if Config.ManagedDensity then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            SetVehicleDensityMultiplierThisFrame(Config.GeneratorsDensity['vehicle'])
            SetParkedVehicleDensityMultiplierThisFrame(Config.GeneratorsDensity['parked'])
            SetRandomVehicleDensityMultiplierThisFrame(Config.GeneratorsDensity['multiplier'])
            SetPedDensityMultiplierThisFrame(Config.GeneratorsDensity['peds'])
            SetScenarioPedDensityMultiplierThisFrame(Config.GeneratorsDensity['actions'], Config.GeneratorsDensity['actions'])
        end
    end)
elseif Config.TrafficZones then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            for i = 1, #Config.TrafficArea do
                ClearAreaOfPeds(Config.TrafficArea[i].pos.x, Config.TrafficArea[i].pos.y, Config.TrafficArea[i].pos.z,
                    Config.TrafficArea[i].radius, false, false, false, false, false)
                ClearAreaOfVehicles(Config.TrafficArea[i].pos.x, Config.TrafficArea[i].pos.y,
                    Config.TrafficArea[i].pos.z, Config.TrafficArea[i].radius, false, false, false, false, false)
            end
        end
    end)
end
