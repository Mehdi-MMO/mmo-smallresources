local cachedPlayers = {}
local printed = true

RegisterNetEvent("mmo-smallresources:playerDisconnect")
AddEventHandler("mmo-smallresources:playerDisconnect", function(player, info)
    cachedPlayers[player] = info

    for playerID, details in pairs(cachedPlayers) do
        if printed then
            print("^3" .. details.name .. " ^7(ID: ^3" .. details.srco .. "^7) disconnected [" .. details.date .. "] - Reason: ^3" .. details.res)
            printed = false
        end
    end

    cachedPlayers[player] = nil
end)