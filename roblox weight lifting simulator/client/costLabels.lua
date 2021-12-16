local player = game.Players.LocalPlayer

function changeText()
	local cost = player.stuff['currentRebirthCost']
	workspace.portalsl.LavaPortal.Teleport.Heading.Frame.TextLabel.Text = tostring(cost.Value / 10)
	workspace.portalsl.DesertPortal.Teleport.Heading.Frame.TextLabel.Text = tostring(cost.Value / 10)
	workspace.portalsl.WinterPortal.Teleport.Heading.Frame.TextLabel.Text = tostring(cost.Value / 10)
end

while wait(10) do
	changeText()
	print"why the mf"
end