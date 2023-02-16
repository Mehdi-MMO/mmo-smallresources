if Config.HideHud then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            for i = 1, #Config.HudElements do
                if Config.HudElements[i].hidden then
                    HideHudComponentThisFrame(Config.HudElements[i].id)
                end
            end
        end
    end)
end
