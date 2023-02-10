if Config.JumpSpam then
    local ragdoll_chance = 0.5

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(100)
            local ped = PlayerPedId()
            if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and
                not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
                if math.random() < ragdoll_chance then
                    Citizen.Wait(600)
                    ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
                    SetPedToRagdoll(ped, 5000, 1, 2)
                else
                    Citizen.Wait(2000)
                end
            end
        end
    end)
end
