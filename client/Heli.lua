if Config.HeliHUD.hud then
    local UI = Config.HeliHUD.UIPosition

    local function DisplayText(text, x, y, scale)
        SetTextFont(4)
        SetTextProportional(0)
        SetTextScale(scale, scale)
        SetTextEdge(1, 0, 0, 0, 150)
        SetTextDropShadow(0, 0, 0, 0, 255)
        SetTextOutline()
        SetTextJustification(0)
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(x, y)
    end

    local function DrawHeliStatus()
        local ped = GetPlayerPed(-1)
        local isInHeli = IsPedInAnyHeli(ped)
        local vehicle = GetVehiclePedIsIn(ped, false)
        local engineRunning = GetIsVehicleEngineRunning(vehicle)
        
        if isInHeli then
            local heliSpeed = GetEntitySpeed(vehicle) * 2.24  -- to MPH
            local altitude = GetEntityHeightAboveGround(vehicle)
            local mainRotorHealth = GetHeliMainRotorHealth(vehicle)
            local tailRotorHealth = GetHeliTailRotorHealth(vehicle)
            
            DisplayText(engineRunning and "~g~ENG" or "~r~ENG", UI.x + 0.4016, UI.y + 0.476, 0.55)

            if mainRotorHealth > 800 then
                DisplayText("~g~MAIN", UI.x + 0.4516, UI.y + 0.476, 0.55)
            elseif mainRotorHealth > 200 then
                DisplayText("~y~MAIN", UI.x + 0.4516, UI.y + 0.476, 0.55)
            else
                DisplayText("~r~MAIN", UI.x + 0.4516, UI.y + 0.476, 0.55)
            end

            if tailRotorHealth > 300 then
                DisplayText("~g~TAIL", UI.x + 0.5, UI.y + 0.476, 0.55)
            elseif tailRotorHealth > 100 then
                DisplayText("~y~TAIL", UI.x + 0.5, UI.y + 0.476, 0.55)
            else
                DisplayText("~r~TAIL", UI.x + 0.5, UI.y + 0.476, 0.55)
            end

            DisplayText(math.ceil(altitude), UI.x + 0.549, UI.y + 0.476, 0.45)
            DisplayText("ALTITUDE", UI.x + 0.549, UI.y + 0.502, 0.29)
            DisplayText(math.ceil(heliSpeed), UI.x + 0.598, UI.y + 0.476, 0.45)
            DisplayText("AIR SPEED", UI.x + 0.598, UI.y + 0.502, 0.29)

            DrawRect(UI.x + 0.5, UI.y + 0.5, 0.255, 0.085, 25, 25, 25, 255)
            DrawRect(UI.x + 0.5, UI.y + 0.5, 0.25, 0.075, 51, 51, 51, 255)
            DrawRect(UI.x + 0.402, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
            DrawRect(UI.x + 0.4516, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
            DrawRect(UI.x + 0.5, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
            DrawRect(UI.x + 0.549, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
            DrawRect(UI.x + 0.598, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
        end
    end

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1)
            DrawHeliStatus()
        end
    end)
end

if Config.HeliHUD.realistic then
    local function ControlHeliSpeed()
        local ped = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(ped, false)
        local altitude = GetEntityHeightAboveGround(vehicle)
        local heliSpeed = GetEntitySpeed(vehicle) * 2.24  -- to MPH

        if IsPedInAnyHeli(ped) then
            if heliSpeed > 15.0 then
                if altitude < 3.0 then SetEntityMaxSpeed(vehicle, 1.0)
                elseif altitude < 5.0 then SetEntityMaxSpeed(vehicle, 2.0)
                elseif altitude < 10.0 then SetEntityMaxSpeed(vehicle, 3.0)
                elseif altitude < 15.0 then SetEntityMaxSpeed(vehicle, 4.0)
                elseif altitude < 20.0 then SetEntityMaxSpeed(vehicle, 6.0)
                elseif altitude < 25.0 then SetEntityMaxSpeed(vehicle, 7.0)
                elseif altitude < 30.0 then SetEntityMaxSpeed(vehicle, 10.0)
                else SetEntityMaxSpeed(vehicle, 300.0)
                end
            end
        end
    end

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(100)
            ControlHeliSpeed()
        end
    end)
end