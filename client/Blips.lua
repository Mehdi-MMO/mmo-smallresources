if Config.Blips then
    Citizen.CreateThread(function()
        for _, info in pairs(Config.TheBlips) do
            info.blip = AddBlipForCoord(info.vector3.x, info.vector3.y, info.vector3.z)
            SetBlipSprite(info.blip, info.id)
            SetBlipDisplay(info.blip, 4)
            SetBlipScale(info.blip, 0.9)
            SetBlipColour(info.blip, info.colour)
            SetBlipAsShortRange(info.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(info.title)
            EndTextCommandSetBlipName(info.blip)
        end
    end)
end
