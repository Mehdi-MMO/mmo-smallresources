if Config.weaponReticle then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)

            local ped = GetPlayerPed(-1)
            local currentWeaponHash = GetSelectedPedWeapon(ped)
            local isSniper = (currentWeaponHash == 100416529 or
                              currentWeaponHash == 205991906 or
                              currentWeaponHash == -952879014 or
                              currentWeaponHash == GetHashKey('WEAPON_HEAVYSNIPER_MK2'))

            if not isSniper then
                HideHudComponentThisFrame(14)
            end
        end
    end)
end
