Config = {}

Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LCONTROL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------

-- Note: You can change the keybind in the settings > key bindings > fivem.
-- Default keybinds: X for Hands Up, F9 for Surrender.
Config.HandsUp = true -- true to enable crouch & surrender, false to disable.

-- Note: You can change the keybind in the settings > key bindings > fivem.
-- Default keybinds: left control to crouch.
Config.Crouch = true -- true enable crouch, false to disable.

Config.AimAssist = true -- Set to true to remove aim assist on controllers. Set to false to allow aim assist.
Config.BlindFire = true -- Set to true to prevent blind firing around corners. Set to false to allow blind firing.
Config.CustomPlates = false -- Set to true to enable custom California license plates. Set to false to disable.
Config.DisableAmbientSounds = true -- Set to true to reduce the noise of the ammunations gun range. Set to false to leave native ambiance.

Config.DisconnectReason = true -- Set to true to display a message in the console for all clients when a player disconnects.
Config.DisconnectTest = true -- Set to true to enable a disconnect test. Set to false to disable.
Config.DisconnectCmdName = "disconnecttest" -- The command name for the disconnect test.

Config.DriveBy = true -- Set to true to prevent players from shooting from a moving vehicle going above a certain speed.
Config.DriveBySpeed = 30 -- The speed limit for drive-by shooting, in MPH.

Config.HeadLightsStrength = 12.0 -- The strength of the headlights. Recommended to go above 10.0 to blind people.
Config.HealthRegen = true -- Set to true to allow native health regeneration, Set to false to disable health regeneration.
Config.Heli = true -- Set to true to enable helicopter HUD and realistic takeoff/landing.
Config.HornFlash = true -- Set to true to flash headlights when car horn is active.
Config.HornFlashEmerg = false -- Set to true to limit headlight flashing to emergency vehicles.
Config.IdleCam = true -- Set to true to stop the native camera from panning around when the player stands idle.
Config.JumpSpam = true -- Set to true to prevent players from jumping spamming, with a chance of rag dolling. Set to false to disable.
Config.PID = true -- Set to true to toggle player ID above their head with left alt.
Config.PIDToggleKey = Keys["LEFTALT"] -- The keybind to toggle player ID.
Config.PistolWhip = true -- Set to true to disable pistol whipping. Set to false to allow pistol whipping.
Config.PointKeybind = Keys["B"] -- The keybind for pointing.
Config.PVP = true -- Set to true to enable player vs. player combat. Set to false to disable.
Config.StaminaBuff = true -- Set to true to give a stamina buff allowing longer running. Set to false to disable.
Config.VehRewards = true -- Set to true to disable vehicle rewards (guns from police cars). Set to false to enable vehicle rewards.
Config.WeaponDrops = true -- Set to true to prevent NPC weapon drop rewards. Set to false to allow NPC weapon drop rewards.

Config.weaponReticle = true -- Set to true to remove redical for all weapons except snipers
Config.HideHud = true -- Set to true to hide the HUD elements listed below.
Config.HudElements = {
    HUD_WANTED_STARS = 1,
    HUD_WEAPON_ICON = 2,
    HUD_CASH = 3,
    HUD_MP_CASH = 4,
    HUD_VEHICLE_NAME = 6,
    HUD_AREA_NAME = 7,
    HUD_VEHICLE_CLASS = 8,
    HUD_STREET_NAME = 9,
    HUD_CASH_CHANGE = 13,
    HUD_SAVING_GAME = 17,
}

Config.ManagedDensity = true
Config.DynamicPedSpawner = true -- Adjusts the ped spawn rate based on the time of day and weather conditions (ManagedDensity needs to be enabled)
Config.GeneratorsDensity = {
    ['vehicle'] = 0.8,
    ['parked'] = 0.8,
    ['multiplier'] = 0.8,
    ['peds'] = 0.8,
    ['actions'] = 0.8
}


-- Enabling ManagedDensity will disable this setting.
Config.TrafficZones = false -- If true, generators for peds and vehicles will be disabled in specified areas.
-- Add or remove zones as needed. Each zone includes a position and radius.
Config.TrafficArea = {
    { pos = vector3(-1539.89, -992.49, 13.02), radius = 100 }, -- Del Perro Pier parking lot
    { pos = vector3(-50.82, -1114.05, 26.44), radius = 100 }, -- Premium Deluxe Motors Dealership
    { pos = vector3(824.36, -998.82, 26.29), radius = 100 }, -- La Mesa Gas Station
    { pos = vector3(922.22, 50.87, 80.9), radius = 200 }, -- Diamond Casino
}


Config.lockVehicles = false -- Enabling this will lock all AI vehicles in traffic and/or parked vehicles.
Config.lockChance = 5 -- Percentage chance of vehicles being locked (100 locks all vehicles).
Config.lockDistance = 5 -- Maximum distance to check for locked vehicles.
Config.parkedOnly = false -- Setting this to true will lock only parked vehicles.


Config.Blips = true
Config.TheBlips = {
    { title = "Del Perro Pier", colour = 266, id = 38,  vector3 = vector3( -1662.0057, -1124.9044, 13.6933) },
    { title = "FBI",            colour = 40,  id = 498, vector3 = vector3(141.5096, -743.9552, 39.8927) },
}

Config.DiscordRPC = {
    ["Enabled"] = true, -- If true, discord rich presence will be enabled.
    ["ApplicationId"] = '00000000000000000', -- Discord application id
    ["IconSmall"] = 'small_logo_name', -- The small icon's name
    ["IconSmallHoverText"] = 'This is a Small icon with text', -- The small icon's hover text
    ["IconLarge"] = 'logo_name', -- The large icon's name
    ["IconLargeHoverText"] = 'This is a Large icon with text', -- The large icon's hover text
    ["UpdateRate"] = 60000, -- How frequently should the player count be updated?
    ["ShowPlayerCount"] = true, -- If true, the player count will be shown in the rich presence.
    ["MaxPlayers"] = 48, -- Maximum number of players
    ["Buttons"] = {{
        text = 'First Button',
        value = 'https://discord.gg/FqQFzndxZ4'
    }, {
        text = 'Second Button',
        value = 'https://discord.gg/FqQFzndxZ4'
    }}
}
  
