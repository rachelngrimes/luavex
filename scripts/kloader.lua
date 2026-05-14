local VERSION = "1.0"
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Loading screen
local screen = Instance.new("ScreenGui")
screen.Name = "LuaflyLoader"
screen.ResetOnSpawn = false
screen.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
frame.BorderSizePixel = 0
frame.Parent = screen

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0.4, 0)
title.BackgroundTransparency = 1
title.Text = "⚡ Luafly"
title.TextColor3 = Color3.fromRGB(160, 120, 255)
title.TextSize = 32
title.Font = Enum.Font.GothamBold
title.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0.55, 0)
status.BackgroundTransparency = 1
status.Text = "Checking version..."
status.TextColor3 = Color3.fromRGB(120, 120, 180)
status.TextSize = 16
status.Font = Enum.Font.Gotham
status.Parent = frame

local function setStatus(text)
    status.Text = text
    task.wait(0.5)
end

-- Improved Executor Detection
local executor = "Unknown"

if identifyexecutor then
    executor = identifyexecutor()
elseif syn then
    executor = "Synapse X"
elseif KRNL_LOADED then
    executor = "Krnl"
elseif fluxus then
    executor = "Fluxus"
elseif getgenv then
    executor = "Generic Executor"
end

setStatus("Checking version...")

-- Version check
local versionRes = HttpService:JSONDecode(
    game:HttpGet("https://luafly.vercel.app/api/version?version=" .. VERSION)
)

if not versionRes.valid then
    screen:Destroy()
    player:Kick("❌ Outdated loader. Please get the latest version.")
    return
end

setStatus("Verifying your HWID...")

-- HWID check and load
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
local res = game:HttpGet("https://luafly.vercel.app/api/load?hwid=" .. HWID .. "&version=" .. VERSION .. "&executor=" .. executor)

setStatus("Loading script...")
task.wait(0.5)

screen:Destroy()
loadstring(res)()