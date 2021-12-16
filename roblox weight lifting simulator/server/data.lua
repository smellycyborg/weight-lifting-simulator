--// Variables (Data)

local dss = game:GetService("DataStoreService")
local pd = dss:GetDataStore("PlayerData")

--// Functions

local function onplayerJoin(player)
	local leaderstats = Instance.new("Folder", player)
	leaderstats.Name = "leaderstats"
	
	local strength = Instance.new("IntValue", leaderstats)
	strength.Name = "Strength"
	strength.Value = 0
	
	local gems = Instance.new("IntValue", leaderstats)
	gems.Name = "Gems"
	gems.Value = 0
	
	local rebirths = Instance.new("IntValue", leaderstats)
	rebirths.Name = "Rebirths"
	rebirths.Value = 0
	
	local coins = Instance.new("IntValue", leaderstats)
	coins.Name = "Coins"
	coins.Value = 0
	
	local coinMulti = Instance.new("NumberValue", player)
	coinMulti.Name = 'coinMultiplier'
	coinMulti.Value = 0
	
	local multiplier = Instance.new("NumberValue", player)
	multiplier.Name = "Multiplier"
	multiplier.Value = 1
	
	local stuff = Instance.new("Folder", player)
	stuff.Name = "stuff"
	
	local doubleCoins = Instance.new("IntValue", stuff)
	doubleCoins.Name = 'doubleCoins'
	
	local doubleGems = Instance.new("IntValue", stuff)
	doubleGems.Name = 'doubleGems'
	
	local doubleHp = Instance.new("IntValue", stuff)
	doubleHp.Name = 'doubleHp'
	
	local doubleRebirths = Instance.new("IntValue", stuff)
	doubleRebirths.Name = 'doubleRebirths'
	
	local morePets1 = Instance.new("IntValue", stuff)
	morePets1.Name = 'twoMorePets'
	
	local morePets2 = Instance.new("IntValue", stuff)
	morePets2.Name = 'fiveMorePets'
	
	local anyPets = Instance.new("IntValue", stuff)
	anyPets.Name = 'anyPets'
	
	local morePets1 = Instance.new("IntValue", stuff)
	morePets1.Name = 'luckyEggs'
	
	local kothWins = Instance.new("NumberValue", stuff)
	kothWins.Name = "kothWins"
	kothWins.Value = 0
	
	local petsFolder = Instance.new("Folder", player)
	petsFolder.Name = "pets"
	
	--// Portals
	
	local dessert = Instance.new("IntValue", player)
	dessert.Name = "Dessert"
	
	local winter = Instance.new("IntValue", player)
	winter.Name = "Winter"
	
	local lava = Instance.new("IntValue", player)
	lava.Name = "Lava"
	
	--// Weights
	
	local weights = Instance.new("Folder", player)
	weights.Name = "weights"
	
	local red = Instance.new("BoolValue", weights)
	red.Name = "Red"
	
	local white = Instance.new("BoolValue", weights)
	white.Name = "White"
	
	local blue = Instance.new("BoolValue", weights)
	blue.Name = "Blue"
	
	local pink = Instance.new("BoolValue", weights)
	pink.Name = "Pink"
	
	local green = Instance.new("BoolValue", weights)
	green.Name = "Green"
	
	local orange = Instance.new("BoolValue", weights)
	orange.Name = "Orange"
	
	local redSpikes = Instance.new("BoolValue", weights)
	redSpikes.Name = "Red Spikes"
	
	local whiteWings = Instance.new("BoolValue", weights)
	whiteWings.Name = "White Wings"
	
	local yellowSpikes = Instance.new("BoolValue", weights)
	yellowSpikes.Name = "Yellow Spikes"
	
	local redWings = Instance.new("BoolValue", weights)
	redWings.Name = "Red Wings"
	
	local purpleWings = Instance.new("BoolValue", weights)
	purpleWings.Name = "Purple Wings"
	
	local blackWings = Instance.new("BoolValue", weights)
	blackWings.Name = "Black Wings"
	
	local orangeWings = Instance.new("BoolValue", weights)
	orangeWings.Name = "Orange Wings"
	
	local purpleGlow = Instance.new("BoolValue", weights)
	purpleGlow.Name = "Purple Glow"
	
	local legendary = Instance.new("BoolValue", weights)	
	legendary.Name = "Legendary"
	
	local greenWings = Instance.new("BoolValue", weights)
	greenWings.Name = "Green Wings"
	
	local blueSpikes = Instance.new("BoolValue", weights)
	blueSpikes.Name = "Blue Spikes"
	
	local redWhite = Instance.new("BoolValue", weights)
	redWhite.Name = "Red White Wings"
	
	local goldWings = Instance.new("BoolValue", weights)
	goldWings.Name = "Gold Wings"
	
	local equippedPets = Instance.new("Folder", player)
	equippedPets.Name = "EquippedPets"
	
	local rebirthPrice = Instance.new("IntValue", stuff)
	rebirthPrice.Name = "currentRebirthCost"
	rebirthPrice.Value = 10000
	
		player.CharacterAdded:Connect(function(character)
		local humanoid = character['Humanoid']
		humanoid.Died:Connect(function()
			local tag = humanoid:FindFirstChild("creator")
			if tag ~= nil then
				kothWins.Value+=1
			end
		end)
	end)
	
	local p_userId = 'Player_'..player.UserId
	local data = pd:GetAsync(p_userId)
	if data then
		gems.Value = data['Gems']
		rebirths.Value = data['Rebirths']
		strength.Value = data['Strength']
		coins.Value = data['Coins']
		gems.Value = data['Gems']
		
		doubleCoins.Value = data['doubleCoins']
		doubleGems.Value = data['doubleGems']
		doubleRebirths.Value = data['doubleRebirths']
		doubleHp.Value = data['doubleHp']
		morePets1.Value = data['twoMorePets']
		morePets2.Value = data['fiveMorePets']
		anyPets.Value = data['anyPets']
		
		kothWins.Value = data['kothWins']
		petsFolder = data['pets']
		equippedPets = data['EquippedPets']
		
		red = data['Red']
		white = data['White']
		blue = data['Blue']
		pink = data['Pink']
		orange = data['Orange']
		orangeWings = data['Orange Wings']
		purpleWings = data['Purple Wings']
		purpleGlow = data['Purple Glow']
		redSpikes = data['Red Spikes']
		redWings = data['Red Wings']
		blackWings = data['Black Wings']
		legendary = data['Legendary']
		blueSpikes = data['Blue Spikes']
		yellowSpikes = data['Yellow Spikes']
		redWhite = data['Red White Wings']
		green = data['Green']
		greenWings = data['Green Wings']
		goldWings = data["Gold Wings"]
	else
		gems.Value = 0
		rebirths.Value = 0
		strength.Value = 0
		coins.Value = 0
		gems.Value = 0
		kothWins.Value = 0
		
		doubleCoins.Value = 0
		doubleGems.Value = 0
		doubleRebirths.Value = 0
		doubleHp.Value = 0
		morePets1.Value = 0
		morePets2.Value = 0
		anyPets.Value = 0
	end
end

local function create_table(player)
	local player_stats = {}
	for _, v in pairs(player.leaderstats:GetChildren()) do
		player_stats[v.Name] = v.Value
		for _, v in pairs(player.stuff:GetChildren()) do
			player_stats[v.Name] = v.Value
		end
	end
	return player_stats
end

local function onplayerExit(player)
	local player_stats = create_table(player)
	local s, e = pcall(function()
		local p_userId = 'Player_'..player.UserId
		pd:SetAsync(p_userId, player_stats)
	end)
	if not s then
		warn("Could not save data"..player.UserId)
	end
end

game.Players.PlayerAdded:Connect(onplayerJoin)
game.Players.PlayerRemoving:Connect(onplayerExit)
