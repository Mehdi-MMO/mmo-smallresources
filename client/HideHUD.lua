if Config.HideHud then

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            for _, val in pairs(Config.HudElements) do
                if val.hidden then
                    HideHudComponentThisFrame(val.id)
                end
            end
        end
    end)
end
