if Config.JumpSpam then
    local ragdoll_chance = 0.5
    local ragdoll_time = 5000
    local ragdoll_flags = 1 + 2

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(100)
            local ped = PlayerPedId()
            if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and
                not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
                if math.random() < ragdoll_chance then
                    Citizen.Wait(600)
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
                    SetPedToRagdoll(ped, ragdoll_time, ragdoll_flags, 0, false, true, false)
                else
                    Citizen.Wait(2000)
                end
            end
        end
    end)
end
