if Config.HandsUp.enabled then

    local handsStatus = false
    local surrenderStatus = false

    local function RequestAndWaitForAnimDict(dict)
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(100)
        end
    end

    local function check(ped)
        if not IsEntityDead(ped) and not IsPedDeadOrDying(ped) and not IsPlayerFreeAiming(ped) and
            not IsPedAimingFromCover(ped) and not IsPedSwimming(ped) and not IsPedShooting(ped) and
            not IsPedClimbing(ped) and not IsPedCuffed(ped) and not IsPedDiving(ped) and not IsPedFalling(ped) and
            not IsPedJumping(ped) and not IsPedJumpingOutOfVehicle(ped) and IsPedOnFoot(ped) and not IsPedRunning(ped) and
            not IsPedInParachuteFreeFall(ped) and not IsPedSprinting(ped) then
            return true
        else
            return false
        end
    end

    function hands(bool)
        local ped = PlayerPedId()

        local dict = 'missminuteman_1ig_2'

        if check(ped) then
            if bool then
                RequestAndWaitForAnimDict(dict)
                TaskPlayAnim(ped, dict, 'handsup_enter', 8.0, 8.0, -1, 50, 0, false, false, false)
                handsStatus = true
            else
                ClearPedTasks(ped)
                handsStatus = false
            end
        end
    end

    function surrender(bool)
        local ped = PlayerPedId()

        local dict = 'random@arrests'

        if check(ped) == true then
            if bool then
                RequestAndWaitForAnimDict(dict)
                TaskPlayAnim(ped, dict, "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0)
                surrenderStatus = true
            else
                ClearPedTasks(ped)
                surrenderStatus = false
            end
        end
    end

    RegisterCommand('surrender', function()
        surrender(not surrenderStatus)
    end)

    RegisterCommand('handsup', function()
        hands(not handsStatus)
    end)

    RegisterKeyMapping('handsup', 'Toggle Hands Up', 'KEYBOARD', Config.HandsUp.keybind)
    RegisterKeyMapping('surrender', 'Toggle Surrender', 'KEYBOARD', Config.HandsUp.surrender)

end
