local RestrictEmerOnly = false
local lightMultiplier = Config.HeadLightsStrength

if Config.HornFlash then
    if Config.HornFlashEmerg then
        RestrictEmerOnly = true
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) and GetPedInVehicleSeat(GetVehiclePedIsUsing(ped), -1) == ped then
            if not RestrictEmerOnly or GetVehicleClass(GetVehiclePedIsUsing(ped)) == 18 then
                if IsDisabledControlJustPressed(0, 86) then
                    SetVehicleLights(GetVehiclePedIsUsing(ped), 2)
                    SetVehicleLightMultiplier(GetVehiclePedIsUsing(ped), lightMultiplier)
                elseif IsDisabledControlJustReleased(0, 86) then
                    SetVehicleLights(GetVehiclePedIsUsing(ped), 0)
                    SetVehicleLightMultiplier(GetVehiclePedIsUsing(ped), 1.0)
                end
            end
        end
    end
end)
