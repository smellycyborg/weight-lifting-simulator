--// regionModule

local module = {}

--// Variables

local king1 = workspace.regions.king1
local king2 = workspace.regions.king2

local area = workspace.KothArea

local region = Region3.new(king1.Position, king2.Position)

local playerInside = false

local count = 0

--// Tables

local ignore = {king1, king2, area}

module.playersInRegion = {}

--// Functions


module.RotateCrown = function(player)
	local inRegion = workspace:FindPartsInRegion3WithIgnoreList(region, ignore, math.huge)
	
	for _,v in ipairs(inRegion) do
		local player = game.Players:GetPlayerFromCharacter(v.Parent)
		if not player then continue end
		
		if table.find(module.playersInRegion, player) then
			workspace.Crown.CFrame = workspace.Crown.CFrame * CFrame.Angles(0, math.rad(1), 0)
		end
	end
end

module.addGems = function(player)
	local leaderstats = player:WaitForChild("leaderstats")
	local gems = leaderstats['Gems']
	
	gems.Value+=1
	wait(1)
end

module.SpawnRegionPart = function()
	local part = Instance.new("Part", workspace)
	part.CanCollide = false
	part.Anchored = true
	part.Transparency = .5
	part.Size = region.Size
	part.CFrame = region.CFrame
end

module.AddPlayers = function()
	local inRegion = workspace:FindPartsInRegion3WithIgnoreList(region, ignore, math.huge)
	
	for _,v in ipairs(inRegion) do
		local player = game.Players:GetPlayerFromCharacter(v.Parent)
		if not player then continue end
		
		if table.find(module.playersInRegion, player) then
			module.addGems(player) continue end
		
		if count >= 2 then continue end

		if player.Character.Humanoid.Health > 0 then
			count+=1
			playerInside = true
			table.insert(module.playersInRegion, player)
			local multiplier = player['Multiplier']
			multiplier.Value+=.1
			print"joined koth"
		end
	end
end

module.RemovePlayers = function()
	local partsInRegion = workspace:FindPartsInRegion3WithIgnoreList(region, ignore, math.huge)
	
	for playerIndex,player in ipairs(module.playersInRegion) do
		for partIndex,part in ipairs(partsInRegion) do
			if player == game.Players:GetPlayerFromCharacter(part.Parent) then
				if player.Character.Humanoid.Health > 0 then break
					
				else 
					playerInside = false
					count-=1
					table.remove(module.playersInRegion, playerIndex)
					local multiplier = player['Multiplier']
					print"left koth"
					multiplier.Value-=.1 break end
				
			elseif partIndex == #partsInRegion then
				count-=1
				playerInside = false
				table.remove(module.playersInRegion, playerIndex)
				local multiplier = player['Multiplier']
				multiplier.Value-=.1
				print"left koth"
			end
		end
	end
end

game.Players.PlayerRemoving:Connect(function(player)
	if table.find(module.playersInRegion, player) == nil then return end
	table.remove(module.playersInRegion, 1)
end)

return module
