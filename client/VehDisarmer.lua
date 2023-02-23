CreateThread(function()
    while true do
        Wait(0)
        if DoesVehicleHaveWeapons(GetVehiclePedIsUsing(PlayerPedId(), false)) == 1 then
            local vehDesarmer = GetVehiclePedIsUsing(PlayerPedId(), false)
            if Config.DisableVehicleWeapons then
                local weapons = GetVehicleProperties(vehDesarmer).Weapons
                for i = 1, #weapons do
                    DisableVehicleWeapon(true, weapons[i], vehDesarmer, PlayerPedId())
                end
            else
                for i = 1, #Config.VehicleWeapons do
                    DisableVehicleWeapon(true, Config.VehicleWeapons[i], vehDesarmer, PlayerPedId())
                end
            end
        end
    end
end)
