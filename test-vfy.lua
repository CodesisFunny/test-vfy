local function checkWhitelist()
    local player = game.Players.LocalPlayer
    
    print("🔍 Checking whitelist status...")
    
    local success, response = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/CodesisFunny/crack-whitelist/refs/heads/main/crack%20whitelist.lua")
    end)
    
    if success then
        local success2, whitelistData = pcall(function()
            return game:GetService("HttpService"):JSONDecode(response)
        end)
        
        if success2 then
            
            local playerData = whitelistData.whitelist[player.Name]
            if playerData then
                
                if playerData.userid == tostring(player.UserId) 
                and playerData.username == player.Name 
                and playerData.displayname == player.DisplayName
                and math.abs(tonumber(playerData.accountage) - player.AccountAge) <= 0 then
                    print("✅ User is whitelisted!")
                    return true
                end
            else
                print("❌ Player not found in whitelist data")
            end
        else
            print("❌ Failed to decode JSON data")
        end
    else
        print("❌ Failed to get response from Pastebin:", response)
    end
    
    print("❌ User is not whitelisted!")
    return false
end

if not checkWhitelist() then
    print("❌ Access denied - not whitelisted")
    return
end
]]

print("Access granted - continuing with script...")
