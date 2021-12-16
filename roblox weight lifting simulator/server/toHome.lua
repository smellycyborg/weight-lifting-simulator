game.ReplicatedStorage.remote_events.teleport.OnServerEvent:Connect(function(player)
	local hrp = player.Character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	
	hrp.CFrame = CFrame.new(-90.323, 18.166, 30.078)
end)
