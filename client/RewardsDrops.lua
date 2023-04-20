if Config.VehRewards then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10)
            DisablePlayerVehicleRewards(PlayerId())
        end
    end)
end

if Config.WeaponDrops then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            local handle, ped = FindFirstPed()
            local finished = false

            repeat
                if not IsEntityDead(ped) then
                    SetPedDropsWeaponsWhenDead(ped, false)
                end
                finished, ped = FindNextPed(handle)
            until not finished

            EndFindPed(handle)
        end
    end)
end
