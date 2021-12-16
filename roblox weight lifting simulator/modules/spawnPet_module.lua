local module = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

function module.SpawnPet(player, petInfo)
	local character = player.Character
	assert(character, "Player's character does not exist")

	local petsFolder = workspace.Pets:FindFirstChild(player.Name)
	assert(petsFolder, "pets folder for " .. player.Name .. " does not exist")
	assert(ReplicatedStorage.Pets:FindFirstChild(petInfo.Name), "Pet ".. petInfo.Name .. " does not exist")

	local petModel = ReplicatedStorage.Pets[petInfo.Name]:Clone()
	petInfo.Model = petModel
	
	local bodypos = Instance.new("BodyPosition", petModel.hinge)
	bodypos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bodypos.D = 100
	bodypos.P = 2000

	local bodyGyro = Instance.new("BodyGyro", petModel.hinge)
	bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
	bodyGyro.D = 100

	petModel.Parent = petsFolder

	return petModel
end

return module
