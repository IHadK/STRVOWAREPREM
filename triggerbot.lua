local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
 local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
 
 Notification:Notify(
     {Title = "strvoware- triggerbot", Description = "ACTIVATED (BETA)"},
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 30, Type = "image"},
     {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) print(tostring(State)) end}
 )

local v0=game:GetService("Players");local v1=game:GetService("UserInputService");local v2=game:GetService("VirtualUser");local v3=v0.LocalPlayer;local v4=v3:GetMouse();local v5=false;local function v6(v8) if (v8 and v8.Parent) then local v10=v8.Parent;local v11=v0:GetPlayerFromCharacter(v10);if v11 then return v11;end end return nil;end local function v7() local v9=v6(v4.Target);if (v9 and  not v5) then v5=true;v2:ClickButton1(Vector2.new(v4.X,v4.Y));wait(0.005);v5=false;end end v4.Move:Connect(v7); -- 
-- Bogus Performance Evaluation: x1.000
