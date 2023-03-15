if Config.HideHud then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            for _, v in pairs(Config.HudElements) do
                if v.hidden then
                    HideHudComponentThisFrame(v.id)
                end
            end
        end
    end)
end