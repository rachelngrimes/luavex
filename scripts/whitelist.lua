local HttpService = game:GetService("HttpService")
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
local username = game.Players.LocalPlayer.Name

local res = game:HttpGet("https://luafly.vercel.app/api/redeem?key=" .. (key or "") .. "&hwid=" .. HWID .. "&username=" .. username)

if res == nil or res == "" then
    print("Error: No response from server.")
    return
end

local data = HttpService:JSONDecode(res)

if data.success then
    print("Successfully redeemed! You are now whitelisted.")
else
    print("Error: " .. (data.error or "Unknown error"))
end