if Config.Crouch then
    local crouched = false

    Citizen.CreateThread(function()
        local ped = GetPlayerPed(-1)

        while true do
            Citizen.Wait(1)

            if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
                if (not IsPauseMenuActive()) then
                    if (IsDisabledControlJustPressed(0, 36)) then
                        if (crouched == false) then
                            RequestAnimSet("move_ped_crouched")
                            while (not HasAnimSetLoaded("move_ped_crouched")) do
                                Citizen.Wait(100)
                            end
                            SetPedMovementClipset(ped, "move_ped_crouched", 0.25)
                            crouched = true
                        else
                            ResetPedMovementClipset(ped, 0)
                            crouched = false
                        end
                    end
                end

                DisableControlAction(0, 36, true)
            end
        end
    end)
end
