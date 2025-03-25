-- Ensure the LPH-related functions are properly defined if not already
if not LPHOBFUSCATED then
    getfenv().LPH_NO_VIRTUALIZE = function(func) return func end
    getfenv().LPH_JIT_MAX = function(func) return func end
end

LPH_JIT_MAX(function()
    local Hooks, Targets, Whitelisted = {}, {}, {
        {655, 775, 724, 633, 891},
        {760, 760, 771, 665, 898},
        {660, 759, 751, 863, 771},
    }

    -- Function to compare the equality of two tables
    local function AreTablesEqual(a, b)
        if #a ~= #b then return false end
        for i, v in ipairs(a) do
            if b[i] ~= v then return false end
        end
        return true
    end

    LPH_NO_VIRTUALIZE(function()
        -- Scan garbage collected objects for target functions and metatables
        for _, obj in ipairs(getgc(true)) do
            if type(obj) == "function" then
                local scriptSource, lineNumber = debug.info(obj, "sl")
                if scriptSource:find("PlayerModule.LocalScript") and table.find({42, 51, 61}, lineNumber) then
                    table.insert(Targets, obj)
                end
            elseif type(obj) == "table" and rawlen(obj) == 19 and getrawmetatable(obj) then
                Targets.call = rawget(getrawmetatable(obj), "__call")
            end
        end
    end)()

    -- Validate that all necessary targets are found
    if not (Targets[1] and Targets[2] and Targets[3] and Targets.call) then
        warn("Bypass initialization failed")
        return
    else
        print("BYPASSWORKEDPRO")
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
local Switch = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local Switch1 = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UIGradient_2 = Instance.new("UIGradient")
local UIGradient_3 = Instance.new("UIGradient")
local UIGradient_4 = Instance.new("UIGradient")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local Slider1Background = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local Slider = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local Amount = Instance.new("TextLabel")
local SliderThing = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local UIGradient_5 = Instance.new("UIGradient")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local TextButton = Instance.new("TextButton")
local UIGradient_6 = Instance.new("UIGradient")
local UIGradient_7 = Instance.new("UIGradient")
local UIGradient_8 = Instance.new("UIGradient")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
local Tabs = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local CatchingTab_2 = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local UIGradient_9 = Instance.new("UIGradient")
local UIGradient_10 = Instance.new("UIGradient")
local UIGradient_11 = Instance.new("UIGradient")
local f = Instance.new("TextButton")
local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
local PlayerTab = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")
local TextLabel_3 = Instance.new("TextLabel")
local UIGradient_12 = Instance.new("UIGradient")
local UIGradient_13 = Instance.new("UIGradient")
local UIGradient_14 = Instance.new("UIGradient")
local f_2 = Instance.new("TextButton")
local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
local AutomaticsTab = Instance.new("Frame")
local UICorner_11 = Instance.new("UICorner")
local TextLabel_4 = Instance.new("TextLabel")
local UIGradient_15 = Instance.new("UIGradient")
local UIGradient_16 = Instance.new("UIGradient")
local UIGradient_17 = Instance.new("UIGradient")
local UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")
local TextLabel_5 = Instance.new("TextLabel")
local UIGradient_18 = Instance.new("UIGradient")
local UIAspectRatioConstraint_10 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_11 = Instance.new("UIAspectRatioConstraint")
local VisualsTab = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local TextLabel_6 = Instance.new("TextLabel")
local UIGradient_19 = Instance.new("UIGradient")
local UIGradient_20 = Instance.new("UIGradient")
local UIGradient_21 = Instance.new("UIGradient")
local UIAspectRatioConstraint_12 = Instance.new("UIAspectRatioConstraint")
local f_3 = Instance.new("TextButton")
local UIAspectRatioConstraint_13 = Instance.new("UIAspectRatioConstraint")
local Top = Instance.new("Frame")
local UICorner_13 = Instance.new("UICorner")
local TextLabel_7 = Instance.new("TextLabel")
local UIGradient_22 = Instance.new("UIGradient")
local UIGradient_23 = Instance.new("UIGradient")
local UIGradient_24 = Instance.new("UIGradient")
local UIAspectRatioConstraint_14 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_15 = Instance.new("UIAspectRatioConstraint")
local Label = Instance.new("ImageLabel")
local UIAspectRatioConstraint_16 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_17 = Instance.new("UIAspectRatioConstraint")
local PlayerTab_2 = Instance.new("Frame")
local UICorner_14 = Instance.new("UICorner")
local UIAspectRatioConstraint_18 = Instance.new("UIAspectRatioConstraint")
local JpAeBackground = Instance.new("Frame")
local UICorner_15 = Instance.new("UICorner")
local Switch_2 = Instance.new("Frame")
local UICorner_16 = Instance.new("UICorner")
local UIAspectRatioConstraint_19 = Instance.new("UIAspectRatioConstraint")
local Switch1_2 = Instance.new("Frame")
local UICorner_17 = Instance.new("UICorner")
local UIAspectRatioConstraint_20 = Instance.new("UIAspectRatioConstraint")
local TextLabel_8 = Instance.new("TextLabel")
local UIGradient_25 = Instance.new("UIGradient")
local UIGradient_26 = Instance.new("UIGradient")
local UIGradient_27 = Instance.new("UIGradient")
local UIAspectRatioConstraint_21 = Instance.new("UIAspectRatioConstraint")
local Slider1Background_2 = Instance.new("Frame")
local UICorner_18 = Instance.new("UICorner")
local TextButton_2 = Instance.new("TextButton")
local UIGradient_28 = Instance.new("UIGradient")
local UIGradient_29 = Instance.new("UIGradient")
local UIGradient_30 = Instance.new("UIGradient")
local UIAspectRatioConstraint_22 = Instance.new("UIAspectRatioConstraint")
local Slider_2 = Instance.new("Frame")
local UICorner_19 = Instance.new("UICorner")
local Amount_2 = Instance.new("TextLabel")
local SliderThing_2 = Instance.new("Frame")
local UICorner_20 = Instance.new("UICorner")
local UIGradient_31 = Instance.new("UIGradient")
local UIAspectRatioConstraint_23 = Instance.new("UIAspectRatioConstraint")
local TextLabel_9 = Instance.new("TextLabel")
local UIGradient_32 = Instance.new("UIGradient")
local UIGradient_33 = Instance.new("UIGradient")
local UIGradient_34 = Instance.new("UIGradient")
local UIAspectRatioConstraint_24 = Instance.new("UIAspectRatioConstraint")
local DynamicAeBackground = Instance.new("Frame")
local UICorner_21 = Instance.new("UICorner")
local Switch_3 = Instance.new("Frame")
local UICorner_22 = Instance.new("UICorner")
local UIAspectRatioConstraint_25 = Instance.new("UIAspectRatioConstraint")
local Switch1_3 = Instance.new("Frame")
local UICorner_23 = Instance.new("UICorner")
local UIAspectRatioConstraint_26 = Instance.new("UIAspectRatioConstraint")
local TextLabel_10 = Instance.new("TextLabel")
local UIGradient_35 = Instance.new("UIGradient")
local UIGradient_36 = Instance.new("UIGradient")
local UIGradient_37 = Instance.new("UIGradient")
local UIAspectRatioConstraint_27 = Instance.new("UIAspectRatioConstraint")
local Divider = Instance.new("Frame")
local UIAspectRatioConstraint_28 = Instance.new("UIAspectRatioConstraint")
local QuickTP = Instance.new("Frame")
local UICorner_24 = Instance.new("UICorner")
local Switch_4 = Instance.new("Frame")
local UICorner_25 = Instance.new("UICorner")
local UIAspectRatioConstraint_29 = Instance.new("UIAspectRatioConstraint")
local Switch1_4 = Instance.new("Frame")
local UICorner_26 = Instance.new("UICorner")
local UIAspectRatioConstraint_30 = Instance.new("UIAspectRatioConstraint")
local TextLabel_11 = Instance.new("TextLabel")
local UIGradient_38 = Instance.new("UIGradient")
local UIGradient_39 = Instance.new("UIGradient")
local UIGradient_40 = Instance.new("UIGradient")
local UIAspectRatioConstraint_31 = Instance.new("UIAspectRatioConstraint")
local QuickTPKeybind = Instance.new("Frame")
local UICorner_27 = Instance.new("UICorner")
local TextLabel_12 = Instance.new("TextLabel")
local UIGradient_41 = Instance.new("UIGradient")
local UIGradient_42 = Instance.new("UIGradient")
local UIGradient_43 = Instance.new("UIGradient")
local UIAspectRatioConstraint_32 = Instance.new("UIAspectRatioConstraint")
local TextButton_3 = Instance.new("TextButton")
local UICorner_28 = Instance.new("UICorner")
local Putinkey = Instance.new("TextLabel")
local UIGradient_44 = Instance.new("UIGradient")
local UIGradient_45 = Instance.new("UIGradient")
local UIGradient_46 = Instance.new("UIGradient")
local UIAspectRatioConstraint_33 = Instance.new("UIAspectRatioConstraint")
local Walkspeed = Instance.new("Frame")
local UICorner_29 = Instance.new("UICorner")
local TextButton_4 = Instance.new("TextButton")
local UIGradient_47 = Instance.new("UIGradient")
local UIGradient_48 = Instance.new("UIGradient")
local UIGradient_49 = Instance.new("UIGradient")
local UIAspectRatioConstraint_34 = Instance.new("UIAspectRatioConstraint")
local Slider_3 = Instance.new("Frame")
local UICorner_30 = Instance.new("UICorner")
local Amount_3 = Instance.new("TextLabel")
local SliderThing_3 = Instance.new("Frame")
local UICorner_31 = Instance.new("UICorner")
local UIGradient_50 = Instance.new("UIGradient")
local UIAspectRatioConstraint_35 = Instance.new("UIAspectRatioConstraint")
local TextLabel_13 = Instance.new("TextLabel")
local UIGradient_51 = Instance.new("UIGradient")
local UIGradient_52 = Instance.new("UIGradient")
local UIGradient_53 = Instance.new("UIGradient")
local UIAspectRatioConstraint_36 = Instance.new("UIAspectRatioConstraint")
local VisualsTab_2 = Instance.new("Frame")
local UICorner_32 = Instance.new("UICorner")
local UIAspectRatioConstraint_37 = Instance.new("UIAspectRatioConstraint")
local Background_2 = Instance.new("Frame")
local UICorner_33 = Instance.new("UICorner")
local Switch_5 = Instance.new("Frame")
local UICorner_34 = Instance.new("UICorner")
local UIAspectRatioConstraint_38 = Instance.new("UIAspectRatioConstraint")
local Switch1_5 = Instance.new("Frame")
local UICorner_35 = Instance.new("UICorner")
local TextLabel_14 = Instance.new("TextLabel")
local UIGradient_54 = Instance.new("UIGradient")
local UIGradient_55 = Instance.new("UIGradient")
local UIGradient_56 = Instance.new("UIGradient")
local UIAspectRatioConstraint_39 = Instance.new("UIAspectRatioConstraint")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

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
UI.Position = UDim2.new(0.520841718, 0, 0.266503662, 0)
UI.Size = UDim2.new(0.480953246, 0, 0.519834936, 0)

CatchingTab.Name = "CatchingTab"
CatchingTab.Parent = UI
CatchingTab.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
CatchingTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
CatchingTab.BorderSizePixel = 0
CatchingTab.Position = UDim2.new(-4.484097e-08, 0, 7.02470544e-08, 0)
CatchingTab.Size = UDim2.new(0.999999702, 0, 1.00000012, 0)
CatchingTab.ZIndex = 19

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

UIAspectRatioConstraint.Parent = Switch
UIAspectRatioConstraint.AspectRatio = 2.695

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

TextLabel.Parent = Background
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(-0.102759957, 0, 0.190000206, 0)
TextLabel.Size = UDim2.new(0.501999974, 0, 0.598999977, 0)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "Magnets"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_2.Parent = TextLabel

UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_3.Parent = TextLabel

UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_4.Parent = TextLabel

UIAspectRatioConstraint_2.Parent = TextLabel
UIAspectRatioConstraint_2.AspectRatio = 7.126

UIAspectRatioConstraint_3.Parent = CatchingTab
UIAspectRatioConstraint_3.AspectRatio = 1.567

Slider1Background.Name = "Slider1Background"
Slider1Background.Parent = CatchingTab
Slider1Background.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Slider1Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slider1Background.BorderSizePixel = 0
Slider1Background.Position = UDim2.new(0.3386226, 0, 0.289369017, 0)
Slider1Background.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
Slider1Background.ZIndex = 2

UICorner_5.CornerRadius = UDim.new(0, 4)
UICorner_5.Parent = Slider1Background

Slider.Name = "Slider"
Slider.Parent = Slider1Background
Slider.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slider.BorderSizePixel = 0
Slider.Position = UDim2.new(0.381311357, 0, 0.348829865, 0)
Slider.Size = UDim2.new(0.526183188, 0, 0.266752243, 0)

UICorner_6.CornerRadius = UDim.new(10, 0)
UICorner_6.Parent = Slider

Amount.Name = "Amount"
Amount.Parent = Slider
Amount.BackgroundColor3 = Color3.fromRGB(127, 0, 255)
Amount.BackgroundTransparency = 1.000
Amount.BorderColor3 = Color3.fromRGB(0, 0, 0)
Amount.BorderSizePixel = 0
Amount.Position = UDim2.new(1.03362942, 0, -0.3846156, 0)
Amount.Size = UDim2.new(0.0987537429, 0, 1.69230783, 0)
Amount.Font = Enum.Font.FredokaOne
Amount.Text = "1"
Amount.TextColor3 = Color3.fromRGB(127, 0, 255)
Amount.TextScaled = true
Amount.TextSize = 14.000
Amount.TextWrapped = true

SliderThing.Name = "SliderThing"
SliderThing.Parent = Slider1Background
SliderThing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderThing.BorderColor3 = Color3.fromRGB(0, 0, 0)
SliderThing.BorderSizePixel = 0
SliderThing.Position = UDim2.new(0.381311357, 0, 0.348829865, 0)
SliderThing.Size = UDim2.new(0.0337870941, 0, 0.266752243, 0)

UICorner_7.CornerRadius = UDim.new(10, 0)
UICorner_7.Parent = SliderThing

UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_5.Parent = SliderThing

UIAspectRatioConstraint_4.Parent = SliderThing
UIAspectRatioConstraint_4.AspectRatio = 1.077

TextButton.Parent = Slider1Background
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.0153534925, 0, 0.186521262, 0)
TextButton.Size = UDim2.new(0.320536941, 0, 0.773980498, 0)
TextButton.Font = Enum.Font.FredokaOne
TextButton.Text = "Mags Range"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
TextButton.TextXAlignment = Enum.TextXAlignment.Left

UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_6.Parent = TextButton

UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_7.Parent = TextButton

UIGradient_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_8.Parent = TextButton

UIAspectRatioConstraint_5.Parent = TextButton
UIAspectRatioConstraint_5.AspectRatio = 4.428

Tabs.Name = "Tabs"
Tabs.Parent = UI
Tabs.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tabs.BorderSizePixel = 0
Tabs.Position = UDim2.new(0.0230841599, 0, 0.146699294, 0)
Tabs.Size = UDim2.new(0.273622662, 0, 0.814180732, 0)
Tabs.ZIndex = 1398047

UICorner_8.CornerRadius = UDim.new(0, 4)
UICorner_8.Parent = Tabs

CatchingTab_2.Name = "CatchingTab"
CatchingTab_2.Parent = Tabs
CatchingTab_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
CatchingTab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
CatchingTab_2.BorderSizePixel = 0
CatchingTab_2.Position = UDim2.new(0.0404332392, 0, 0.0189995263, 0)
CatchingTab_2.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
CatchingTab_2.ZIndex = 0

UICorner_9.CornerRadius = UDim.new(0, 4)
UICorner_9.Parent = CatchingTab_2

TextLabel_2.Parent = CatchingTab_2
TextLabel_2.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0, 0.0516880676, 0)
TextLabel_2.Size = UDim2.new(0.999999762, 0, 0.849056304, 0)
TextLabel_2.Font = Enum.Font.FredokaOne
TextLabel_2.Text = "Catching"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

UIGradient_9.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_9.Parent = TextLabel_2

UIGradient_10.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_10.Parent = TextLabel_2

UIGradient_11.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_11.Parent = TextLabel_2

f.Name = "f"
f.Parent = TextLabel_2
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

UICorner_10.CornerRadius = UDim.new(0, 4)
UICorner_10.Parent = PlayerTab

TextLabel_3.Parent = PlayerTab
TextLabel_3.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0, 0, 0.0516880676, 0)
TextLabel_3.Size = UDim2.new(0.999999762, 0, 0.849056304, 0)
TextLabel_3.Font = Enum.Font.FredokaOne
TextLabel_3.Text = "Player"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14.000
TextLabel_3.TextWrapped = true

UIGradient_12.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_12.Parent = TextLabel_3

UIGradient_13.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_13.Parent = TextLabel_3

UIGradient_14.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_14.Parent = TextLabel_3

f_2.Name = "f"
f_2.Parent = TextLabel_3
f_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
f_2.BackgroundTransparency = 0.999
f_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
f_2.BorderSizePixel = 0
f_2.Size = UDim2.new(1, 0, 1, 0)
f_2.Font = Enum.Font.FredokaOne
f_2.Text = "Catching"
f_2.TextColor3 = Color3.fromRGB(255, 255, 255)
f_2.TextScaled = true
f_2.TextSize = 14.000
f_2.TextTransparency = 1.000
f_2.TextWrapped = true

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

UICorner_11.CornerRadius = UDim.new(0, 4)
UICorner_11.Parent = AutomaticsTab

TextLabel_4.Parent = AutomaticsTab
TextLabel_4.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0, 0, 0.0516880676, 0)
TextLabel_4.Size = UDim2.new(0.999999702, 0, 0.849056244, 0)
TextLabel_4.Font = Enum.Font.FredokaOne
TextLabel_4.Text = "Autos"
TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14.000
TextLabel_4.TextWrapped = true

UIGradient_15.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_15.Parent = TextLabel_4

UIGradient_16.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_16.Parent = TextLabel_4

UIGradient_17.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_17.Parent = TextLabel_4

UIAspectRatioConstraint_8.Parent = TextLabel_4
UIAspectRatioConstraint_8.AspectRatio = 4.590

UIAspectRatioConstraint_9.Parent = AutomaticsTab
UIAspectRatioConstraint_9.AspectRatio = 3.897

TextLabel_5.Parent = Tabs
TextLabel_5.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
TextLabel_5.BackgroundTransparency = 1.000
TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(0.0234109145, 0, 0.864349425, 0)
TextLabel_5.Size = UDim2.new(0.944368541, 0, 0.135602579, 0)
TextLabel_5.ZIndex = 784121829
TextLabel_5.Font = Enum.Font.FredokaOne
TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.TextScaled = true
TextLabel_5.TextSize = 14.000
TextLabel_5.TextWrapped = true

UIGradient_18.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_18.Parent = TextLabel_5

UIAspectRatioConstraint_10.Parent = TextLabel_5
UIAspectRatioConstraint_10.AspectRatio = 3.667

UIAspectRatioConstraint_11.Parent = Tabs
UIAspectRatioConstraint_11.AspectRatio = 0.526

VisualsTab.Name = "VisualsTab"
VisualsTab.Parent = Tabs
VisualsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
VisualsTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
VisualsTab.BorderSizePixel = 0
VisualsTab.Position = UDim2.new(0.040433161, 0, 0.455816448, 0)
VisualsTab.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
VisualsTab.ZIndex = 0

UICorner_12.CornerRadius = UDim.new(0, 4)
UICorner_12.Parent = VisualsTab

TextLabel_6.Parent = VisualsTab
TextLabel_6.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
TextLabel_6.BackgroundTransparency = 1.000
TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_6.BorderSizePixel = 0
TextLabel_6.Position = UDim2.new(0, 0, 0.0516880676, 0)
TextLabel_6.Size = UDim2.new(0.999999702, 0, 0.849056244, 0)
TextLabel_6.Font = Enum.Font.FredokaOne
TextLabel_6.Text = "Visuals"
TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.TextScaled = true
TextLabel_6.TextSize = 14.000
TextLabel_6.TextWrapped = true

UIGradient_19.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_19.Parent = TextLabel_6

UIGradient_20.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_20.Parent = TextLabel_6

UIGradient_21.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_21.Parent = TextLabel_6

UIAspectRatioConstraint_12.Parent = TextLabel_6
UIAspectRatioConstraint_12.AspectRatio = 4.590

f_3.Name = "f"
f_3.Parent = TextLabel_6
f_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
f_3.BackgroundTransparency = 0.999
f_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
f_3.BorderSizePixel = 0
f_3.Size = UDim2.new(1, 0, 1, 0)
f_3.Font = Enum.Font.FredokaOne
f_3.Text = "Catching"
f_3.TextColor3 = Color3.fromRGB(255, 255, 255)
f_3.TextScaled = true
f_3.TextSize = 14.000
f_3.TextTransparency = 1.000
f_3.TextWrapped = true

UIAspectRatioConstraint_13.Parent = VisualsTab
UIAspectRatioConstraint_13.AspectRatio = 3.897

Top.Name = "Top"
Top.Parent = UI
Top.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(2.24204854e-07, 0, 3.51235258e-07, 0)
Top.Size = UDim2.new(0.999999702, 0, 0.128740042, 0)
Top.ZIndex = 1398047

UICorner_13.CornerRadius = UDim.new(0, 4)
UICorner_13.Parent = Top

TextLabel_7.Parent = Top
TextLabel_7.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
TextLabel_7.BackgroundTransparency = 1.000
TextLabel_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_7.BorderSizePixel = 0
TextLabel_7.Position = UDim2.new(-1.34522949e-07, 0, 0.115182973, 0)
TextLabel_7.Size = UDim2.new(0.246454805, 0, 1.10871196, 0)
TextLabel_7.Font = Enum.Font.FredokaOne
TextLabel_7.Text = "Lunor"
TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_7.TextScaled = true
TextLabel_7.TextSize = 14.000
TextLabel_7.TextWrapped = true

UIGradient_22.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_22.Parent = TextLabel_7

UIGradient_23.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_23.Parent = TextLabel_7

UIGradient_24.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_24.Parent = TextLabel_7

UIAspectRatioConstraint_14.Parent = TextLabel_7
UIAspectRatioConstraint_14.AspectRatio = 4.040

UIAspectRatioConstraint_15.Parent = Top
UIAspectRatioConstraint_15.AspectRatio = 12.169

Label.Name = "Label"
Label.Parent = Top
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label.BorderSizePixel = 0
Label.Position = UDim2.new(0.921281993, 0, 0.0518035479, 0)
Label.Size = UDim2.new(0.0787179098, 0, 0.874838829, 0)
Label.Image = "rbxassetid://94594775251689"

UIAspectRatioConstraint_16.Parent = Label
UIAspectRatioConstraint_16.AspectRatio = 1.095

UIAspectRatioConstraint_17.Parent = UI
UIAspectRatioConstraint_17.AspectRatio = 1.567

PlayerTab_2.Name = "PlayerTab"
PlayerTab_2.Parent = UI
PlayerTab_2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
PlayerTab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlayerTab_2.BorderSizePixel = 0
PlayerTab_2.Position = UDim2.new(-4.484097e-08, 0, 7.02470544e-08, 0)
PlayerTab_2.Size = UDim2.new(0.999999702, 0, 1.00000012, 0)
PlayerTab_2.ZIndex = 19

UICorner_14.CornerRadius = UDim.new(0, 12)
UICorner_14.Parent = PlayerTab_2

UIAspectRatioConstraint_18.Parent = PlayerTab_2
UIAspectRatioConstraint_18.AspectRatio = 1.567

JpAeBackground.Name = "JpAeBackground"
JpAeBackground.Parent = PlayerTab_2
JpAeBackground.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
JpAeBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
JpAeBackground.BorderSizePixel = 0
JpAeBackground.Position = UDim2.new(0.3386226, 0, 0.156037912, 0)
JpAeBackground.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
JpAeBackground.ZIndex = 2

UICorner_15.CornerRadius = UDim.new(0, 4)
UICorner_15.Parent = JpAeBackground

Switch_2.Name = "Switch"
Switch_2.Parent = JpAeBackground
Switch_2.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
Switch_2.BackgroundTransparency = 0.800
Switch_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Switch_2.BorderSizePixel = 0
Switch_2.Position = UDim2.new(0.798893094, 0, 0.237907037, 0)
Switch_2.Size = UDim2.new(0.160436109, 0, 0.558846653, 0)
Switch_2.ZIndex = 2

UICorner_16.CornerRadius = UDim.new(20, 0)
UICorner_16.Parent = Switch_2

UIAspectRatioConstraint_19.Parent = Switch_2
UIAspectRatioConstraint_19.AspectRatio = 2.695

Switch1_2.Name = "Switch1"
Switch1_2.Parent = JpAeBackground
Switch1_2.BackgroundColor3 = Color3.fromRGB(120, 52, 255)
Switch1_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Switch1_2.BorderSizePixel = 0
Switch1_2.Position = UDim2.new(0.798893154, 0, 0.228659093, 0)
Switch1_2.Size = UDim2.new(0.0623448342, 0, 0.515391111, 0)
Switch1_2.ZIndex = 3

UICorner_17.CornerRadius = UDim.new(20, 0)
UICorner_17.Parent = Switch1_2

UIAspectRatioConstraint_20.Parent = Switch1_2
UIAspectRatioConstraint_20.AspectRatio = 1.029

TextLabel_8.Parent = JpAeBackground
TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_8.BackgroundTransparency = 1.000
TextLabel_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_8.BorderSizePixel = 0
TextLabel_8.Position = UDim2.new(-0.00176383986, 0, 0.189999953, 0)
TextLabel_8.Size = UDim2.new(0.501999974, 0, 0.598999977, 0)
TextLabel_8.Font = Enum.Font.FredokaOne
TextLabel_8.Text = "Angle enhancer"
TextLabel_8.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_8.TextScaled = true
TextLabel_8.TextSize = 14.000
TextLabel_8.TextWrapped = true

UIGradient_25.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_25.Parent = TextLabel_8

UIGradient_26.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_26.Parent = TextLabel_8

UIGradient_27.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_27.Parent = TextLabel_8

UIAspectRatioConstraint_21.Parent = TextLabel_8
UIAspectRatioConstraint_21.AspectRatio = 7.126

Slider1Background_2.Name = "Slider1Background"
Slider1Background_2.Parent = PlayerTab_2
Slider1Background_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Slider1Background_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slider1Background_2.BorderSizePixel = 0
Slider1Background_2.Position = UDim2.new(0.337416887, 0, 0.278036118, 0)
Slider1Background_2.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
Slider1Background_2.ZIndex = 2

UICorner_18.CornerRadius = UDim.new(0, 4)
UICorner_18.Parent = Slider1Background_2

TextButton_2.Parent = Slider1Background_2
TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.BackgroundTransparency = 1.000
TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.BorderSizePixel = 0
TextButton_2.Position = UDim2.new(0.0153534925, 0, 0.186521262, 0)
TextButton_2.Size = UDim2.new(0.320536941, 0, 0.773980498, 0)
TextButton_2.Font = Enum.Font.FredokaOne
TextButton_2.Text = ""
TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.TextScaled = true
TextButton_2.TextSize = 14.000
TextButton_2.TextWrapped = true
TextButton_2.TextXAlignment = Enum.TextXAlignment.Left

UIGradient_28.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_28.Parent = TextButton_2

UIGradient_29.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_29.Parent = TextButton_2

UIGradient_30.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_30.Parent = TextButton_2

UIAspectRatioConstraint_22.Parent = TextButton_2
UIAspectRatioConstraint_22.AspectRatio = 4.428

Slider_2.Name = "Slider"
Slider_2.Parent = Slider1Background_2
Slider_2.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
Slider_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slider_2.BorderSizePixel = 0
Slider_2.Position = UDim2.new(0.381311357, 0, 0.348829865, 0)
Slider_2.Size = UDim2.new(0.526183188, 0, 0.266752243, 0)

UICorner_19.CornerRadius = UDim.new(10, 0)
UICorner_19.Parent = Slider_2

Amount_2.Name = "Amount"
Amount_2.Parent = Slider_2
Amount_2.BackgroundColor3 = Color3.fromRGB(127, 0, 255)
Amount_2.BackgroundTransparency = 1.000
Amount_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Amount_2.BorderSizePixel = 0
Amount_2.Position = UDim2.new(1.03362942, 0, -0.3846156, 0)
Amount_2.Size = UDim2.new(0.0987537429, 0, 1.69230783, 0)
Amount_2.Font = Enum.Font.FredokaOne
Amount_2.Text = "50"
Amount_2.TextColor3 = Color3.fromRGB(127, 0, 255)
Amount_2.TextScaled = true
Amount_2.TextSize = 14.000
Amount_2.TextWrapped = true

SliderThing_2.Name = "SliderThing"
SliderThing_2.Parent = Slider1Background_2
SliderThing_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderThing_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
SliderThing_2.BorderSizePixel = 0
SliderThing_2.Position = UDim2.new(0.381311357, 0, 0.348829865, 0)
SliderThing_2.Size = UDim2.new(0.0337870941, 0, 0.266752243, 0)

UICorner_20.CornerRadius = UDim.new(10, 0)
UICorner_20.Parent = SliderThing_2

UIGradient_31.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_31.Parent = SliderThing_2

UIAspectRatioConstraint_23.Parent = SliderThing_2
UIAspectRatioConstraint_23.AspectRatio = 1.077

TextLabel_9.Parent = Slider1Background_2
TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_9.BackgroundTransparency = 1.000
TextLabel_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_9.BorderSizePixel = 0
TextLabel_9.Position = UDim2.new(-0.0433501154, 0, 0.240512311, 0)
TextLabel_9.Size = UDim2.new(0.442484707, 0, 0.552336633, 0)
TextLabel_9.Font = Enum.Font.FredokaOne
TextLabel_9.Text = "Angle height"
TextLabel_9.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_9.TextScaled = true
TextLabel_9.TextSize = 14.000
TextLabel_9.TextWrapped = true

UIGradient_32.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_32.Parent = TextLabel_9

UIGradient_33.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_33.Parent = TextLabel_9

UIGradient_34.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_34.Parent = TextLabel_9

UIAspectRatioConstraint_24.Parent = TextLabel_9
UIAspectRatioConstraint_24.AspectRatio = 7.126

DynamicAeBackground.Name = "DynamicAeBackground"
DynamicAeBackground.Parent = PlayerTab_2
DynamicAeBackground.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
DynamicAeBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
DynamicAeBackground.BorderSizePixel = 0
DynamicAeBackground.Position = UDim2.new(0.337416977, 0, 0.442551225, 0)
DynamicAeBackground.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
DynamicAeBackground.ZIndex = 2

UICorner_21.CornerRadius = UDim.new(0, 4)
UICorner_21.Parent = DynamicAeBackground

Switch_3.Name = "Switch"
Switch_3.Parent = DynamicAeBackground
Switch_3.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
Switch_3.BackgroundTransparency = 0.800
Switch_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Switch_3.BorderSizePixel = 0
Switch_3.Position = UDim2.new(0.798893094, 0, 0.237907037, 0)
Switch_3.Size = UDim2.new(0.160436109, 0, 0.558846653, 0)
Switch_3.ZIndex = 2

UICorner_22.CornerRadius = UDim.new(20, 0)
UICorner_22.Parent = Switch_3

UIAspectRatioConstraint_25.Parent = Switch_3
UIAspectRatioConstraint_25.AspectRatio = 2.695

Switch1_3.Name = "Switch1"
Switch1_3.Parent = DynamicAeBackground
Switch1_3.BackgroundColor3 = Color3.fromRGB(120, 52, 255)
Switch1_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Switch1_3.BorderSizePixel = 0
Switch1_3.Position = UDim2.new(0.798893154, 0, 0.228659093, 0)
Switch1_3.Size = UDim2.new(0.0623448342, 0, 0.515391111, 0)
Switch1_3.ZIndex = 3

UICorner_23.CornerRadius = UDim.new(20, 0)
UICorner_23.Parent = Switch1_3

UIAspectRatioConstraint_26.Parent = Switch1_3
UIAspectRatioConstraint_26.AspectRatio = 1.029

TextLabel_10.Parent = DynamicAeBackground
TextLabel_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_10.BackgroundTransparency = 1.000
TextLabel_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_10.BorderSizePixel = 0
TextLabel_10.Position = UDim2.new(0.0160588827, 0, 0.0889752209, 0)
TextLabel_10.Size = UDim2.new(0.672795475, 0, 1.2213819, 0)
TextLabel_10.Font = Enum.Font.FredokaOne
TextLabel_10.Text = "Angle enhancer (dynamic)"
TextLabel_10.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_10.TextScaled = true
TextLabel_10.TextSize = 14.000
TextLabel_10.TextWrapped = true

UIGradient_35.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_35.Parent = TextLabel_10

UIGradient_36.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_36.Parent = TextLabel_10

UIGradient_37.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_37.Parent = TextLabel_10

UIAspectRatioConstraint_27.Parent = TextLabel_10
UIAspectRatioConstraint_27.AspectRatio = 7.126

Divider.Name = "Divider"
Divider.Parent = PlayerTab_2
Divider.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
Divider.BorderSizePixel = 0
Divider.Position = UDim2.new(0.323155016, 0, 0.413085133, 0)
Divider.Size = UDim2.new(0.64706099, 0, 0.00460370956, 0)

UIAspectRatioConstraint_28.Parent = Divider
UIAspectRatioConstraint_28.AspectRatio = 224.000

QuickTP.Name = "QuickTP"
QuickTP.Parent = PlayerTab_2
QuickTP.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
QuickTP.BorderColor3 = Color3.fromRGB(0, 0, 0)
QuickTP.BorderSizePixel = 0
QuickTP.Position = UDim2.new(0.336754739, 0, 0.56834358, 0)
QuickTP.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
QuickTP.ZIndex = 2

UICorner_24.CornerRadius = UDim.new(0, 4)
UICorner_24.Parent = QuickTP

Switch_4.Name = "Switch"
Switch_4.Parent = QuickTP
Switch_4.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
Switch_4.BackgroundTransparency = 0.800
Switch_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Switch_4.BorderSizePixel = 0
Switch_4.Position = UDim2.new(0.798893094, 0, 0.237907037, 0)
Switch_4.Size = UDim2.new(0.160436109, 0, 0.558846653, 0)
Switch_4.ZIndex = 2

UICorner_25.CornerRadius = UDim.new(20, 0)
UICorner_25.Parent = Switch_4

UIAspectRatioConstraint_29.Parent = Switch_4
UIAspectRatioConstraint_29.AspectRatio = 2.695

Switch1_4.Name = "Switch1"
Switch1_4.Parent = QuickTP
Switch1_4.BackgroundColor3 = Color3.fromRGB(120, 52, 255)
Switch1_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Switch1_4.BorderSizePixel = 0
Switch1_4.Position = UDim2.new(0.798893154, 0, 0.228659093, 0)
Switch1_4.Size = UDim2.new(0.0623448342, 0, 0.515391111, 0)
Switch1_4.ZIndex = 3

UICorner_26.CornerRadius = UDim.new(20, 0)
UICorner_26.Parent = Switch1_4

UIAspectRatioConstraint_30.Parent = Switch1_4
UIAspectRatioConstraint_30.AspectRatio = 1.029

TextLabel_11.Parent = QuickTP
TextLabel_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_11.BackgroundTransparency = 1.000
TextLabel_11.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_11.BorderSizePixel = 0
TextLabel_11.Position = UDim2.new(-0.103007227, 0, 0.189999655, 0)
TextLabel_11.Size = UDim2.new(0.501999974, 0, 0.598999977, 0)
TextLabel_11.Font = Enum.Font.FredokaOne
TextLabel_11.Text = "Quick Tp"
TextLabel_11.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_11.TextScaled = true
TextLabel_11.TextSize = 14.000
TextLabel_11.TextWrapped = true

UIGradient_38.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_38.Parent = TextLabel_11

UIGradient_39.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_39.Parent = TextLabel_11

UIGradient_40.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_40.Parent = TextLabel_11

UIAspectRatioConstraint_31.Parent = TextLabel_11
UIAspectRatioConstraint_31.AspectRatio = 7.126

QuickTPKeybind.Name = "QuickTPKeybind"
QuickTPKeybind.Parent = PlayerTab_2
QuickTPKeybind.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
QuickTPKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
QuickTPKeybind.BorderSizePixel = 0
QuickTPKeybind.Position = UDim2.new(0.336754739, 0, 0.695767164, 0)
QuickTPKeybind.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
QuickTPKeybind.ZIndex = 2

UICorner_27.CornerRadius = UDim.new(0, 4)
UICorner_27.Parent = QuickTPKeybind

TextLabel_12.Parent = QuickTPKeybind
TextLabel_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_12.BackgroundTransparency = 1.000
TextLabel_12.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_12.BorderSizePixel = 0
TextLabel_12.Position = UDim2.new(-0.0232394971, 0, 0.189999655, 0)
TextLabel_12.Size = UDim2.new(0.501999974, 0, 0.598999977, 0)
TextLabel_12.Font = Enum.Font.FredokaOne
TextLabel_12.Text = "Quick Tp Bind:"
TextLabel_12.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_12.TextScaled = true
TextLabel_12.TextSize = 14.000
TextLabel_12.TextWrapped = true

UIGradient_41.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_41.Parent = TextLabel_12

UIGradient_42.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_42.Parent = TextLabel_12

UIGradient_43.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_43.Parent = TextLabel_12

UIAspectRatioConstraint_32.Parent = TextLabel_12
UIAspectRatioConstraint_32.AspectRatio = 7.126

TextButton_3.Parent = QuickTPKeybind
TextButton_3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.BorderSizePixel = 0
TextButton_3.Position = UDim2.new(0.886393547, 0, 0.0789476708, 0)
TextButton_3.Size = UDim2.new(0.0923932269, 0, 0.769655704, 0)
TextButton_3.Font = Enum.Font.FredokaOne
TextButton_3.Text = "F"
TextButton_3.TextColor3 = Color3.fromRGB(99, 0, 255)
TextButton_3.TextScaled = true
TextButton_3.TextSize = 14.000
TextButton_3.TextWrapped = true

UICorner_28.Parent = TextButton_3

Putinkey.Name = "Putinkey"
Putinkey.Parent = QuickTPKeybind
Putinkey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Putinkey.BackgroundTransparency = 1.000
Putinkey.BorderColor3 = Color3.fromRGB(0, 0, 0)
Putinkey.BorderSizePixel = 0
Putinkey.Position = UDim2.new(0.510590672, 0, 0.268255562, 0)
Putinkey.Size = UDim2.new(0.374206126, 0, 0.598999918, 0)
Putinkey.Visible = false
Putinkey.Font = Enum.Font.FredokaOne
Putinkey.Text = "Press a key..."
Putinkey.TextColor3 = Color3.fromRGB(255, 255, 255)
Putinkey.TextScaled = true
Putinkey.TextSize = 14.000
Putinkey.TextWrapped = true

UIGradient_44.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_44.Parent = Putinkey

UIGradient_45.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_45.Parent = Putinkey

UIGradient_46.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_46.Parent = Putinkey

UIAspectRatioConstraint_33.Parent = Putinkey
UIAspectRatioConstraint_33.AspectRatio = 7.126

Walkspeed.Name = "Walkspeed"
Walkspeed.Parent = PlayerTab_2
Walkspeed.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Walkspeed.BorderColor3 = Color3.fromRGB(0, 0, 0)
Walkspeed.BorderSizePixel = 0
Walkspeed.Position = UDim2.new(0.336211205, 0, 0.820126295, 0)
Walkspeed.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
Walkspeed.ZIndex = 2

UICorner_29.CornerRadius = UDim.new(0, 4)
UICorner_29.Parent = Walkspeed

TextButton_4.Parent = Walkspeed
TextButton_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_4.BackgroundTransparency = 1.000
TextButton_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton_4.BorderSizePixel = 0
TextButton_4.Position = UDim2.new(0.0153534925, 0, 0.186521262, 0)
TextButton_4.Size = UDim2.new(0.320536941, 0, 0.773980498, 0)
TextButton_4.Font = Enum.Font.FredokaOne
TextButton_4.Text = ""
TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton_4.TextScaled = true
TextButton_4.TextSize = 14.000
TextButton_4.TextWrapped = true
TextButton_4.TextXAlignment = Enum.TextXAlignment.Left

UIGradient_47.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_47.Parent = TextButton_4

UIGradient_48.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_48.Parent = TextButton_4

UIGradient_49.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_49.Parent = TextButton_4

UIAspectRatioConstraint_34.Parent = TextButton_4
UIAspectRatioConstraint_34.AspectRatio = 4.428

Slider_3.Name = "Slider"
Slider_3.Parent = Walkspeed
Slider_3.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
Slider_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slider_3.BorderSizePixel = 0
Slider_3.Position = UDim2.new(0.381311357, 0, 0.348829865, 0)
Slider_3.Size = UDim2.new(0.526183188, 0, 0.266752243, 0)

UICorner_30.CornerRadius = UDim.new(10, 0)
UICorner_30.Parent = Slider_3

Amount_3.Name = "Amount"
Amount_3.Parent = Slider_3
Amount_3.BackgroundColor3 = Color3.fromRGB(127, 0, 255)
Amount_3.BackgroundTransparency = 1.000
Amount_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Amount_3.BorderSizePixel = 0
Amount_3.Position = UDim2.new(1.03362942, 0, -0.3846156, 0)
Amount_3.Size = UDim2.new(0.0987537429, 0, 1.69230783, 0)
Amount_3.Font = Enum.Font.FredokaOne
Amount_3.Text = "20"
Amount_3.TextColor3 = Color3.fromRGB(127, 0, 255)
Amount_3.TextScaled = true
Amount_3.TextSize = 14.000
Amount_3.TextWrapped = true

SliderThing_3.Name = "SliderThing"
SliderThing_3.Parent = Walkspeed
SliderThing_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SliderThing_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
SliderThing_3.BorderSizePixel = 0
SliderThing_3.Position = UDim2.new(0.381311357, 0, 0.348829865, 0)
SliderThing_3.Size = UDim2.new(0.0337870941, 0, 0.266752243, 0)

UICorner_31.CornerRadius = UDim.new(10, 0)
UICorner_31.Parent = SliderThing_3

UIGradient_50.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_50.Parent = SliderThing_3

UIAspectRatioConstraint_35.Parent = SliderThing_3
UIAspectRatioConstraint_35.AspectRatio = 1.077

TextLabel_13.Parent = Walkspeed
TextLabel_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_13.BackgroundTransparency = 1.000
TextLabel_13.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_13.BorderSizePixel = 0
TextLabel_13.Position = UDim2.new(-0.0433501154, 0, 0.240512311, 0)
TextLabel_13.Size = UDim2.new(0.442484707, 0, 0.552336633, 0)
TextLabel_13.Font = Enum.Font.FredokaOne
TextLabel_13.Text = "Walk Speed"
TextLabel_13.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_13.TextScaled = true
TextLabel_13.TextSize = 14.000
TextLabel_13.TextWrapped = true

UIGradient_51.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_51.Parent = TextLabel_13

UIGradient_52.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_52.Parent = TextLabel_13

UIGradient_53.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_53.Parent = TextLabel_13

UIAspectRatioConstraint_36.Parent = TextLabel_13
UIAspectRatioConstraint_36.AspectRatio = 7.126

VisualsTab_2.Name = "VisualsTab"
VisualsTab_2.Parent = UI
VisualsTab_2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
VisualsTab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
VisualsTab_2.BorderSizePixel = 0
VisualsTab_2.Position = UDim2.new(-4.484097e-08, 0, 7.02470544e-08, 0)
VisualsTab_2.Size = UDim2.new(0.999999702, 0, 1.00000012, 0)
VisualsTab_2.ZIndex = 2

UICorner_32.CornerRadius = UDim.new(0, 12)
UICorner_32.Parent = VisualsTab_2

UIAspectRatioConstraint_37.Parent = VisualsTab_2
UIAspectRatioConstraint_37.AspectRatio = 1.567

Background_2.Name = "Background"
Background_2.Parent = VisualsTab_2
Background_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Background_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background_2.BorderSizePixel = 0
Background_2.Position = UDim2.new(0.3386226, 0, 0.167370707, 0)
Background_2.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
Background_2.ZIndex = 2

UICorner_33.CornerRadius = UDim.new(0, 4)
UICorner_33.Parent = Background_2

Switch_5.Name = "Switch"
Switch_5.Parent = Background_2
Switch_5.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
Switch_5.BackgroundTransparency = 0.800
Switch_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
Switch_5.BorderSizePixel = 0
Switch_5.Position = UDim2.new(0.798893094, 0, 0.237907037, 0)
Switch_5.Size = UDim2.new(0.160436109, 0, 0.558846653, 0)
Switch_5.ZIndex = 2

UICorner_34.CornerRadius = UDim.new(20, 0)
UICorner_34.Parent = Switch_5

UIAspectRatioConstraint_38.Parent = Switch_5
UIAspectRatioConstraint_38.AspectRatio = 2.695

Switch1_5.Name = "Switch1"
Switch1_5.Parent = Background_2
Switch1_5.BackgroundColor3 = Color3.fromRGB(120, 52, 255)
Switch1_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
Switch1_5.BorderSizePixel = 0
Switch1_5.Position = UDim2.new(0.798893154, 0, 0.228659093, 0)
Switch1_5.Size = UDim2.new(0.0623449758, 0, 0.515391111, 0)
Switch1_5.ZIndex = 3

UICorner_35.CornerRadius = UDim.new(20, 0)
UICorner_35.Parent = Switch1_5

TextLabel_14.Parent = Background_2
TextLabel_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_14.BackgroundTransparency = 1.000
TextLabel_14.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_14.BorderSizePixel = 0
TextLabel_14.Position = UDim2.new(-0.075813219, 0, 0.190000266, 0)
TextLabel_14.Size = UDim2.new(0.501999974, 0, 0.598999977, 0)
TextLabel_14.Font = Enum.Font.FredokaOne
TextLabel_14.Text = "Ball Hitbox"
TextLabel_14.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_14.TextScaled = true
TextLabel_14.TextSize = 14.000
TextLabel_14.TextWrapped = true

UIGradient_54.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_54.Parent = TextLabel_14

UIGradient_55.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_55.Parent = TextLabel_14

UIGradient_56.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
UIGradient_56.Parent = TextLabel_14

UIAspectRatioConstraint_39.Parent = TextLabel_14
UIAspectRatioConstraint_39.AspectRatio = 7.126

-- Scripts:

local function AKDGFUM_fake_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)

	local vis = false
	
	for i,v in script.Parent:GetDescendants() do
		if not v:IsA("LocalScript") and not v:IsA("TextLabel") and not v:IsA("UICorner") and not v:IsA("UIGradient") and not v:IsA("UIAspectRatioConstraint") and not v:IsA("ImageLabel") then
			v.Transparency = 1
		elseif v:IsA("TextLabel") then
			v.TextTransparency = 1
		elseif v:IsA("ImageLabel") then
			v.ImageTransparency = 1
		end
	end
	
	task.wait(3)
	
	vis = true
	
	game:GetService("UserInputService").InputBegan:Connect(function(input,gp)
		if input.KeyCode == Enum.KeyCode.LeftControl then
			if not vis then
				local TweenService = game:GetService("TweenService")
	
				local tweenInfo = TweenInfo.new(.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	
				for _, v in script.Parent.UI:GetDescendants() do
					if v:IsA("Frame") and v.Name ~= "UI" or v:IsA("UIStroke") then
						TweenService:Create(v, tweenInfo, {Transparency = 0}):Play()
					elseif v:IsA("TextLabel") then
						TweenService:Create(v, tweenInfo, {TextTransparency = 0}):Play()
					elseif v:IsA("TextButton") and v.Name ~= "f" then
						TweenService:Create(v, tweenInfo, {TextTransparency = 0}):Play()
					elseif v:IsA("ImageLabel") then
						TweenService:Create(v, tweenInfo, {ImageTransparency = 0}):Play()
					end
					
					if v:IsA("TextButton") then
						v.Interactable = true
					end
				end
			else
				local TweenService = game:GetService("TweenService")
	
				local tweenInfo = TweenInfo.new(.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	
				for _, v in script.Parent.UI:GetDescendants() do
					if v:IsA("Frame") and v.Name ~= "UI" or v:IsA("UIStroke") then
						TweenService:Create(v, tweenInfo, {Transparency = 1}):Play()
					elseif v:IsA("TextLabel") then
						TweenService:Create(v, tweenInfo, {TextTransparency = 1}):Play()
					elseif v:IsA("TextButton") and v.Name ~= "f" then
						TweenService:Create(v, tweenInfo, {TextTransparency = 1}):Play()
					elseif v:IsA("ImageLabel") then
						TweenService:Create(v, tweenInfo, {ImageTransparency = 1}):Play()
					end
					
					if v:IsA("TextButton") then
						v.Interactable = false
					end
				end
			end
			vis = not vis
		end
	end)
end
coroutine.wrap(AKDGFUM_fake_script)()
local function UNBXXTI_fake_script() -- Welcome.LocalScript 
	local script = Instance.new('LocalScript', Welcome)

	local TweenService = game:GetService("TweenService")
	local textLabel = script.Parent
	
	textLabel.Text = "Welcome to Lunor, " .. game.Players.LocalPlayer.DisplayName .. "! Please wait while the script loads."
	
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	
	local fadeIn = TweenService:Create(textLabel, tweenInfo, {TextTransparency = 0})
	fadeIn:Play()
	fadeIn.Completed:Wait()
	
	task.wait(1)
	
	local fadeOut = TweenService:Create(textLabel, tweenInfo, {TextTransparency = 1})
	fadeOut:Play()
	fadeOut.Completed:Wait()
	
	for _, v in script.Parent.Parent:GetDescendants() do
		if v:IsA("Frame") and v.Name ~= "UI" or v:IsA("UIStroke") then
			TweenService:Create(v, tweenInfo, {Transparency = 0}):Play()
		elseif v:IsA("TextLabel") and v ~= textLabel then
			TweenService:Create(v, tweenInfo, {TextTransparency = 0}):Play()
		elseif v:IsA("TextButton") and v.Name ~= "f" then
			TweenService:Create(v, tweenInfo, {TextTransparency = 0}):Play()
		elseif v:IsA("ImageLabel") then
			TweenService:Create(v, tweenInfo, {ImageTransparency = 0}):Play()
		end
	end
end
coroutine.wrap(UNBXXTI_fake_script)()
local function DZNLZP_fake_script() -- Switch1.LocalScript 
	local script = Instance.new('LocalScript', Switch1)

	local toggle = script.Parent
	local toggled = false
	local tween = game:GetService("TweenService")
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	
	toggle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if not toggled and toggle.Parent.Parent.ZIndex == 19 then
	
	
				local goal = {}
				goal.Position = UDim2.new(0.8975, 0, toggle.Position.Y.Scale, 0)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
	
				toggled = true
				tween:Create(toggle, info, goal):Play()
	
				local goal = {}
				goal.Color = Color3.fromRGB(255,255,255)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
	
				tween:Create(toggle.Parent.Switch.UIStroke, info, goal):Play()
			elseif toggle.Parent.Parent.ZIndex == 19 then
	
	
				local goal = {}
				goal.Position = UDim2.new(0.799, 0, toggle.Position.Y.Scale, 0)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
	
				toggled = false
				tween:Create(toggle, info, goal):Play()
	
				local goal = {}
				goal.Color = Color3.fromRGB(5,5,5)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
				tween:Create(toggle.Parent.Switch.UIStroke, info, goal):Play()
			end
		end
	end)
	
	mouse.Button1Down:Connect(function()
		local player = game:GetService("Players").LocalPlayer
		if player and player.Character and toggled then
			
			local amountLabel = toggle.Parent.Parent.Slider1Background.Slider.Amount
			local sizeValue = tonumber(amountLabel.Text)
			
			local mind = sizeValue
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
	
	game:GetService("RunService").RenderStepped:Connect(function()
		local amountLabel = toggle.Parent.Parent.Slider1Background.Slider.Amount
		local sizeValue = tonumber(amountLabel.Text)
		local player = game:GetService("Players").LocalPlayer
	
		local catchRight = player.Character:FindFirstChild("CatchRight")
		local catchLeft = player.Character:FindFirstChild("CatchLeft")
	
		if catchRight then
			catchRight.Size = Vector3.new(sizeValue, sizeValue, sizeValue)
		end
		
		if catchLeft then
			catchLeft.Size = Vector3.new(sizeValue, sizeValue, sizeValue)
		end
		
		if not toggled then
			if catchRight then
				catchRight.Size = Vector3.new(1.4, 1.65, 1.4)
			end
	
			if catchLeft then
				catchLeft.Size = Vector3.new(1.4, 1.65, 1.4)
			end
		end
	end)
end
coroutine.wrap(DZNLZP_fake_script)()
local function AWUU_fake_script() -- Slider1Background.LocalScript 
	local script = Instance.new('LocalScript', Slider1Background)

	
end
coroutine.wrap(AWUU_fake_script)()
local function DTXD_fake_script() -- SliderThing.LocalScript 
	local script = Instance.new('LocalScript', SliderThing)

	local UserInputService = game:GetService("UserInputService")
	local camera = workspace.CurrentCamera
	local slider = script.Parent
	local renderstepped = game:GetService("RunService").RenderStepped
	local amount = slider.Parent.Slider.Amount
	local tweenservice =game:GetService("TweenService")
	
	task.wait(2)
	
	slider.UIAspectRatioConstraint:Destroy()
	
	local holding = false
	local initialMouseX = 0
	local initialScaleX = slider.Size.X.Scale
	local sensitivity = 2.7
	
	local function getSliderValue(size)
		local inputMin = 0.034
		local inputMax = 0.527
		local outputMin = 1
		local outputMax = 25
	
		local value = ((size - inputMin) / (inputMax - inputMin)) * (outputMax - outputMin) + outputMin
		return value
	end
	
	slider.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
	
		holding = true
		initialMouseX = UserInputService:GetMouseLocation().X
		initialScaleX = slider.Size.X.Scale
		
		local debounce = false
	
		while holding do
			renderstepped:Wait()
			
			if debounce or slider.Parent.Parent.ZIndex ~= 19 then
				continue
			end
			
			local currentMouseX = UserInputService:GetMouseLocation().X
			local screenWidth = camera.ViewportSize.X
	
			local deltaX = (currentMouseX - initialMouseX) / screenWidth * sensitivity
			
			local goal = {}
			
			local newScaleX = math.clamp(initialScaleX + deltaX, 0.034, 0.527)
			
			goal.Size = UDim2.new(newScaleX, 0, slider.Size.Y.Scale, 0)
			
			local info = TweenInfo.new(
				0.075,
				Enum.EasingStyle.Sine,
				Enum.EasingDirection.InOut,
				0,
				false,
				0
			)
			
			debounce = true
			
			local tween = tweenservice:Create(slider, info, goal)
			tween:Play()
	
			local sliderValue = getSliderValue(newScaleX)
			
			amount.Text = math.round(sliderValue)
			
			renderstepped:Wait()
			tween:Destroy()
			debounce = false
		end
	end)
	
	slider.InputEnded:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
		holding = false
	end)
end
coroutine.wrap(DTXD_fake_script)()
-- CatchingTab.SliderScript is disabled.
local function DQWHSHJ_fake_script() -- f.LocalScript 
	local script = Instance.new('LocalScript', f)

	local Button = script.Parent
	local UI = Button.Parent.Parent.Parent.Parent
	local TabName = "CatchingTab"
	
	Button.MouseButton1Down:Connect(function()
		for i,v in UI:GetChildren() do
			pcall(function()
				if v.Name ~= "Tabs" and v.Name ~= "Top" and v ~= UI:FindFirstChild(TabName) then
					v.ZIndex = 0
					print(v)
				elseif v == UI:FindFirstChild(TabName) then
					v.ZIndex = 19
				end
			end)
		end
	end)
end
coroutine.wrap(DQWHSHJ_fake_script)()
local function KUBHK_fake_script() -- f_2.LocalScript 
	local script = Instance.new('LocalScript', f_2)

	local Button = script.Parent
	local UI = Button.Parent.Parent.Parent.Parent
	local TabName = "PlayerTab"
	
	Button.MouseButton1Down:Connect(function()
		for i,v in UI:GetChildren() do
			pcall(function()
				if v.Name ~= "Tabs" and v.Name ~= "Top" and v ~= UI:FindFirstChild(TabName) then
					v.ZIndex = 0
				elseif v == UI:FindFirstChild(TabName) then
					v.ZIndex = 19
				end
			end)
		end
	end)
end
coroutine.wrap(KUBHK_fake_script)()
local function SXKT_fake_script() -- TextLabel_5.LocalScript 
	local script = Instance.new('LocalScript', TextLabel_5)

	script.Parent.Text = "Hello ".. game.Players.LocalPlayer.DisplayName .."!"
end
coroutine.wrap(SXKT_fake_script)()
local function UXZUZZ_fake_script() -- f_3.LocalScript 
	local script = Instance.new('LocalScript', f_3)

	local Button = script.Parent
	local UI = Button.Parent.Parent.Parent.Parent
	local TabName = "VisualsTab"
	
	Button.MouseButton1Down:Connect(function()
		for i,v in UI:GetChildren() do
			pcall(function()
				if v.Name ~= "Tabs" and v.Name ~= "Top" and v ~= UI:FindFirstChild(TabName) then
					v.ZIndex = 0
					print(v)
				elseif v == UI:FindFirstChild(TabName) then
					v.ZIndex = 19
				end
			end)
		end
	end)
end
coroutine.wrap(UXZUZZ_fake_script)()
local function ROFIFNJ_fake_script() -- Top.LocalScript 
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
				0.05,
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
coroutine.wrap(ROFIFNJ_fake_script)()
local function OSCW_fake_script() -- Switch1_2.LocalScript 
	local script = Instance.new('LocalScript', Switch1_2)

	local toggle = script.Parent
	local toggled = false
	local tween = game:GetService("TweenService")
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	
	toggle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if not toggled and toggle.Parent.Parent.ZIndex == 19 then
	
	
				local goal = {}
				goal.Position = UDim2.new(0.8975, 0, toggle.Position.Y.Scale, 0)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
	
				toggled = true
				tween:Create(toggle, info, goal):Play()
				
				local goal = {}
				goal.Color = Color3.fromRGB(255,255,255)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
				
				tween:Create(toggle.Parent.Switch.UIStroke, info, goal):Play()
			elseif toggle.Parent.Parent.ZIndex == 19 then
	
	
				local goal = {}
				goal.Position = UDim2.new(0.799, 0, toggle.Position.Y.Scale, 0)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
	
				toggled = false
				tween:Create(toggle, info, goal):Play()
				
				local goal = {}
				goal.Color = Color3.fromRGB(5,5,5)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
				tween:Create(toggle.Parent.Switch.UIStroke, info, goal):Play()
			end
		end
	end)
	
	local UserInputService = game:GetService("UserInputService")
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	
	local shiftTime = 0
	local jumpTime = 0
	local timeWindow = 0.3  -- Time window in seconds
	
	-- Detect when the Shift key is pressed
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
			shiftTime = tick()  -- Record the time when Shift was pressed
		end
	end)
	
	-- Detect when the player jumps
	humanoid.Jumping:Connect(function()
		jumpTime = tick()
		
		local amountLabel = toggle.Parent.Parent.Slider1Background.Slider.Amount
		local sizeValue = tonumber(amountLabel.Text)
	
		if math.abs(jumpTime - shiftTime) <= timeWindow then
			if toggled == true then
				humanoid.UseJumpPower = true
				humanoid.JumpPower = sizeValue
				wait(0.001)
				humanoid.UseJumpPower = false
				humanoid.JumpPower = 50
			end
		end
	end)
end
coroutine.wrap(OSCW_fake_script)()
local function UADAXBW_fake_script() -- Slider1Background_2.LocalScript 
	local script = Instance.new('LocalScript', Slider1Background_2)

	
end
coroutine.wrap(UADAXBW_fake_script)()
local function OZND_fake_script() -- SliderThing_2.LocalScript 
	local script = Instance.new('LocalScript', SliderThing_2)

	local UserInputService = game:GetService("UserInputService")
	local camera = workspace.CurrentCamera
	local slider = script.Parent
	local renderstepped = game:GetService("RunService").RenderStepped
	local amount = slider.Parent.Slider.Amount
	local tweenservice =game:GetService("TweenService")
	
	task.wait(2)
	
	slider.UIAspectRatioConstraint:Destroy()
	
	local holding = false
	local initialMouseX = 0
	local initialScaleX = slider.Size.X.Scale
	local sensitivity = 2.7
	
	local function getSliderValue(size)
		local inputMin = 0.034
		local inputMax = 0.527
		local outputMin = 50
		local outputMax = 65
	
		local value = ((size - inputMin) / (inputMax - inputMin)) * (outputMax - outputMin) + outputMin
		return value
	end
	
	slider.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
	
		holding = true
		initialMouseX = UserInputService:GetMouseLocation().X
		initialScaleX = slider.Size.X.Scale
		
		local debounce = false
	
		while holding do
			renderstepped:Wait()
			
			if debounce or slider.Parent.Parent.ZIndex ~= 19 then
				continue
			end
			
			local currentMouseX = UserInputService:GetMouseLocation().X
			local screenWidth = camera.ViewportSize.X
	
			local deltaX = (currentMouseX - initialMouseX) / screenWidth * sensitivity
			
			local goal = {}
			
			local newScaleX = math.clamp(initialScaleX + deltaX, 0.034, 0.527)
			
			goal.Size = UDim2.new(newScaleX, 0, slider.Size.Y.Scale, 0)
			
			local info = TweenInfo.new(
				0.075,
				Enum.EasingStyle.Sine,
				Enum.EasingDirection.InOut,
				0,
				false,
				0
			)
			
			debounce = true
			
			local tween = tweenservice:Create(slider, info, goal)
			tween:Play()
	
			local sliderValue = getSliderValue(newScaleX)
			
			amount.Text = math.round(sliderValue)
			
			renderstepped:Wait()
			tween:Destroy()
			debounce = false
		end
	end)
	
	slider.InputEnded:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
		holding = false
	end)
end
coroutine.wrap(OZND_fake_script)()
local function QKSWS_fake_script() -- Switch1_3.LocalScript 
	local script = Instance.new('LocalScript', Switch1_3)

	local toggle = script.Parent
	local toggled = false
	local tween = game:GetService("TweenService")
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	
	toggle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if not toggled and toggle.Parent.Parent.ZIndex == 19 then
	
	
				local goal = {}
				goal.Position = UDim2.new(0.8975, 0, toggle.Position.Y.Scale, 0)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
	
				toggled = true
				tween:Create(toggle, info, goal):Play()
				
				local goal = {}
				goal.Color = Color3.fromRGB(255,255,255)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
				
				tween:Create(toggle.Parent.Switch.UIStroke, info, goal):Play()
			elseif toggle.Parent.Parent.ZIndex == 19 then
	
	
				local goal = {}
				goal.Position = UDim2.new(0.799, 0, toggle.Position.Y.Scale, 0)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
	
				toggled = false
				tween:Create(toggle, info, goal):Play()
				
				local goal = {}
				goal.Color = Color3.fromRGB(5,5,5)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
				tween:Create(toggle.Parent.Switch.UIStroke, info, goal):Play()
			end
		end
	end)
	
	local UserInputService = game:GetService("UserInputService")
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	
	local shiftTime = 0
	local jumpTime = 0
	local timeWindow = 0.2  -- Time window in seconds
	
	-- Detect when the Shift key is pressed
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
			shiftTime = tick()  -- Record the time when Shift was pressed
		end
	end)
	
	-- Detect when the player jumps
	humanoid.Jumping:Connect(function()
		jumpTime = tick()  -- Record the time when the player jumps
	
		-- Check if shifting and jumping occurred within the time window
		if math.abs(jumpTime - shiftTime) <= timeWindow then
			local footballs = game.Workspace:GetChildren()
			local closestFootball = nil
			local minDistance = math.huge
	
			for _, part in ipairs(footballs) do
				if part.Name == "Football" then
					local distance = (part.Position - player.Character.HumanoidRootPart.Position).magnitude
					if distance < minDistance then
						minDistance = distance
						closestFootball = part
					end
				end
			end
	
			if closestFootball then
				local yPosition = closestFootball.Position.Y
				local heightDifference = math.abs(player.Character.HumanoidRootPart.Position.Y - yPosition)
				local jumpHeight = heightDifference - 10  -- Desired jump height
				local gravity = 196.2  -- Roblox gravity constant
				local jumpPower = math.sqrt(jumpHeight * 2 * gravity)
				
				print(jumpPower)
	
				if toggled == true then
					if jumpPower > 50 and jumpPower <= 60 then
						humanoid.JumpPower = jumpPower
					elseif jumpPower < 50 then
						humanoid.JumpPower = math.random(55, 60)  -- Cap it at 60
					else
						humanoid.JumpPower = 60
					end
				end
			end
	
			wait(0.001)
			humanoid.JumpPower = 50  -- Reset jump power
		end
	end)
end
coroutine.wrap(QKSWS_fake_script)()
local function HKGHOAA_fake_script() -- Switch1_4.LocalScript 
	local script = Instance.new('LocalScript', Switch1_4)

	local toggle = script.Parent
	local toggled = false
	local tween = game:GetService("TweenService")
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	
	toggle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if not toggled and toggle.Parent.Parent.ZIndex == 19 then
	
	
				local goal = {}
				goal.Position = UDim2.new(0.8975, 0, toggle.Position.Y.Scale, 0)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
	
				toggled = true
				tween:Create(toggle, info, goal):Play()
				
				local goal = {}
				goal.Color = Color3.fromRGB(255,255,255)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
				
				tween:Create(toggle.Parent.Switch.UIStroke, info, goal):Play()
			elseif toggle.Parent.Parent.ZIndex == 19 then
	
	
				local goal = {}
				goal.Position = UDim2.new(0.799, 0, toggle.Position.Y.Scale, 0)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
	
				toggled = false
				tween:Create(toggle, info, goal):Play()
				
				local goal = {}
				goal.Color = Color3.fromRGB(5,5,5)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
				tween:Create(toggle.Parent.Switch.UIStroke, info, goal):Play()
			end
		end
	end)
	
	local textbutton = toggle.Parent.Parent.QuickTPKeybind.TextButton
	
	local uis = game:GetService("UserInputService")
	
	uis.InputBegan:Connect(function(input,gp)
		if not game.Players.LocalPlayer.Character then
			return
		end
		
		if input.KeyCode == Enum.KeyCode[textbutton.Text] and not gp and toggled then
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame *= CFrame.new(0,0,-3)
		end
	end)
end
coroutine.wrap(HKGHOAA_fake_script)()
local function UAIRRUC_fake_script() -- TextButton_3.LocalScript 
	local script = Instance.new('LocalScript', TextButton_3)

	local characters = {
		"One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Zero", "Minus", "Equals",  
		"Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P",
		"A", "S", "D", "F", "G", "H", "J", "K", "L", "Colon",
		"Z", "X", "C", "V", "B", "N", "N", "Comma", "Period", "Slash",  
		"Space", "Return", "Backspace", "Tab", "CapsLock", "LeftShift", "LeftControl", "LeftAlt",  
		"Escape", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12",  
		"Up", "Down", "Left", "Right", "RightShift", "RightControl", "ScrollLock", "Home",
	}
	
	local textbutton = script.Parent
	
	textbutton.MouseButton1Down:Connect(function()
		local inp = nil
		textbutton.Parent.Putinkey.Visible = true
	
		local connection
		connection = game:GetService("UserInputService").InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.Keyboard then
				for i, v in pairs(characters) do
					if input.KeyCode == Enum.KeyCode[v] then
						inp = v
						script.Parent.Text = v
						textbutton.Parent.Putinkey.Visible = false
						connection:Disconnect()
					end
				end
			end
		end)
	end)
end
coroutine.wrap(UAIRRUC_fake_script)()
local function UBLQMP_fake_script() -- Walkspeed.LocalScript 
	local script = Instance.new('LocalScript', Walkspeed)

	
end
coroutine.wrap(UBLQMP_fake_script)()
local function BHYCN_fake_script() -- SliderThing_3.LocalScript 
	local script = Instance.new('LocalScript', SliderThing_3)

	local UserInputService = game:GetService("UserInputService")
	local camera = workspace.CurrentCamera
	local slider = script.Parent
	local renderstepped = game:GetService("RunService").RenderStepped
	local amount = slider.Parent.Slider.Amount
	local tweenservice =game:GetService("TweenService")
	
	task.wait(2)
	
	slider.UIAspectRatioConstraint:Destroy()
	
	local holding = false
	local initialMouseX = 0
	local initialScaleX = slider.Size.X.Scale
	local sensitivity = 2.7
	
	local function getSliderValue(size)
		local inputMin = 0.034
		local inputMax = 0.527
		local outputMin = 20
		local outputMax = 23
	
		local value = ((size - inputMin) / (inputMax - inputMin)) * (outputMax - outputMin) + outputMin
		return value
	end
	
	slider.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
	
		holding = true
		initialMouseX = UserInputService:GetMouseLocation().X
		initialScaleX = slider.Size.X.Scale
		
		local debounce = false
	
		while holding or slider.Parent.Parent.ZIndex ~= 19 do
			renderstepped:Wait()
			
			if debounce then
				continue
			end
			
			local currentMouseX = UserInputService:GetMouseLocation().X
			local screenWidth = camera.ViewportSize.X
	
			local deltaX = (currentMouseX - initialMouseX) / screenWidth * sensitivity
			
			local goal = {}
			
			local newScaleX = math.clamp(initialScaleX + deltaX, 0.034, 0.527)
			
			goal.Size = UDim2.new(newScaleX, 0, slider.Size.Y.Scale, 0)
			
			local info = TweenInfo.new(
				0.075,
				Enum.EasingStyle.Sine,
				Enum.EasingDirection.InOut,
				0,
				false,
				0
			)
			
			debounce = true
			
			local tween = tweenservice:Create(slider, info, goal)
			tween:Play()
	
			local sliderValue = getSliderValue(newScaleX)
			
			amount.Text = math.round(sliderValue)
			
			renderstepped:Wait()
			tween:Destroy()
			debounce = false
		end
	end)
	
	slider.InputEnded:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
		holding = false
	end)
	
	renderstepped:Connect(function()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = slider.Parent.Slider.Amount.Text
	end)
end
coroutine.wrap(BHYCN_fake_script)()
-- VisualsTab_2.SliderScript is disabled.
local function EPCFUCG_fake_script() -- Switch1_5.LocalScript 
	local script = Instance.new('LocalScript', Switch1_5)

	local toggle = script.Parent
	local toggled = false
	local tween = game:GetService("TweenService")
	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	
	toggle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			if not toggled and toggle.Parent.Parent.ZIndex == 19 then
	
	
				local goal = {}
				goal.Position = UDim2.new(0.8975, 0, toggle.Position.Y.Scale, 0)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
	
				toggled = true
				tween:Create(toggle, info, goal):Play()
	
				local goal = {}
				goal.Color = Color3.fromRGB(255,255,255)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
	
				tween:Create(toggle.Parent.Switch.UIStroke, info, goal):Play()
			elseif toggle.Parent.Parent.ZIndex == 19 then
	
	
				local goal = {}
				goal.Position = UDim2.new(0.799, 0, toggle.Position.Y.Scale, 0)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
	
				toggled = false
				tween:Create(toggle, info, goal):Play()
	
				local goal = {}
				goal.Color = Color3.fromRGB(5,5,5)
	
				local info = TweenInfo.new(
					0.7,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.Out,
					0,
					false
				)
				tween:Create(toggle.Parent.Switch.UIStroke, info, goal):Play()
			end
		end
	end)
	
	game:GetService("RunService").RenderStepped:Connect(function()
		for i,v in workspace:GetChildren() do
			
			local player = game:GetService("Players").LocalPlayer
	
			local catchRight = player.Character:FindFirstChild("CatchRight")
			
			if v.Name == "Football" and toggled then
				
				local function spotlight(face)
					local spotlight = Instance.new("SpotLight",v)
					spotlight.Name = 'sefuij'
					spotlight.Angle = 180
					spotlight.Brightness = 2
					spotlight.Range = 16
					spotlight.Face = face
				end
	
				if catchRight and not v:FindFirstChild("efaiuo") and toggled then
					
					spotlight(Enum.NormalId.Front)
					spotlight(Enum.NormalId.Left)
					spotlight(Enum.NormalId.Right)
					spotlight(Enum.NormalId.Top)
					spotlight(Enum.NormalId.Bottom)
					spotlight(Enum.NormalId.Back)
					
					local hb = Instance.new("Part", v)
					hb.Name = 'efaiuo'
					hb.Material = Enum.Material.ForceField
					hb.Shape = Enum.PartType.Ball
					hb.Transparency = 0.5
					hb.Size = Vector3.new(catchRight.Size.Y,catchRight.Size.Y,catchRight.Size.Y)
					hb.CanCollide = false
					hb.Anchored = false
					hb.CFrame = v.CFrame
					hb.Massless = true
					hb.Color = Color3.fromRGB(149, 0, 255)
				elseif catchRight and v:FindFirstChild("efaiuo") then
					local hb = v:FindFirstChild("efaiuo")
					hb.CFrame = v.CFrame
					hb.Size = Vector3.new(catchRight.Size.Y,catchRight.Size.Y,catchRight.Size.Y)
				end
			elseif not toggled and v.Name == "Football" then
				for i,s in v:GetChildren() do
					if s.Name == "efaiuo" or s.Name == "sefuij" then
						s:Destroy()
					end
				end
			end
		end
	end)
end
coroutine.wrap(EPCFUCG_fake_script)()

			end				

end

    local scriptIdentifier = debug.info(Targets[1], "s")

    -- Hook the debug.info function to return the spoofed script path
    Hooks.debug_info = hookfunction(debug.info, LPH_NO_VIRTUALIZE(function(...)
        local args = {...}
        if not checkcaller() and AreTablesEqual(args, {2, "s"}) then
            return scriptIdentifier
        end
        return Hooks.debug_info(...)
    end))

    -- Neutralize the identified functions by hooking them to empty functions
    for i = 1, 3 do
        hookfunction(Targets[i], LPH_NO_VIRTUALIZE(function() end))
    end

    -- Hook the call metamethod to allow only whitelisted calls
    Hooks.call = hookfunction(Targets.call, LPH_NO_VIRTUALIZE(function(self, ...)
        local callArgs = {...}
        for _, whitelist in ipairs(Whitelisted) do
            if AreTablesEqual(whitelist, callArgs) then
                return Hooks.call(self, ...)
            end
        end
    end))

    task.wait(3)
end)()
