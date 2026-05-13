local HttpService = game:GetService("HttpService")
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

local res = game:HttpGet("https://luafly.vercel.app/api/redeem?key=" .. key .. "&hwid=" .. HWID .. "&username=" .. game.Players.LocalPlayer.Name)
local data = HttpService:JSONDecode(res)

if data.success then
    print("Successfully redeemed! You are now whitelisted.")
else
    print("Error: " .. (data.error or "Unknown error"))
end