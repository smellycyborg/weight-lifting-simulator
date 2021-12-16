--// Variables (Rebirth Cost)

local rep_storage = game:GetService("ReplicatedStorage")
local rebirth_event = rep_storage.remote_events.rebirthing

--// Tables

local List = {
	"K",
	"M",
	"B",
	"T",
	"Qd",
	"Qn",
	"Sx",
	"Sp",
	"O",
	"N" 
}

--// Functions

local numberSuffix = function(number)
	local ListCount = 0
	
    while number / 1000 >= 1 do
        ListCount = ListCount + 1 
        number = number / 1000 
	end
	
	if ListCount == 0 then 
		return number end 
    return math.floor(number*10)/10 ..List[ListCount]--.."+"
end

local addRebirth = function(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	local rebirths = leaderstats:FindFirstChild("Rebirths")
	local strength = leaderstats:FindFirstChild("Strength")
	local multiplier = player['Multiplier']
	local stuff = player:FindFirstChild("stuff")
	local rebirthCost = stuff:FindFirstChild("currentRebirthCost")
	local gems = leaderstats:FindFirstChild("Gems")
	
	if strength.Value >= rebirthCost.Value then
		strength.Value -= rebirthCost.Value
		rebirths.Value += 1
		multiplier.Value += .1
		rebirthCost.Value *= 1.65
		gems.Value += 1000
		
		while wait() do
			local gui = player:WaitForChild("PlayerGui")
			local main_gui = gui:WaitForChild("Main")
			local rebirths_menu = main_gui:FindFirstChild("rebirthMenu")
			local info_text = rebirths_menu.Information
			local rebirth_text = rebirths_menu.Rebirths
			info_text.Text = "You Need " .. numberSuffix(rebirthCost.Value) .. " Strength To Rebirth!"
			rebirth_text.Text = rebirths.Value .. " Rebirths"
		end
	end
end

--// Event with Function

rebirth_event.OnServerEvent:Connect(addRebirth)