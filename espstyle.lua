  --strvo runs this
local players = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local localPlayer = players.LocalPlayer
local toggleKey = Enum.KeyCode.T
local espEnabled = false
local blacklist = {
    "enterrealuser", 
    "en"
}
local function isBlacklisted(player)
    local displayName = player.DisplayName
    local username = player.Name
    for _, blacklisted in ipairs(blacklist) do
        if blacklisted == displayName or blacklisted == username then
            return true
        end
    end
    return false
end
local function createESP(player)
    if player == localPlayer or isBlacklisted(player) then
        return
    end
    local head = player.Character:FindFirstChild("Head")
    if head and head:FindFirstChild("ESP") then
        return
    end
    -- esp funtions
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = player.Character:WaitForChild("Head")
    billboard.Size = UDim2.new(10, 0, 1, 0) -- use 5 or 10 as prefered
    billboard.StudsOffset = Vector3.new(0, 3, 0) --offest 1-19-25
    billboard.AlwaysOnTop = true
    billboard.Name = "ESP"
    local textLabel = Instance.new("TextLabel")
    textLabel.Text = string.format("%s (%s)", player.DisplayName, player.Name)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.new(1, 0, 0) -- red text
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextScaled = true
    textLabel.Parent = billboard
    billboard.Parent = player.Character:WaitForChild("Head")
end
--a
local function removeESP(player)
    local head = player.Character and player.Character:FindFirstChild("Head")
    if head then
        local esp = head:FindFirstChild("ESP")
        if esp then
            esp:Destroy()
        end
    end
end
--h
local function toggleESP()
    espEnabled = not espEnabled
    if espEnabled then
        for _, player in ipairs(players:GetPlayers()) do
            if player.Character then
                createESP(player)
            end
        end
    else
        for _, player in ipairs(players:GetPlayers()) do
            removeESP(player)
        end
    end
end
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == toggleKey then
        toggleESP()
    end
end)
players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if espEnabled then
            createESP(player)
        end
    end)
end)
-- cleanup esp
players.PlayerRemoving:Connect(function(player)
    removeESP(player)
end)
-- make sure not overlapping
for _, player in ipairs(players:GetPlayers()) do
    player.CharacterAdded:Connect(function()
        if espEnabled then
            createESP(player)
        end
    end)
    if player.Character then
        if espEnabled then
            createESP(player)
        end
    end
end
    end})
