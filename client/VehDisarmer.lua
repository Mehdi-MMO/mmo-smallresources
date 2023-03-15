Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            if GetPedInVehicleSeat(vehicle, -1) == ped then
                if Config.DisableVehicleWeapons then
                    for i = 1, GetVehicleMaxNumberOfWeapons(vehicle) do
                        local weapon = GetVehicleWeapon(vehicle, i - 1)
                        if weapon ~= -1569615261 and weapon ~= -1312131151 then -- excluding unarmed and sticky bombs
                            DisableVehicleWeapon(true, weapon, vehicle, ped)
                        end
                    end
                else
                    for i, model in ipairs(Config.VehicleWeapons) do
                        if GetEntityModel(vehicle) == model then
                            for j = 1, GetVehicleMaxNumberOfWeapons(vehicle) do
                                local weapon = GetVehicleWeapon(vehicle, j - 1)
                                if weapon ~= -1569615261 and weapon ~= -1312131151 then -- excluding unarmed and sticky bombs
                                    DisableVehicleWeapon(true, weapon, vehicle, ped)
                                end
                            end
                            break
                        end
                    end
                end
            end
        end
    end
end)