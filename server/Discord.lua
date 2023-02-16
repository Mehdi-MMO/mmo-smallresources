RegisterServerEvent("mmo-smallresources:getPlayerCount")
AddEventHandler("mmo-smallresources:getPlayerCount", function()
    TriggerClientEvent("mmo-smallresources:playerCount", source, #GetPlayers())
end)
