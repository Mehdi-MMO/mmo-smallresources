if Config.DriveBy then
    local passengerDriveBy = true

    Citizen.CreateThread(function()
        while true do
            Wait(1)
            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
            local speed = GetEntitySpeed(vehicle)
            local kmh = 3.6
            local mph = 2.23694
            local vehicleClass = GetVehicleClass(vehicle)
            local vehicleModel = GetEntityModel(vehicle)

            if vehicleClass ~= 15 and 16 then
                GetEntitySpeed(GetPedInVehicleSeat(GetPlayerPed(-1), false))
                -- If you want mph, then replace kmh with mph under here. If you want more or less than 30 also change it here
                if math.floor(speed * mph) > Config.DriveBySpeed then
                    SetPlayerCanDoDriveBy(PlayerId(), false)
                elseif passengerDriveBy then
                    SetPlayerCanDoDriveBy(PlayerId(), true)
                else
                    SetPlayerCanDoDriveBy(PlayerId(), false)
                end
            end
        end
    end)
end
