if Config.VehRewards then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1)
            id = PlayerId()
            DisablePlayerVehicleRewards(id)
        end
    end)
end
