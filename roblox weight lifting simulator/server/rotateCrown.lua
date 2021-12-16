local module = require(game.ReplicatedStorage.regionModule)

game.Players.PlayerAdded:Connect(function(player)
	while wait() do
		module.RotateCrown(player)
	end
end)
