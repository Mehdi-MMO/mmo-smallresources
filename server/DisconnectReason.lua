local cached_players = {}

if Config.DisconnectReason then
    AddEventHandler('playerDropped', function(reason)
        local src = source
        local playerPed = GetPlayerPed(src)
        
        if playerPed then
            local pCoords = GetEntityCoords(playerPed)
            cached_players[src] = {
                res = reason,
                date = os.date("%d/%m %X"),
                name = GetPlayerName(src),
                srco = src,
                coords = pCoords
            }
            
            TriggerClientEvent("mmo-smallresources:playerDisconnect", -1, src, {
                res = reason,
                date = os.date("%d/%m %X"),
                name = GetPlayerName(src),
                srco = src,
                pos = pCoords
            })
        end
    end)
end

if Config.DisconnectTest then
    RegisterCommand(Config.DisconnectCmdName, function(src)
        local playerPed = GetPlayerPed(src)
    
        if playerPed then
            local pCoords = GetEntityCoords(playerPed)
            cached_players[src] = {
                res = "Disconnect Example",
                date = os.date("%d/%m %X"),
                name = GetPlayerName(src),
                srco = src,
                coords = pCoords
            }
            
            TriggerClientEvent("mmo-smallresources:playerDisconnect", -1, src, {
                res = "Disconnect Example",
                date = os.date("%d/%m %X"),
                name = GetPlayerName(src),
                srco = src,
                pos = pCoords
            })
        end
    end, false)
end
