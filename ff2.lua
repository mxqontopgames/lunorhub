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
local Welcome = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local UI = Instance.new("Frame")
local CatchingTab = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Background = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UIGradient_2 = Instance.new("UIGradient")
local UIGradient_3 = Instance.new("UIGradient")
local UIGradient_4 = Instance.new("UIGradient")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Switch = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local Switch1 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local Background_2 = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local TextButton_2 = Instance.new("TextButton")
local UIGradient_5 = Instance.new("UIGradient")
local UIGradient_6 = Instance.new("UIGradient")
local UIGradient_7 = Instance.new("UIGradient")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
local Tabs = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local CatchingTab_2 = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UIGradient_8 = Instance.new("UIGradient")
local UIGradient_9 = Instance.new("UIGradient")
local UIGradient_10 = Instance.new("UIGradient")
local f = Instance.new("TextButton")
local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
local PlayerTab = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local UIGradient_11 = Instance.new("UIGradient")
local UIGradient_12 = Instance.new("UIGradient")
local UIGradient_13 = Instance.new("UIGradient")
local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
local AutomaticsTab = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local TextLabel_3 = Instance.new("TextLabel")
local UIGradient_14 = Instance.new("UIGradient")
local UIGradient_15 = Instance.new("UIGradient")
local UIGradient_16 = Instance.new("UIGradient")
local UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")
local TextLabel_4 = Instance.new("TextLabel")
local UIGradient_17 = Instance.new("UIGradient")
local UIAspectRatioConstraint_10 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_11 = Instance.new("UIAspectRatioConstraint")
local Top = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")
local TextLabel_5 = Instance.new("TextLabel")
local UIGradient_18 = Instance.new("UIGradient")
local UIGradient_19 = Instance.new("UIGradient")
local UIGradient_20 = Instance.new("UIGradient")
local UIAspectRatioConstraint_12 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_13 = Instance.new("UIAspectRatioConstraint")
local Label = Instance.new("ImageLabel")
local UIAspectRatioConstraint_14 = Instance.new("UIAspectRatioConstraint")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Welcome.Name = "Welcome"
Welcome.Parent = ScreenGui
Welcome.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
Welcome.BackgroundTransparency = 1.000
Welcome.BorderColor3 = Color3.fromRGB(0, 0, 0)
Welcome.BorderSizePixel = 0
Welcome.Position = UDim2.new(0.228072792, 0, 0.431837827, 0)
Welcome.Size = UDim2.new(0.542345762, 0, 0.133126125, 0)
Welcome.ZIndex = 784121829
Welcome.Font = Enum.Font.FredokaOne
Welcome.TextColor3 = Color3.fromRGB(255, 255, 255)
Welcome.TextScaled = true
Welcome.TextSize = 14.000
Welcome.TextTransparency = 1.000
Welcome.TextWrapped = true

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient.Parent = Welcome

UI.Name = "UI"
UI.Parent = ScreenGui
UI.AnchorPoint = Vector2.new(0.5, 0)
UI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UI.BackgroundTransparency = 1.000
UI.BorderColor3 = Color3.fromRGB(0, 0, 0)
UI.BorderSizePixel = 0
UI.Position = UDim2.new(0.5, 0, 0.233496308, 0)
UI.Size = UDim2.new(0.501528025, 0, 0.531090677, 0)

CatchingTab.Name = "CatchingTab"
CatchingTab.Parent = UI
CatchingTab.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
CatchingTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
CatchingTab.BorderSizePixel = 0
CatchingTab.Position = UDim2.new(-4.484097e-08, 0, 7.02470544e-08, 0)
CatchingTab.Size = UDim2.new(0.999999702, 0, 1.00000012, 0)
CatchingTab.ZIndex = 0

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = CatchingTab

Background.Name = "Background"
Background.Parent = CatchingTab
Background.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.3386226, 0, 0.167370707, 0)
Background.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
Background.ZIndex = 2

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = Background

TextButton.Parent = Background
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.022160558, 0, 0.190203443, 0)
TextButton.Size = UDim2.new(0.502305567, 0, 0.599002898, 0)
TextButton.Font = Enum.Font.FredokaOne
TextButton.Text = "Magnets"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
TextButton.TextXAlignment = Enum.TextXAlignment.Left

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_2.Parent = TextButton

UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_3.Parent = TextButton

UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_4.Parent = TextButton

UIAspectRatioConstraint.Parent = TextButton
UIAspectRatioConstraint.AspectRatio = 4.428

Switch.Name = "Switch"
Switch.Parent = Background
Switch.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
Switch.BackgroundTransparency = 0.800
Switch.BorderColor3 = Color3.fromRGB(0, 0, 0)
Switch.BorderSizePixel = 0
Switch.Position = UDim2.new(0.798893094, 0, 0.237907037, 0)
Switch.Size = UDim2.new(0.160436109, 0, 0.558846653, 0)
Switch.ZIndex = 2

UICorner_3.CornerRadius = UDim.new(20, 0)
UICorner_3.Parent = Switch

UIAspectRatioConstraint_2.Parent = Switch
UIAspectRatioConstraint_2.AspectRatio = 2.695

Switch1.Name = "Switch1"
Switch1.Parent = Background
Switch1.BackgroundColor3 = Color3.fromRGB(120, 52, 255)
Switch1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Switch1.BorderSizePixel = 0
Switch1.Position = UDim2.new(0.798893154, 0, 0.228659093, 0)
Switch1.Size = UDim2.new(0.0623449758, 0, 0.515391111, 0)
Switch1.ZIndex = 3

UICorner_4.CornerRadius = UDim.new(20, 0)
UICorner_4.Parent = Switch1

UIAspectRatioConstraint_3.Parent = Switch1
UIAspectRatioConstraint_3.AspectRatio = 1.029

UIAspectRatioConstraint_4.Parent = CatchingTab
UIAspectRatioConstraint_4.AspectRatio = 1.567

Background_2.Name = "Background"
Background_2.Parent = CatchingTab
Background_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Background_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background_2.BorderSizePixel = 0
Background_2.Position = UDim2.new(0.3386226, 0, 0.289369017, 0)
Background_2.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
Background_2.ZIndex = 2

UICorner_5.CornerRadius = UDim.new(0, 4)
UICorner_5.Parent = Background_2

TextButton_2.Parent = Background_2
TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.BackgroundTransparency = 1.000
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(0.022160558, 0, 0.190203443, 0)
TextButton_2.Size = UDim2.new(0.502305567, 0, 0.599002898, 0)
TextButton_2.Font = Enum.Font.FredokaOne
TextButton_2.Text = "Magnets Range"
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextScaled = true
TextButton_2.TextSize = 14.000
TextButton_2.TextWrapped = true
TextButton_2.TextXAlignment = Enum.TextXAlignment.Left

UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_5.Parent = TextButton_2

UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_6.Parent = TextButton_2

UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_7.Parent = TextButton_2

UIAspectRatioConstraint_5.Parent = TextButton_2
UIAspectRatioConstraint_5.AspectRatio = 4.428

Tabs.Name = "Tabs"
Tabs.Parent = UI
Tabs.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tabs.BorderSizePixel = 0
Tabs.Position = UDim2.new(0.0230841599, 0, 0.146699294, 0)
Tabs.Size = UDim2.new(0.273622662, 0, 0.814180732, 0)
Tabs.ZIndex = 20

UICorner_6.CornerRadius = UDim.new(0, 4)
UICorner_6.Parent = Tabs

CatchingTab_2.Name = "CatchingTab"
CatchingTab_2.Parent = Tabs
CatchingTab_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
CatchingTab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
CatchingTab_2.BorderSizePixel = 0
CatchingTab_2.Position = UDim2.new(0.0404332392, 0, 0.0189995263, 0)
CatchingTab_2.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
CatchingTab_2.ZIndex = 0

UICorner_7.CornerRadius = UDim.new(0, 4)
UICorner_7.Parent = CatchingTab_2

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

UIGradient_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_8.Parent = TextLabel

UIGradient_9.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_9.Parent = TextLabel

UIGradient_10.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_10.Parent = TextLabel

f.Name = "f"
f.Parent = TextLabel
f.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
f.BackgroundTransparency = 0.999
f.BorderColor3 = Color3.fromRGB(0, 0, 0)
f.BorderSizePixel = 0
f.Size = UDim2.new(1, 0, 1, 0)
f.Font = Enum.Font.FredokaOne
f.Text = "Catching"
f.TextColor3 = Color3.fromRGB(255, 255, 255)
f.TextScaled = true
f.TextSize = 14.000
f.TextTransparency = 1.000
f.TextWrapped = true

UIAspectRatioConstraint_6.Parent = CatchingTab_2
UIAspectRatioConstraint_6.AspectRatio = 3.897

PlayerTab.Name = "PlayerTab"
PlayerTab.Parent = Tabs
PlayerTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
PlayerTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlayerTab.BorderSizePixel = 0
PlayerTab.Position = UDim2.new(0.0404333025, 0, 0.163171247, 0)
PlayerTab.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
PlayerTab.ZIndex = 0

UICorner_8.CornerRadius = UDim.new(0, 4)
UICorner_8.Parent = PlayerTab

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

UIGradient_11.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_11.Parent = TextLabel_2

UIGradient_12.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_12.Parent = TextLabel_2

UIGradient_13.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_13.Parent = TextLabel_2

UIAspectRatioConstraint_7.Parent = PlayerTab
UIAspectRatioConstraint_7.AspectRatio = 3.897

AutomaticsTab.Name = "AutomaticsTab"
AutomaticsTab.Parent = Tabs
AutomaticsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
AutomaticsTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
AutomaticsTab.BorderSizePixel = 0
AutomaticsTab.Position = UDim2.new(0.0404333025, 0, 0.307342976, 0)
AutomaticsTab.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
AutomaticsTab.ZIndex = 0

UICorner_9.CornerRadius = UDim.new(0, 4)
UICorner_9.Parent = AutomaticsTab

TextLabel_3.Parent = AutomaticsTab
TextLabel_3.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0, 0, 0.0516880676, 0)
TextLabel_3.Size = UDim2.new(0.999999702, 0, 0.849056244, 0)
TextLabel_3.Font = Enum.Font.FredokaOne
TextLabel_3.Text = "Autos"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14.000
TextLabel_3.TextWrapped = true

UIGradient_14.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_14.Parent = TextLabel_3

UIGradient_15.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_15.Parent = TextLabel_3

UIGradient_16.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_16.Parent = TextLabel_3

UIAspectRatioConstraint_8.Parent = TextLabel_3
UIAspectRatioConstraint_8.AspectRatio = 4.590

UIAspectRatioConstraint_9.Parent = AutomaticsTab
UIAspectRatioConstraint_9.AspectRatio = 3.897

TextLabel_4.Parent = Tabs
TextLabel_4.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0.0234109145, 0, 0.864349425, 0)
TextLabel_4.Size = UDim2.new(0.944368541, 0, 0.135602579, 0)
TextLabel_4.ZIndex = 784121829
TextLabel_4.Font = Enum.Font.FredokaOne
TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14.000
TextLabel_4.TextWrapped = true

UIGradient_17.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_17.Parent = TextLabel_4

UIAspectRatioConstraint_10.Parent = TextLabel_4
UIAspectRatioConstraint_10.AspectRatio = 3.667

UIAspectRatioConstraint_11.Parent = Tabs
UIAspectRatioConstraint_11.AspectRatio = 0.526

Top.Name = "Top"
Top.Parent = UI
Top.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(2.24204854e-07, 0, 3.51235258e-07, 0)
Top.Size = UDim2.new(0.999999702, 0, 0.128740042, 0)
Top.ZIndex = 891718247

UICorner_10.CornerRadius = UDim.new(0, 4)
UICorner_10.Parent = Top

TextLabel_5.Parent = Top
TextLabel_5.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
TextLabel_5.BackgroundTransparency = 1.000
TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(-1.34522949e-07, 0, 0.115182973, 0)
TextLabel_5.Size = UDim2.new(0.246454805, 0, 1.10871196, 0)
TextLabel_5.Font = Enum.Font.FredokaOne
TextLabel_5.Text = "Lunor"
TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.TextScaled = true
TextLabel_5.TextSize = 14.000
TextLabel_5.TextWrapped = true

UIGradient_18.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_18.Parent = TextLabel_5

UIGradient_19.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_19.Parent = TextLabel_5

UIGradient_20.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_20.Parent = TextLabel_5

UIAspectRatioConstraint_12.Parent = TextLabel_5
UIAspectRatioConstraint_12.AspectRatio = 4.040

UIAspectRatioConstraint_13.Parent = Top
UIAspectRatioConstraint_13.AspectRatio = 12.169

Label.Name = "Label"
Label.Parent = Top
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label.BorderSizePixel = 0
Label.Position = UDim2.new(0.921281993, 0, 0.125161558, 0)
Label.Size = UDim2.new(0.0603275783, 0, 0.732395411, 0)
Label.Image = "rbxassetid://94594775251689"

UIAspectRatioConstraint_14.Parent = UI
UIAspectRatioConstraint_14.AspectRatio = 1.567

-- Scripts:

local function LNRYP_fake_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)

	local vis = false
	
	for i,v in script.Parent:GetDescendants() do
		if not v:IsA("LocalScript") and not v:IsA("TextLabel") and not v:IsA("UICorner") and not v:IsA("UIGradient") and not v:IsA("UIAspectRatioConstraint") then
			v.Transparency = 1
		elseif v:IsA("TextLabel") then
			v.TextTransparency = 1
		end
	end
	
	task.wait(3)
	
	vis = true
	
	game:GetService("UserInputService").InputBegan:Connect(function(input,gp)
		if input.KeyCode == Enum.KeyCode.RightShift and not gp then
			if not vis then
				local TweenService = game:GetService("TweenService")
	
				local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	
				for _, v in script.Parent.UI:GetDescendants() do
					if v:IsA("Frame") and v.Name ~= "UI" then
						TweenService:Create(v, tweenInfo, {Transparency = 0}):Play()
					elseif v:IsA("TextLabel") then
						TweenService:Create(v, tweenInfo, {TextTransparency = 0}):Play()
					elseif v:IsA("TextButton") and v.Name ~= "f" then
						TweenService:Create(v, tweenInfo, {TextTransparency = 0}):Play()
					end
				end
			else
				local TweenService = game:GetService("TweenService")
	
				local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	
				for _, v in script.Parent.UI:GetDescendants() do
					if v:IsA("Frame") and v.Name ~= "UI" then
						TweenService:Create(v, tweenInfo, {Transparency = 1}):Play()
					elseif v:IsA("TextLabel") then
						TweenService:Create(v, tweenInfo, {TextTransparency = 1}):Play()
					elseif v:IsA("TextButton") and v.Name ~= "f" then
						TweenService:Create(v, tweenInfo, {TextTransparency = 1}):Play()
					end
				end
			end
			vis = not vis
		end
	end)
end
coroutine.wrap(LNRYP_fake_script)()
local function OLYFN_fake_script() -- Welcome.LocalScript 
	local script = Instance.new('LocalScript', Welcome)

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
	
	for _, v in script.Parent.Parent:GetDescendants() do
		if v:IsA("Frame") and v.Name ~= "UI" then
			TweenService:Create(v, tweenInfo, {Transparency = 0}):Play()
		elseif v:IsA("TextLabel") and v ~= textLabel then
			TweenService:Create(v, tweenInfo, {TextTransparency = 0}):Play()
		elseif v:IsA("TextButton") and v.Name ~= "f" then
			TweenService:Create(v, tweenInfo, {TextTransparency = 0}):Play()
		end
	end
end
coroutine.wrap(OLYFN_fake_script)()
local function UVXQDFM_fake_script() -- Switch1.LocalScript 
	local script = Instance.new('LocalScript', Switch1)

	local toggle = script.Parent
	local toggled = false
	local tween = game:GetService("TweenService")
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	
	task.wait(2)
	
	toggle.UIAspectRatioConstraint:Destroy()
	
	toggle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if not toggled then
				
	
				local goal = {}
				goal.Size = UDim2.new(0.16, 0, toggle.Size.Y.Scale, 0)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
	
				toggled = true
				tween:Create(toggle, info, goal):Play()
			else
				
	
				local goal = {}
				goal.Size = UDim2.new(0.062, 0, toggle.Size.Y.Scale, 0)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
	
				toggled = false
				tween:Create(toggle, info, goal):Play()
			end
		end
	end)
	
	mouse.Button1Down:Connect(function()
		local player = game:GetService("Players").LocalPlayer
		if player and player.Character and toggled then
			local mind = math.huge
			local cf = nil
	
			for i,v in workspace:GetChildren() do
				if v.Name == "Football" and v:IsA('BasePart') then
					if (v.Position - game:GetService("Players").LocalPlayer.Character.Head.Position).Magnitude < mind then
						mind = (v.Position - game:GetService("Players").LocalPlayer.Character.Head.Position).Magnitude
						cf = v
					end
				end
			end
	
			local st = tick()
	
			while tick() - st < 3 and cf do
				firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("CatchRight"),cf,0)
				firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("CatchLeft"),cf,0)
				task.wait(0.1)
				firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("CatchRight"),cf,1)
				firetouchinterest(game:GetService("Players").LocalPlayer.Character:FindFirstChild("CatchLeft"),cf,1)
			end
		end
	end)
end
coroutine.wrap(UVXQDFM_fake_script)()
local function PTCHYS_fake_script() -- f.LocalScript 
	local script = Instance.new('LocalScript', f)

	local Button = script.Parent
	local UI = Button.Parent.Parent.Parent.Parent
	local TabName = "CatchingTab"
	
	Button.MouseButton1Down:Connect(function()
		for i,v in UI:GetChildren() do
			if v.Name ~= "Tabs" and v.Name ~= "Top" and v ~= UI:FindFirstChild(TabName) then
				v.ZIndex = 0
			elseif UI:FindFirstChild(TabName) then
				v.ZIndex = 19
			end
		end
	end)
end
coroutine.wrap(PTCHYS_fake_script)()
local function PHAJR_fake_script() -- TextLabel_4.LocalScript 
	local script = Instance.new('LocalScript', TextLabel_4)

	script.Parent.Text = "Hello ".. game.Players.LocalPlayer.DisplayName .."!"
end
coroutine.wrap(PHAJR_fake_script)()
local function FIZZ_fake_script() -- Top.LocalScript 
	local script = Instance.new('LocalScript', Top)

	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local TweenService = game:GetService("TweenService")
	
	local LocalPlayer = Players.LocalPlayer
	local Mouse = LocalPlayer:GetMouse()
	local Topbar = script.Parent
	local UI = Topbar.Parent
	
	-- Configuration
	local DRAG_SPEED = 0.1 -- Lower is faster, higher is slower
	local BOUNDARY_PADDING = 0 -- Pixels from screen edge
	local MOMENTUM_FACTOR = 0.5 -- How much initial momentum is preserved
	local FRICTION = 0.95 -- How quickly momentum fades (closer to 1 = slower stop)
	local MIN_VELOCITY = 5 -- Minimum speed to continue sliding
	local SNAP_BACK_SPEED = 0.3 -- Time in seconds for snap-back animation
	
	-- Variables
	local isDragging = false
	local offsetX, offsetY
	local screenSize = UI.Parent.AbsoluteSize
	local tweenActive = false
	local velocityX, velocityY = 0, 0
	local lastPosX, lastPosY
	local lastUpdateTime
	
	-- Utility Functions
	local function clamp(value, min, max)
		return math.max(min, math.min(max, value))
	end
	
	local function updateScreenSize()
		screenSize = UI.Parent.AbsoluteSize
	end
	
	-- Position Update with UI Velocity
	local function updatePosition(deltaTime)
		local currentPos = UI.AbsolutePosition
	
		if isDragging then
			-- Calculate UI velocity while dragging
			local currentTime = tick()
			if lastUpdateTime and lastPosX and lastPosY then
				local timeDiff = currentTime - lastUpdateTime
				if timeDiff > 0 then
					velocityX = (currentPos.X - lastPosX) / timeDiff
					velocityY = (currentPos.Y - lastPosY) / timeDiff
				end
			end
			lastUpdateTime = currentTime
			lastPosX = currentPos.X
			lastPosY = currentPos.Y
	
			-- Regular dragging
			local targetX = clamp(Mouse.X + offsetX, BOUNDARY_PADDING, screenSize.X - UI.AbsoluteSize.X - BOUNDARY_PADDING)
			local targetY = clamp(Mouse.Y + offsetY, BOUNDARY_PADDING, screenSize.Y - UI.AbsoluteSize.Y - BOUNDARY_PADDING)
	
			local newX = currentPos.X + (targetX - currentPos.X) * DRAG_SPEED
			local newY = currentPos.Y + (targetY - currentPos.Y) * DRAG_SPEED
	
			UI.Position = UDim2.new(newX / screenSize.X, 0, newY / screenSize.Y, 0)
	
		elseif not tweenActive then
			-- Apply momentum based on UI velocity
			local speed = math.sqrt(velocityX * velocityX + velocityY * velocityY)
	
			if speed > MIN_VELOCITY then
				local newX = currentPos.X + velocityX * MOMENTUM_FACTOR * deltaTime
				local newY = currentPos.Y + velocityY * MOMENTUM_FACTOR * deltaTime
	
				-- Apply friction
				velocityX = velocityX * FRICTION
				velocityY = velocityY * FRICTION
	
				-- Keep within bounds
				newX = clamp(newX, BOUNDARY_PADDING, screenSize.X - UI.AbsoluteSize.X - BOUNDARY_PADDING)
				newY = clamp(newY, BOUNDARY_PADDING, screenSize.Y - UI.AbsoluteSize.Y - BOUNDARY_PADDING)
	
				UI.Position = UDim2.new(newX / screenSize.X, 0, newY / screenSize.Y, 0)
	
				-- Update velocity based on actual movement
				if lastUpdateTime and lastPosX and lastPosY then
					local timeDiff = tick() - lastUpdateTime
					if timeDiff > 0 then
						velocityX = (newX - lastPosX) / timeDiff
						velocityY = (newY - lastPosY) / timeDiff
					end
				end
				lastPosX = newX
				lastPosY = newY
				lastUpdateTime = tick()
			else
				velocityX, velocityY = 0, 0
			end
		end
	end
	
	-- Start Dragging
	Topbar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			isDragging = true
			updateScreenSize()
	
			local uiPos = UI.AbsolutePosition
			offsetX = uiPos.X - Mouse.X
			offsetY = uiPos.Y - Mouse.Y
	
			velocityX, velocityY = 0, 0
			lastPosX = uiPos.X
			lastPosY = uiPos.Y
			lastUpdateTime = tick()
	
			if tweenActive then
				tweenActive = false
			end
		end
	end)
	
	-- Stop Dragging
	Topbar.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			isDragging = false
	
			-- Check if we need to snap to boundaries
			local currentPos = UI.AbsolutePosition
			local targetX = clamp(currentPos.X, BOUNDARY_PADDING, screenSize.X - UI.AbsoluteSize.X - BOUNDARY_PADDING)
			local targetY = clamp(currentPos.Y, BOUNDARY_PADDING, screenSize.Y - UI.AbsoluteSize.Y - BOUNDARY_PADDING)
	
			if math.abs(currentPos.X - targetX) > 1 or math.abs(currentPos.Y - targetY) > 1 then
				local goal = {
					Position = UDim2.new(targetX / screenSize.X, 0, targetY / screenSize.Y, 0)
				}
	
				local tweenInfo = TweenInfo.new(
					SNAP_BACK_SPEED,
					Enum.EasingStyle.Quad,
					Enum.EasingDirection.Out
				)
	
				local tween = TweenService:Create(UI, tweenInfo, goal)
				tweenActive = true
				tween:Play()
	
				tween.Completed:Connect(function()
					tweenActive = false
					velocityX, velocityY = 0, 0
					tween:Destroy()
				end)
			end
		end
	end)
	
	-- Connect Updates
	RunService.RenderStepped:Connect(updatePosition)
	UI.Parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateScreenSize)
end
coroutine.wrap(FIZZ_fake_script)()

	
end
