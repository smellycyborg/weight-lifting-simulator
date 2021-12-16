--// Variables

local rep = game:GetService("ReplicatedStorage")
local OpenShopRemote = rep.remote_events.OpenShop
local CloseShopRemote = rep.remote_events.CloseShop

--// Functions

OpenShopRemote.OnClientEvent:Connect(function()
	local player = game.Players.LocalPlayer
	local main = player.PlayerGui:WaitForChild("Main")
	local shopGui = main['shop']
	shopGui:TweenPosition(UDim2.new(0.5,0,0.5,0),"In","Quint",0.2,false)
end)

CloseShopRemote.OnClientEvent:Connect(function()
	local player = game.Players.LocalPlayer
	local main = player.PlayerGui:WaitForChild("Main")
	local shopGui = main['shop']
	shopGui:TweenPosition(UDim2.new(1.5,0,0.5,0),"Out","Quint",0.2,false)
end)