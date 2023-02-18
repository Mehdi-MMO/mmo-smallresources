if Config.Crouch then
    Crouched = false
    CrouchedForce = false
    Aimed = false
    LastCam = 0

    local NormalWalk = function()
        local Player = PlayerPedId()
        SetPedMaxMoveBlendRatio(Player, 1.0)
        ResetPedMovementClipset(Player, 0.55)
        ResetPedStrafeClipset(Player)
        SetPedCanPlayAmbientAnims(Player, true)
        SetPedCanPlayAmbientBaseAnims(Player, true)
        ResetPedWeaponMovementClipset(Player)
        Crouched = false
    end

    local SetupCrouch = function()
        while not HasAnimSetLoaded('move_ped_crouched') do
            Citizen.Wait(5)
            RequestAnimSet('move_ped_crouched')
        end
    end

    local RemoveCrouchAnim = function()
        RemoveAnimDict('move_ped_crouched')
    end

    local CanCrouch = function()
        local PlayerPed = PlayerPedId()
        return IsPedOnFoot(PlayerPed) and not IsPedJumping(PlayerPed) and not IsPedFalling(PlayerPed) and not IsPedDeadOrDying(PlayerPed)
    end

    local CrouchPlayer = function()
        local Player = PlayerPedId()
        SetPedUsingActionMode(Player, false, -1, "DEFAULT_ACTION")
        SetPedMovementClipset(Player, 'move_ped_crouched', 0.55)
        SetPedStrafeClipset(Player, 'move_ped_crouched_strafing')
        SetWeaponAnimationOverride(Player, "Ballistic")
        Crouched = true
        Aimed = false
    end

    local SetPlayerAimSpeed = function()
        local Player = PlayerPedId()
        SetPedMaxMoveBlendRatio(Player, 0.2)
        Aimed = true
    end

    local IsPlayerFreeAimed = function()
        local PlayerID = GetPlayerIndex()
        return IsPlayerFreeAiming(PlayerID) or IsAimCamActive() or IsAimCamThirdPersonActive()
    end

    local CrouchLoop = function()
        SetupCrouch()
        while CrouchedForce do
            local CanDo = CanCrouch()
            if CanDo and Crouched and IsPlayerFreeAimed() then
                SetPlayerAimSpeed()
            elseif CanDo and (not Crouched or Aimed) then
                CrouchPlayer()
            elseif not CanDo and Crouched then
                CrouchedForce = false
                NormalWalk()
            end

            local NowCam = GetFollowPedCamViewMode()
            if CanDo and Crouched and NowCam == 4 then
                SetFollowPedCamViewMode(LastCam)
            elseif CanDo and Crouched and NowCam ~= 4 then
                LastCam = NowCam
            end

            Citizen.Wait(5)
        end
        NormalWalk()
        RemoveCrouchAnim()
    end

    --[[
    Just trying to make a custom keybind still testing this out
    
    RegisterCommand('crouch', function()
        DisableControlAction(0, 36, true)
        CrouchedForce = not CrouchedForce
        if CrouchedForce then
            CreateThread(CrouchLoop)
        end

    end, false)

    RegisterKeyMapping('crouch', 'Crouch', 'keyboard', 'LCONTROL') 
    ]]
end
