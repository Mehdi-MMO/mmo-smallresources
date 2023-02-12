if Config.Traffic then
    CreateThread(function()
        while true do
            for i = 1, #Config.TrafficArea do
                ClearAreaOfPeds(Config.TrafficArea[i].pos.x, Config.TrafficArea[i].pos.y, Config.TrafficArea[i].pos.z,
                    Config.TrafficArea[i].radius,
                    false, false, false, false, false)
                Wait(100)
                ClearAreaOfVehicles(Config.TrafficArea[i].pos.x, Config.TrafficArea[i].pos.y, Config.TrafficArea[i].pos
                .z, Config.TrafficArea[i].radius, false, false, false,
                    false, false)
                Wait(100)
            end
        end
    end)
end
