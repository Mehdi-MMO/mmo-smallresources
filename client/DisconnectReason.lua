local cached_players = {}
local b = true

RegisterNetEvent("mmo-smallresources:playerDisconnect")
AddEventHandler("mmo-smallresources:playerDisconnect", function(player, info)
    cached_players[player] = info
    for k, v in pairs(cached_players) do
        if b then
            print("^3" .. v.name .. " ^7(ID: ^3" .. v.srco .. "^7) disconnected [" .. v.date .. "] - Reason: ^3" ..
                      v.res)
            b = false
        end
    end
    if cached_players[player] ~= nil then
        cached_players[player] = nil
    end
end)
