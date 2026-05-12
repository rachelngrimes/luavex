local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 254, 0, 107)
Frame.Active = true
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 254, 0, 41)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "KongerHub | Anti Afk"
TextLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel.TextSize = 23.000

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0, 0.487464696, 0)
TextLabel_2.Size = UDim2.new(0, 254, 0, 41)
TextLabel_2.Font = Enum.Font.Gotham
TextLabel_2.Text = "Status: Active"
TextLabel_2.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel_2.TextSize = 23.000

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

Players.LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    TextLabel_2.Text = "Status: Saved"
    wait(5)
    TextLabel_2.Text = "Status: Active1"
end)