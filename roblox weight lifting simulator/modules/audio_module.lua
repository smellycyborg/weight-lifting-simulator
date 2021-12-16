local module = {}

local SoundService = game:GetService("SoundService")

-- Function to set up audio assets
module.setupAudio = function(assetArray)
	for name, audioID in pairs(assetArray) do
		local audioInstance = Instance.new("Sound")
		audioInstance.SoundId = "rbxassetid://" .. audioID
		audioInstance.Name = name
		audioInstance.Parent = SoundService
	end
end

-- Function to play an audio asset
module.playAudio = function(assetName)
	local audio = SoundService:FindFirstChild(assetName)
	if audio then
		if not audio.IsLoaded then
			audio.Loaded:Wait()
		end
		audio:Play()
	else
		warn("Could not find audio asset: " .. assetName)
	end
end

module.stopAudio = function(assetName)
	local audio = SoundService:FindFirstChild(assetName)
	if audio then
		if audio.IsPlaying then
			audio:Stop()
		end
	end
end

return module