local module = {}

local function createAngles(player, listOfPets)
	local PetModule = require(script.Parent)
	local numPetsEquipped = PetModule.NumPetsEquipped[player]
	
	local angles = {}
	local increment = 360/numPetsEquipped
	local initialAngle = 90
	initialAngle  = initialAngle - (initialAngle / numPetsEquipped)

	for i, petInfo in pairs(listOfPets) do
		if not petInfo.Model then continue end 
		local angle = initialAngle + increment*(i-1)
		angles[petInfo.Id] = angle
	end

	return angles
end

function module.UpdatePlayersPetPositions(player)
	local PetModule = require(script.Parent)
	local listOfPets = PetModule.GetPets(player)
	
	if not listOfPets or not player.Character then return end 
	local angles = createAngles(player, listOfPets)
	local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

	for _, petInfo in pairs(listOfPets)do
		if not petInfo.Model then continue end 
		if petInfo.Model then
			local petCF = (humanoidRootPart.CFrame * CFrame.Angles(0,math.rad(angles[petInfo.Id]),0)) * CFrame.new(0,4,5)
			local hinge = petInfo.Model:FindFirstChild("hinge")
			if hinge then
				hinge.BodyPosition.Position = petCF.Position
				hinge.BodyGyro.CFrame = petCF
			end
		end
	end
end

return module
