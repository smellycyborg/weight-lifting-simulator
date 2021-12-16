local replicated = game:GetService("ReplicatedStorage")
local sellStrEvent = replicated.remote_events.sellStrength

sellStrEvent.OnServerEvent:Connect(function(player)
	local leaderstats = player:WaitForChild("leaderstats")
	local strength = leaderstats:FindFirstChild("Strength")
	local coins = leaderstats:FindFirstChild("Coins")
	if strength then
		local playerStrength = strength.Value
		local strengthPerCoin = 1000
		
		local numberOfCoins = playerStrength / strengthPerCoin
		numberOfCoins = math.floor(numberOfCoins + .5)
		strength.Value = 0
		coins.Value += numberOfCoins
	end
end)