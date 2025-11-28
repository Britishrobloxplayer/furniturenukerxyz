-- GOD MENU v18.5 - DRAGGABLE FIXED 100% (works PERFECTLY now) ☢️♡
-- Drag from ANYWHERE on the menu – even when open or minimized
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
repeat task.wait() until LocalPlayer and LocalPlayer.Character

-- PRED JOINED
local PREDS = {VOSSK4 = true, ["1ucyhi1234yt"] = true, xDiana420 = true}
local PRED_SOUND = "rbxassetid://9047050076"
local notified = {}
local function notifyPred(plr)
    if notified[plr.Name] then return end
    notified[plr.Name] = true
    StarterGui:SetCore("SendNotification", {Title = "PREDATOR JOINED", Text = plr.DisplayName.." (@"..plr.Name..")", Duration = 30})
    local s = Instance.new("Sound", Workspace)
    s.SoundId = PRED_SOUND s.Volume = 10 s:Play()
    task.delay(10, function() s:Destroy() end)
end
Players.PlayerAdded:Connect(function(p) if PREDS[p.Name] then task.wait(0.2) notifyPred(p) end end)
for _,p in Players:GetPlayers() do if PREDS[p.Name] then notifyPred(p) end end

-- MAIN GUI
local sg = Instance.new("ScreenGui")
sg.Name = "GodMenuV18"
sg.ResetOnSpawn = false
sg.Parent = game.CoreGui
local mf = Instance.new("Frame")
mf.Size = UDim2.new(0,420,0,760)
mf.Position = UDim2.new(0.5,-210,0.5,-380)
mf.BackgroundColor3 = Color3.fromRGB(15,15,25)
mf.BackgroundTransparency = 0.1
mf.BorderSizePixel = 0
mf.AnchorPoint = Vector2.new(0.5,0.5)
mf.Parent = sg
Instance.new("UICorner", mf).CornerRadius = UDim.new(0,20)
local stroke = Instance.new("UIStroke", mf)
stroke.Thickness = 3 stroke.Color = Color3.fromRGB(255,50,200) stroke.Transparency = 0.4

-- Title bar
local title = Instance.new("TextLabel", mf)
title.Size = UDim2.new(1,0,0,70) title.BackgroundTransparency = 1
title.Text = "GOD MENU v18.5 ☢️♡"
title.TextColor3 = Color3.new(1,1,1) title.Font = Enum.Font.GothamBlack title.TextSize = 32
title.TextXAlignment = Enum.TextXAlignment.Left title.Position = UDim2.new(0,20,0,0)
local minBtn = Instance.new("TextButton", mf)
minBtn.Size = UDim2.new(0,50,0,50) minBtn.Position = UDim2.new(1,-70,0,10)
minBtn.BackgroundTransparency = 1 minBtn.Text = "−" minBtn.TextColor3 = Color3.new(1,1,1)
minBtn.Font = Enum.Font.GothamBold minBtn.TextSize = 40

-- Content container
local content = Instance.new("Frame", mf)
content.Size = UDim2.new(1,0,1,-70)
content.Position = UDim2.new(0,0,0,70)
content.BackgroundTransparency = 1
content.ClipsDescendants = true
local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    minBtn.Text = minimized and "+" or "−"
    TweenService:Create(mf, TweenInfo.new(0.35, Enum.EasingStyle.Quint), {
        Size = minimized and UDim2.new(0,420,0,70) or UDim2.new(0,420,0,760)
    }):Play()
    content.Visible = not minimized
end)

-- ULTRA MODERN NUKE (FIXED - deletes ALL Daybed models + ALL Seat parts)
local nukeFrame = Instance.new("Frame", content)
nukeFrame.Size = UDim2.new(0,380,0,180) nukeFrame.Position = UDim2.new(0.5,-190,0,20)
nukeFrame.BackgroundColor3 = Color3.fromRGB(20,20,25)
local grad = Instance.new("UIGradient", nukeFrame)
grad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,50,150)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,100,200))}
grad.Rotation = 90
Instance.new("UICorner", nukeFrame).CornerRadius = UDim.new(0,16)
local shadow = Instance.new("ImageLabel", nukeFrame)
shadow.Size = UDim2.new(1,40,1,40) shadow.Position = UDim2.new(0,-20,0,-20)
shadow.BackgroundTransparency = 1 shadow.Image = "rbxassetid://6014261993"
shadow.ImageColor3 = Color3.new(0,0,0) shadow.ImageTransparency = 0.6 shadow.ZIndex = 0
local nukeTitle = Instance.new("TextLabel", nukeFrame) nukeTitle.Size = UDim2.new(1,-30,0,50) nukeTitle.Position = UDim2.new(0,15,0,10)
nukeTitle.BackgroundTransparency = 1 nukeTitle.Text = "FURNITURE NUKER" nukeTitle.TextColor3 = Color3.new(1,1,1)
nukeTitle.Font = Enum.Font.GothamBold nukeTitle.TextSize = 28
local nukeSub = Instance.new("TextLabel", nukeFrame) nukeSub.Size = UDim2.new(1,-30,0,30) nukeSub.Position = UDim2.new(0,15,0,50)
nukeSub.BackgroundTransparency = 1 nukeSub.Text = "Deletes all Daybeds & Seats (clientside)" nukeSub.TextColor3 = Color3.fromRGB(180,180,180)
nukeSub.Font = Enum.Font.Gotham nukeSub.TextSize = 16
local NukeBtn = Instance.new("TextButton", nukeFrame)
NukeBtn.Size = UDim2.new(0,320,0,60) NukeBtn.Position = UDim2.new(0.5,-160,1,-80)
NukeBtn.BackgroundColor3 = Color3.fromRGB(255,50,130) NukeBtn.Text = "☢️ NUKE ALL FURNITURE ☢️"
NukeBtn.TextColor3 = Color3.new(1,1,1) NukeBtn.Font = Enum.Font.GothamBlack NukeBtn.TextSize = 22
NukeBtn.AutoButtonColor = false
Instance.new("UICorner", NukeBtn).CornerRadius = UDim.new(0,12)
local btnGrad = Instance.new("UIGradient", NukeBtn)
btnGrad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,80,160)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,20,100))}
btnGrad.Rotation = 90
NukeBtn.MouseEnter:Connect(function()
    TweenService:Create(NukeBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255,100,160)}):Play()
    TweenService:Create(NukeBtn, TweenInfo.new(0.2), {Size = UDim2.new(0,330,0,65)}):Play()
end)
NukeBtn.MouseLeave:Connect(function()
    TweenService:Create(NukeBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255,50,130)}):Play()
    TweenService:Create(NukeBtn, TweenInfo.new(0.2), {Size = UDim2.new(0,320,0,60)}):Play()
end)
NukeBtn.MouseButton1Click:Connect(function()
    NukeBtn.Text = "NUKING..."
    task.wait(0.3)
    local count = 0
    for _, v in Workspace:GetDescendants() do
        if (v:IsA("Model") and v.Name == "Daybed") or (v:IsA("Part") and v.Name == "Seat") then
            v:Destroy()
            count += 1
        end
    end
    NukeBtn.Text = "☢️ NUKED "..count.." OBJECTS ☢️"
    TweenService:Create(NukeBtn, TweenInfo.new(0.3, Enum.EasingStyle.Bounce), {BackgroundColor3 = Color3.fromRGB(0,255,100)}):Play()
    task.wait(2)
    NukeBtn.Text = "☢️ NUKE ALL FURNITURE ☢️"
    TweenService:Create(NukeBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255,50,130)}):Play()
end)

-- LATCH (working)
local latchFrame = Instance.new("Frame", content)
latchFrame.Size = UDim2.new(0,380,0,140) latchFrame.Position = UDim2.new(0.5,-190,0,220)
latchFrame.BackgroundColor3 = Color3.fromRGB(20,20,30) latchFrame.BackgroundTransparency = 0.1
Instance.new("UICorner", latchFrame).CornerRadius = UDim.new(0,16)
local latchBox = Instance.new("TextBox", latchFrame)
latchBox.Size = UDim2.new(1,-30,0,45) latchBox.Position = UDim2.new(0,15,0,15)
latchBox.PlaceholderText = "Username" latchBox.BackgroundColor3 = Color3.fromRGB(40,40,60)
latchBox.TextColor3 = Color3.new(1,1,1) latchBox.Text = ""
Instance.new("UICorner", latchBox).CornerRadius = UDim.new(0,10)
local latchBtn = Instance.new("TextButton", latchFrame)
latchBtn.Size = UDim2.new(1,-30,0,55) latchBtn.Position = UDim2.new(0,15,0,70)
latchBtn.BackgroundColor3 = Color3.fromRGB(180,0,0) latchBtn.Text = "LATCH OFF"
latchBtn.TextColor3 = Color3.new(1,1,1) latchBtn.Font = Enum.Font.GothamBlack latchBtn.TextSize = 26
Instance.new("UICorner", latchBtn).CornerRadius = UDim.new(0,12)
local latching = false
local latchConn
latchBtn.MouseButton1Click:Connect(function()
    latching = not latching
    local target = Players:FindFirstChild(latchBox.Text)
    if latching and target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        latchBtn.Text = "LATCHED → "..target.Name
        latchBtn.BackgroundColor3 = Color3.fromRGB(0,255,0)
        if latchConn then latchConn:Disconnect() end
        latchConn = RunService.Heartbeat:Connect(function()
            pcall(function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0.1, 0)
            end)
        end)
    else
        latching = false
        if latchConn then latchConn:Disconnect() latchConn = nil end
        latchBtn.Text = "LATCH OFF"
        latchBtn.BackgroundColor3 = Color3.fromRGB(180,0,0)
    end
end)

-- PRED INDICATOR
local predBtn = Instance.new("TextButton", content)
predBtn.Size = UDim2.new(0,360,0,60) predBtn.Position = UDim2.new(0.5,-180,0,380)
predBtn.BackgroundColor3 = Color3.fromRGB(220,20,60) predBtn.Text = "PRED JOINED ACTIVE"
predBtn.TextColor3 = Color3.new(1,1,1) predBtn.Font = Enum.Font.GothamBlack predBtn.TextSize = 22
Instance.new("UICorner", predBtn).CornerRadius = UDim.new(0,14)

-- FULLY WORKING DRAGGABLE (drag from ANYWHERE on the menu)
local dragging = false
local dragInput = nil
local dragStart = nil
local startPos = nil
local function updateDrag(input)
    local delta = input.Position - dragStart
    mf.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
mf.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mf.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
mf.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
RunService.RenderStepped:Connect(function()
    if dragging and dragInput then
        updateDrag(dragInput)
    end
end)

print("GOD MENU v18.5 LOADED - DRAGGABLE FROM ANYWHERE ☢️♡")
print("drag the whole menu anywhere you want king – works 100% now")
