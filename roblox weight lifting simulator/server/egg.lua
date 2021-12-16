--// Variables (egg Script)

local replicated = game:GetService("ReplicatedStorage")
local hatch = replicated.remote_events.hatchEgg
local heaven = replicated.remote_events.eggs.heaven

local petCost = 0 or 1000

local clicked = false

--// Modules

local petRarityModule = require(game.ServerScriptService:WaitForChild("petRarityModule"))
local petModule = require(game.ReplicatedStorage.PetModule)

--// Functions

function getHeaven(player)
	local leaderstats = player:WaitForChild("leaderstats")
	local gems = leaderstats:FindFirstChild("Gems")
	local petsFolder = player:FindFirstChild("pets")
	
	if gems.Value >= petCost then
	
		gems.Value -= petCost
		local pet = petRarityModule.chooseRandomHeaven()
		print(pet)
		
		local petInfo = petModule.AddPetToInventory(player, tostring(pet))
		
		hatch:FireClient(player, pet, petInfo.Id)
		
		local petString = Instance.new("StringValue")
		petString.Name = tostring(pet)
		petString.Parent = petsFolder
	end
end

function getLava(player)
	local leaderstats = player:WaitForChild("leaderstats")
	local gems = leaderstats:FindFirstChild("Gems")
	local petsFolder = player:FindFirstChild("pets")
	
	if gems.Value >= petCost then
	
		gems.Value -= petCost
		local pet = petRarityModule.chooseRandomLava()
		print(pet)
		
		local petInfo = petModule.AddPetToInventory(player, tostring(pet))
		
		hatch:FireClient(player, pet, petInfo.Id)
		
		local petString = Instance.new("StringValue")
		petString.Name = tostring(pet)
		petString.Parent = petsFolder
	end
end

local getAlien = function(player)
	local leaderstats = player:WaitForChild("leaderstats")
	local gems = leaderstats:FindFirstChild("Gems")
	local petsFolder = player:FindFirstChild("pets")
	
	if gems.Value >= petCost then
	
		gems.Value -= petCost
		local pet = petRarityModule.chooseRandomAlien()
		print(pet)
		
		local petInfo = petModule.AddPetToInventory(player, tostring(pet))
		
		hatch:FireClient(player, pet, petInfo.Id)
		
		local petString = Instance.new("StringValue")
		petString.Name = tostring(pet)
		petString.Parent = petsFolder
	end
end

local getLight = function(player)
	local leaderstats = player:WaitForChild("leaderstats")
	local gems = leaderstats:FindFirstChild("Gems")
	local petsFolder = player:FindFirstChild("pets")
	
	if gems.Value >= petCost then
	
		gems.Value -= petCost
		local pet = petRarityModule.chooseRandomLight()
		print(pet)
		
		local petInfo = petModule.AddPetToInventory(player, tostring(pet))
		
		hatch:FireClient(player, pet, petInfo.Id)
		
		local petString = Instance.new("StringValue")
		petString.Name = tostring(pet)
		petString.Parent = petsFolder
	end
end

local getIce = function(player)
	local leaderstats = player:WaitForChild("leaderstats")
	local gems = leaderstats:FindFirstChild("Gems")
	local petsFolder = player:FindFirstChild("pets")
	
	if gems.Value >= petCost then
	
		gems.Value -= petCost
		local pet = petRarityModule.chooseRandomIce()
		print(pet)
		
		local petInfo = petModule.AddPetToInventory(player, tostring(pet))
		
		hatch:FireClient(player, pet, petInfo.Id)
		
		local petString = Instance.new("StringValue")
		petString.Name = tostring(pet)
		petString.Parent = petsFolder
	end
end


--// OnServerEvents'

heaven.OnServerEvent:Connect(function(player)
	if clicked then return end
	
	getHeaven(player)
	clicked = true
	wait(1)
	clicked = false
end)

replicated.remote_events.eggs.lava.OnServerEvent:Connect(function(player)
	if clicked then return end

	getLava(player)
	clicked = true
	wait(1)
	clicked = false
end)

replicated.remote_events.eggs.alien.OnServerEvent:Connect(function(player)
	if clicked then return end
	
	getAlien(player)
	clicked = true
	wait(1)
	clicked = false
end)

replicated.remote_events.eggs.light.OnServerEvent:Connect(function(player)
	if clicked then return end
	
	getLight(player)
	clicked = true
	wait(1)
	clicked = false
end)

replicated.remote_events.eggs.ice.OnServerEvent:Connect(function(player)
	if clicked then return end
	
	getIce(player)
	clicked = true
	wait(1)
	clicked = false
end)

