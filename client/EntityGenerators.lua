Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.ManagedDensity and 0 or 1000)
        if Config.ManagedDensity then
            local timeModifier = 1
            if Config.DynamicPedSpawner then
                local hour = GetClockHours()
                local weather = GetPrevWeatherTypeHashName()

                if hour >= 20 or hour < 6 then -- night time
                    timeModifier = 0.5
                end

                local weatherModifier = 1.0
                if weather == "RAIN" or weather == "THUNDER" then
                    weatherModifier = 0.75
                end

            end

            SetVehicleDensityMultiplierThisFrame(Config.GeneratorsDensity.vehicle * timeModifier)
            SetParkedVehicleDensityMultiplierThisFrame(Config.GeneratorsDensity.parked * timeModifier)
            SetRandomVehicleDensityMultiplierThisFrame(Config.GeneratorsDensity.multiplier * timeModifier)
            SetPedDensityMultiplierThisFrame(Config.GeneratorsDensity.peds * timeModifier)
            SetScenarioPedDensityMultiplierThisFrame(Config.GeneratorsDensity.actions * timeModifier,
                Config.GeneratorsDensity.actions * timeModifier)

        elseif Config.TrafficZones then
            for i = 1, #Config.TrafficArea do
                ClearAreaOfPeds(Config.TrafficArea[i].pos.x, Config.TrafficArea[i].pos.y, Config.TrafficArea[i].pos.z,
                    Config.TrafficArea[i].radius, false, false, false, false, false)
                ClearAreaOfVehicles(Config.TrafficArea[i].pos.x, Config.TrafficArea[i].pos.y,
                    Config.TrafficArea[i].pos.z, Config.TrafficArea[i].radius, false, false, false, false, false)
            end
        end
    end
end)
