if Config.DriveBy then
    local passengerDriveBy = true
    local speedLimit = Config.DriveBySpeed

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(100)

            local playerPed = GetPlayerPed(-1)
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local speed = GetEntitySpeed(vehicle) * 2.23694

            local vehicleClass = GetVehicleClass(vehicle)
            if vehicleClass ~= 15 and vehicleClass ~= 16 then
                if math.floor(speed) > speedLimit then
                    SetPlayerCanDoDriveBy(PlayerId(), false)
                else
                    SetPlayerCanDoDriveBy(PlayerId(), passengerDriveBy)
                end
            end
        end
    end)
end
