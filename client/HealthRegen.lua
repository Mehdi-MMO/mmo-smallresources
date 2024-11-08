if not Config.HealthRegen then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(00)
            SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
            SetPlayerHealthRechargeLimit(PlayerId(), 0.0)
        end
    end)
end
