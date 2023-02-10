if Config.BlindFire then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5)
            local ped = PlayerPedId()
            if IsPedInCover(ped, 1) and not IsPedAimingFromCover(ped, 1) then
                DisableControlAction(2, 24, true)
                DisableControlAction(2, 142, true)
                DisableControlAction(2, 257, true)
            end
        end
    end)
end
