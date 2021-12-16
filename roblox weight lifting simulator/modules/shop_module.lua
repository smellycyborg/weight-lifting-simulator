local module = {}

--// Variables

local rep = game:GetService("ReplicatedStorage")
local OpenShopRemote = rep.remote_events.OpenShop
local CloseShopRemote = rep.remote_events.CloseShop

local regionPart1 = workspace.regions.shop1
local regionPart2 = workspace.regions.shop2
local region = Region3.new(regionPart1.Position, regionPart2.Position)

local ignore = {}

--// Tables

module.PlayersInRegion = {}

module.AddPlayers = function()
	local inRegion = workspace:FindPartsInRegion3WithIgnoreList(region, ignore, math.huge)

	for _,v in ipairs(inRegion) do
		local player = game.Players:GetPlayerFromCharacter(v.Parent)
		if not player then continue end
		
		if table.find(module.PlayersInRegion, player) then return true end
		
		if player and not table.find(module.PlayersInRegion, player) then
			table.insert(module.PlayersInRegion, player)
			return true
		end
	end
end

module.RemovePlayers = function()
	local partsInRegion = workspace:FindPartsInRegion3WithIgnoreList(region, ignore, math.huge)
	
	for playerIndex,player in ipairs(module.PlayersInRegion) do
		for partIndex,part in ipairs(partsInRegion) do
			if player == game.Players:GetPlayerFromCharacter(part.Parent) then
				if player.Character.Humanoid.Health > 0 then break
					
				else 
					table.remove(module.PlayersInRegion, playerIndex) 
					end
				
			elseif partIndex == #partsInRegion then
				table.remove(module.PlayersInRegion, playerIndex)
			end
		end
	end
end

module.ShopHandler = function(player)
	local playerIn = module.AddPlayers()
	if playerIn then
		OpenShopRemote:FireClient(player)
	end
	
	if not playerIn then
		module.RemovePlayers()
		CloseShopRemote:FireClient(player)
	end
end

game.Players.PlayerRemoving:Connect(function(player)
	if table.find(module.PlayersInRegion, player) == nil then return end
	table.remove(module.PlayersInRegion, 1)
end)

return module
