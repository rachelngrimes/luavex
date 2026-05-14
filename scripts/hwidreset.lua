local HttpService = game:GetService("HttpService")
local old_hwid = game:GetService("RbxAnalyticsService"):GetClientId()

print("🔄 Attempting HWID reset...")
print("Current HWID: " .. old_hwid)

local new_hwid = game:GetService("RbxAnalyticsService"):GetClientId()

local res = game:HttpGet("https://luafly.vercel.app/api/hwidreset?old_hwid=" .. old_hwid .. "&new_hwid=" .. new_hwid)
local data = HttpService:JSONDecode(res)

if data.success then
    print("✅ HWID reset successful!")
    print("🪙 Tokens left: " .. (data.tokens_left or 0))
else
    print("❌ Error: " .. (data.error or "Unknown error"))
end