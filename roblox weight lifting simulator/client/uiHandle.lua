--// Variables

local players = game:GetService("Players")
local player = players.LocalPlayer
local b_sound = workspace.sounds.button_sound

--// Bool Variables

local rebirth_menu_open = false
local twitter_menu_open = false
local settings_menu_open = false
local pets_menu_open = false
local sound_playing = false
local buy_coins_menu_open = false
local buy_gems_menu_open = false

local menu_open = false

--// Gui Variables

local main_gui = player.PlayerGui:WaitForChild("Main")
local buttons = main_gui:WaitForChild("toggleIcons")
local stats_display = main_gui:WaitForChild("statDisplay")

local rebirth_button = buttons:FindFirstChild("Rebirths")
local twitter_button = buttons:FindFirstChild("Twitter")
local settings_button = buttons:FindFirstChild("Settings")
local soundEffectsButton = main_gui.settingsMenu.SFX:FindFirstChild("Config")
local pets_button = buttons:FindFirstChild("Pets")

local buy_gems_button = stats_display:FindFirstChild("Gems").buyGems
local buy_coins_button = stats_display:FindFirstChild("Coins").buyCoins

local rebirth = main_gui:FindFirstChild("rebirthMenu")
local twitter = main_gui:FindFirstChild("twitterMenu")
local settings_menu = main_gui:FindFirstChild("settingsMenu")
local pets_menu = main_gui:FindFirstChild("petsMenu")
local buy_coins_menu = main_gui:FindFirstChild("buyCoins")
local buy_gems_menu = main_gui:FindFirstChild("buyGems")
local heaven_menu = main_gui:FindFirstChild("heaven")

local exit_rebirth = rebirth:FindFirstChild("Exit")
local exit_twitter = twitter:FindFirstChild("Exit")
local exit_settings = settings_menu:FindFirstChild("Exit")
local exit_pets = pets_menu:FindFirstChild("Exit")
local exit_buy_coins = buy_coins_menu:FindFirstChild("Exit")
local exit_buy_gems = buy_gems_menu:FindFirstChild("Exit")

--// Functions

local stopPlaying = function()
	if sound_playing then
		wait(.2)
		b_sound:Stop()
		sound_playing = false
	end
end

local soundEffectsOff = false

soundEffectsButton.MouseButton1Click:Connect(function()
	if not soundEffectsOff then 
		soundEffectsOff = true
		soundEffectsButton.ImageColor3 = Color3.new(1, 0, 0)
		soundEffectsButton.TextLabel.Text = "off"
		
	else
		soundEffectsOff = false
		soundEffectsButton.ImageColor3 = Color3.new(0.0470588, 1, 0)
		soundEffectsButton.TextLabel.Text = "on"
	end
end)

--// rebirth Functions

rebirth_button.MouseButton1Click:Connect(function()
	rebirth_button:TweenSize(UDim2.new(0.047, 0,0.084, 0),Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 0.1, true)
	if rebirth_menu_open and menu_open then
		rebirth:TweenPosition(UDim2.new(1.5,0,0.5,0),"Out","Quint",0.2,false)
		rebirth_menu_open = false
		menu_open = false
		
	elseif not menu_open then
		rebirth:TweenPosition(UDim2.new(0.5,0,0.5,0),"In","Quint",0.2,false)
		rebirth_menu_open = true
		menu_open = true
		if soundEffectsOff then return end
		
		b_sound:Play()
		sound_playing = true
		stopPlaying()
	end
end)

exit_rebirth.MouseButton1Click:Connect(function()
	if  rebirth_menu_open and menu_open then
		rebirth:TweenPosition(UDim2.new(1.5,0,0.5,0),"Out","Quint",0.2,false)
		rebirth_menu_open = false
		menu_open = false
		if soundEffectsOff then return end
		
		b_sound:Play()
		sound_playing = true
		stopPlaying()
	end
end)

--// twitter Functions

twitter_button.MouseButton1Click:Connect(function()
	twitter_button:TweenSize(UDim2.new(0.047, 0,0.084, 0),Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 0.1, true)
	if twitter_menu_open and menu_open then
		twitter:TweenPosition(UDim2.new(1.5,0,0.5,0),"Out","Quint",0.2,false)
		twitter_menu_open = false
		menu_open = false
		
	elseif not menu_open then
		twitter:TweenPosition(UDim2.new(0.5,0,0.5,0),"In","Quint",0.2,false)
		twitter_menu_open = true
		menu_open = true
		if soundEffectsOff then return end
		
		b_sound:Play()
		sound_playing = true
		stopPlaying()
	end
end)

exit_twitter.MouseButton1Click:Connect(function()
	if  twitter_menu_open and menu_open then
		twitter:TweenPosition(UDim2.new(1.5,0,0.5,0),"Out","Quint",0.2,false)
		twitter_menu_open = false
		menu_open = false
		if soundEffectsOff then return end
		
		b_sound:Play()
		sound_playing = true
		stopPlaying()
	end
end)

--// settings Functions

settings_button.MouseButton1Click:Connect(function()
	settings_button:TweenSize(UDim2.new(0.047, 0,0.084, 0),Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 0.1, true)
	if settings_menu_open and menu_open then
		settings_menu:TweenPosition(UDim2.new(1.5,0,0.5,0),"Out","Quint",0.2,false)
		settings_menu_open = false
		menu_open = false
		
	elseif not menu_open then
		settings_menu:TweenPosition(UDim2.new(0.5,0,0.5,0),"In","Quint",0.2,false)
		settings_menu_open = true
		menu_open = true
		if soundEffectsOff then return end
		
		b_sound:Play()
		sound_playing = true
		stopPlaying()
	end
end)

exit_settings.MouseButton1Click:Connect(function()
	if  settings_menu_open and menu_open then
		settings_menu:TweenPosition(UDim2.new(1.5,0,0.5,0),"Out","Quint",0.2,false)
		settings_menu_open = false
		menu_open = false
		if soundEffectsOff then return end
		
		b_sound:Play()
		sound_playing = true
		stopPlaying()
	end
end)

--// pets Functions

pets_button.MouseButton1Click:Connect(function()
	pets_button:TweenSize(UDim2.new(0.047, 0,0.084, 0),Enum.EasingDirection.InOut, Enum.EasingStyle.Quint, 0.1, true)
	if pets_menu_open and menu_open then
		pets_menu:TweenPosition(UDim2.new(1.5,0,0.5,0),"Out","Quint",0.2,false)
		pets_menu_open = false
		menu_open = false
		
	elseif not menu_open then
		pets_menu:TweenPosition(UDim2.new(0.5,0,0.5,0),"In","Quint",0.2,false)
		pets_menu_open = true
		menu_open = true
		if soundEffectsOff then return end
		
		b_sound:Play()
		sound_playing = true
		stopPlaying()
	end
end)

exit_pets.MouseButton1Click:Connect(function()
	if  pets_menu_open and menu_open then
		pets_menu:TweenPosition(UDim2.new(1.5,0,0.5,0),"Out","Quint",0.2,false)
		pets_menu_open = false
		menu_open = false
		if soundEffectsOff then return end
		
		b_sound:Play()
		sound_playing = true
		stopPlaying()
	end
end)

--// Buy Menu Functions

buy_coins_button.MouseButton1Click:Connect(function()
	if buy_coins_menu_open and menu_open then
		buy_coins_menu:TweenPosition(UDim2.new(1.5,0,0.5,0),"Out","Quint",0.2,false)
		buy_coins_menu_open = false
		menu_open = false
		
	elseif not menu_open then
		buy_coins_menu:TweenPosition(UDim2.new(0.5,0,0.5,0),"In","Quint",0.2,false)
		buy_coins_menu_open = true
		menu_open = true
		if soundEffectsOff then return end
		
		b_sound:Play()
		sound_playing = true
		stopPlaying()
	end
end)

exit_buy_coins.MouseButton1Click:Connect(function()
	if  buy_coins_menu_open and menu_open then
		buy_coins_menu:TweenPosition(UDim2.new(1.5,0,0.5,0),"Out","Quint",0.2,false)
		buy_coins_menu_open = false
		menu_open = false
		if soundEffectsOff then return end
		
		b_sound:Play()
		sound_playing = true
		stopPlaying()
	end
end)

buy_gems_button.MouseButton1Click:Connect(function()
	if buy_gems_menu_open and menu_open then
		buy_gems_menu:TweenPosition(UDim2.new(1.5,0,0.5,0),"Out","Quint",0.2,false)
		buy_gems_menu_open = false
		menu_open = false
		
	elseif not menu_open then
		buy_gems_menu:TweenPosition(UDim2.new(0.5,0,0.5,0),"In","Quint",0.2,false)
		buy_gems_menu_open = true
		menu_open = true
		if soundEffectsOff then return end
		
		b_sound:Play()
		sound_playing = true
		stopPlaying()
	end
end)

exit_buy_gems.MouseButton1Click:Connect(function()
	if  buy_gems_menu_open and menu_open then
		buy_gems_menu:TweenPosition(UDim2.new(1.5,0,0.5,0),"Out","Quint",0.2,false)
		buy_gems_menu_open = false
		menu_open = false
		if soundEffectsOff then return end
		
		b_sound:Play()
		sound_playing = true
		stopPlaying()
	end
end)


game.ReplicatedStorage.remote_events.eggs.openHeaven.OnClientEvent:Connect(function()
	if menu_open then return end
	
	heaven_menu:TweenPosition(UDim2.new(0.5,0,0.5,0),"In","Quint",0.2,false)
	menu_open = true
end)


heaven_menu:FindFirstChild("Exit").Activated:Connect(function()
	if not menu_open then return end
	
	heaven_menu:TweenPosition(UDim2.new(1.5,0,0.5,0),"Out","Quint",0.2,false)
	menu_open = false
end)

