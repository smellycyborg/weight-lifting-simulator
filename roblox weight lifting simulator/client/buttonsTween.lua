local TweenService = game:GetService("TweenService")
local mainGui = script.Parent

local playing = false

local tweenInfo = TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In, -1, true, 0)

for _, v in pairs(mainGui:GetDescendants()) do
	if v:GetAttribute("button") then
		
		local Tween = TweenService:Create(v, tweenInfo, {Rotation = 20})
		v.MouseEnter:Connect(function()
			if playing then return end
			
			Tween:Play()
			playing = true
			wait(.6)
			Tween:Cancel()
			playing = false
		end)
	end
end