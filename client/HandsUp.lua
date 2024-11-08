if Config.HandsUp then
    local handsStatus = false
    local surrenderStatus = false

    local function RequestAndWaitForAnimDict(dict)
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(100)
        end
    end

    local function canPerformAction(ped)
        return not (IsEntityDead(ped) or IsPedSwimming(ped) or IsPedInAnyVehicle(ped, true) or
                    IsPedClimbing(ped) or IsPedCuffed(ped) or IsPedDiving(ped) or IsPedFalling(ped) or
                    IsPedJumping(ped) or IsPedJumpingOutOfVehicle(ped) or IsPedRunning(ped) or
                    IsPedSprinting(ped) or IsPedInParachuteFreeFall(ped))
    end

    function hands(shouldRaiseHands)
        local ped = PlayerPedId()
        local animDict = 'missminuteman_1ig_2'
        
        if canPerformAction(ped) then
            if shouldRaiseHands then
                RequestAndWaitForAnimDict(animDict)
                TaskPlayAnim(ped, animDict, 'handsup_enter', 8.0, 8.0, -1, 50, 0, false, false, false)
                handsStatus = true
            else
                ClearPedTasks(ped)
                handsStatus = false
            end
        end
    end

    function surrender(shouldSurrender)
        local ped = PlayerPedId()
        local animDict = 'random@arrests'

        if canPerformAction(ped) then
            if shouldSurrender then
                RequestAndWaitForAnimDict(animDict)
                TaskPlayAnim(ped, animDict, "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0)
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

    RegisterKeyMapping('handsup', 'Toggle Hands Up', 'keyboard', 'X')
    RegisterKeyMapping('surrender', 'Toggle Surrender', 'keyboard', 'F9')
end
