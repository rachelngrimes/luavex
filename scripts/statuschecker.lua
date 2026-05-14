local HttpService = game:GetService("HttpService")
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

local res = game:HttpGet("https://luafly.vercel.app/api/status?hwid=" .. HWID)
local data = HttpService:JSONDecode(res)

if data.status == "not_found" then
    print("❌ You are not whitelisted.")
elseif data.status == "whitelisted" then
    print("✅ Whitelisted as: " .. (data.username or "Unknown"))
    if data.expires_at then
        print("⏰ Expires: " .. data.expires_at)
    else
        print("♾️ Lifetime access")
    end
    print("🔄 HWID Resets left: " .. (data.hwid_resets_left or 0))
    print("🪙 Tokens: " .. (data.tokens or 0))
elseif data.status == "blacklisted" then
    print("❌ You are blacklisted.")
elseif data.status == "expired" then
    print("⏰ Your whitelist has expired.")
end