local module = {}

local storage = game:GetService("ReplicatedStorage")
local pets = storage.Pets

module.HeavenPets = {
	
	["Legendary"] = {
		pets["Heaven3"]
	};
	["Rare"] = {
		pets["Heaven2"]
	};
	["Uncommon"] = {
		pets["Heaven"]
	};
}

module.LavaPets = {
	
	["Legendary"] = {
		pets["Lava3"]
	};
	["Rare"] = {
		pets["Lava2"]
	};
	["Uncommon"] = {
		pets["Lava"]
	};
}

module.EarthPets = {
	
	--["Rare"] = {
	--	pets["Earth3"]
	--};
	["Uncommon"] = {
		pets["Earth2"]
	};
	["Common"] = {
		pets["Earth1"]
	}
}

module.AlienPets = {
	
	["Legendary"] = {
		pets["AlienShip"]
	};
	["Rare"] = {
		pets["Alien2"]
	};
	["Uncommon"] = {
		pets["Alien"]
	};
}

module.IcePets = {
	
	["Rare"] = {
		pets["Ice3"]
	};
	["Uncommon"] = {
		pets["Ice2"]
	};
	["Common"] = {
		pets["Ice"]
	}
}

module.LightPets = {
	
	["Legendary"] = {
		pets["ElectroManga"]
	};
	["Rare"] = {
		pets["Ghost"]
	};
	["Uncommon"] = {
		pets["Light"],
	};
}

module.bigRarities = {
	["Legendary"] = 1;
	["Rare"] = 10;
	["Uncommon"] = 30;
	--["Common"] = 50
}

module.smallRarities = {
	--["Legendary"] = 1;
	["Rare"] = 10;
	["Uncommon"] = 30;
	["Common"] = 50
}

module.chooseRandomHeaven = function()
	local randomNumber = math.random(1, 41)
	local count = 0
	for i, v in pairs(module.bigRarities) do
		count = count + v
		if randomNumber <= count then
			
			local rarityTable = module.HeavenPets[i]
			local chosenPet = rarityTable[math.random(1, #rarityTable)]
			print(#rarityTable)
			
			print(chosenPet)
			
			return chosenPet
		end
	end
end

module.chooseRandomLava = function()
	local randomNumber = math.random(1, 41)
	local count = 0
	for i, v in pairs(module.bigRarities) do
		count = count + v
		if randomNumber <= count then
			
			local rarityTable = module.LavaPets[i]
			local chosenPet = rarityTable[math.random(1, #rarityTable)]
			
			return chosenPet
		end
	end
end

module.chooseRandomEarth = function()
	local randomNumber = math.random(1, 90)
	local count = 0
	for i, v in pairs(module.smallRarities) do
		count = count + v
		if randomNumber <= count then
			
			local rarityTable = module.EarthPets[i]
			local chosenPet = rarityTable[math.random(1, #rarityTable)]
			
			return chosenPet
		end
	end
end

module.chooseRandomLight = function()
	local randomNumber = math.random(1, 41)
	local count = 0
	for i, v in pairs(module.bigRarities) do
		count = count + v
		if randomNumber <= count then
			
			local rarityTable = module.LightPets[i]
			local chosenPet = rarityTable[math.random(1, #rarityTable)]
			
			return chosenPet
		end
	end
end

module.chooseRandomIce = function()
	local randomNumber = math.random(1, 90)
	local count = 0
	for i, v in pairs(module.smallRarities) do
		count = count + v
		if randomNumber <= count then
			
			local rarityTable = module.IcePets[i]
			local chosenPet = rarityTable[math.random(1, #rarityTable)]
			
			return chosenPet
		end
	end
end

module.chooseRandomAlien = function()
	local randomNumber = math.random(1, 41)
	local count = 0
	for i, v in pairs(module.bigRarities) do
		count = count + v
		if randomNumber <= count then
			
			local rarityTable = module.AlienPets[i]
			local chosenPet = rarityTable[math.random(1, #rarityTable)]
			
			return chosenPet
		end
	end
end

return module
