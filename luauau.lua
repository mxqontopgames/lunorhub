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

local ScreenGui = {
	ScreenGui = Instance.new("ScreenGui"),
	Welcome = Instance.new("TextLabel"),
	UIGradient = Instance.new("UIGradient"),
	UI = Instance.new("Frame"),
	CatchingTab = Instance.new("Frame"),
	UICorner = Instance.new("UICorner"),
	Background = Instance.new("Frame"),
	UICorner_2 = Instance.new("UICorner"),
	Switch = Instance.new("Frame"),
	UICorner_3 = Instance.new("UICorner"),
	UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint"),
	Switch1 = Instance.new("Frame"),
	UICorner_4 = Instance.new("UICorner"),
	TextLabel = Instance.new("TextLabel"),
	UIGradient_2 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint"),
	UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint"),
	Slider1Background = Instance.new("Frame"),
	UICorner_5 = Instance.new("UICorner"),
	Slider = Instance.new("Frame"),
	UICorner_6 = Instance.new("UICorner"),
	Amount = Instance.new("TextLabel"),
	SliderThing = Instance.new("Frame"),
	UICorner_7 = Instance.new("UICorner"),
	UIGradient_3 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint"),
	TextButton = Instance.new("TextButton"),
	UIGradient_4 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint"),
	Tabs = Instance.new("Frame"),
	UICorner_8 = Instance.new("UICorner"),
	CatchingTab_2 = Instance.new("Frame"),
	UICorner_9 = Instance.new("UICorner"),
	TextLabel_2 = Instance.new("TextLabel"),
	UIGradient_5 = Instance.new("UIGradient"),
	f = Instance.new("TextButton"),
	UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint"),
	PlayerTab = Instance.new("Frame"),
	UICorner_10 = Instance.new("UICorner"),
	TextLabel_3 = Instance.new("TextLabel"),
	UIGradient_6 = Instance.new("UIGradient"),
	f_2 = Instance.new("TextButton"),
	UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint"),
	AutomaticsTab = Instance.new("Frame"),
	UICorner_11 = Instance.new("UICorner"),
	TextLabel_4 = Instance.new("TextLabel"),
	UIGradient_7 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint"),
	f_3 = Instance.new("TextButton"),
	UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint"),
	TextLabel_5 = Instance.new("TextLabel"),
	UIGradient_8 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_10 = Instance.new("UIAspectRatioConstraint"),
	UIAspectRatioConstraint_11 = Instance.new("UIAspectRatioConstraint"),
	VisualsTab = Instance.new("Frame"),
	UICorner_12 = Instance.new("UICorner"),
	TextLabel_6 = Instance.new("TextLabel"),
	UIGradient_9 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_12 = Instance.new("UIAspectRatioConstraint"),
	f_4 = Instance.new("TextButton"),
	UIAspectRatioConstraint_13 = Instance.new("UIAspectRatioConstraint"),
	Top = Instance.new("Frame"),
	UICorner_13 = Instance.new("UICorner"),
	TextLabel_7 = Instance.new("TextLabel"),
	UIGradient_10 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_14 = Instance.new("UIAspectRatioConstraint"),
	UIAspectRatioConstraint_15 = Instance.new("UIAspectRatioConstraint"),
	Label = Instance.new("ImageLabel"),
	UIAspectRatioConstraint_16 = Instance.new("UIAspectRatioConstraint"),
	UIAspectRatioConstraint_17 = Instance.new("UIAspectRatioConstraint"),
	PlayerTab_2 = Instance.new("Frame"),
	UICorner_14 = Instance.new("UICorner"),
	UIAspectRatioConstraint_18 = Instance.new("UIAspectRatioConstraint"),
	JpAeBackground = Instance.new("Frame"),
	UICorner_15 = Instance.new("UICorner"),
	Switch_2 = Instance.new("Frame"),
	UICorner_16 = Instance.new("UICorner"),
	UIAspectRatioConstraint_19 = Instance.new("UIAspectRatioConstraint"),
	Switch1_2 = Instance.new("Frame"),
	UICorner_17 = Instance.new("UICorner"),
	UIAspectRatioConstraint_20 = Instance.new("UIAspectRatioConstraint"),
	TextLabel_8 = Instance.new("TextLabel"),
	UIGradient_11 = Instance.new("UIGradient"),
	UIGradient_12 = Instance.new("UIGradient"),
	UIGradient_13 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_21 = Instance.new("UIAspectRatioConstraint"),
	Slider1Background_2 = Instance.new("Frame"),
	UICorner_18 = Instance.new("UICorner"),
	TextButton_2 = Instance.new("TextButton"),
	UIGradient_14 = Instance.new("UIGradient"),
	UIGradient_15 = Instance.new("UIGradient"),
	UIGradient_16 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_22 = Instance.new("UIAspectRatioConstraint"),
	Slider_2 = Instance.new("Frame"),
	UICorner_19 = Instance.new("UICorner"),
	Amount_2 = Instance.new("TextLabel"),
	SliderThing_2 = Instance.new("Frame"),
	UICorner_20 = Instance.new("UICorner"),
	UIGradient_17 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_23 = Instance.new("UIAspectRatioConstraint"),
	TextLabel_9 = Instance.new("TextLabel"),
	UIGradient_18 = Instance.new("UIGradient"),
	UIGradient_19 = Instance.new("UIGradient"),
	UIGradient_20 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_24 = Instance.new("UIAspectRatioConstraint"),
	DynamicAeBackground = Instance.new("Frame"),
	UICorner_21 = Instance.new("UICorner"),
	Switch_3 = Instance.new("Frame"),
	UICorner_22 = Instance.new("UICorner"),
	UIAspectRatioConstraint_25 = Instance.new("UIAspectRatioConstraint"),
	Switch1_3 = Instance.new("Frame"),
	UICorner_23 = Instance.new("UICorner"),
	UIAspectRatioConstraint_26 = Instance.new("UIAspectRatioConstraint"),
	TextLabel_10 = Instance.new("TextLabel"),
	UIGradient_21 = Instance.new("UIGradient"),
	UIGradient_22 = Instance.new("UIGradient"),
	UIGradient_23 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_27 = Instance.new("UIAspectRatioConstraint"),
	Divider = Instance.new("Frame"),
	UIAspectRatioConstraint_28 = Instance.new("UIAspectRatioConstraint"),
	QuickTP = Instance.new("Frame"),
	UICorner_24 = Instance.new("UICorner"),
	Switch_4 = Instance.new("Frame"),
	UICorner_25 = Instance.new("UICorner"),
	UIAspectRatioConstraint_29 = Instance.new("UIAspectRatioConstraint"),
	Switch1_4 = Instance.new("Frame"),
	UICorner_26 = Instance.new("UICorner"),
	UIAspectRatioConstraint_30 = Instance.new("UIAspectRatioConstraint"),
	TextLabel_11 = Instance.new("TextLabel"),
	UIGradient_24 = Instance.new("UIGradient"),
	UIGradient_25 = Instance.new("UIGradient"),
	UIGradient_26 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_31 = Instance.new("UIAspectRatioConstraint"),
	QuickTPKeybind = Instance.new("Frame"),
	UICorner_27 = Instance.new("UICorner"),
	TextLabel_12 = Instance.new("TextLabel"),
	UIGradient_27 = Instance.new("UIGradient"),
	UIGradient_28 = Instance.new("UIGradient"),
	UIGradient_29 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_32 = Instance.new("UIAspectRatioConstraint"),
	TextButton_3 = Instance.new("TextButton"),
	UICorner_28 = Instance.new("UICorner"),
	Putinkey = Instance.new("TextLabel"),
	UIGradient_30 = Instance.new("UIGradient"),
	UIGradient_31 = Instance.new("UIGradient"),
	UIGradient_32 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_33 = Instance.new("UIAspectRatioConstraint"),
	Walkspeed = Instance.new("Frame"),
	UICorner_29 = Instance.new("UICorner"),
	TextButton_4 = Instance.new("TextButton"),
	UIGradient_33 = Instance.new("UIGradient"),
	UIGradient_34 = Instance.new("UIGradient"),
	UIGradient_35 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_34 = Instance.new("UIAspectRatioConstraint"),
	Slider_3 = Instance.new("Frame"),
	UICorner_30 = Instance.new("UICorner"),
	Amount_3 = Instance.new("TextLabel"),
	SliderThing_3 = Instance.new("Frame"),
	UICorner_31 = Instance.new("UICorner"),
	UIGradient_36 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_35 = Instance.new("UIAspectRatioConstraint"),
	TextLabel_13 = Instance.new("TextLabel"),
	UIGradient_37 = Instance.new("UIGradient"),
	UIGradient_38 = Instance.new("UIGradient"),
	UIGradient_39 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_36 = Instance.new("UIAspectRatioConstraint"),
	VisualsTab_2 = Instance.new("Frame"),
	UICorner_32 = Instance.new("UICorner"),
	UIAspectRatioConstraint_37 = Instance.new("UIAspectRatioConstraint"),
	Background_2 = Instance.new("Frame"),
	UICorner_33 = Instance.new("UICorner"),
	Switch_5 = Instance.new("Frame"),
	UICorner_34 = Instance.new("UICorner"),
	UIAspectRatioConstraint_38 = Instance.new("UIAspectRatioConstraint"),
	Switch1_5 = Instance.new("Frame"),
	UICorner_35 = Instance.new("UICorner"),
	TextLabel_14 = Instance.new("TextLabel"),
	UIGradient_40 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_39 = Instance.new("UIAspectRatioConstraint"),
	AutomaticsTab_2 = Instance.new("Frame"),
	UICorner_36 = Instance.new("UICorner"),
	Background_3 = Instance.new("Frame"),
	UICorner_37 = Instance.new("UICorner"),
	Switch_6 = Instance.new("Frame"),
	UICorner_38 = Instance.new("UICorner"),
	UIAspectRatioConstraint_40 = Instance.new("UIAspectRatioConstraint"),
	Switch1_6 = Instance.new("Frame"),
	UICorner_39 = Instance.new("UICorner"),
	TextLabel_15 = Instance.new("TextLabel"),
	UIGradient_41 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_41 = Instance.new("UIAspectRatioConstraint"),
	UIAspectRatioConstraint_42 = Instance.new("UIAspectRatioConstraint"),
	Slider1Background_3 = Instance.new("Frame"),
	UICorner_40 = Instance.new("UICorner"),
	Slider_4 = Instance.new("Frame"),
	UICorner_41 = Instance.new("UICorner"),
	Amount_4 = Instance.new("TextLabel"),
	SliderThing_4 = Instance.new("Frame"),
	UICorner_42 = Instance.new("UICorner"),
	UIGradient_42 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_43 = Instance.new("UIAspectRatioConstraint"),
	TextButton_5 = Instance.new("TextButton"),
	UIGradient_43 = Instance.new("UIGradient"),
	UIAspectRatioConstraint_44 = Instance.new("UIAspectRatioConstraint"),
}

--Properties:

ScreenGui.ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ScreenGui.ResetOnSpawn = false

ScreenGui.Welcome.Name = "Welcome"
ScreenGui.Welcome.Parent = ScreenGui.ScreenGui
ScreenGui.Welcome.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
ScreenGui.Welcome.BackgroundTransparency = 1.000
ScreenGui.Welcome.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Welcome.BorderSizePixel = 0
ScreenGui.Welcome.Position = UDim2.new(0.228072792, 0, 0.431837827, 0)
ScreenGui.Welcome.Size = UDim2.new(0.542345762, 0, 0.133126125, 0)
ScreenGui.Welcome.ZIndex = 784121829
ScreenGui.Welcome.Font = Enum.Font.FredokaOne
ScreenGui.Welcome.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.Welcome.TextScaled = true
ScreenGui.Welcome.TextSize = 14.000
ScreenGui.Welcome.TextTransparency = 1.000
ScreenGui.Welcome.TextWrapped = true

ScreenGui.UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient.Parent = ScreenGui.Welcome

ScreenGui.UI.Name = "UI"
ScreenGui.UI.Parent = ScreenGui.ScreenGui
ScreenGui.UI.AnchorPoint = Vector2.new(0.5, 0)
ScreenGui.UI.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.UI.BackgroundTransparency = 1.000
ScreenGui.UI.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.UI.BorderSizePixel = 0
ScreenGui.UI.Position = UDim2.new(0.520841718, 0, 0.266503662, 0)
ScreenGui.UI.Size = UDim2.new(0.480953246, 0, 0.519834936, 0)

ScreenGui.CatchingTab.Name = "CatchingTab"
ScreenGui.CatchingTab.Parent = ScreenGui.UI
ScreenGui.CatchingTab.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
ScreenGui.CatchingTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.CatchingTab.BorderSizePixel = 0
ScreenGui.CatchingTab.Position = UDim2.new(-4.484097e-08, 0, 7.02470544e-08, 0)
ScreenGui.CatchingTab.Size = UDim2.new(0.999999702, 0, 1.00000012, 0)
ScreenGui.CatchingTab.ZIndex = 19

ScreenGui.UICorner.CornerRadius = UDim.new(0, 12)
ScreenGui.UICorner.Parent = ScreenGui.CatchingTab

ScreenGui.Background.Name = "Background"
ScreenGui.Background.Parent = ScreenGui.CatchingTab
ScreenGui.Background.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Background.BorderSizePixel = 0
ScreenGui.Background.Position = UDim2.new(0.3386226, 0, 0.167370707, 0)
ScreenGui.Background.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
ScreenGui.Background.ZIndex = 2

ScreenGui.UICorner_2.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_2.Parent = ScreenGui.Background

ScreenGui.Switch.Name = "Switch"
ScreenGui.Switch.Parent = ScreenGui.Background
ScreenGui.Switch.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
ScreenGui.Switch.BackgroundTransparency = 0.800
ScreenGui.Switch.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Switch.BorderSizePixel = 0
ScreenGui.Switch.Position = UDim2.new(0.798893094, 0, 0.237907037, 0)
ScreenGui.Switch.Size = UDim2.new(0.160436109, 0, 0.558846653, 0)
ScreenGui.Switch.ZIndex = 2

ScreenGui.UICorner_3.CornerRadius = UDim.new(20, 0)
ScreenGui.UICorner_3.Parent = ScreenGui.Switch

ScreenGui.UIAspectRatioConstraint.Parent = ScreenGui.Switch
ScreenGui.UIAspectRatioConstraint.AspectRatio = 2.695

ScreenGui.Switch1.Name = "Switch1"
ScreenGui.Switch1.Parent = ScreenGui.Background
ScreenGui.Switch1.BackgroundColor3 = Color3.fromRGB(120, 52, 255)
ScreenGui.Switch1.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Switch1.BorderSizePixel = 0
ScreenGui.Switch1.Position = UDim2.new(0.798893154, 0, 0.228659093, 0)
ScreenGui.Switch1.Size = UDim2.new(0.0623449758, 0, 0.515391111, 0)
ScreenGui.Switch1.ZIndex = 3

ScreenGui.UICorner_4.CornerRadius = UDim.new(20, 0)
ScreenGui.UICorner_4.Parent = ScreenGui.Switch1

ScreenGui.TextLabel.Parent = ScreenGui.Background
ScreenGui.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel.BackgroundTransparency = 1.000
ScreenGui.TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel.BorderSizePixel = 0
ScreenGui.TextLabel.Position = UDim2.new(-0.102759957, 0, 0.190000206, 0)
ScreenGui.TextLabel.Size = UDim2.new(0.501999974, 0, 0.598999977, 0)
ScreenGui.TextLabel.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel.Text = "Magnets"
ScreenGui.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel.TextScaled = true
ScreenGui.TextLabel.TextSize = 14.000
ScreenGui.TextLabel.TextWrapped = true

ScreenGui.UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_2.Parent = ScreenGui.TextLabel

ScreenGui.UIAspectRatioConstraint_2.Parent = ScreenGui.TextLabel
ScreenGui.UIAspectRatioConstraint_2.AspectRatio = 7.126

ScreenGui.UIAspectRatioConstraint_3.Parent = ScreenGui.CatchingTab
ScreenGui.UIAspectRatioConstraint_3.AspectRatio = 1.567

ScreenGui.Slider1Background.Name = "Slider1Background"
ScreenGui.Slider1Background.Parent = ScreenGui.CatchingTab
ScreenGui.Slider1Background.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.Slider1Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Slider1Background.BorderSizePixel = 0
ScreenGui.Slider1Background.Position = UDim2.new(0.3386226, 0, 0.289369017, 0)
ScreenGui.Slider1Background.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
ScreenGui.Slider1Background.ZIndex = 2

ScreenGui.UICorner_5.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_5.Parent = ScreenGui.Slider1Background

ScreenGui.Slider.Name = "Slider"
ScreenGui.Slider.Parent = ScreenGui.Slider1Background
ScreenGui.Slider.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
ScreenGui.Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Slider.BorderSizePixel = 0
ScreenGui.Slider.Position = UDim2.new(0.381311357, 0, 0.348829865, 0)
ScreenGui.Slider.Size = UDim2.new(0.526183188, 0, 0.266752243, 0)

ScreenGui.UICorner_6.CornerRadius = UDim.new(10, 0)
ScreenGui.UICorner_6.Parent = ScreenGui.Slider

ScreenGui.Amount.Name = "Amount"
ScreenGui.Amount.Parent = ScreenGui.Slider
ScreenGui.Amount.BackgroundColor3 = Color3.fromRGB(127, 0, 255)
ScreenGui.Amount.BackgroundTransparency = 1.000
ScreenGui.Amount.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Amount.BorderSizePixel = 0
ScreenGui.Amount.Position = UDim2.new(1.03362942, 0, -0.3846156, 0)
ScreenGui.Amount.Size = UDim2.new(0.0987537429, 0, 1.69230783, 0)
ScreenGui.Amount.Font = Enum.Font.FredokaOne
ScreenGui.Amount.Text = "1"
ScreenGui.Amount.TextColor3 = Color3.fromRGB(127, 0, 255)
ScreenGui.Amount.TextScaled = true
ScreenGui.Amount.TextSize = 14.000
ScreenGui.Amount.TextWrapped = true

ScreenGui.SliderThing.Name = "SliderThing"
ScreenGui.SliderThing.Parent = ScreenGui.Slider1Background
ScreenGui.SliderThing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.SliderThing.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.SliderThing.BorderSizePixel = 0
ScreenGui.SliderThing.Position = UDim2.new(0.381311357, 0, 0.348829865, 0)
ScreenGui.SliderThing.Size = UDim2.new(0.0337870941, 0, 0.266752243, 0)

ScreenGui.UICorner_7.CornerRadius = UDim.new(10, 0)
ScreenGui.UICorner_7.Parent = ScreenGui.SliderThing

ScreenGui.UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_3.Parent = ScreenGui.SliderThing

ScreenGui.UIAspectRatioConstraint_4.Parent = ScreenGui.SliderThing
ScreenGui.UIAspectRatioConstraint_4.AspectRatio = 1.077

ScreenGui.TextButton.Parent = ScreenGui.Slider1Background
ScreenGui.TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextButton.BackgroundTransparency = 1.000
ScreenGui.TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextButton.BorderSizePixel = 0
ScreenGui.TextButton.Position = UDim2.new(0.0153534925, 0, 0.186521262, 0)
ScreenGui.TextButton.Size = UDim2.new(0.320536941, 0, 0.773980498, 0)
ScreenGui.TextButton.Font = Enum.Font.FredokaOne
ScreenGui.TextButton.Text = "Mags Range"
ScreenGui.TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextButton.TextScaled = true
ScreenGui.TextButton.TextSize = 14.000
ScreenGui.TextButton.TextWrapped = true
ScreenGui.TextButton.TextXAlignment = Enum.TextXAlignment.Left

ScreenGui.UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_4.Parent = ScreenGui.TextButton

ScreenGui.UIAspectRatioConstraint_5.Parent = ScreenGui.TextButton
ScreenGui.UIAspectRatioConstraint_5.AspectRatio = 4.428

ScreenGui.Tabs.Name = "Tabs"
ScreenGui.Tabs.Parent = ScreenGui.UI
ScreenGui.Tabs.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
ScreenGui.Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Tabs.BorderSizePixel = 0
ScreenGui.Tabs.Position = UDim2.new(0.0230841599, 0, 0.146699294, 0)
ScreenGui.Tabs.Size = UDim2.new(0.273622662, 0, 0.814180732, 0)
ScreenGui.Tabs.ZIndex = 1398047

ScreenGui.UICorner_8.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_8.Parent = ScreenGui.Tabs

ScreenGui.CatchingTab_2.Name = "CatchingTab"
ScreenGui.CatchingTab_2.Parent = ScreenGui.Tabs
ScreenGui.CatchingTab_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.CatchingTab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.CatchingTab_2.BorderSizePixel = 0
ScreenGui.CatchingTab_2.Position = UDim2.new(0.0404332392, 0, 0.0189995263, 0)
ScreenGui.CatchingTab_2.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
ScreenGui.CatchingTab_2.ZIndex = 0

ScreenGui.UICorner_9.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_9.Parent = ScreenGui.CatchingTab_2

ScreenGui.TextLabel_2.Parent = ScreenGui.CatchingTab_2
ScreenGui.TextLabel_2.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
ScreenGui.TextLabel_2.BackgroundTransparency = 1.000
ScreenGui.TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel_2.BorderSizePixel = 0
ScreenGui.TextLabel_2.Position = UDim2.new(0, 0, 0.0516880676, 0)
ScreenGui.TextLabel_2.Size = UDim2.new(0.999999762, 0, 0.849056304, 0)
ScreenGui.TextLabel_2.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel_2.Text = "Catching"
ScreenGui.TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_2.TextScaled = true
ScreenGui.TextLabel_2.TextSize = 14.000
ScreenGui.TextLabel_2.TextWrapped = true

ScreenGui.UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_5.Parent = ScreenGui.TextLabel_2

ScreenGui.f.Name = "f"
ScreenGui.f.Parent = ScreenGui.TextLabel_2
ScreenGui.f.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.f.BackgroundTransparency = 0.999
ScreenGui.f.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.f.BorderSizePixel = 0
ScreenGui.f.Size = UDim2.new(1, 0, 1, 0)
ScreenGui.f.Font = Enum.Font.FredokaOne
ScreenGui.f.Text = "Catching"
ScreenGui.f.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.f.TextScaled = true
ScreenGui.f.TextSize = 14.000
ScreenGui.f.TextTransparency = 1.000
ScreenGui.f.TextWrapped = true

ScreenGui.UIAspectRatioConstraint_6.Parent = ScreenGui.CatchingTab_2
ScreenGui.UIAspectRatioConstraint_6.AspectRatio = 3.897

ScreenGui.PlayerTab.Name = "PlayerTab"
ScreenGui.PlayerTab.Parent = ScreenGui.Tabs
ScreenGui.PlayerTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.PlayerTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.PlayerTab.BorderSizePixel = 0
ScreenGui.PlayerTab.Position = UDim2.new(0.0404333025, 0, 0.163171247, 0)
ScreenGui.PlayerTab.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
ScreenGui.PlayerTab.ZIndex = 0

ScreenGui.UICorner_10.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_10.Parent = ScreenGui.PlayerTab

ScreenGui.TextLabel_3.Parent = ScreenGui.PlayerTab
ScreenGui.TextLabel_3.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
ScreenGui.TextLabel_3.BackgroundTransparency = 1.000
ScreenGui.TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel_3.BorderSizePixel = 0
ScreenGui.TextLabel_3.Position = UDim2.new(0, 0, 0.0516880676, 0)
ScreenGui.TextLabel_3.Size = UDim2.new(0.999999762, 0, 0.849056304, 0)
ScreenGui.TextLabel_3.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel_3.Text = "Player"
ScreenGui.TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_3.TextScaled = true
ScreenGui.TextLabel_3.TextSize = 14.000
ScreenGui.TextLabel_3.TextWrapped = true

ScreenGui.UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_6.Parent = ScreenGui.TextLabel_3

ScreenGui.f_2.Name = "f"
ScreenGui.f_2.Parent = ScreenGui.TextLabel_3
ScreenGui.f_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.f_2.BackgroundTransparency = 0.999
ScreenGui.f_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.f_2.BorderSizePixel = 0
ScreenGui.f_2.Size = UDim2.new(1, 0, 1, 0)
ScreenGui.f_2.Font = Enum.Font.FredokaOne
ScreenGui.f_2.Text = "Catching"
ScreenGui.f_2.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.f_2.TextScaled = true
ScreenGui.f_2.TextSize = 14.000
ScreenGui.f_2.TextTransparency = 1.000
ScreenGui.f_2.TextWrapped = true

ScreenGui.UIAspectRatioConstraint_7.Parent = ScreenGui.PlayerTab
ScreenGui.UIAspectRatioConstraint_7.AspectRatio = 3.897

ScreenGui.AutomaticsTab.Name = "AutomaticsTab"
ScreenGui.AutomaticsTab.Parent = ScreenGui.Tabs
ScreenGui.AutomaticsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.AutomaticsTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.AutomaticsTab.BorderSizePixel = 0
ScreenGui.AutomaticsTab.Position = UDim2.new(0.0404333025, 0, 0.307342976, 0)
ScreenGui.AutomaticsTab.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
ScreenGui.AutomaticsTab.ZIndex = 0

ScreenGui.UICorner_11.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_11.Parent = ScreenGui.AutomaticsTab

ScreenGui.TextLabel_4.Parent = ScreenGui.AutomaticsTab
ScreenGui.TextLabel_4.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
ScreenGui.TextLabel_4.BackgroundTransparency = 1.000
ScreenGui.TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel_4.BorderSizePixel = 0
ScreenGui.TextLabel_4.Position = UDim2.new(0, 0, 0.0516880676, 0)
ScreenGui.TextLabel_4.Size = UDim2.new(0.999999702, 0, 0.849056244, 0)
ScreenGui.TextLabel_4.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel_4.Text = "Autos"
ScreenGui.TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_4.TextScaled = true
ScreenGui.TextLabel_4.TextSize = 14.000
ScreenGui.TextLabel_4.TextWrapped = true

ScreenGui.UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_7.Parent = ScreenGui.TextLabel_4

ScreenGui.UIAspectRatioConstraint_8.Parent = ScreenGui.TextLabel_4
ScreenGui.UIAspectRatioConstraint_8.AspectRatio = 4.590

ScreenGui.f_3.Name = "f"
ScreenGui.f_3.Parent = ScreenGui.TextLabel_4
ScreenGui.f_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.f_3.BackgroundTransparency = 0.999
ScreenGui.f_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.f_3.BorderSizePixel = 0
ScreenGui.f_3.Size = UDim2.new(1, 0, 1, 0)
ScreenGui.f_3.Font = Enum.Font.FredokaOne
ScreenGui.f_3.Text = "Catching"
ScreenGui.f_3.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.f_3.TextScaled = true
ScreenGui.f_3.TextSize = 14.000
ScreenGui.f_3.TextTransparency = 1.000
ScreenGui.f_3.TextWrapped = true

ScreenGui.UIAspectRatioConstraint_9.Parent = ScreenGui.AutomaticsTab
ScreenGui.UIAspectRatioConstraint_9.AspectRatio = 3.897

ScreenGui.TextLabel_5.Parent = ScreenGui.Tabs
ScreenGui.TextLabel_5.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
ScreenGui.TextLabel_5.BackgroundTransparency = 1.000
ScreenGui.TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel_5.BorderSizePixel = 0
ScreenGui.TextLabel_5.Position = UDim2.new(0.0234109145, 0, 0.864349425, 0)
ScreenGui.TextLabel_5.Size = UDim2.new(0.944368541, 0, 0.135602579, 0)
ScreenGui.TextLabel_5.ZIndex = 784121829
ScreenGui.TextLabel_5.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_5.TextScaled = true
ScreenGui.TextLabel_5.TextSize = 14.000
ScreenGui.TextLabel_5.TextWrapped = true

ScreenGui.UIGradient_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_8.Parent = ScreenGui.TextLabel_5

ScreenGui.UIAspectRatioConstraint_10.Parent = ScreenGui.TextLabel_5
ScreenGui.UIAspectRatioConstraint_10.AspectRatio = 3.667

ScreenGui.UIAspectRatioConstraint_11.Parent = ScreenGui.Tabs
ScreenGui.UIAspectRatioConstraint_11.AspectRatio = 0.526

ScreenGui.VisualsTab.Name = "VisualsTab"
ScreenGui.VisualsTab.Parent = ScreenGui.Tabs
ScreenGui.VisualsTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.VisualsTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.VisualsTab.BorderSizePixel = 0
ScreenGui.VisualsTab.Position = UDim2.new(0.040433161, 0, 0.455816448, 0)
ScreenGui.VisualsTab.Size = UDim2.new(0.91500473, 0, 0.12362013, 0)
ScreenGui.VisualsTab.ZIndex = 0

ScreenGui.UICorner_12.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_12.Parent = ScreenGui.VisualsTab

ScreenGui.TextLabel_6.Parent = ScreenGui.VisualsTab
ScreenGui.TextLabel_6.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
ScreenGui.TextLabel_6.BackgroundTransparency = 1.000
ScreenGui.TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel_6.BorderSizePixel = 0
ScreenGui.TextLabel_6.Position = UDim2.new(0, 0, 0.0516880676, 0)
ScreenGui.TextLabel_6.Size = UDim2.new(0.999999702, 0, 0.849056244, 0)
ScreenGui.TextLabel_6.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel_6.Text = "Visuals"
ScreenGui.TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_6.TextScaled = true
ScreenGui.TextLabel_6.TextSize = 14.000
ScreenGui.TextLabel_6.TextWrapped = true

ScreenGui.UIGradient_9.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_9.Parent = ScreenGui.TextLabel_6

ScreenGui.UIAspectRatioConstraint_12.Parent = ScreenGui.TextLabel_6
ScreenGui.UIAspectRatioConstraint_12.AspectRatio = 4.590

ScreenGui.f_4.Name = "f"
ScreenGui.f_4.Parent = ScreenGui.TextLabel_6
ScreenGui.f_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.f_4.BackgroundTransparency = 0.999
ScreenGui.f_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.f_4.BorderSizePixel = 0
ScreenGui.f_4.Size = UDim2.new(1, 0, 1, 0)
ScreenGui.f_4.Font = Enum.Font.FredokaOne
ScreenGui.f_4.Text = "Catching"
ScreenGui.f_4.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.f_4.TextScaled = true
ScreenGui.f_4.TextSize = 14.000
ScreenGui.f_4.TextTransparency = 1.000
ScreenGui.f_4.TextWrapped = true

ScreenGui.UIAspectRatioConstraint_13.Parent = ScreenGui.VisualsTab
ScreenGui.UIAspectRatioConstraint_13.AspectRatio = 3.897

ScreenGui.Top.Name = "Top"
ScreenGui.Top.Parent = ScreenGui.UI
ScreenGui.Top.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
ScreenGui.Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Top.BorderSizePixel = 0
ScreenGui.Top.Position = UDim2.new(2.24204854e-07, 0, 3.51235258e-07, 0)
ScreenGui.Top.Size = UDim2.new(0.999999702, 0, 0.128740042, 0)
ScreenGui.Top.ZIndex = 1398047

ScreenGui.UICorner_13.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_13.Parent = ScreenGui.Top

ScreenGui.TextLabel_7.Parent = ScreenGui.Top
ScreenGui.TextLabel_7.BackgroundColor3 = Color3.fromRGB(43, 177, 255)
ScreenGui.TextLabel_7.BackgroundTransparency = 1.000
ScreenGui.TextLabel_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel_7.BorderSizePixel = 0
ScreenGui.TextLabel_7.Position = UDim2.new(-1.34522949e-07, 0, 0.115182973, 0)
ScreenGui.TextLabel_7.Size = UDim2.new(0.246454805, 0, 1.10871196, 0)
ScreenGui.TextLabel_7.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel_7.Text = "Lunor"
ScreenGui.TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_7.TextScaled = true
ScreenGui.TextLabel_7.TextSize = 14.000
ScreenGui.TextLabel_7.TextWrapped = true

ScreenGui.UIGradient_10.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_10.Parent = ScreenGui.TextLabel_7

ScreenGui.UIAspectRatioConstraint_14.Parent = ScreenGui.TextLabel_7
ScreenGui.UIAspectRatioConstraint_14.AspectRatio = 4.040

ScreenGui.UIAspectRatioConstraint_15.Parent = ScreenGui.Top
ScreenGui.UIAspectRatioConstraint_15.AspectRatio = 12.169

ScreenGui.Label.Name = "Label"
ScreenGui.Label.Parent = ScreenGui.Top
ScreenGui.Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.Label.BackgroundTransparency = 1.000
ScreenGui.Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Label.BorderSizePixel = 0
ScreenGui.Label.Position = UDim2.new(0.921281993, 0, 0.0518035479, 0)
ScreenGui.Label.Size = UDim2.new(0.0787179098, 0, 0.874838829, 0)
ScreenGui.Label.Image = "rbxassetid://94594775251689"

ScreenGui.UIAspectRatioConstraint_16.Parent = ScreenGui.Label
ScreenGui.UIAspectRatioConstraint_16.AspectRatio = 1.095

ScreenGui.UIAspectRatioConstraint_17.Parent = ScreenGui.UI
ScreenGui.UIAspectRatioConstraint_17.AspectRatio = 1.567

ScreenGui.PlayerTab_2.Name = "PlayerTab"
ScreenGui.PlayerTab_2.Parent = ScreenGui.UI
ScreenGui.PlayerTab_2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
ScreenGui.PlayerTab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.PlayerTab_2.BorderSizePixel = 0
ScreenGui.PlayerTab_2.Position = UDim2.new(-4.484097e-08, 0, 7.02470544e-08, 0)
ScreenGui.PlayerTab_2.Size = UDim2.new(0.999999702, 0, 1.00000012, 0)
ScreenGui.PlayerTab_2.ZIndex = 19

ScreenGui.UICorner_14.CornerRadius = UDim.new(0, 12)
ScreenGui.UICorner_14.Parent = ScreenGui.PlayerTab_2

ScreenGui.UIAspectRatioConstraint_18.Parent = ScreenGui.PlayerTab_2
ScreenGui.UIAspectRatioConstraint_18.AspectRatio = 1.567

ScreenGui.JpAeBackground.Name = "JpAeBackground"
ScreenGui.JpAeBackground.Parent = ScreenGui.PlayerTab_2
ScreenGui.JpAeBackground.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.JpAeBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.JpAeBackground.BorderSizePixel = 0
ScreenGui.JpAeBackground.Position = UDim2.new(0.3386226, 0, 0.156037912, 0)
ScreenGui.JpAeBackground.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
ScreenGui.JpAeBackground.ZIndex = 2

ScreenGui.UICorner_15.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_15.Parent = ScreenGui.JpAeBackground

ScreenGui.Switch_2.Name = "Switch"
ScreenGui.Switch_2.Parent = ScreenGui.JpAeBackground
ScreenGui.Switch_2.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
ScreenGui.Switch_2.BackgroundTransparency = 0.800
ScreenGui.Switch_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Switch_2.BorderSizePixel = 0
ScreenGui.Switch_2.Position = UDim2.new(0.798893094, 0, 0.237907037, 0)
ScreenGui.Switch_2.Size = UDim2.new(0.160436109, 0, 0.558846653, 0)
ScreenGui.Switch_2.ZIndex = 2

ScreenGui.UICorner_16.CornerRadius = UDim.new(20, 0)
ScreenGui.UICorner_16.Parent = ScreenGui.Switch_2

ScreenGui.UIAspectRatioConstraint_19.Parent = ScreenGui.Switch_2
ScreenGui.UIAspectRatioConstraint_19.AspectRatio = 2.695

ScreenGui.Switch1_2.Name = "Switch1"
ScreenGui.Switch1_2.Parent = ScreenGui.JpAeBackground
ScreenGui.Switch1_2.BackgroundColor3 = Color3.fromRGB(120, 52, 255)
ScreenGui.Switch1_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Switch1_2.BorderSizePixel = 0
ScreenGui.Switch1_2.Position = UDim2.new(0.798893154, 0, 0.228659093, 0)
ScreenGui.Switch1_2.Size = UDim2.new(0.0623448342, 0, 0.515391111, 0)
ScreenGui.Switch1_2.ZIndex = 3

ScreenGui.UICorner_17.CornerRadius = UDim.new(20, 0)
ScreenGui.UICorner_17.Parent = ScreenGui.Switch1_2

ScreenGui.UIAspectRatioConstraint_20.Parent = ScreenGui.Switch1_2
ScreenGui.UIAspectRatioConstraint_20.AspectRatio = 1.029

ScreenGui.TextLabel_8.Parent = ScreenGui.JpAeBackground
ScreenGui.TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_8.BackgroundTransparency = 1.000
ScreenGui.TextLabel_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel_8.BorderSizePixel = 0
ScreenGui.TextLabel_8.Position = UDim2.new(-0.00176383986, 0, 0.189999953, 0)
ScreenGui.TextLabel_8.Size = UDim2.new(0.501999974, 0, 0.598999977, 0)
ScreenGui.TextLabel_8.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel_8.Text = "Angle enhancer"
ScreenGui.TextLabel_8.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_8.TextScaled = true
ScreenGui.TextLabel_8.TextSize = 14.000
ScreenGui.TextLabel_8.TextWrapped = true

ScreenGui.UIGradient_11.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_11.Parent = ScreenGui.TextLabel_8

ScreenGui.UIGradient_12.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_12.Parent = ScreenGui.TextLabel_8

ScreenGui.UIGradient_13.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_13.Parent = ScreenGui.TextLabel_8

ScreenGui.UIAspectRatioConstraint_21.Parent = ScreenGui.TextLabel_8
ScreenGui.UIAspectRatioConstraint_21.AspectRatio = 7.126

ScreenGui.Slider1Background_2.Name = "Slider1Background"
ScreenGui.Slider1Background_2.Parent = ScreenGui.PlayerTab_2
ScreenGui.Slider1Background_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.Slider1Background_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Slider1Background_2.BorderSizePixel = 0
ScreenGui.Slider1Background_2.Position = UDim2.new(0.337416887, 0, 0.278036118, 0)
ScreenGui.Slider1Background_2.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
ScreenGui.Slider1Background_2.ZIndex = 2

ScreenGui.UICorner_18.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_18.Parent = ScreenGui.Slider1Background_2

ScreenGui.TextButton_2.Parent = ScreenGui.Slider1Background_2
ScreenGui.TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextButton_2.BackgroundTransparency = 1.000
ScreenGui.TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextButton_2.BorderSizePixel = 0
ScreenGui.TextButton_2.Position = UDim2.new(0.0153534925, 0, 0.186521262, 0)
ScreenGui.TextButton_2.Size = UDim2.new(0.320536941, 0, 0.773980498, 0)
ScreenGui.TextButton_2.Font = Enum.Font.FredokaOne
ScreenGui.TextButton_2.Text = ""
ScreenGui.TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextButton_2.TextScaled = true
ScreenGui.TextButton_2.TextSize = 14.000
ScreenGui.TextButton_2.TextWrapped = true
ScreenGui.TextButton_2.TextXAlignment = Enum.TextXAlignment.Left

ScreenGui.UIGradient_14.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_14.Parent = ScreenGui.TextButton_2

ScreenGui.UIGradient_15.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_15.Parent = ScreenGui.TextButton_2

ScreenGui.UIGradient_16.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_16.Parent = ScreenGui.TextButton_2

ScreenGui.UIAspectRatioConstraint_22.Parent = ScreenGui.TextButton_2
ScreenGui.UIAspectRatioConstraint_22.AspectRatio = 4.428

ScreenGui.Slider_2.Name = "Slider"
ScreenGui.Slider_2.Parent = ScreenGui.Slider1Background_2
ScreenGui.Slider_2.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
ScreenGui.Slider_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Slider_2.BorderSizePixel = 0
ScreenGui.Slider_2.Position = UDim2.new(0.381311357, 0, 0.348829865, 0)
ScreenGui.Slider_2.Size = UDim2.new(0.526183188, 0, 0.266752243, 0)

ScreenGui.UICorner_19.CornerRadius = UDim.new(10, 0)
ScreenGui.UICorner_19.Parent = ScreenGui.Slider_2

ScreenGui.Amount_2.Name = "Amount"
ScreenGui.Amount_2.Parent = ScreenGui.Slider_2
ScreenGui.Amount_2.BackgroundColor3 = Color3.fromRGB(127, 0, 255)
ScreenGui.Amount_2.BackgroundTransparency = 1.000
ScreenGui.Amount_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Amount_2.BorderSizePixel = 0
ScreenGui.Amount_2.Position = UDim2.new(1.03362942, 0, -0.3846156, 0)
ScreenGui.Amount_2.Size = UDim2.new(0.0987537429, 0, 1.69230783, 0)
ScreenGui.Amount_2.Font = Enum.Font.FredokaOne
ScreenGui.Amount_2.Text = "50"
ScreenGui.Amount_2.TextColor3 = Color3.fromRGB(127, 0, 255)
ScreenGui.Amount_2.TextScaled = true
ScreenGui.Amount_2.TextSize = 14.000
ScreenGui.Amount_2.TextWrapped = true

ScreenGui.SliderThing_2.Name = "SliderThing"
ScreenGui.SliderThing_2.Parent = ScreenGui.Slider1Background_2
ScreenGui.SliderThing_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.SliderThing_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.SliderThing_2.BorderSizePixel = 0
ScreenGui.SliderThing_2.Position = UDim2.new(0.381311357, 0, 0.348829865, 0)
ScreenGui.SliderThing_2.Size = UDim2.new(0.0337870941, 0, 0.266752243, 0)

ScreenGui.UICorner_20.CornerRadius = UDim.new(10, 0)
ScreenGui.UICorner_20.Parent = ScreenGui.SliderThing_2

ScreenGui.UIGradient_17.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_17.Parent = ScreenGui.SliderThing_2

ScreenGui.UIAspectRatioConstraint_23.Parent = ScreenGui.SliderThing_2
ScreenGui.UIAspectRatioConstraint_23.AspectRatio = 1.077

ScreenGui.TextLabel_9.Parent = ScreenGui.Slider1Background_2
ScreenGui.TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_9.BackgroundTransparency = 1.000
ScreenGui.TextLabel_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel_9.BorderSizePixel = 0
ScreenGui.TextLabel_9.Position = UDim2.new(-0.0433501154, 0, 0.240512311, 0)
ScreenGui.TextLabel_9.Size = UDim2.new(0.442484707, 0, 0.552336633, 0)
ScreenGui.TextLabel_9.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel_9.Text = "Angle height"
ScreenGui.TextLabel_9.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_9.TextScaled = true
ScreenGui.TextLabel_9.TextSize = 14.000
ScreenGui.TextLabel_9.TextWrapped = true

ScreenGui.UIGradient_18.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_18.Parent = ScreenGui.TextLabel_9

ScreenGui.UIGradient_19.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_19.Parent = ScreenGui.TextLabel_9

ScreenGui.UIGradient_20.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_20.Parent = ScreenGui.TextLabel_9

ScreenGui.UIAspectRatioConstraint_24.Parent = ScreenGui.TextLabel_9
ScreenGui.UIAspectRatioConstraint_24.AspectRatio = 7.126

ScreenGui.DynamicAeBackground.Name = "DynamicAeBackground"
ScreenGui.DynamicAeBackground.Parent = ScreenGui.PlayerTab_2
ScreenGui.DynamicAeBackground.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.DynamicAeBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.DynamicAeBackground.BorderSizePixel = 0
ScreenGui.DynamicAeBackground.Position = UDim2.new(0.337416977, 0, 0.442551225, 0)
ScreenGui.DynamicAeBackground.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
ScreenGui.DynamicAeBackground.ZIndex = 2

ScreenGui.UICorner_21.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_21.Parent = ScreenGui.DynamicAeBackground

ScreenGui.Switch_3.Name = "Switch"
ScreenGui.Switch_3.Parent = ScreenGui.DynamicAeBackground
ScreenGui.Switch_3.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
ScreenGui.Switch_3.BackgroundTransparency = 0.800
ScreenGui.Switch_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Switch_3.BorderSizePixel = 0
ScreenGui.Switch_3.Position = UDim2.new(0.798893094, 0, 0.237907037, 0)
ScreenGui.Switch_3.Size = UDim2.new(0.160436109, 0, 0.558846653, 0)
ScreenGui.Switch_3.ZIndex = 2

ScreenGui.UICorner_22.CornerRadius = UDim.new(20, 0)
ScreenGui.UICorner_22.Parent = ScreenGui.Switch_3

ScreenGui.UIAspectRatioConstraint_25.Parent = ScreenGui.Switch_3
ScreenGui.UIAspectRatioConstraint_25.AspectRatio = 2.695

ScreenGui.Switch1_3.Name = "Switch1"
ScreenGui.Switch1_3.Parent = ScreenGui.DynamicAeBackground
ScreenGui.Switch1_3.BackgroundColor3 = Color3.fromRGB(120, 52, 255)
ScreenGui.Switch1_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Switch1_3.BorderSizePixel = 0
ScreenGui.Switch1_3.Position = UDim2.new(0.798893154, 0, 0.228659093, 0)
ScreenGui.Switch1_3.Size = UDim2.new(0.0623448342, 0, 0.515391111, 0)
ScreenGui.Switch1_3.ZIndex = 3

ScreenGui.UICorner_23.CornerRadius = UDim.new(20, 0)
ScreenGui.UICorner_23.Parent = ScreenGui.Switch1_3

ScreenGui.UIAspectRatioConstraint_26.Parent = ScreenGui.Switch1_3
ScreenGui.UIAspectRatioConstraint_26.AspectRatio = 1.029

ScreenGui.TextLabel_10.Parent = ScreenGui.DynamicAeBackground
ScreenGui.TextLabel_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_10.BackgroundTransparency = 1.000
ScreenGui.TextLabel_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel_10.BorderSizePixel = 0
ScreenGui.TextLabel_10.Position = UDim2.new(0.0160588827, 0, 0.0889752209, 0)
ScreenGui.TextLabel_10.Size = UDim2.new(0.672795475, 0, 1.2213819, 0)
ScreenGui.TextLabel_10.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel_10.Text = "Angle enhancer (dynamic)"
ScreenGui.TextLabel_10.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_10.TextScaled = true
ScreenGui.TextLabel_10.TextSize = 14.000
ScreenGui.TextLabel_10.TextWrapped = true

ScreenGui.UIGradient_21.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_21.Parent = ScreenGui.TextLabel_10

ScreenGui.UIGradient_22.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_22.Parent = ScreenGui.TextLabel_10

ScreenGui.UIGradient_23.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_23.Parent = ScreenGui.TextLabel_10

ScreenGui.UIAspectRatioConstraint_27.Parent = ScreenGui.TextLabel_10
ScreenGui.UIAspectRatioConstraint_27.AspectRatio = 7.126

ScreenGui.Divider.Name = "Divider"
ScreenGui.Divider.Parent = ScreenGui.PlayerTab_2
ScreenGui.Divider.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
ScreenGui.Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Divider.BorderSizePixel = 0
ScreenGui.Divider.Position = UDim2.new(0.323155016, 0, 0.413085133, 0)
ScreenGui.Divider.Size = UDim2.new(0.64706099, 0, 0.00460370956, 0)

ScreenGui.UIAspectRatioConstraint_28.Parent = ScreenGui.Divider
ScreenGui.UIAspectRatioConstraint_28.AspectRatio = 224.000

ScreenGui.QuickTP.Name = "QuickTP"
ScreenGui.QuickTP.Parent = ScreenGui.PlayerTab_2
ScreenGui.QuickTP.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.QuickTP.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.QuickTP.BorderSizePixel = 0
ScreenGui.QuickTP.Position = UDim2.new(0.336754739, 0, 0.56834358, 0)
ScreenGui.QuickTP.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
ScreenGui.QuickTP.ZIndex = 2

ScreenGui.UICorner_24.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_24.Parent = ScreenGui.QuickTP

ScreenGui.Switch_4.Name = "Switch"
ScreenGui.Switch_4.Parent = ScreenGui.QuickTP
ScreenGui.Switch_4.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
ScreenGui.Switch_4.BackgroundTransparency = 0.800
ScreenGui.Switch_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Switch_4.BorderSizePixel = 0
ScreenGui.Switch_4.Position = UDim2.new(0.798893094, 0, 0.237907037, 0)
ScreenGui.Switch_4.Size = UDim2.new(0.160436109, 0, 0.558846653, 0)
ScreenGui.Switch_4.ZIndex = 2

ScreenGui.UICorner_25.CornerRadius = UDim.new(20, 0)
ScreenGui.UICorner_25.Parent = ScreenGui.Switch_4

ScreenGui.UIAspectRatioConstraint_29.Parent = ScreenGui.Switch_4
ScreenGui.UIAspectRatioConstraint_29.AspectRatio = 2.695

ScreenGui.Switch1_4.Name = "Switch1"
ScreenGui.Switch1_4.Parent = ScreenGui.QuickTP
ScreenGui.Switch1_4.BackgroundColor3 = Color3.fromRGB(120, 52, 255)
ScreenGui.Switch1_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Switch1_4.BorderSizePixel = 0
ScreenGui.Switch1_4.Position = UDim2.new(0.798893154, 0, 0.228659093, 0)
ScreenGui.Switch1_4.Size = UDim2.new(0.0623448342, 0, 0.515391111, 0)
ScreenGui.Switch1_4.ZIndex = 3

ScreenGui.UICorner_26.CornerRadius = UDim.new(20, 0)
ScreenGui.UICorner_26.Parent = ScreenGui.Switch1_4

ScreenGui.UIAspectRatioConstraint_30.Parent = ScreenGui.Switch1_4
ScreenGui.UIAspectRatioConstraint_30.AspectRatio = 1.029

ScreenGui.TextLabel_11.Parent = ScreenGui.QuickTP
ScreenGui.TextLabel_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_11.BackgroundTransparency = 1.000
ScreenGui.TextLabel_11.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel_11.BorderSizePixel = 0
ScreenGui.TextLabel_11.Position = UDim2.new(-0.103007227, 0, 0.189999655, 0)
ScreenGui.TextLabel_11.Size = UDim2.new(0.501999974, 0, 0.598999977, 0)
ScreenGui.TextLabel_11.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel_11.Text = "Quick Tp"
ScreenGui.TextLabel_11.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_11.TextScaled = true
ScreenGui.TextLabel_11.TextSize = 14.000
ScreenGui.TextLabel_11.TextWrapped = true

ScreenGui.UIGradient_24.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_24.Parent = ScreenGui.TextLabel_11

ScreenGui.UIGradient_25.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_25.Parent = ScreenGui.TextLabel_11

ScreenGui.UIGradient_26.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_26.Parent = ScreenGui.TextLabel_11

ScreenGui.UIAspectRatioConstraint_31.Parent = ScreenGui.TextLabel_11
ScreenGui.UIAspectRatioConstraint_31.AspectRatio = 7.126

ScreenGui.QuickTPKeybind.Name = "QuickTPKeybind"
ScreenGui.QuickTPKeybind.Parent = ScreenGui.PlayerTab_2
ScreenGui.QuickTPKeybind.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.QuickTPKeybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.QuickTPKeybind.BorderSizePixel = 0
ScreenGui.QuickTPKeybind.Position = UDim2.new(0.336754739, 0, 0.695767164, 0)
ScreenGui.QuickTPKeybind.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
ScreenGui.QuickTPKeybind.ZIndex = 2

ScreenGui.UICorner_27.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_27.Parent = ScreenGui.QuickTPKeybind

ScreenGui.TextLabel_12.Parent = ScreenGui.QuickTPKeybind
ScreenGui.TextLabel_12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_12.BackgroundTransparency = 1.000
ScreenGui.TextLabel_12.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel_12.BorderSizePixel = 0
ScreenGui.TextLabel_12.Position = UDim2.new(-0.0232394971, 0, 0.189999655, 0)
ScreenGui.TextLabel_12.Size = UDim2.new(0.501999974, 0, 0.598999977, 0)
ScreenGui.TextLabel_12.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel_12.Text = "Quick Tp Bind:"
ScreenGui.TextLabel_12.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_12.TextScaled = true
ScreenGui.TextLabel_12.TextSize = 14.000
ScreenGui.TextLabel_12.TextWrapped = true

ScreenGui.UIGradient_27.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_27.Parent = ScreenGui.TextLabel_12

ScreenGui.UIGradient_28.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_28.Parent = ScreenGui.TextLabel_12

ScreenGui.UIGradient_29.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_29.Parent = ScreenGui.TextLabel_12

ScreenGui.UIAspectRatioConstraint_32.Parent = ScreenGui.TextLabel_12
ScreenGui.UIAspectRatioConstraint_32.AspectRatio = 7.126

ScreenGui.TextButton_3.Parent = ScreenGui.QuickTPKeybind
ScreenGui.TextButton_3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextButton_3.BorderSizePixel = 0
ScreenGui.TextButton_3.Position = UDim2.new(0.886393547, 0, 0.0789476708, 0)
ScreenGui.TextButton_3.Size = UDim2.new(0.0923932269, 0, 0.769655704, 0)
ScreenGui.TextButton_3.Font = Enum.Font.FredokaOne
ScreenGui.TextButton_3.Text = "F"
ScreenGui.TextButton_3.TextColor3 = Color3.fromRGB(99, 0, 255)
ScreenGui.TextButton_3.TextScaled = true
ScreenGui.TextButton_3.TextSize = 14.000
ScreenGui.TextButton_3.TextWrapped = true

ScreenGui.UICorner_28.Parent = ScreenGui.TextButton_3

ScreenGui.Putinkey.Name = "Putinkey"
ScreenGui.Putinkey.Parent = ScreenGui.QuickTPKeybind
ScreenGui.Putinkey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.Putinkey.BackgroundTransparency = 1.000
ScreenGui.Putinkey.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Putinkey.BorderSizePixel = 0
ScreenGui.Putinkey.Position = UDim2.new(0.510590672, 0, 0.268255562, 0)
ScreenGui.Putinkey.Size = UDim2.new(0.374206126, 0, 0.598999918, 0)
ScreenGui.Putinkey.Visible = false
ScreenGui.Putinkey.Font = Enum.Font.FredokaOne
ScreenGui.Putinkey.Text = "Press a key..."
ScreenGui.Putinkey.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.Putinkey.TextScaled = true
ScreenGui.Putinkey.TextSize = 14.000
ScreenGui.Putinkey.TextWrapped = true

ScreenGui.UIGradient_30.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_30.Parent = ScreenGui.Putinkey

ScreenGui.UIGradient_31.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_31.Parent = ScreenGui.Putinkey

ScreenGui.UIGradient_32.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_32.Parent = ScreenGui.Putinkey

ScreenGui.UIAspectRatioConstraint_33.Parent = ScreenGui.Putinkey
ScreenGui.UIAspectRatioConstraint_33.AspectRatio = 7.126

ScreenGui.Walkspeed.Name = "Walkspeed"
ScreenGui.Walkspeed.Parent = ScreenGui.PlayerTab_2
ScreenGui.Walkspeed.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.Walkspeed.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Walkspeed.BorderSizePixel = 0
ScreenGui.Walkspeed.Position = UDim2.new(0.336211205, 0, 0.820126295, 0)
ScreenGui.Walkspeed.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
ScreenGui.Walkspeed.ZIndex = 2

ScreenGui.UICorner_29.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_29.Parent = ScreenGui.Walkspeed

ScreenGui.TextButton_4.Parent = ScreenGui.Walkspeed
ScreenGui.TextButton_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextButton_4.BackgroundTransparency = 1.000
ScreenGui.TextButton_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextButton_4.BorderSizePixel = 0
ScreenGui.TextButton_4.Position = UDim2.new(0.0153534925, 0, 0.186521262, 0)
ScreenGui.TextButton_4.Size = UDim2.new(0.320536941, 0, 0.773980498, 0)
ScreenGui.TextButton_4.Font = Enum.Font.FredokaOne
ScreenGui.TextButton_4.Text = ""
ScreenGui.TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextButton_4.TextScaled = true
ScreenGui.TextButton_4.TextSize = 14.000
ScreenGui.TextButton_4.TextWrapped = true
ScreenGui.TextButton_4.TextXAlignment = Enum.TextXAlignment.Left

ScreenGui.UIGradient_33.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_33.Parent = ScreenGui.TextButton_4

ScreenGui.UIGradient_34.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_34.Parent = ScreenGui.TextButton_4

ScreenGui.UIGradient_35.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_35.Parent = ScreenGui.TextButton_4

ScreenGui.UIAspectRatioConstraint_34.Parent = ScreenGui.TextButton_4
ScreenGui.UIAspectRatioConstraint_34.AspectRatio = 4.428

ScreenGui.Slider_3.Name = "Slider"
ScreenGui.Slider_3.Parent = ScreenGui.Walkspeed
ScreenGui.Slider_3.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
ScreenGui.Slider_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Slider_3.BorderSizePixel = 0
ScreenGui.Slider_3.Position = UDim2.new(0.381311357, 0, 0.348829865, 0)
ScreenGui.Slider_3.Size = UDim2.new(0.526183188, 0, 0.266752243, 0)

ScreenGui.UICorner_30.CornerRadius = UDim.new(10, 0)
ScreenGui.UICorner_30.Parent = ScreenGui.Slider_3

ScreenGui.Amount_3.Name = "Amount"
ScreenGui.Amount_3.Parent = ScreenGui.Slider_3
ScreenGui.Amount_3.BackgroundColor3 = Color3.fromRGB(127, 0, 255)
ScreenGui.Amount_3.BackgroundTransparency = 1.000
ScreenGui.Amount_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Amount_3.BorderSizePixel = 0
ScreenGui.Amount_3.Position = UDim2.new(1.03362942, 0, -0.3846156, 0)
ScreenGui.Amount_3.Size = UDim2.new(0.0987537429, 0, 1.69230783, 0)
ScreenGui.Amount_3.Font = Enum.Font.FredokaOne
ScreenGui.Amount_3.Text = "20"
ScreenGui.Amount_3.TextColor3 = Color3.fromRGB(127, 0, 255)
ScreenGui.Amount_3.TextScaled = true
ScreenGui.Amount_3.TextSize = 14.000
ScreenGui.Amount_3.TextWrapped = true

ScreenGui.SliderThing_3.Name = "SliderThing"
ScreenGui.SliderThing_3.Parent = ScreenGui.Walkspeed
ScreenGui.SliderThing_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.SliderThing_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.SliderThing_3.BorderSizePixel = 0
ScreenGui.SliderThing_3.Position = UDim2.new(0.381311357, 0, 0.348829865, 0)
ScreenGui.SliderThing_3.Size = UDim2.new(0.0337870941, 0, 0.266752243, 0)

ScreenGui.UICorner_31.CornerRadius = UDim.new(10, 0)
ScreenGui.UICorner_31.Parent = ScreenGui.SliderThing_3

ScreenGui.UIGradient_36.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_36.Parent = ScreenGui.SliderThing_3

ScreenGui.UIAspectRatioConstraint_35.Parent = ScreenGui.SliderThing_3
ScreenGui.UIAspectRatioConstraint_35.AspectRatio = 1.077

ScreenGui.TextLabel_13.Parent = ScreenGui.Walkspeed
ScreenGui.TextLabel_13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_13.BackgroundTransparency = 1.000
ScreenGui.TextLabel_13.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel_13.BorderSizePixel = 0
ScreenGui.TextLabel_13.Position = UDim2.new(-0.0433501154, 0, 0.240512311, 0)
ScreenGui.TextLabel_13.Size = UDim2.new(0.442484707, 0, 0.552336633, 0)
ScreenGui.TextLabel_13.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel_13.Text = "Walk Speed"
ScreenGui.TextLabel_13.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_13.TextScaled = true
ScreenGui.TextLabel_13.TextSize = 14.000
ScreenGui.TextLabel_13.TextWrapped = true

ScreenGui.UIGradient_37.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_37.Parent = ScreenGui.TextLabel_13

ScreenGui.UIGradient_38.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_38.Parent = ScreenGui.TextLabel_13

ScreenGui.UIGradient_39.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_39.Parent = ScreenGui.TextLabel_13

ScreenGui.UIAspectRatioConstraint_36.Parent = ScreenGui.TextLabel_13
ScreenGui.UIAspectRatioConstraint_36.AspectRatio = 7.126

ScreenGui.VisualsTab_2.Name = "VisualsTab"
ScreenGui.VisualsTab_2.Parent = ScreenGui.UI
ScreenGui.VisualsTab_2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
ScreenGui.VisualsTab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.VisualsTab_2.BorderSizePixel = 0
ScreenGui.VisualsTab_2.Position = UDim2.new(-4.484097e-08, 0, 7.02470544e-08, 0)
ScreenGui.VisualsTab_2.Size = UDim2.new(0.999999702, 0, 1.00000012, 0)
ScreenGui.VisualsTab_2.ZIndex = 2

ScreenGui.UICorner_32.CornerRadius = UDim.new(0, 12)
ScreenGui.UICorner_32.Parent = ScreenGui.VisualsTab_2

ScreenGui.UIAspectRatioConstraint_37.Parent = ScreenGui.VisualsTab_2
ScreenGui.UIAspectRatioConstraint_37.AspectRatio = 1.567

ScreenGui.Background_2.Name = "Background"
ScreenGui.Background_2.Parent = ScreenGui.VisualsTab_2
ScreenGui.Background_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.Background_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Background_2.BorderSizePixel = 0
ScreenGui.Background_2.Position = UDim2.new(0.3386226, 0, 0.167370707, 0)
ScreenGui.Background_2.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
ScreenGui.Background_2.ZIndex = 2

ScreenGui.UICorner_33.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_33.Parent = ScreenGui.Background_2

ScreenGui.Switch_5.Name = "Switch"
ScreenGui.Switch_5.Parent = ScreenGui.Background_2
ScreenGui.Switch_5.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
ScreenGui.Switch_5.BackgroundTransparency = 0.800
ScreenGui.Switch_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Switch_5.BorderSizePixel = 0
ScreenGui.Switch_5.Position = UDim2.new(0.798893094, 0, 0.237907037, 0)
ScreenGui.Switch_5.Size = UDim2.new(0.160436109, 0, 0.558846653, 0)
ScreenGui.Switch_5.ZIndex = 2

ScreenGui.UICorner_34.CornerRadius = UDim.new(20, 0)
ScreenGui.UICorner_34.Parent = ScreenGui.Switch_5

ScreenGui.UIAspectRatioConstraint_38.Parent = ScreenGui.Switch_5
ScreenGui.UIAspectRatioConstraint_38.AspectRatio = 2.695

ScreenGui.Switch1_5.Name = "Switch1"
ScreenGui.Switch1_5.Parent = ScreenGui.Background_2
ScreenGui.Switch1_5.BackgroundColor3 = Color3.fromRGB(120, 52, 255)
ScreenGui.Switch1_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Switch1_5.BorderSizePixel = 0
ScreenGui.Switch1_5.Position = UDim2.new(0.798893154, 0, 0.228659093, 0)
ScreenGui.Switch1_5.Size = UDim2.new(0.0623449758, 0, 0.515391111, 0)
ScreenGui.Switch1_5.ZIndex = 3

ScreenGui.UICorner_35.CornerRadius = UDim.new(20, 0)
ScreenGui.UICorner_35.Parent = ScreenGui.Switch1_5

ScreenGui.TextLabel_14.Parent = ScreenGui.Background_2
ScreenGui.TextLabel_14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_14.BackgroundTransparency = 1.000
ScreenGui.TextLabel_14.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel_14.BorderSizePixel = 0
ScreenGui.TextLabel_14.Position = UDim2.new(-0.075813219, 0, 0.190000266, 0)
ScreenGui.TextLabel_14.Size = UDim2.new(0.501999974, 0, 0.598999977, 0)
ScreenGui.TextLabel_14.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel_14.Text = "Ball Hitbox"
ScreenGui.TextLabel_14.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_14.TextScaled = true
ScreenGui.TextLabel_14.TextSize = 14.000
ScreenGui.TextLabel_14.TextWrapped = true

ScreenGui.UIGradient_40.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_40.Parent = ScreenGui.TextLabel_14

ScreenGui.UIAspectRatioConstraint_39.Parent = ScreenGui.TextLabel_14
ScreenGui.UIAspectRatioConstraint_39.AspectRatio = 7.126

ScreenGui.AutomaticsTab_2.Name = "AutomaticsTab"
ScreenGui.AutomaticsTab_2.Parent = ScreenGui.UI
ScreenGui.AutomaticsTab_2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
ScreenGui.AutomaticsTab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.AutomaticsTab_2.BorderSizePixel = 0
ScreenGui.AutomaticsTab_2.Position = UDim2.new(-4.484097e-08, 0, 7.02470544e-08, 0)
ScreenGui.AutomaticsTab_2.Size = UDim2.new(0.999999702, 0, 1.00000012, 0)
ScreenGui.AutomaticsTab_2.ZIndex = 2

ScreenGui.UICorner_36.CornerRadius = UDim.new(0, 12)
ScreenGui.UICorner_36.Parent = ScreenGui.AutomaticsTab_2

ScreenGui.Background_3.Name = "Background"
ScreenGui.Background_3.Parent = ScreenGui.AutomaticsTab_2
ScreenGui.Background_3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.Background_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Background_3.BorderSizePixel = 0
ScreenGui.Background_3.Position = UDim2.new(0.3386226, 0, 0.167370707, 0)
ScreenGui.Background_3.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
ScreenGui.Background_3.ZIndex = 2

ScreenGui.UICorner_37.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_37.Parent = ScreenGui.Background_3

ScreenGui.Switch_6.Name = "Switch"
ScreenGui.Switch_6.Parent = ScreenGui.Background_3
ScreenGui.Switch_6.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
ScreenGui.Switch_6.BackgroundTransparency = 0.800
ScreenGui.Switch_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Switch_6.BorderSizePixel = 0
ScreenGui.Switch_6.Position = UDim2.new(0.798893094, 0, 0.237907037, 0)
ScreenGui.Switch_6.Size = UDim2.new(0.160436109, 0, 0.558846653, 0)
ScreenGui.Switch_6.ZIndex = 2

ScreenGui.UICorner_38.CornerRadius = UDim.new(20, 0)
ScreenGui.UICorner_38.Parent = ScreenGui.Switch_6

ScreenGui.UIAspectRatioConstraint_40.Parent = ScreenGui.Switch_6
ScreenGui.UIAspectRatioConstraint_40.AspectRatio = 2.695

ScreenGui.Switch1_6.Name = "Switch1"
ScreenGui.Switch1_6.Parent = ScreenGui.Background_3
ScreenGui.Switch1_6.BackgroundColor3 = Color3.fromRGB(120, 52, 255)
ScreenGui.Switch1_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Switch1_6.BorderSizePixel = 0
ScreenGui.Switch1_6.Position = UDim2.new(0.798893154, 0, 0.228659093, 0)
ScreenGui.Switch1_6.Size = UDim2.new(0.0623449758, 0, 0.515391111, 0)
ScreenGui.Switch1_6.ZIndex = 3

ScreenGui.UICorner_39.CornerRadius = UDim.new(20, 0)
ScreenGui.UICorner_39.Parent = ScreenGui.Switch1_6

ScreenGui.TextLabel_15.Parent = ScreenGui.Background_3
ScreenGui.TextLabel_15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_15.BackgroundTransparency = 1.000
ScreenGui.TextLabel_15.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextLabel_15.BorderSizePixel = 0
ScreenGui.TextLabel_15.Position = UDim2.new(-0.0775939077, 0, 0.190000132, 0)
ScreenGui.TextLabel_15.Size = UDim2.new(0.501999974, 0, 0.598999977, 0)
ScreenGui.TextLabel_15.Font = Enum.Font.FredokaOne
ScreenGui.TextLabel_15.Text = "Auto Catch"
ScreenGui.TextLabel_15.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextLabel_15.TextScaled = true
ScreenGui.TextLabel_15.TextSize = 14.000
ScreenGui.TextLabel_15.TextWrapped = true

ScreenGui.UIGradient_41.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_41.Parent = ScreenGui.TextLabel_15

ScreenGui.UIAspectRatioConstraint_41.Parent = ScreenGui.TextLabel_15
ScreenGui.UIAspectRatioConstraint_41.AspectRatio = 7.126

ScreenGui.UIAspectRatioConstraint_42.Parent = ScreenGui.AutomaticsTab_2
ScreenGui.UIAspectRatioConstraint_42.AspectRatio = 1.567

ScreenGui.Slider1Background_3.Name = "Slider1Background"
ScreenGui.Slider1Background_3.Parent = ScreenGui.AutomaticsTab_2
ScreenGui.Slider1Background_3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScreenGui.Slider1Background_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Slider1Background_3.BorderSizePixel = 0
ScreenGui.Slider1Background_3.Position = UDim2.new(0.3386226, 0, 0.289369017, 0)
ScreenGui.Slider1Background_3.Size = UDim2.new(0.608838677, 0, 0.112179428, 0)
ScreenGui.Slider1Background_3.ZIndex = 2

ScreenGui.UICorner_40.CornerRadius = UDim.new(0, 4)
ScreenGui.UICorner_40.Parent = ScreenGui.Slider1Background_3

ScreenGui.Slider_4.Name = "Slider"
ScreenGui.Slider_4.Parent = ScreenGui.Slider1Background_3
ScreenGui.Slider_4.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
ScreenGui.Slider_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Slider_4.BorderSizePixel = 0
ScreenGui.Slider_4.Position = UDim2.new(0.381311357, 0, 0.348829865, 0)
ScreenGui.Slider_4.Size = UDim2.new(0.526183188, 0, 0.266752243, 0)

ScreenGui.UICorner_41.CornerRadius = UDim.new(10, 0)
ScreenGui.UICorner_41.Parent = ScreenGui.Slider_4

ScreenGui.Amount_4.Name = "Amount"
ScreenGui.Amount_4.Parent = ScreenGui.Slider_4
ScreenGui.Amount_4.BackgroundColor3 = Color3.fromRGB(127, 0, 255)
ScreenGui.Amount_4.BackgroundTransparency = 1.000
ScreenGui.Amount_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.Amount_4.BorderSizePixel = 0
ScreenGui.Amount_4.Position = UDim2.new(1.03362942, 0, -0.3846156, 0)
ScreenGui.Amount_4.Size = UDim2.new(0.0987537429, 0, 1.69230783, 0)
ScreenGui.Amount_4.Font = Enum.Font.FredokaOne
ScreenGui.Amount_4.Text = "1"
ScreenGui.Amount_4.TextColor3 = Color3.fromRGB(127, 0, 255)
ScreenGui.Amount_4.TextScaled = true
ScreenGui.Amount_4.TextSize = 14.000
ScreenGui.Amount_4.TextWrapped = true

ScreenGui.SliderThing_4.Name = "SliderThing"
ScreenGui.SliderThing_4.Parent = ScreenGui.Slider1Background_3
ScreenGui.SliderThing_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.SliderThing_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.SliderThing_4.BorderSizePixel = 0
ScreenGui.SliderThing_4.Position = UDim2.new(0.381311357, 0, 0.348829865, 0)
ScreenGui.SliderThing_4.Size = UDim2.new(0.0337870941, 0, 0.266752243, 0)

ScreenGui.UICorner_42.CornerRadius = UDim.new(10, 0)
ScreenGui.UICorner_42.Parent = ScreenGui.SliderThing_4

ScreenGui.UIGradient_42.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_42.Parent = ScreenGui.SliderThing_4

ScreenGui.UIAspectRatioConstraint_43.Parent = ScreenGui.SliderThing_4
ScreenGui.UIAspectRatioConstraint_43.AspectRatio = 1.077

ScreenGui.TextButton_5.Parent = ScreenGui.Slider1Background_3
ScreenGui.TextButton_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextButton_5.BackgroundTransparency = 1.000
ScreenGui.TextButton_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScreenGui.TextButton_5.BorderSizePixel = 0
ScreenGui.TextButton_5.Position = UDim2.new(0.0153535372, 0, 0.186520994, 0)
ScreenGui.TextButton_5.Size = UDim2.new(0.336831003, 0, 0.695151031, 0)
ScreenGui.TextButton_5.Font = Enum.Font.FredokaOne
ScreenGui.TextButton_5.Text = "Autocatch Range"
ScreenGui.TextButton_5.TextColor3 = Color3.fromRGB(255, 255, 255)
ScreenGui.TextButton_5.TextScaled = true
ScreenGui.TextButton_5.TextSize = 14.000
ScreenGui.TextButton_5.TextWrapped = true
ScreenGui.TextButton_5.TextXAlignment = Enum.TextXAlignment.Left

ScreenGui.UIGradient_43.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(102, 0, 255)), ColorSequenceKeypoint.new(0.27, Color3.fromRGB(85, 0, 255)), ColorSequenceKeypoint.new(0.70, Color3.fromRGB(131, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(138, 20, 255))}
ScreenGui.UIGradient_43.Parent = ScreenGui.TextButton_5

ScreenGui.UIAspectRatioConstraint_44.Parent = ScreenGui.TextButton_5
ScreenGui.UIAspectRatioConstraint_44.AspectRatio = 4.428

-- Scripts:

local function RRZETB_fake_script() -- ScreenGui.Welcome.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.Welcome)

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
coroutine.wrap(RRZETB_fake_script)()
local function GDYWPDK_fake_script() -- ScreenGui.Switch1.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.Switch1)

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
coroutine.wrap(GDYWPDK_fake_script)()
local function EZHT_fake_script() -- ScreenGui.Slider1Background.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.Slider1Background)

	
end
coroutine.wrap(EZHT_fake_script)()
local function TEVKQ_fake_script() -- ScreenGui.SliderThing.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.SliderThing)

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
coroutine.wrap(TEVKQ_fake_script)()
-- ScreenGui.CatchingTab.SliderScript is disabled.
local function MXJTV_fake_script() -- ScreenGui.f.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.f)

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
coroutine.wrap(MXJTV_fake_script)()
local function EQMRE_fake_script() -- ScreenGui.f_2.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.f_2)

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
coroutine.wrap(EQMRE_fake_script)()
local function MHTMD_fake_script() -- ScreenGui.f_3.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.f_3)

	local Button = script.Parent
	local UI = Button.Parent.Parent.Parent.Parent
	local TabName = "AutomaticsTab"
	
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
coroutine.wrap(MHTMD_fake_script)()
local function OBEJUDU_fake_script() -- ScreenGui.TextLabel_5.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.TextLabel_5)

	script.Parent.Text = "Hello ".. game.Players.LocalPlayer.DisplayName .."!"
end
coroutine.wrap(OBEJUDU_fake_script)()
local function NVDK_fake_script() -- ScreenGui.f_4.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.f_4)

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
coroutine.wrap(NVDK_fake_script)()
local function MMQCBQY_fake_script() -- ScreenGui.Top.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.Top)

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
coroutine.wrap(MMQCBQY_fake_script)()
local function PBTDA_fake_script() -- ScreenGui.Switch1_2.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.Switch1_2)

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
coroutine.wrap(PBTDA_fake_script)()
local function FRBQY_fake_script() -- ScreenGui.Slider1Background_2.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.Slider1Background_2)

	
end
coroutine.wrap(FRBQY_fake_script)()
local function IINUC_fake_script() -- ScreenGui.SliderThing_2.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.SliderThing_2)

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
coroutine.wrap(IINUC_fake_script)()
local function EINXHN_fake_script() -- ScreenGui.Switch1_3.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.Switch1_3)

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
coroutine.wrap(EINXHN_fake_script)()
local function SGKT_fake_script() -- ScreenGui.Switch1_4.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.Switch1_4)

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
coroutine.wrap(SGKT_fake_script)()
local function YWKOOFH_fake_script() -- ScreenGui.TextButton_3.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.TextButton_3)

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
coroutine.wrap(YWKOOFH_fake_script)()
local function TDAD_fake_script() -- ScreenGui.Walkspeed.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.Walkspeed)

	
end
coroutine.wrap(TDAD_fake_script)()
local function ORAZ_fake_script() -- ScreenGui.SliderThing_3.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.SliderThing_3)

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
coroutine.wrap(ORAZ_fake_script)()
-- ScreenGui.VisualsTab_2.SliderScript is disabled.
local function LOXIFG_fake_script() -- ScreenGui.Switch1_5.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.Switch1_5)

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
coroutine.wrap(LOXIFG_fake_script)()
local function ZGEM_fake_script() -- ScreenGui.Switch1_6.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.Switch1_6)

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
	
	local renderstepped = game:GetService("RunService").RenderStepped
	local amount = toggle.Parent.Parent.Slider1Background.Slider.Amount
	local VirtualInputManager = game:GetService("VirtualInputManager")
	
	renderstepped:Connect(function()
	
		local val = tonumber(amount.Text)
	
		local cf = nil
	
		for i,v in workspace:GetChildren() do
			if v.Name == "Football" then
				local distance = (v.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	
				if distance < val then
					val = distance
					cf = v
				end
			end
		end
	
		if cf and toggled then
			VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
			task.wait()
			VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
		end
	end)
end
coroutine.wrap(ZGEM_fake_script)()
local function AUWW_fake_script() -- ScreenGui.Amount_4.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.Amount_4)

	
end
coroutine.wrap(AUWW_fake_script)()
local function YJVZCY_fake_script() -- ScreenGui.Slider1Background_3.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.Slider1Background_3)

	
end
coroutine.wrap(YJVZCY_fake_script)()
local function LSQSXV_fake_script() -- ScreenGui.SliderThing_4.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.SliderThing_4)

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
		local outputMax = 40
	
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
coroutine.wrap(LSQSXV_fake_script)()
-- ScreenGui.AutomaticsTab_2.SliderScript is disabled.
local function WKNPF_fake_script() -- ScreenGui.ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui.ScreenGui)

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
coroutine.wrap(WKNPF_fake_script)()


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
