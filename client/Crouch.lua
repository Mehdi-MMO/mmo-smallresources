if Config.Crouch then
    local isCrouched = false
    local isCrouchedForce = false
    local Aimed = false
    local Cooldown = false
    local CoolDownTime = 200

    local PlayerInfo = {
        playerPed = PlayerPedId(),
        playerID = GetPlayerIndex(),
        nextCheck = GetGameTimer() + 1500
    }

    local function NormalWalk()
        SetPedMaxMoveBlendRatio(PlayerInfo.playerPed, 1.0)
        ResetPedMovementClipset(PlayerInfo.playerPed, 0.55)
        ResetPedStrafeClipset(PlayerInfo.playerPed)
        SetPedCanPlayAmbientAnims(PlayerInfo.playerPed, true)
        SetPedCanPlayAmbientBaseAnims(PlayerInfo.playerPed, true)
        ResetPedWeaponMovementClipset(PlayerInfo.playerPed)
        isCrouched = false
    end

    local function SetupCrouch()
        while not HasAnimSetLoaded('move_ped_crouched') do
            Citizen.Wait(10)
            RequestAnimSet('move_ped_crouched')
        end
    end

    local function RemoveCrouchAnim()
        RemoveAnimDict('move_ped_crouched')
    end

    local function CanCrouch()
        local ped = PlayerInfo.playerPed
        return IsPedOnFoot(ped) and not IsPedInAnyVehicle(ped, false) and 
               not IsPedJumping(ped) and not IsPedFalling(ped) and not IsPedDeadOrDying(ped)
    end

    local function CrouchPlayer()
        SetPedUsingActionMode(PlayerInfo.playerPed, false, -1, "DEFAULT_ACTION")
        SetPedMovementClipset(PlayerInfo.playerPed, 'move_ped_crouched', 0.55)
        SetPedStrafeClipset(PlayerInfo.playerPed, 'move_ped_crouched_strafing')
        isCrouched = true
        Aimed = false
    end

    local function SetPlayerAimSpeed()
        SetPedMaxMoveBlendRatio(PlayerInfo.playerPed, 0.2)
        Aimed = true
    end

    local function IsPlayerFreeAimed()
        return IsPlayerFreeAiming(PlayerInfo.playerID) or IsAimCamActive() or IsAimCamThirdPersonActive()
    end

    local function CrouchLoop()
        SetupCrouch()

        while isCrouchedForce do
            Citizen.Wait(10)

            local now = GetGameTimer()
            if now >= PlayerInfo.nextCheck then
                PlayerInfo.playerPed = PlayerPedId()
                PlayerInfo.playerID = GetPlayerIndex()
                PlayerInfo.nextCheck = now + 1500
            end

            local canCrouch = CanCrouch()
            if canCrouch and isCrouched and IsPlayerFreeAimed() then
                SetPlayerAimSpeed()
            elseif canCrouch and (not isCrouched or Aimed) then
                CrouchPlayer()
            elseif not canCrouch and isCrouched then
                isCrouchedForce = false
                NormalWalk()
            end
        end

        NormalWalk()
        RemoveCrouchAnim()
    end

    RegisterCommand('crouch', function()
        DisableControlAction(0, 36, true)

        if not Cooldown then
            isCrouchedForce = not isCrouchedForce

            if isCrouchedForce then
                Citizen.CreateThread(CrouchLoop)
            end

            Cooldown = true
            SetTimeout(CoolDownTime, function()
                Cooldown = false
            end)
        end
    end, false)

    RegisterKeyMapping('crouch', 'Crouch', 'keyboard', 'LCONTROL')
end
