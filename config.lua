Config = {}

Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168,
    ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160,
    ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83,
    ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246,
    ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34,
    ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249,
    ["M"] = 244, [","] = 82, ["."] = 81, ["LCONTROL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174,
    ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107,
    ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

--------------------------------------------------------
-- Player Actions Configuration
--------------------------------------------------------

Config.PVP = true                            -- Set to true to enable player vs. player combat
Config.IdleCam = true                        -- Set to true to stop the native camera from panning around when the player stands idle
Config.HandsUp = true                        -- Enable "Hands Up" action
Config.HealthRegen = true                    -- Enables health regeneration
Config.StaminaBuff = true                    -- Set to true to give a stamina buff allowing longer running
Config.Crouch = true                         -- Enable crouch action
Config.AimAssist = true                      -- Disable aim assist on controllers
Config.BlindFire = true                      -- Prevent blind firing around corners
Config.PistolWhip = true                     -- Disable pistol whipping
Config.PointKeybind = Keys["B"]              -- Sets key for pointing action
Config.JumpSpam = true                       -- Prevent jump spamming with rag dolling chance
Config.DisconnectReason = true               -- Shows a disconnect reason in console
Config.DisconnectTest = true                 -- Enables disconnect test
Config.DisconnectCmdName = "disconnecttest"  -- Command name for disconnect test
Config.PID = true                            -- Set to true to toggle player ID above their head with left alt
Config.PIDToggleKey = Keys["LEFTALT"]        -- The keybind to toggle player ID.
Config.WeaponDrops = true                    -- Set to true to prevent NPC weapon drop rewards

--------------------------------------------------------
-- Vehicle Settings
--------------------------------------------------------

Config.CustomPlates = true        -- Enable custom license plates
Config.DriveBy = true             -- Prevent shooting from moving vehicles above speed limit
Config.DriveBySpeed = 30          -- Speed limit for drive-by shooting (in MPH)
Config.HeadLightsStrength = 12.0  -- Headlight strength
Config.lockVehicles = false       -- Lock AI traffic and/or parked vehicles
Config.lockChance = 5             -- Lock percentage for vehicles
Config.lockDistance = 5           -- Maximum check distance for locked vehicles
Config.parkedOnly = false         -- Lock only parked vehicles if true
Config.HornFlash = true           -- Flash headlights when horn is active
Config.HornFlashEmerg = false     -- Limit flashing to emergency vehicles
Config.VehRewards = true          -- Set to true to disable vehicle rewards (guns from police cars). Set to false to enable vehicle rewards
Config.HeliHUD = {                
    hud = true,                   -- Enable helicopter HUD
    realisitc = true,             -- Enable realistic takeoff/landing
    UIPosition = { x = -0.36, y = 0.22 }
}               

--------------------------------------------------------
-- HUD and Interface Settings
--------------------------------------------------------

Config.weaponReticle = true       -- Remove reticle for all weapons except snipers
Config.HideHud = true             -- Hide specific HUD elements (set below)
Config.HudElements = {            -- List of HUD elements to hide
    HUD_WANTED_STARS = 1, HUD_WEAPON_ICON = 2, HUD_CASH = 3, HUD_MP_CASH = 4,
    HUD_VEHICLE_NAME = 6, HUD_AREA_NAME = 7, HUD_VEHICLE_CLASS = 8,
    HUD_STREET_NAME = 9, HUD_CASH_CHANGE = 13, HUD_SAVING_GAME = 17
}

--------------------------------------------------------
-- Density and Spawner Configuration
--------------------------------------------------------

Config.DisableAmbientSounds = true -- Set to true to reduce the noise of the ammunations gun range. Set to false to leave native ambiance
Config.ManagedDensity = true       -- Adjust density dynamically based on time/weather
Config.DynamicPedSpawner = true    -- Adjusts pedestrian spawn rate with ManagedDensity
Config.GeneratorsDensity = {       -- Density multipliers for different entities
    ['vehicle'] = 0.8, ['parked'] = 0.8, ['multiplier'] = 0.8, ['peds'] = 0.8, ['actions'] = 0.8
}

--------------------------------------------------------
-- Blips Configuration
--------------------------------------------------------

Config.Blips = true
Config.TheBlips = {
    { title = "Del Perro Pier", colour = 266, id = 38, vector3 = vector3(-1662.0057, -1124.9044, 13.6933) },
    { title = "FBI", colour = 40, id = 498, vector3 = vector3(141.5096, -743.9552, 39.8927) }
}

--------------------------------------------------------
-- Traffic Zones Configuration
--------------------------------------------------------

Config.TrafficZones = false
Config.TrafficArea = {
    { pos = vector3(-1539.89, -992.49, 13.02), radius = 100 }, -- Del Perro Pier parking lot
    { pos = vector3(-50.82, -1114.05, 26.44), radius = 100 }, -- Premium Deluxe Motors Dealership
    { pos = vector3(824.36, -998.82, 26.29), radius = 100 }, -- La Mesa Gas Station
    { pos = vector3(922.22, 50.87, 80.9), radius = 200 }      -- Diamond Casino
}

--------------------------------------------------------
-- Discord RPC Settings
--------------------------------------------------------

Config.DiscordRPC = {
    ["Enabled"] = true,           -- Enable Discord rich presence
    ["ApplicationId"] = '00000000000000000', -- Discord app ID
    ["IconSmall"] = 'small_logo_name',       -- Small icon name for presence
    ["IconSmallHoverText"] = 'Small icon hover text',
    ["IconLarge"] = 'logo_name',             -- Large icon name for presence
    ["IconLargeHoverText"] = 'Large icon hover text',
    ["UpdateRate"] = 60000,       -- Update rate in ms for player count
    ["ShowPlayerCount"] = true,   -- Show player count in rich presence
    ["MaxPlayers"] = 48,          -- Maximum number of players
    ["Buttons"] = {               -- Optional buttons with links
        {text = 'First Button', value = 'https://discord.gg/FqQFzndxZ4'},
        {text = 'Second Button', value = 'https://discord.gg/FqQFzndxZ4'}
    }
}
