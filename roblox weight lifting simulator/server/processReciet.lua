local mps = game:GetService("MarketplaceService")
local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")
 
-- Data store for tracking purchases that were successfully processed
local purchaseHistoryStore = DataStoreService:GetDataStore("PurchaseHistory")
 
-- Table setup containing product IDs and functions for handling purchases
local productFunctions = {}

--// GamePasses

productFunctions[15306901] = function(receipt, player)
	local stuff = player['stuff']
	local doubleCoins = stuff['doubleCoins']
	if doubleCoins then
		doubleCoins.Value+=2
	end
end

productFunctions[15306905] = function(receipt, player)
	local stuff = player['stuff']
	local doubleGems = stuff['doubleGems']
	if doubleGems then
		doubleGems.Value+=2
	end
end

productFunctions[15306910] = function(receipt, player)
	local stuff = player['stuff']
	local doubleHp = stuff['doubleHp']
	if doubleHp then
		doubleHp.Value+=2
	end
end

productFunctions[16929428] = function(receipt, player)
	local stuff = player['stuff']
	local doubleRebirths = stuff['doubleRebirths']
	if doubleRebirths then
		doubleRebirths.Value+=2
	end
end

productFunctions[16929439] = function(receipt, player)
	local stuff = player['stuff']
	local morePets = stuff['twoMorePets']
	if morePets then
		morePets.Value+=2
	end
end

productFunctions[16929443] = function(receipt, player)
	local stuff = player['stuff']
	local morePets = stuff['fiveMorePets']
	if morePets then
		morePets.Value+=2
	end
end

productFunctions[16929451] = function(receipt, player)
	local stuff = player['stuff']
	local luckyEggs = stuff['luckyEggs']
	if luckyEggs then
		luckyEggs.Value+=2
	end
end

productFunctions[16929455] = function(receipt, player)
	local stuff = player['stuff']
	local anyPets = stuff['anyPets']
	if anyPets then
		anyPets.Value+=2
	end
end

--// Coins

productFunctions[1163505632] = function(receipt, player)
		local leaderstats = player['leaderstats']
		local coins = leaderstats['Coins']
		if coins then
			coins.Value += 1000
		return true
	end
end

productFunctions[1163507155] = function(receipt, player)
		local leaderstats = player:WaitForChild("leaderstats")
		local coins = leaderstats:FindFirstChild("Coins")
		if coins then
			coins.Value += 2500
		return true
	end
end

productFunctions[1163507239] = function(receipt, player)
		local leaderstats = player:WaitForChild("leaderstats")
		local coins = leaderstats:FindFirstChild("Coins")
		if coins then
			coins.Value += 5000
		return true
	end
end

productFunctions[1163507295] = function(receipt, player)
		local leaderstats = player:WaitForChild("leaderstats")
		local coins = leaderstats:FindFirstChild("Coins")
		if coins then
			coins.Value += 10000
		return true
	end
end

productFunctions[1163507330] = function(receipt, player)
		local leaderstats = player:WaitForChild("leaderstats")
		local coins = leaderstats:FindFirstChild("Coins")
		if coins then
			coins.Value += 25000
		return true
	end
end

productFunctions[1163507378] = function(receipt, player)
		local leaderstats = player:WaitForChild("leaderstats")
		local coins = leaderstats:FindFirstChild("Coins")
		if coins then
			coins.Value += 75000
		return true
	end
end

--// Gems

productFunctions[1163507414] = function(receipt, player)
		local leaderstats = player:WaitForChild("leaderstats")
		local gems = leaderstats:FindFirstChild("Gems")
		if gems then
			gems.Value += 1000
		return true
	end
end

productFunctions[1163507516] = function(receipt, player)
		local leaderstats = player:WaitForChild("leaderstats")
		local gems = leaderstats:FindFirstChild("Gems")
		if gems then
			gems.Value += 2500
		return true
	end
end

productFunctions[1163507582] = function(receipt, player)
		local leaderstats = player:WaitForChild("leaderstats")
		local gems = leaderstats:FindFirstChild("Gems")
		if gems then
			gems.Value += 5000
		return true
	end
end

productFunctions[1163507669] = function(receipt, player)
		local leaderstats = player:WaitForChild("leaderstats")
		local gems = leaderstats:FindFirstChild("Gems")
		if gems then
			gems.Value += 10000
		return true
	end
end

productFunctions[1163507704] = function(receipt, player)
		local leaderstats = player:WaitForChild("leaderstats")
		local gems = leaderstats:FindFirstChild("Gems")
		if gems then
			gems.Value += 25000
		return true
	end
end

productFunctions[1163507745] = function(receipt, player)
		local leaderstats = player:WaitForChild("leaderstats")
		local gems = leaderstats:FindFirstChild("Gems")
		if gems then
			gems.Value += 75000
		return true
	end
end

 
-- The core 'ProcessReceipt' callback function
local function processReceipt(receiptInfo)
 
	-- Determine if the product was already granted by checking the data store  
	local playerProductKey = receiptInfo.PlayerId .. "_" .. receiptInfo.PurchaseId
	local purchased = false
	local success, errorMessage = pcall(function()
		purchased = purchaseHistoryStore:GetAsync(playerProductKey)
	end)
	-- If purchase was recorded, the product was already granted
	if success and purchased then
		return Enum.ProductPurchaseDecision.PurchaseGranted
	elseif not success then
		error("Data store error:" .. errorMessage)
	end
 
	-- Find the player who made the purchase in the server
	local player = Players:GetPlayerByUserId(receiptInfo.PlayerId)
	if not player then
		-- The player probably left the game
		-- If they come back, the callback will be called again
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
	
	-- Look up handler function from 'productFunctions' table above
	local handler = productFunctions[receiptInfo.ProductId]
 
	-- Call the handler function and catch any errors
	local success, result = pcall(handler, receiptInfo, player)
	if not success or not result then
		warn("Error occurred while processing a product purchase")
		print("\nProductId:", receiptInfo.ProductId)
		print("\nPlayer:", player)
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end
 
	-- Record transaction in data store so it isn't granted again
	local success, errorMessage = pcall(function()
		purchaseHistoryStore:SetAsync(playerProductKey, true)
	end)
	if not success then
		error("Cannot save purchase data: " .. errorMessage)
	end
 
	-- IMPORTANT: Tell Roblox that the game successfully handled the purchase
	return Enum.ProductPurchaseDecision.PurchaseGranted
end

mps.ProcessReceipt = processReceipt
