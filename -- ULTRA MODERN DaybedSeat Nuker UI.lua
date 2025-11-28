-- ULTRA MODERN Daybed/Seat Nuker UI 
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

-- Main GUI
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 380, 0, 180)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Parent = ScreenGui

-- Top gradient bar
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 50, 150)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 200))
}
Gradient.Rotation = 90
Gradient.Parent = MainFrame

-- Corner rounding
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 16)
Corner.Parent = MainFrame

-- Drop shadow (image label trick)
local Shadow = Instance.new("ImageLabel")
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.Position = UDim2.new(0, -20, 0, -20)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://6014261993"
Shadow.ImageColor3 = Color3.new(0,0,0)
Shadow.ImageTransparency = 0.6
Shadow.ZIndex = 0
Shadow.Parent = MainFrame

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -30, 0, 50)
Title.Position = UDim2.new(0, 15, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "FURNITURE NUKER"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 28
Title.Parent = MainFrame

-- Subtitle
local Sub = Instance.new("TextLabel")
Sub.Size = UDim2.new(1, -30, 0, 30)
Sub.Position = UDim2.new(0, 15, 0, 50)
Sub.BackgroundTransparency = 1
Sub.Text = "Deletes all Daybeds & Seats (clientside)"
Sub.TextColor3 = Color3.fromRGB(180, 180, 180)
Sub.Font = Enum.Font.Gotham
Sub.TextSize = 16
Sub.Parent = MainFrame

-- Nuke Button (the star of the show)
local NukeBtn = Instance.new("TextButton")
NukeBtn.Size = UDim2.new(0, 320, 0, 60)
NukeBtn.Position = UDim2.new(0.5, -160, 1, -80)
NukeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 130)
NukeBtn.Text = "☢️ NUKE ALL FURNITURE ☢️"
NukeBtn.TextColor3 = Color3.new(1,1,1)
NukeBtn.Font = Enum.Font.GothamBlack
NukeBtn.TextSize = 22
NukeBtn.AutoButtonColor = false
NukeBtn.Parent = MainFrame

local BtnCorner = Instance.new("UICorner", NukeBtn)
BtnCorner.CornerRadius = UDim.new(0, 12)

local BtnGradient = Instance.new("UIGradient", NukeBtn)
BtnGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 160)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 20, 100))
}
BtnGradient.Rotation = 90

-- Hover animation
NukeBtn.MouseEnter:Connect(function()
    TweenService:Create(NukeBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 100, 160)}):Play()
    TweenService:Create(NukeBtn, TweenInfo.new(0.2), {Size = UDim2.new(0, 330, 0, 65)}):Play()
end)

NukeBtn.MouseLeave:Connect(function()
    TweenService:Create(NukeBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 50, 130)}):Play()
    TweenService:Create(NukeBtn, TweenInfo.new(0.2), {Size = UDim2.new(0, 320, 0, 60)}):Play()
end)

-- Click & nuke
NukeBtn.MouseButton1Click:Connect(function()
    NukeBtn.Text = "NUKING..."
    task.wait(0.3)
    
    local count = 0
    for _, v in game:GetService("Workspace"):GetDescendants() do
        if v:IsA("Model") and (v.Name == "Daybed" or v.Name == "Seat") then
            v:Destroy()
            count += 1
        end
    end
    
    NukeBtn.Text = "☢️ NUKED "..count.." OBJECTS ☢️"
    TweenService:Create(NukeBtn, TweenInfo.new(0.3, Enum.EasingStyle.Bounce), {BackgroundColor3 = Color3.fromRGB(0, 255, 100)}):Play()
    task.wait(2)
    NukeBtn.Text = "☢️ NUKE ALL FURNITURE ☢️"
    TweenService:Create(NukeBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 50, 130)}):Play()
end)

-- Dragging (cuz modern UIs gotta move)
local dragging = false
local dragInput, mousePos, framePos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        mousePos = input.Position
        framePos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - mousePos
        if dragging then
            MainFrame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end
end)

print("Modern Furniture Nuker loaded - go make chaos 🔥")