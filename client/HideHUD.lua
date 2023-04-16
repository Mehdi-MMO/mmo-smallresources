if Config.HideHud then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            for _, v in pairs(Config.HudElements) do
                HideHudComponentThisFrame(v)
            end
        end
    end)
end
