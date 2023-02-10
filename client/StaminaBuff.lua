if Config.StaminaBuff then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            RestorePlayerStamina(GetPlayerPed(-1), 2.0)
        end
    end)
end
