if Config.lockVehicles then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local playerPed = GetPlayerPed(-1)
            local playerCoords = GetEntityCoords(playerPed)

            local vehicles = GetGamePool("CVehicle")
            for i = 1, #vehicles do
                local vehicle = vehicles[i]
                local vehicleCoords = GetEntityCoords(vehicle)
                local distance = #(vehicleCoords - playerCoords)
                if distance <= Config.lockDistance then
                    local isLocked = GetVehicleDoorLockStatus(vehicle) >= 2
                    local driverPed = GetPedInVehicleSeat(vehicle, -1)
                    local isParked = not IsPedStill(driverPed, -1)
                    if not Config.parkedOnly or (Config.parkedOnly and isParked) then
                        if not IsPedAPlayer(driverPed) and not isLocked then
                            local randomNum = math.random(1, 100)
                            if randomNum <= Config.lockChance then
                                SetVehicleDoorsLocked(vehicle, 2)
                            end
                        end
                    end
                end
            end
        end
    end)
end
