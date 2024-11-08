Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.ManagedDensity and 100 or 1000)

        if Config.ManagedDensity then
            local timeModifier = 1.0
            local weatherModifier = 1.0

            if Config.DynamicPedSpawner then
                local hour = GetClockHours()
                local weather = GetPrevWeatherTypeHashName()

                if hour >= 20 or hour < 6 then
                    timeModifier = 0.5
                end

                if weather == "RAIN" or weather == "THUNDER" then
                    weatherModifier = 0.75
                end
            end

            SetVehicleDensityMultiplierThisFrame(Config.GeneratorsDensity.vehicle * timeModifier * weatherModifier)
            SetParkedVehicleDensityMultiplierThisFrame(Config.GeneratorsDensity.parked * timeModifier * weatherModifier)
            SetRandomVehicleDensityMultiplierThisFrame(Config.GeneratorsDensity.multiplier * timeModifier * weatherModifier)
            SetPedDensityMultiplierThisFrame(Config.GeneratorsDensity.peds * timeModifier * weatherModifier)
            SetScenarioPedDensityMultiplierThisFrame(Config.GeneratorsDensity.actions * timeModifier * weatherModifier, 
                                                     Config.GeneratorsDensity.actions * timeModifier * weatherModifier)

        elseif Config.TrafficZones then
            for _, area in ipairs(Config.TrafficArea) do
                ClearAreaOfPeds(area.pos.x, area.pos.y, area.pos.z, area.radius, false, false, false, false, false)
                ClearAreaOfVehicles(area.pos.x, area.pos.y, area.pos.z, area.radius, false, false, false, false, false)
            end
        end
    end
end)
