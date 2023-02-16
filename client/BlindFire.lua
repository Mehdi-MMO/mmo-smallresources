if Config.BlindFire then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5)
            local ped = PlayerPedId()
            if IsPedInCover(ped, 1) and not IsPedAimingFromCover(ped, 1) then
                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 142, true) -- Melee Attack 1
                DisableControlAction(0, 257, true) -- Attack 2
            end
        end
    end)
end
