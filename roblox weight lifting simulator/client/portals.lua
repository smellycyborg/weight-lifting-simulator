local rep = game:GetService("ReplicatedStorage")
local p = rep.remote_events.portals
local dessertEvent = p.dessert
local winterEvent = p.winter
local lavaEvent = p.lava

dessertEvent.OnClientEvent:Connect(function()
	workspace.portalsl.DesertPortal.Teleport.Heading.Frame.Visible = false
end)

winterEvent.OnClientEvent:Connect(function()
	workspace.portalsl.WinterPortal.Teleport.Heading.Frame.Visible = false
end)

lavaEvent.OnClientEvent:Connect(function()
	workspace.portalsl.LavaPortal.Teleport.Heading.Frame.Visible = false
end)