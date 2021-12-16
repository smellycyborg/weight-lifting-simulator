--//  Variables

local rp = game:GetService("ReplicatedStorage")
local PetModule = require(rp:WaitForChild("PetModule"))

local gui = script.Parent
local scrollingFrame = gui.petsMenu.back1.petsFrames
local midFrame = gui.petsMenu.midback
local deleteAllButton = gui.petsMenu.multipleDelete.multiDelete

local deleteButton = gui.petsMenu.deleteButton
local midFrame = gui.petsMenu.midback
local petsFrame = gui.petsMenu.back1.petsFrames

--//  Functions

-- deletes pet selected
function delete()
	if midFrame:FindFirstChildWhichIsA('ViewportFrame') ~= nil then
		
		local petId = midFrame:FindFirstChildWhichIsA('ViewportFrame').PetId.Value
		local petInfo = PetModule.GetPetById(game.Players.LocalPlayer, petId)
		
		PetModule.DeletePet(game.Players.LocalPlayer, petId)
		midFrame:ClearAllChildren()
		for _, v in pairs(petsFrame:GetChildren()) do
			if v:IsA('Frame') and v:FindFirstChild('PetId').Value == petId then
				v:Destroy()
			end
		end
	end
end

-- deletes all pets
function deleteAll()
	for _, v in pairs(scrollingFrame:GetChildren()) do
		if v:IsA("Frame") then
			v:Destroy()
		end
	end
	midFrame:ClearAllChildren()
	PetModule.DeleteAllPets(game.Players.LocalPlayer)
end

--//  Calling

deleteAllButton.MouseButton1Down:Connect(deleteAll)
deleteButton.MouseButton1Down:Connect(delete)