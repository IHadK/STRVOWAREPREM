local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
 local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
 
 Notification:Notify(
     {Title = "strvoware- targethub", Description = "f to toggle   tracers a little wonky"},
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 30, Type = "image"},
     {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) print(tostring(State)) end}
 )

-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local BackgroundFrame = Instance.new("Frame")
local AvatarFrame = Instance.new("Frame")
local HighlightButton = Instance.new("TextButton")
local TracersButton = Instance.new("TextButton")
local XrayButton = Instance.new("TextButton")
local TextBox = Instance.new("TextBox")
local button = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

BackgroundFrame.Name = "BackgroundFrame"
BackgroundFrame.Parent = ScreenGui
BackgroundFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
BackgroundFrame.BorderColor3 = Color3.fromRGB(0, 0, 127)
BackgroundFrame.BorderSizePixel = 5
BackgroundFrame.Position = UDim2.new(0.499742329, 0, 0.14660494, 0)
BackgroundFrame.Size = UDim2.new(0, 314, 0, 404)
BackgroundFrame.Style = Enum.FrameStyle.RobloxRound

AvatarFrame.Name = "AvatarFrame"
AvatarFrame.Parent = BackgroundFrame
AvatarFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
AvatarFrame.BorderColor3 = Color3.fromRGB(0, 0, 127)
AvatarFrame.BorderSizePixel = 0
AvatarFrame.Position = UDim2.new(1.0600431, 0, -0.0149495341, 0)
AvatarFrame.Size = UDim2.new(0, 100, 0, 100)
AvatarFrame.Style = Enum.FrameStyle.RobloxRound

HighlightButton.Name = "HighlightButton"
HighlightButton.Parent = BackgroundFrame
HighlightButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
HighlightButton.BorderColor3 = Color3.fromRGB(0, 0, 127)
HighlightButton.BorderSizePixel = 3
HighlightButton.Position = UDim2.new(0.162420377, 0, 0.261828423, 0)
HighlightButton.Size = UDim2.new(0, 200, 0, 50)
HighlightButton.Font = Enum.Font.SourceSansBold
HighlightButton.Text = "highlight"
HighlightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HighlightButton.TextSize = 14.000

TracersButton.Name = "TracersButton"
TracersButton.Parent = BackgroundFrame
TracersButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TracersButton.BorderColor3 = Color3.fromRGB(0, 0, 127)
TracersButton.BorderSizePixel = 3
TracersButton.Position = UDim2.new(0.162420377, 0, 0.437855035, 0)
TracersButton.Size = UDim2.new(0, 200, 0, 50)
TracersButton.Font = Enum.Font.SourceSansBold
TracersButton.Text = "tracers"
TracersButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TracersButton.TextSize = 14.000

XrayButton.Name = "XrayButton"
XrayButton.Parent = BackgroundFrame
XrayButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
XrayButton.BorderColor3 = Color3.fromRGB(0, 0, 127)
XrayButton.BorderSizePixel = 3
XrayButton.Position = UDim2.new(0.162420377, 0, 0.61662066, 0)
XrayButton.Size = UDim2.new(0, 200, 0, 50)
XrayButton.Font = Enum.Font.SourceSansBold
XrayButton.Text = "xray (eli)"
XrayButton.TextColor3 = Color3.fromRGB(255, 255, 255)
XrayButton.TextSize = 14.000

TextBox.Parent = BackgroundFrame
TextBox.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
TextBox.BackgroundTransparency = 0.050
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 127)
TextBox.BorderSizePixel = 3
TextBox.Position = UDim2.new(0.162420377, 0, 0.0512295067, 0)
TextBox.Size = UDim2.new(0, 200, 0, 50)
TextBox.Font = Enum.Font.SourceSansBold
TextBox.Text = "name"
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000

button.Name = "button"
button.Parent = BackgroundFrame
button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
button.BorderColor3 = Color3.fromRGB(0, 0, 127)
button.BorderSizePixel = 3
button.Position = UDim2.new(0.0254777074, 0, 0.81730336, 0)
button.Selectable = false
button.Size = UDim2.new(0, 290, 0, 50)
button.Style = Enum.ButtonStyle.RobloxButtonDefault
button.Font = Enum.Font.SourceSansBold
button.Text = "strvoware- targethub v1.1"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 18.000
button.TextStrokeColor3 = Color3.fromRGB(0, 0, 127)

-- Scripts:

local function GHXNVBU_fake_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)

	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	
	local ScreenGui = script.Parent
	local BackgroundFrame = ScreenGui:WaitForChild("BackgroundFrame")
	local TextBox = BackgroundFrame:WaitForChild("TextBox")
	local AvatarFrame = BackgroundFrame:WaitForChild("AvatarFrame")
	local HighlightButton = BackgroundFrame:WaitForChild("HighlightButton")
	local TracersButton = BackgroundFrame:WaitForChild("TracersButton")
	local XrayButton = BackgroundFrame:WaitForChild("XrayButton")
	
	local selectedPlayer
	local highlightInstance
	local tracerPart
	local xrayEnabled = false
	local highlightEnabled = false
	local tracersEnabled = false
	local uiVisible = true
	
	local function clearPreviousHighlight()
		if highlightInstance then
			highlightInstance:Destroy()
			highlightInstance = nil
		end
	end
	
	local function createHighlight(targetPlayer)
		clearPreviousHighlight()
		highlightInstance = Instance.new("Highlight")
		highlightInstance.Parent = targetPlayer.Character
	end
	
	local function toggleHighlight()
		highlightEnabled = not highlightEnabled
		if highlightEnabled then
			if selectedPlayer then
				createHighlight(selectedPlayer)
			end
		else
			clearPreviousHighlight()
		end
	end
	
	local function clearPreviousTracer()
		if tracerPart then
			tracerPart:Destroy()
			tracerPart = nil
		end
	end
	
	local function createTracer(targetPlayer)
		clearPreviousTracer()
		local character = Players.LocalPlayer.Character
		if character and targetPlayer.Character then
			local attachment0 = Instance.new("Attachment", character.PrimaryPart)
			local attachment1 = Instance.new("Attachment", targetPlayer.Character.PrimaryPart)
			tracerPart = Instance.new("Beam")
			tracerPart.Attachment0 = attachment0
			tracerPart.Attachment1 = attachment1
			tracerPart.Color = ColorSequence.new(Color3.new(1, 0, 0)) -- Red color
			tracerPart.Width0 = 0.50 -- Adjust thickness as needed
			tracerPart.Width1 = 0.50 -- Adjust thickness as needed
			tracerPart.Parent = character.PrimaryPart
		end
	end
	
	local function toggleTracers()
		tracersEnabled = not tracersEnabled
		if tracersEnabled then
			if selectedPlayer then
				createTracer(selectedPlayer)
			end
		else
			clearPreviousTracer()
		end
	end
	
	local function setXrayEnabled(enabled)
		xrayEnabled = enabled
		for _, descendant in ipairs(workspace:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.LocalTransparencyModifier = enabled and 0.5 or 0
			end
		end
	end
	
	local function displayPlayerAvatar(player)
		local userId = player.UserId
		local thumbnailType = Enum.ThumbnailType.HeadShot
		local thumbnailSize = Enum.ThumbnailSize.Size420x420
		local content, isReady = Players:GetUserThumbnailAsync(userId, thumbnailType, thumbnailSize)
		if isReady then
			AvatarFrame.BackgroundColor3 = Color3.new(1, 1, 1)
			AvatarFrame.BackgroundTransparency = 0
			AvatarFrame:ClearAllChildren()
			local imageLabel = Instance.new("ImageLabel")
			imageLabel.Size = UDim2.new(1, 0, 1, 0)
			imageLabel.Image = content
			imageLabel.Parent = AvatarFrame
		end
	end
	
	local function findPlayerByName(name)
		name = name:lower()
		for _, player in ipairs(Players:GetPlayers()) do
			if player.Name:lower():sub(1, #name) == name or player.DisplayName:lower():sub(1, #name) == name then
				return player
			end
		end
		return nil
	end
	
	TextBox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			local name = TextBox.Text
			local player = findPlayerByName(name)
			if player then
				selectedPlayer = player
				displayPlayerAvatar(player)
				print("Player found: " .. player.Name)
			else
				print("Player not found")
			end
		end
	end)
	
	HighlightButton.MouseButton1Click:Connect(function()
		toggleHighlight()
	end)
	
	TracersButton.MouseButton1Click:Connect(function()
		toggleTracers()
	end)
	
	XrayButton.MouseButton1Click:Connect(function()
		xrayEnabled = not xrayEnabled
		setXrayEnabled(xrayEnabled)
		print("Xray mode: " .. tostring(xrayEnabled))
	end)
	
	-- Make GUI Draggable
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		BackgroundFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	BackgroundFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = BackgroundFrame.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	BackgroundFrame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if dragging and input == dragInput then
			update(input)
		end
	end)
	
	-- Toggle UI with F key
	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.F then
			uiVisible = not uiVisible
			ScreenGui.Enabled = uiVisible
		end
	end)
	
	-- Ensure GUI doesn't disappear on respawn
	Players.LocalPlayer.CharacterAdded:Connect(function()
		wait(1) -- wait for character to fully load
		ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
	end)
	
end
coroutine.wrap(GHXNVBU_fake_script)()
