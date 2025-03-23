local fetch
if httpget then
	fetch = httpget
elseif http and http.get then
	fetch = http.get
elseif http and http.request then
	fetch = function(url) return http.request({Url = url, Method = "GET"}).Body end
elseif game and game.HttpGet then
	fetch = function(url) return game:HttpGet(url, true) end
else
	error("Your executor doesn’t support any known HTTP functions!")
end

if not loadstring then
	error("Your executor doesn’t support loadstring!")
end

local API_URL = "https://api.github.com/repos/mxqontopgames/lunorhub/commits/main"
local GITHUB_URL_BASE = "https://raw.githubusercontent.com/mxqontopgames/lunorhub/"

local function fetchKeys()
	local commitResponse = fetch(API_URL)
	if not commitResponse then
		warn("Failed to fetch commit!")
		return nil
	end
	local commitHash = commitResponse:match('"sha":"(.-)"')
	if not commitHash then
		warn("Failed to parse commit hash!")
		return nil
	end
	local response = fetch(GITHUB_URL_BASE .. commitHash .. "/ff2keys.lua")
	if not response then
		warn("Failed to fetch keys!")
		return nil
	end
	local keys = loadstring(response)()
	if not keys or type(keys) ~= "table" then
		warn("Failed to extract table from response!")
		return nil
	end
	return keys
end

local function validatePlayerKey()
	local player = game.Players.LocalPlayer
	if not player then
		warn("LocalPlayer not found!")
		return false
	end

	local keys = fetchKeys()
	if not keys then
		warn("Key fetch failed for " .. player.Name)
		return false
	end

	if not next(keys) then
		warn("Please generate a key from the Discord with your UserId (" .. player.UserId .. "!)")
		return false
	end

	for key, data in pairs(keys) do
		if data.userId == player.UserId and data.active == true then
			return true
		end
	end
	warn("Please generate a key from the Discord with your UserId (" .. player.UserId .. "!)")
	return false
end

local hasValidKey = validatePlayerKey()
if not hasValidKey then
	game.Players.LocalPlayer:Kick("Please do not execute without a key.")
end

if hasValidKey then
	-- Gui to Lua
	-- Version: 3.2

	-- Instances:

	local ScreenGui = Instance.new("ScreenGui")
	local CatchingTab = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Background = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Tabs = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local CatchingTab_2 = Instance.new("Frame")
	local UICorner_4 = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")
	local UIGradient = Instance.new("UIGradient")
	local UIGradient_2 = Instance.new("UIGradient")
	local UIGradient_3 = Instance.new("UIGradient")
	local PlayerTab = Instance.new("Frame")
	local UICorner_5 = Instance.new("UICorner")
	local TextLabel_2 = Instance.new("TextLabel")
	local UIGradient_4 = Instance.new("UIGradient")
	local UIGradient_5 = Instance.new("UIGradient")
	local UIGradient_6 = Instance.new("UIGradient")
	local AutomaticsTab = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local TextLabel_3 = Instance.new("TextLabel")
	local UIGradient_7 = Instance.new("UIGradient")
	local UIGradient_8 = Instance.new("UIGradient")
	local UIGradient_9 = Instance.new("UIGradient")
	local TextLabel_4 = Instance.new("TextLabel")
	local UIGradient_10 = Instance.new("UIGradient")
	local Label = Instance.new("Frame")
	local UICorner_7 = Instance.new("UICorner")
	local TextLabel_5 = Instance.new("TextLabel")
	local UIGradient_11 = Instance.new("UIGradient")
	local UIGradient_12 = Instance.new("UIGradient")
	local UIGradient_13 = Instance.new("UIGradient")
	local TextLabel_6 = Instance.new("TextLabel")
	local UIGradient_14 = Instance.new("UIGradient")

	--Properties:

	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	CatchingTab.Name = "CatchingTab"
	CatchingTab.Parent = ScreenGui
	CatchingTab.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	CatchingTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CatchingTab.BorderSizePixel = 0
	CatchingTab.Position = UDim2.new(0.26039362, 0, 0.249388695, 0)
	CatchingTab.Size = UDim2.new(0.478850454, 0, 0.50000006, 0)

	UICorner.CornerRadius = UDim.new(0, 12)
	UICorner.Parent = CatchingTab

	Background.Name = "Background"
	Background.Parent = CatchingTab
	Background.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Background.BorderSizePixel = 0
	Background.Position = UDim2.new(0.3386226, 0, 0.160161376, 0)
	Background.Size = UDim2.new(0.608838618, 0, 0.131999999, 0)

	UICorner_2.CornerRadius = UDim.new(0, 4)
	UICorner_2.Parent = Background

	Tabs.Name = "Tabs"
	Tabs.Parent = ScreenGui
	Tabs.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tabs.BorderSizePixel = 0
	Tabs.Position = UDim2.new(0.27144745, 0, 0.32273829, 0)
	Tabs.Size = UDim2.new(0.131024331, 0, 0.407090604, 0)
	Tabs.ZIndex = 20

	UICorner_3.CornerRadius = UDim.new(0, 4)
	UICorner_3.Parent = Tabs

	CatchingTab_2.Name = "CatchingTab"
	CatchingTab_2.Parent = Tabs
	CatchingTab_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	CatchingTab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CatchingTab_2.BorderSizePixel = 0
	CatchingTab_2.Position = UDim2.new(0.0404332392, 0, 0.0189995263, 0)
	CatchingTab_2.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
	CatchingTab_2.ZIndex = 0

	UICorner_4.CornerRadius = UDim.new(0, 4)
	UICorner_4.Parent = CatchingTab_2

	TextLabel.Parent = CatchingTab_2
	TextLabel.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0, 0, 0.0516880676, 0)
	TextLabel.Size = UDim2.new(0.999999762, 0, 0.849056304, 0)
	TextLabel.Font = Enum.Font.FredokaOne
	TextLabel.Text = "Catching"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
	UIGradient.Parent = TextLabel

	UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
	UIGradient_2.Parent = TextLabel

	UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
	UIGradient_3.Parent = TextLabel

	PlayerTab.Name = "PlayerTab"
	PlayerTab.Parent = Tabs
	PlayerTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	PlayerTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	PlayerTab.BorderSizePixel = 0
	PlayerTab.Position = UDim2.new(0.0404333025, 0, 0.163171247, 0)
	PlayerTab.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
	PlayerTab.ZIndex = 0

	UICorner_5.CornerRadius = UDim.new(0, 4)
	UICorner_5.Parent = PlayerTab

	TextLabel_2.Parent = PlayerTab
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_2.BorderSizePixel = 0
	TextLabel_2.Position = UDim2.new(0, 0, 0.0516880676, 0)
	TextLabel_2.Size = UDim2.new(0.999999762, 0, 0.849056304, 0)
	TextLabel_2.Font = Enum.Font.FredokaOne
	TextLabel_2.Text = "Player"
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextScaled = true
	TextLabel_2.TextSize = 14.000
	TextLabel_2.TextWrapped = true

	UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
	UIGradient_4.Parent = TextLabel_2

	UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
	UIGradient_5.Parent = TextLabel_2

	UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
	UIGradient_6.Parent = TextLabel_2

	AutomaticsTab.Name = "AutomaticsTab"
	AutomaticsTab.Parent = Tabs
	AutomaticsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	AutomaticsTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	AutomaticsTab.BorderSizePixel = 0
	AutomaticsTab.Position = UDim2.new(0.0404333025, 0, 0.307342976, 0)
	AutomaticsTab.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
	AutomaticsTab.ZIndex = 0

	UICorner_6.CornerRadius = UDim.new(0, 4)
	UICorner_6.Parent = AutomaticsTab

	TextLabel_3.Parent = AutomaticsTab
	TextLabel_3.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
	TextLabel_3.BackgroundTransparency = 1.000
	TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_3.BorderSizePixel = 0
	TextLabel_3.Position = UDim2.new(0, 0, 0.0516880676, 0)
	TextLabel_3.Size = UDim2.new(0.999999762, 0, 0.849056304, 0)
	TextLabel_3.Font = Enum.Font.FredokaOne
	TextLabel_3.Text = "Autos"
	TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_3.TextScaled = true
	TextLabel_3.TextSize = 14.000
	TextLabel_3.TextWrapped = true

	UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
	UIGradient_7.Parent = TextLabel_3

	UIGradient_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
	UIGradient_8.Parent = TextLabel_3

	UIGradient_9.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
	UIGradient_9.Parent = TextLabel_3

	TextLabel_4.Parent = Tabs
	TextLabel_4.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
	TextLabel_4.BackgroundTransparency = 1.000
	TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_4.BorderSizePixel = 0
	TextLabel_4.Position = UDim2.new(0.0502612218, 0, 0.7767061, 0)
	TextLabel_4.Size = UDim2.new(0.897969007, 0, 0.220418692, 0)
	TextLabel_4.ZIndex = 784121829
	TextLabel_4.Font = Enum.Font.FredokaOne
	TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_4.TextScaled = true
	TextLabel_4.TextSize = 14.000
	TextLabel_4.TextWrapped = true

	UIGradient_10.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
	UIGradient_10.Parent = TextLabel_4

	Label.Name = "Label"
	Label.Parent = ScreenGui
	Label.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Label.BorderSizePixel = 0
	Label.Position = UDim2.new(0.260393649, 0, 0.24938865, 0)
	Label.Size = UDim2.new(0.478850394, 0, 0.0647923276, 0)
	Label.ZIndex = 20

	UICorner_7.CornerRadius = UDim.new(0, 4)
	UICorner_7.Parent = Label

	TextLabel_5.Parent = Label
	TextLabel_5.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
	TextLabel_5.BackgroundTransparency = 1.000
	TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_5.BorderSizePixel = 0
	TextLabel_5.Position = UDim2.new(-1.12445036e-07, 0, 0.150943056, 0)
	TextLabel_5.Size = UDim2.new(0.231761307, 0, 0.698113918, 0)
	TextLabel_5.Font = Enum.Font.FredokaOne
	TextLabel_5.Text = "Lunor"
	TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_5.TextScaled = true
	TextLabel_5.TextSize = 14.000
	TextLabel_5.TextWrapped = true

	UIGradient_11.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
	UIGradient_11.Parent = TextLabel_5

	UIGradient_12.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
	UIGradient_12.Parent = TextLabel_5

	UIGradient_13.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
	UIGradient_13.Parent = TextLabel_5

	TextLabel_6.Parent = ScreenGui
	TextLabel_6.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
	TextLabel_6.BackgroundTransparency = 1.000
	TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_6.BorderSizePixel = 0
	TextLabel_6.Position = UDim2.new(0.228072792, 0, 0.431837827, 0)
	TextLabel_6.Size = UDim2.new(0.542345762, 0, 0.133126125, 0)
	TextLabel_6.ZIndex = 784121829
	TextLabel_6.Font = Enum.Font.FredokaOne
	TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_6.TextScaled = true
	TextLabel_6.TextSize = 14.000
	TextLabel_6.TextTransparency = 1.000
	TextLabel_6.TextWrapped = true

	UIGradient_14.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
	UIGradient_14.Parent = TextLabel_6

	-- Scripts:

	local function QZSKFB_fake_script() -- TextLabel_4.LocalScript 
		local script = Instance.new('LocalScript', TextLabel_4)

		script.Parent.Text = "Welcome ".. game.Players.LocalPlayer.DisplayName .."."
	end
	coroutine.wrap(QZSKFB_fake_script)()
	local function VFILXJ_fake_script() -- ScreenGui.LocalScript 
		local script = Instance.new('LocalScript', ScreenGui)

		for i,v in script.Parent:GetDescendants() do
			if not v:IsA("LocalScript") and not v:IsA("TextLabel") and not v:IsA("UICorner") and not v:IsA("UIGradient") then
				v.Transparency = 1
			elseif v:IsA("TextLabel") then
				v.TextTransparency = 1
			end
		end
	end
	coroutine.wrap(VFILXJ_fake_script)()
	local function HKYFGL_fake_script() -- TextLabel_6.LocalScript 
		local script = Instance.new('LocalScript', TextLabel_6)

		local TweenService = game:GetService("TweenService")
		local textLabel = script.Parent

		textLabel.Text = "Welcome " .. game.Players.LocalPlayer.DisplayName .. "."

		local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

		local fadeIn = TweenService:Create(textLabel, tweenInfo, {TextTransparency = 0})
		fadeIn:Play()
		fadeIn.Completed:Wait()

		task.wait(1)

		local fadeOut = TweenService:Create(textLabel, tweenInfo, {TextTransparency = 1})
		fadeOut:Play()
		fadeOut.Completed:Wait()

		for _, v in pairs(script.Parent.Parent:GetDescendants()) do
			if v:IsA("Frame") then
				TweenService:Create(v, tweenInfo, {Transparency = 0}):Play()
			elseif v:IsA("TextLabel") and v ~= textLabel then
				TweenService:Create(v, tweenInfo, {TextTransparency = 0}):Play()
			end
		end
	end
	coroutine.wrap(HKYFGL_fake_script)()

end
