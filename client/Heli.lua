if Config.Heli then
    local UI = {
        x = -0.36,
        y = 0.22
    }

    function Text(text, x, y, scale)
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

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1)

            local Ped = GetPlayerPed(-1)
            local inHeli = IsPedInAnyHeli(Ped)
            local PedVehicle = GetVehiclePedIsIn(Ped, false)
            local HeliSpeed = GetEntitySpeed(PedVehicle) * 2.24
            local Engine = GetIsVehicleEngineRunning(PedVehicle)
            local Height = GetEntityHeightAboveGround(PedVehicle)
            local MainRotorHealth = GetHeliMainRotorHealth(PedVehicle)
            local TailRotorHealth = GetHeliTailRotorHealth(PedVehicle)

            if inHeli then
                -- engine display
                if Engine then
                    Text("~g~ENG", UI.x + 0.4016, UI.y + 0.476, 0.55)
                    Text("~g~__", UI.x + 0.4016, UI.y + 0.47, 0.79)
                else
                    Text("~r~ENG", UI.x + 0.4016, UI.y + 0.476, 0.55)
                    Text("~r~__", UI.x + 0.4016, UI.y + 0.47, 0.79)
                end

                -- Main rotor display
                if MainRotorHealth > 800 and Engine then
                    Text("~g~MAIN", UI.x + 0.4516, UI.y + 0.476, 0.55)
                    Text("~g~__", UI.x + 0.4516, UI.y + 0.47, 0.79)
                elseif MainRotorHealth > 200 and MainRotorHealth < 800 and Engine then
                    Text("~y~MAIN", UI.x + 0.4516, UI.y + 0.476, 0.55)
                    Text("~y~__", UI.x + 0.4516, UI.y + 0.47, 0.79)
                elseif MainRotorHealth < 200 and Engine then
                    Text("~r~MAIN", UI.x + 0.4516, UI.y + 0.476, 0.55)
                    Text("~r~__", UI.x + 0.4516, UI.y + 0.47, 0.79)
                else
                    Text("~r~MAIN", UI.x + 0.4516, UI.y + 0.476, 0.55)
                    Text("~r~__", UI.x + 0.4516, UI.y + 0.47, 0.79)
                end

                -- Tail rotor display
                if TailRotorHealth > 300 and Engine then
                    Text("~g~TAIL", UI.x + 0.5, UI.y + 0.476, 0.55)
                    Text("~g~__", UI.x + 0.5, UI.y + 0.47, 0.79)
                elseif TailRotorHealth > 100 and TailRotorHealth < 300 and Engine then
                    Text("~y~TAIL", UI.x + 0.5, UI.y + 0.476, 0.55)
                    Text("~y~__", UI.x + 0.5, UI.y + 0.47, 0.79)
                elseif TailRotorHealth < 100 and Engine then
                    Text("~r~TAIL", UI.x + 0.5, UI.y + 0.476, 0.55)
                    Text("~r~__", UI.x + 0.5, UI.y + 0.47, 0.79)
                elseif Engine == false then
                    Text("~r~TAIL", UI.x + 0.5, UI.y + 0.476, 0.55)
                    Text("~r~__", UI.x + 0.5, UI.y + 0.47, 0.79)
                end

                -- Altitude and speed display
                Text(math.ceil(Height), UI.x + 0.549, UI.y + 0.476, 0.45)
                Text("ALTITUDE", UI.x + 0.549, UI.y + 0.502, 0.29)

                Text(math.ceil(HeliSpeed), UI.x + 0.598, UI.y + 0.476, 0.45)
                Text("AIR SPEED", UI.x + 0.598, UI.y + 0.502, 0.29)

                if HeliSpeed < 0.9 and HeliSpeed > 0.1 then
                    Text("1", UI.x + 0.598, UI.y + 0.476, 0.45)
                elseif HeliSpeed == 0.0 then
                    Text("0", UI.x + 0.598, UI.y + 0.476, 0.45)
                end

                -- Big rectangels on the ui
                DrawRect(UI.x + 0.5, UI.y + 0.5, 0.255, 0.085, 25, 25, 25, 255)
                DrawRect(UI.x + 0.5, UI.y + 0.5, 0.25, 0.075, 51, 51, 51, 255)

                -- Smaller squares in the rectangels.
                DrawRect(UI.x + 0.402, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
                DrawRect(UI.x + 0.4516, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
                DrawRect(UI.x + 0.5, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
                DrawRect(UI.x + 0.549, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)
                DrawRect(UI.x + 0.598, UI.y + 0.5, 0.040, 0.050, 25, 25, 25, 255)

                -- Slows down helicopter on landing and takeoff but not if it's flying fast close to the ground.
                if HeliSpeed > 15.0 and Height < 30.0 then
                    SetEntityMaxSpeed(PedVehicle, 300.0)
                elseif HeliSpeed > 15.0 and Height < 10.0 then
                    SetEntityMaxSpeed(PedVehicle, 20.0)
                elseif Height < 3.0 then
                    SetEntityMaxSpeed(PedVehicle, 1.0)
                elseif Height < 5.0 then
                    SetEntityMaxSpeed(PedVehicle, 2.0)
                elseif Height > 5.0 and Height < 10.0 then
                    SetEntityMaxSpeed(PedVehicle, 3.0)
                elseif Height > 10.0 and Height < 15.0 then
                    SetEntityMaxSpeed(PedVehicle, 4.0)
                elseif Height > 15.0 and Height < 20.0 then
                    SetEntityMaxSpeed(PedVehicle, 6.0)
                elseif Height > 20.0 and Height < 25.0 then
                    SetEntityMaxSpeed(PedVehicle, 7.0)
                elseif Height > 25.0 and Height < 30.0 then
                    SetEntityMaxSpeed(PedVehicle, 10.0)
                elseif Height > 30.0 then
                    SetEntityMaxSpeed(PedVehicle, 300.0)
                end
            end
        end
    end)

    Citizen.CreateThread(function()
        local Ped = GetPlayerPed(-1)
        while true do
            Citizen.Wait(1)

            local PedVehicle = GetVehiclePedIsIn(Ped, false)
            if IsPedInAnyHeli(Ped) and GetIsVehicleEngineRunning(PedVehicle) then
                local HeliSpeed = GetEntitySpeed(PedVehicle) * 2.24
                local Height = GetEntityHeightAboveGround(PedVehicle)

                -- Shuts down engine 5 seconds after landing.
                if Height < 3.0 and HeliSpeed == 0 then
                    Citizen.Wait(5000)
                    SetVehicleEngineOn(PedVehicle, false, true, true)
                end
            end
        end
    end)

end
