local canHandsUp = false

if Config.HandsUp then
    canHandsUp = true
end

AddEventHandler('handsup:toggle', function(param)
    canHandsUp = param
end)

Citizen.CreateThread(function()
    local handsup = false
    local playerPed = PlayerPedId()

    RequestAnimDict('random@mugging3')
    while not HasAnimDictLoaded('random@mugging3') do
        Citizen.Wait(100)
    end

    while true do
        Citizen.Wait(0)
        if canHandsUp and IsControlJustReleased(0, Config.HandsUpKeybind) then
            if handsup then
                handsup = false
                ClearPedTasks(playerPed)
            else
                handsup = true
                TaskPlayAnim(playerPed, 'random@mugging3', 'handsup_standing_base', 8.0, -8.0, -1, 49, 0, 0, 0, 0)
            end
        end
    end
end)
