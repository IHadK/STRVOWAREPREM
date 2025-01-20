print("cracked in 27 hours")
local p=game.Players.LocalPlayer local g=p:WaitForChild("PlayerGui") local function e() local a=g:WaitForChild("gui"):WaitForChild("Settings"):WaitForChild("ScrollingFrame"):WaitForChild("aimviewer") if a then a.Visible=true end end e() p.CharacterAdded:Connect(function() task.wait(1)e()end)
