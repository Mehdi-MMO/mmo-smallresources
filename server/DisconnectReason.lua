local cached_players = {}

if Config.DisconnectReason then
    AddEventHandler('playerDropped', function(reason)
        local src = source
        local pCoords = GetEntityCoords(GetPlayerPed(source))
        cached_players[source] = {
            res = reason,
            date = os.date("%d/%m %X"),
            name = GetPlayerName(src),
            srco = src,
            coords = pCoords
        }
        TriggerClientEvent("mmo-smallresources:playerDisconnect", -1, source, {
            res = reason,
            date = os.date("%d/%m %X"),
            name = GetPlayerName(src),
            srco = src,
            pos = pCoords
        })
    end)

end

if Config.DisconnectTest then
    RegisterCommand(Config.DisconnectCmdName, function(source, args, rawCommand)
        local src = source
        local pCoords = GetEntityCoords(GetPlayerPed(source))
        cached_players[source] = {
            res = "Disconnect Example",
            date = os.date("%d/%m %X"),
            name = GetPlayerName(src),
            srco = src,
            coords = pCoords
        }
        TriggerClientEvent("mmo-smallresources:playerDisconnect", -1, source, {
            res = "Disconnect Example",
            date = os.date("%d/%m %X"),
            name = GetPlayerName(src),
            srco = src,
            pos = pCoords
        })
    end, false)
end
