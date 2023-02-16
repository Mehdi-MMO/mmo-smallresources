if Config.AimAssist then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local weaponHash = GetSelectedPedWeapon(PlayerId())
            if weaponHash ~= GetHashKey("WEAPON_PISTOL") then
                SetPlayerLockonRangeOverride(PlayerId(), 0.0)
            end
        end
    end)
end
