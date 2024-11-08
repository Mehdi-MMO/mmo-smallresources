if Config.DisableAmbientSounds then
    Citizen.CreateThread(function()
        SetAmbientZoneListStatePersistent("AZL_DLC_Hei4_Island_Disabled_Zones", false, true)
        SetAmbientZoneListStatePersistent("AZL_DLC_Hei4_Island_Zones", true, true)
        
        SetAudioFlag("DisableFlightMusic", true)
        SetAudioFlag("PoliceScannerDisabled", true)
        
        SetDeepOceanScaler(0.0)

        SetRandomEventFlag(false)

        local scenarios = {
            "WORLD_VEHICLE_BIKE_OFF_ROAD_RACE", "WORLD_VEHICLE_BUSINESSMEN", "WORLD_VEHICLE_EMPTY",
            "WORLD_VEHICLE_MECHANIC", "WORLD_VEHICLE_MILITARY_PLANES_BIG", "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
            "WORLD_VEHICLE_POLICE_BIKE", "WORLD_VEHICLE_POLICE_CAR", "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
            "WORLD_VEHICLE_SALTON_DIRT_BIKE", "WORLD_VEHICLE_SALTON", "WORLD_VEHICLE_STREETRACE"
        }
        
        for _, scenario in ipairs(scenarios) do
            SetScenarioTypeEnabled(scenario, false)
        end

        local emitters = {
            "LOS_SANTOS_VANILLA_UNICORN_01_STAGE", "LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM",
            "LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM", "se_dlc_aw_arena_construction_01",
            "se_dlc_aw_arena_crowd_background_main", "se_dlc_aw_arena_crowd_exterior_lobby",
            "se_dlc_aw_arena_crowd_interior_lobby"
        }

        for _, emitter in ipairs(emitters) do
            SetStaticEmitterEnabled(emitter, false)
        end

        StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
        StartAudioScene("DLC_MPHEIST_TRANSITION_TO_APT_FADE_IN_RADIO_SCENE")
        StartAudioScene("FBI_HEIST_H5_MUTE_AMBIENCE_SCENE")
    end)
end
