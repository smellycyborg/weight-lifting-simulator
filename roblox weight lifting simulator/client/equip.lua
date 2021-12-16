--//  Variables

local replicated = game:GetService("ReplicatedStorage")
local toggleEquipEvent = replicated.remote_events.togglePetEquipped
local PetModule = require(game.ReplicatedStorage:WaitForChild("PetModule"))

local gui = script.Parent
local petsFrame = gui.petsMenu.back1.petsFrames
local equipToggleButton = gui.petsMenu.equipButton.equipBest
local viewportGui = gui.petsMenu.midback

local petId = nil;

--// Functions

function onPetFrameAdded(petFrame)
	petFrame.petsName.MouseButton1Down:Connect(function(gui)
		petId = petFrame.PetId.Value
		
		local petInfo = PetModule.GetPetById(game.Players.LocalPlayer, petId)
		equipToggleButton.Text = petInfo.Model and "UNEQUIP" or "EQUIP"
		
		viewportGui:ClearAllChildren()
		local viewportFrame = petFrame.ViewportFrame:Clone()
		viewportFrame.Parent = viewportGui
		local idClone = petFrame.PetId:Clone()
		idClone.Parent = viewportFrame
	end)
end

petsFrame.ChildAdded:Connect(onPetFrameAdded)

equipToggleButton.MouseButton1Click:Connect(function()
	if petId then
		toggleEquipEvent:FireServer(petId)
		equipToggleButton.Text = equipToggleButton.Text == "EQUIP" and "UNEQUIP" or "EQUIP"
    end
end)