local pcount = 0
local c = Config.DiscordRPC
local showPlayerCount = c.ShowPlayerCount
local buttons = c.Buttons

SetDiscordAppId(c.ApplicationId)
SetDiscordRichPresenceAsset(c.IconLarge)
SetDiscordRichPresenceAssetText(c.IconLargeHoverText)
SetDiscordRichPresenceAssetSmall(c.IconSmall)
SetDiscordRichPresenceAssetSmallText(c.IconSmallHoverText)

RegisterNetEvent("mmo-smallresources:playerCount")
AddEventHandler("mmo-smallresources:playerCount", function(playerCount)
    pcount = playerCount
end)

if buttons and type(buttons) == "table" then
    for i, v in pairs(buttons) do
        SetDiscordRichPresenceAction(i - 1, v.text, v.value)
    end
end

CreateThread(function()
    while c.Enabled do
        TriggerServerEvent("mmo-smallresources:getPlayerCount")

        if showPlayerCount then
            SetRichPresence('Players: ' .. pcount .. '/' .. c.MaxPlayers)
        end

        Wait(c.UpdateRate)
    end
end)
