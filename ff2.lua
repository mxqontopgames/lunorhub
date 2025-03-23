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
local Switch = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local Switch1 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local Tabs = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local CatchingTab_2 = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UIGradient_5 = Instance.new("UIGradient")
local UIGradient_6 = Instance.new("UIGradient")
local UIGradient_7 = Instance.new("UIGradient")
local f = Instance.new("TextButton")
local PlayerTab = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local UIGradient_8 = Instance.new("UIGradient")
local UIGradient_9 = Instance.new("UIGradient")
local UIGradient_10 = Instance.new("UIGradient")
local AutomaticsTab = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local TextLabel_3 = Instance.new("TextLabel")
local UIGradient_11 = Instance.new("UIGradient")
local UIGradient_12 = Instance.new("UIGradient")
local UIGradient_13 = Instance.new("UIGradient")
local TextLabel_4 = Instance.new("TextLabel")
local UIGradient_14 = Instance.new("UIGradient")
local Top = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local TextLabel_5 = Instance.new("TextLabel")
local UIGradient_15 = Instance.new("UIGradient")
local UIGradient_16 = Instance.new("UIGradient")
local UIGradient_17 = Instance.new("UIGradient")

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
UI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UI.BackgroundTransparency = 1.000
UI.BorderColor3 = Color3.fromRGB(0, 0, 0)
UI.BorderSizePixel = 0
UI.Position = UDim2.new(0.259878457, 0, 0.25, 0)
UI.Size = UDim2.new(0.479365617, 0, 0.499388725, 0)

CatchingTab.Name = "CatchingTab"
CatchingTab.Parent = UI
CatchingTab.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
CatchingTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
CatchingTab.BorderSizePixel = 0
CatchingTab.Position = UDim2.new(-4.83757034e-08, 0, 1.1515678e-07, 0)
CatchingTab.Size = UDim2.new(0.999999702, 0, 1.00000012, 0)
CatchingTab.ZIndex = 0

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = CatchingTab

Background.Name = "Background"
Background.Parent = CatchingTab
Background.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.3386226, 0, 0.160161376, 0)
Background.Size = UDim2.new(0.608838618, 0, 0.131999999, 0)
Background.ZIndex = 2

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = Background

TextButton.Parent = Background
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.0390540808, 0, -0.0190578643, 0)
TextButton.Size = UDim2.new(0.499892205, 0, 1.01905775, 0)
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

Switch.Name = "Switch"
Switch.Parent = Background
Switch.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Switch.BorderColor3 = Color3.fromRGB(0, 0, 0)
Switch.BorderSizePixel = 0
Switch.Position = UDim2.new(0.748475194, 0, 0.237906903, 0)
Switch.Size = UDim2.new(0.21085389, 0, 0.558846653, 0)
Switch.ZIndex = 2

UICorner_3.CornerRadius = UDim.new(20, 0)
UICorner_3.Parent = Switch

Switch1.Name = "Switch1"
Switch1.Parent = Background
Switch1.BackgroundColor3 = Color3.fromRGB(29, 63, 255)
Switch1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Switch1.BorderSizePixel = 0
Switch1.Position = UDim2.new(0.732853532, 0, 0.193779767, 0)
Switch1.Size = UDim2.new(0.090663217, 0, 0.602973759, 0)
Switch1.ZIndex = 3

UICorner_4.CornerRadius = UDim.new(20, 0)
UICorner_4.Parent = Switch1

Tabs.Name = "Tabs"
Tabs.Parent = UI
Tabs.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tabs.BorderSizePixel = 0
Tabs.Position = UDim2.new(0.0230841599, 0, 0.146699294, 0)
Tabs.Size = UDim2.new(0.273622662, 0, 0.814180732, 0)
Tabs.ZIndex = 20

UICorner_5.CornerRadius = UDim.new(0, 4)
UICorner_5.Parent = Tabs

CatchingTab_2.Name = "CatchingTab"
CatchingTab_2.Parent = Tabs
CatchingTab_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
CatchingTab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
CatchingTab_2.BorderSizePixel = 0
CatchingTab_2.Position = UDim2.new(0.0404332392, 0, 0.0189995263, 0)
CatchingTab_2.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
CatchingTab_2.ZIndex = 0

UICorner_6.CornerRadius = UDim.new(0, 4)
UICorner_6.Parent = CatchingTab_2

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

UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_5.Parent = TextLabel

UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_6.Parent = TextLabel

UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_7.Parent = TextLabel

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

PlayerTab.Name = "PlayerTab"
PlayerTab.Parent = Tabs
PlayerTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
PlayerTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlayerTab.BorderSizePixel = 0
PlayerTab.Position = UDim2.new(0.0404333025, 0, 0.163171247, 0)
PlayerTab.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
PlayerTab.ZIndex = 0

UICorner_7.CornerRadius = UDim.new(0, 4)
UICorner_7.Parent = PlayerTab

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

UIGradient_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_8.Parent = TextLabel_2

UIGradient_9.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_9.Parent = TextLabel_2

UIGradient_10.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_10.Parent = TextLabel_2

AutomaticsTab.Name = "AutomaticsTab"
AutomaticsTab.Parent = Tabs
AutomaticsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
AutomaticsTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
AutomaticsTab.BorderSizePixel = 0
AutomaticsTab.Position = UDim2.new(0.0404333025, 0, 0.307342976, 0)
AutomaticsTab.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
AutomaticsTab.ZIndex = 0

UICorner_8.CornerRadius = UDim.new(0, 4)
UICorner_8.Parent = AutomaticsTab

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

UIGradient_11.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_11.Parent = TextLabel_3

UIGradient_12.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_12.Parent = TextLabel_3

UIGradient_13.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_13.Parent = TextLabel_3

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

UIGradient_14.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_14.Parent = TextLabel_4

Top.Name = "Top"
Top.Parent = UI
Top.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(2.41878524e-07, 0, 7.67711867e-08, 0)
Top.Size = UDim2.new(0.999999702, 0, 0.129584551, 0)
Top.ZIndex = 891718247

UICorner_9.CornerRadius = UDim.new(0, 4)
UICorner_9.Parent = Top

TextLabel_5.Parent = Top
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

UIGradient_15.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_15.Parent = TextLabel_5

UIGradient_16.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_16.Parent = TextLabel_5

UIGradient_17.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_17.Parent = TextLabel_5

-- Scripts:

local function VYZUYUC_fake_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)

	for i,v in script.Parent:GetDescendants() do
		if not v:IsA("LocalScript") and not v:IsA("TextLabel") and not v:IsA("UICorner") and not v:IsA("UIGradient") then
			v.Transparency = 1
		elseif v:IsA("TextLabel") then
			v.TextTransparency = 1
		end
	end
end
coroutine.wrap(VYZUYUC_fake_script)()
local function LFMN_fake_script() -- Welcome.LocalScript 
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
coroutine.wrap(LFMN_fake_script)()
local function YWGHRT_fake_script() -- Switch1.LocalScript 
	local script = Instance.new('LocalScript', Switch1)

	local toggle = script.Parent
	local toggled = false
	local tween = game:GetService("TweenService")
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	
	toggle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if not toggled then
				
				local goal = {}
				
				goal.Size = UDim2.new(0.227, 0, 0.603, 0)
				
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
				
				toggled = true
				
				tween:Create(toggle, info, goal):Play()
			elseif toggled then
				
				local goal = {}
				
				goal.Size = UDim2.new(0.091, 0 ,0.603, 0)
				
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
		local player = game.Players.LocalPlayer
		if player and player.Character and toggled then
			local rightHand = player.Character:FindFirstChild("CatchRight")
			local leftHand = player.Character:FindFirstChild("CatchLeft")
	
			if rightHand and leftHand then
				for _, part in ipairs(workspace:GetDescendants()) do
					if part:IsA("BasePart") and part ~= rightHand and part ~= leftHand then
						print(part)
						firetouchinterest(leftHand, part, 0)
						firetouchinterest(rightHand, part, 0)
						task.wait(0.1)
						firetouchinterest(leftHand, part, 1)
						firetouchinterest(rightHand, part, 1)
					end
				end
			end
		end
	end)
end
coroutine.wrap(YWGHRT_fake_script)()
local function VARHYL_fake_script() -- f.LocalScript 
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
coroutine.wrap(VARHYL_fake_script)()
local function BEMOAC_fake_script() -- TextLabel_4.LocalScript 
	local script = Instance.new('LocalScript', TextLabel_4)

	script.Parent.Text = "Welcome ".. game.Players.LocalPlayer.DisplayName .."."
end
coroutine.wrap(BEMOAC_fake_script)()
local function QXOLAI_fake_script() -- Top.LocalScript 
	local script = Instance.new('LocalScript', Top)

	local localplayer = game:GetService("Players").LocalPlayer
	local localmouse = localplayer:GetMouse()
	
	local renderstepped = game:GetService("RunService").RenderStepped
	local TweenService = game:GetService("TweenService")
	
	local Topbar = script.Parent
	local UI = Topbar.Parent
	local mousex = localmouse.X
	local mousey = localmouse.Y
	local offsetXScale, offsetYScale
	local mousedown = false
	local tweenplaying = false
	
	local screenSize = UI.Parent.AbsoluteSize
	
	localmouse.Move:Connect(function()
		mousex = localmouse.X
		mousey = localmouse.Y
	end)
	
	renderstepped:Connect(function()
		if mousedown and not tweenplaying then
			local mouseXScale = mousex / screenSize.X
			local mouseYScale = mousey / screenSize.Y
	
			local targetXScale = mouseXScale + offsetXScale
			local targetYScale = mouseYScale + offsetYScale
	
			local goal = {
				Position = UDim2.new(targetXScale, 0, targetYScale, 0)
			}
	
			local info = TweenInfo.new(
				0.075,
				Enum.EasingStyle.Sine,
				Enum.EasingDirection.InOut,
				0,
				false,
				0
			)
	
			local Tween = TweenService:Create(UI, info, goal)
			tweenplaying = true
			Tween:Play()
	
			renderstepped:Wait()
			Tween:Destroy()
			tweenplaying = false
		end
	end)
	
	Topbar.InputBegan:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 then		
			mousedown = true
			
			local uiPos = UI.Position
			local mouseXScale = localmouse.X / screenSize.X
			local mouseYScale = localmouse.Y / screenSize.Y
	
			offsetXScale = uiPos.X.Scale - mouseXScale
			offsetYScale = uiPos.Y.Scale - mouseYScale
		end
	end)
	
	Topbar.InputEnded:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 then
			mousedown = false
			local mouseXScale = mousex / screenSize.X
			local mouseYScale = mousey / screenSize.Y
	
			local targetXScale = mouseXScale + offsetXScale
			local targetYScale = mouseYScale + offsetYScale
	
			local goal = {
				Position = UDim2.new(targetXScale, 0, targetYScale, 0)
			}
	
			local info = TweenInfo.new(
				0.5,
				Enum.EasingStyle.Sine,
				Enum.EasingDirection.InOut,
				0,
				false,
				0
			)
	
			local Tween = TweenService:Create(UI, info, goal)
			tweenplaying = true
			Tween:Play()
	
			Tween.Completed:Wait()
			Tween:Destroy()
			tweenplaying = false
		end
	end)
end
coroutine.wrap(QXOLAI_fake_script)()

end
