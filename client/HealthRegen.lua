if not Config.HealthRegen then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(100)
            SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
            SetPlayerHealthRechargeLimit(PlayerId(), 0.0)
        end
    end)
end
