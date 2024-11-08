if Config.Blips then
    Citizen.CreateThread(function()
        for _, info in pairs(Config.TheBlips) do
            if info.vector3 and info.title and info.id and info.colour then
                local blip = AddBlipForCoord(info.vector3.x, info.vector3.y, info.vector3.z)
                
                SetBlipSprite(blip, info.id)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, 0.9)
                SetBlipColour(blip, info.colour)
                SetBlipAsShortRange(blip, true)
                
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(info.title)
                EndTextCommandSetBlipName(blip)
            else
                print("Warning: Invalid blip data (Config.TheBlips)")
            end
        end
    end)
end
