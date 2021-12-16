local repilcated = game:GetService("ReplicatedStorage")
local remotes = repilcated.remote_events
local shopEvent = remotes.weightsShop

shopEvent.OnServerEvent:Connect(function(player, name, cost)
	local leaderstats = player['leaderstats']
	local coins = leaderstats['Coins']
	cost = math.abs(cost) 

	if coins.Value > cost then
	
		local weights = player['weights']

		coins.Value-=cost

		local weight = game.ReplicatedStorage.Weights:FindFirstChild(name)
		local newWeight = weight:Clone()
		newWeight.Parent = player['Backpack']

		local value = weights:FindFirstChild(name)
		value.Value = true
	end
end)