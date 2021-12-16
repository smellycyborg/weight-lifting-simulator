local module = {}

--// Variables

local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

local statsModule = require(game.ReplicatedStorage:WaitForChild("petStats"))

local pets_count = 0

local PetSpawning = require(script.SpawnPet)
local MovePets = require(script.MovePet)

local isServer = RunService:IsServer()
local petInfoRemote = game.ReplicatedStorage.remote_functions.petModuleRemote

--// Tables

module.NumPetsEquipped = {}
module.pets = {}

--// Functions

-- get the pet by the pet id
module.GetPetById = function(player, petId)
	-- if this function is called on server then
	if isServer then
		-- loop through the player's pets table
		for index, petInfo in pairs(module.pets[player])do
			-- if we find an id in our table that matches the id we have then
			if petInfo.Id == petId then
				-- return pets info from our player's pets table
				return petInfo, index
			end
		end
	else
		-- if the function is called on the client we will invoke server function (which called the same function on the server)
		return petInfoRemote:InvokeServer("GetPetById", player, petId)
	end
end

-- gets player's pets table
module.GetPets = function(player)
	-- if function is being called on the server then
	if isServer then
		-- if player's pets table doesn't exist then
		if not module.pets[player] then 
			-- create player's pets table
			module.pets[player] = {}
		end
		-- return player's pets table
		return module.pets[player]
	else
		-- we're on the client and we can't get the pets data on the server
		-- so we need to run the code on the server, 
		-- and have the server send the pets data back to us
		return petInfoRemote:InvokeServer("GetPets", player)
	end
end

-- adds pet to player's pets table and gives them their random generated id
module.AddPetToInventory = function(player, petName)
	-- if the function is called on the client then do nothing
	if not isServer then return end
	
	-- variable for generating a random id
	local petId = HttpService:GenerateGUID(true)
	-- creating a dictionary of information for the pet 
	local petInfo = {Model = nil, Name = petName, Id = petId}
	-- putting the pet's information inside of our player's pets table
	table.insert(module.pets[player], petInfo)
	
	-- returning our pets information
	return petInfo
end

-- equips pet, adds multiplier
module.EquipPet = function(player, petId)
	-- if the function is ran on the client then do nothing
	if not isServer then return end
	
	-- variable for player's stuff folder
	local stuff = player['stuff']
	-- variable for player's gamePass boolVariable
	local twoPets = stuff['twoMorePets']
	-- variable for player's gamePass boolVariable
	local fivePets = stuff['fiveMorePets']
	
	-- if player doesn't have either game pass and the player has 2 pets equipped then do nothing
	if twoPets.Value == 0 and fivePets.Value == 0 and pets_count == 2 then return end
	
	-- if the player has one of the game passes and has 4 pets equipped then do nothing
	if fivePets.Value == 0 and pets_count == 4 then return end
	
	-- variable for pets information 
	local petInfo = module.GetPetById(player, petId)
	-- adding 1 to our player's number of pets equipped table
	module.NumPetsEquipped[player]+=1
	-- calling our spawn function from spawn module 
	PetSpawning.SpawnPet(player, petInfo)
	
	-- variable for the multiplier of the pet (so we know how much to add to multiplier when pet is equipped)
	local key = statsModule.pets[petInfo.Name].multi
	
	-- player's multiplier (number value)
	local multiplier = player['Multiplier']
	-- adding our pet's multiplier key to our player's multiple value
	multiplier.Value+=key
	-- adding to our pets count module variable
	pets_count+=1
	
	-- variable for main gui
	local mainGui = player.PlayerGui:WaitForChild("Main")
	-- variable for text label of number of pets equipped
	local petText = mainGui.petsMenu.topback.pets
	-- making the number of pets equipped text the legnth of our number of pets equipped table
	petText.Text = module.NumPetsEquipped[player]
end

-- returns number of pets
module.GetNumberOfPets = function(player)
	return module.NumPetsEquipped[player]
end

-- unequips selected
function module.UnEquipPet(player, petId)
	-- if we're not on server we return end the function
	if not isServer then return end
	
	-- if our player's pets folder in workspace isn't nil (has pets inside)
	if workspace.Pets:FindFirstChild(player.Name) ~= nil then
		-- variable to get our player's pet's infromation from player's pets table
		local petInfo = module.GetPetById(player, petId)
		-- destroy pet model
		petInfo.Model:Destroy()
		-- making pet model nil so it doesn't error
		petInfo.Model = nil
		-- subtracting 1 from the player's table of pets equipped
		module.NumPetsEquipped[player]-=1
		
		-- player's multiplier (number value) variable
		local multiplier = player['Multiplier']
		--subtracting from our player's multiplier (number value)
		multiplier.Value-=.1
		-- substracting 1 from our count variable
		pets_count-=1
		
		-- variable for main gui
		local mainGui = player.PlayerGui:WaitForChild("Main")
		-- variable for number of pets equipped text label
		local petText = mainGui.petsMenu.topback.pets
		-- making number of pets equipped text label the number of pets in our pets equipped table
		petText.Text = module.NumPetsEquipped[player]
	end
end

-- updates positions of the pets when equipped
module.UpdatePetPositions = function()
	-- if function is ran on client then do nothing
	if not isServer then return end
	
	-- while true then run 
	while true do
		-- wait 
		wait()
		-- looping through all the players 
		for _, player in pairs(game.Players:GetPlayers()) do
			-- calling the function updating pet's position's for the players
			MovePets.UpdatePlayersPetPositions(player)
		end
	end
end

-- deletes all pets
function module.DeleteAllPets(player)
	-- if the function is ran on the server then
	if isServer then
		-- clear our player's pets table
		table.clear(module.pets, table.find(module.pets, player))
		
		-- variable for our player's pets folder in workspace
		local folder = workspace.Pets:FindFirstChild(player.Name)
		-- if the folder does not equal nil (has pets inside) then
		if folder ~= nil then
			-- variable for the amount of pets we have inside our folder
			local amount = #folder or module.GetNumberOfPets(player)
			-- subtracting the amount of pets we have from the player's number of pets equipped table
			module.NumPetsEquipped[player]-=amount
			-- looping through the folder
			for _, v in pairs(folder:GetChildren()) do
				-- destroying everything in the folder
				v:Destroy()
			end
		end
	else
		-- if the function is called on the client we will invoke server function (which called the same function on the server)
		return petInfoRemote:InvokeServer("DeleteAllPets", player)
	end
end

-- deletes pet selected
function module.DeletePet(player, petId)
	-- if code is being ran on the server
	if isServer then
		-- variable for our pets information
		local petInfo, index = module.GetPetById(player, petId)
		-- if the pet is in workspace
		if petInfo.Model then
			-- subtract 1 from player's pets equipped table 
			module.NumPetsEquipped[player]-=1
			-- destroys pet in workspace
			petInfo.Model:Destroy()
			-- makes petInfo model nil so we don't get any errors
			petInfo.Model = nil
		end
		-- removes petInfo fromplayer's pets table
		table.remove(module.pets[player], index)
	else
		-- if the function is called on the client we will invoke server function (which called the same function on the server)
		return petInfoRemote:InvokeServer("DeletePet", player, petId)
	end
end

-- get rid of the players temporary data when they leave the game so we don't have memory leaks
module.RemoveData = function(player)
	-- if function is called on client then do nothing
	if not isServer then return end
	
	-- making the player's pets table nil
	module.pets[player] = nil
	-- making the player's number of pets equipped table nil
	module.NumPetsEquipped[player] = nil
end

return module