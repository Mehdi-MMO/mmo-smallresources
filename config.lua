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
    ["LEFTCTRL"] = 36,
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

Config.HandsUp = {
    ['enabled'] = true,
    ['keybind'] = 'X',
    ['surrender'] = 'F9'
}

Config.AimAssist = true -- True to remove aim assist on controllers. False to allow
Config.BlindFire = true -- True to stop players from blind firing around corners. False to allow blind firing around corners
Config.Crouch = true -- True to add updated crouch feature, false to ignore (Left Ctrl to use crouch)
Config.CustomPlates = false -- Custom California plates stream
Config.DisableAmbientSounds = true -- True Lowers the noises of ammunations gun range, false leaves native ambiance
Config.DisconnectReason = true -- Send a message in the console for all clients with who disconnected and the reason
Config.DisconnectTest = true -- if you want to test it
Config.DisconnectCmdName = "disconnecttest" -- command name for test
Config.DriveBy = true -- True to stop players from shooting from a moving vehicle going above 30mph. False to diable.(Find the lines below in client.lua and change 30 to whatever speed you want set)
Config.DriveBySpeed = 30 -- In MPH
Config.HeadLightsStrength = 10 -- There's no limit, recommended to go above 10.0 to blind em people
Config.HealthRegen = false -- True stops native health regeneration, false allows native health regeneration to happen
Config.Heli = true -- Helicopter HUD and Realisitc takeoff/landing
Config.HornFlash = true -- Flash headlights when car horn is active
Config.HornFlashEmerg = false -- for emergency vehicles only
Config.IdleCam = true -- True Stops the native camera from panning around when player stands idle, false allows
Config.JumpSpam = true -- True to stop players from jumping spamming, gives rag doll chance when jumping. False to disable
Config.PID = true -- Toggle Player ID above their head with left alt
Config.PIDToggleKey = Keys["LEFTALT"]
Config.PistolWhip = true -- True to turn off pistol whipping, false to allow
Config.PointKeybind = Keys["B"]
Config.PVP = true
Config.StaminaBuff = true -- True to give staminia buff, allowing longer running. False to disable.
Config.VehRewards = true -- True to disable vehicle rewards (guns from cars). False to enable vehicle rewards
Config.WeaponDrops = true -- True to stop NPC wewapon drop rewards. False to allow NPC to drop weapon rewards

Config.HideHud = true -- hide hud element below
-- IF SET TO TRUE, IT WILL FORCE SHOW IT! DELETE THE LINE THE CONFIG OR COMMENT IT!
Config.HudElements = {
    HUD_WANTED_STARS = { id = 1, hidden = true },
    HUD_WEAPON_ICON = { id = 2, hidden = true },
    HUD_CASH = { id = 3, hidden = true },
    HUD_MP_CASH = { id = 4, hidden = true },
    HUD_VEHICLE_NAME = { id = 6, hidden = true },
    HUD_AREA_NAME = { id = 7, hidden = true },
    HUD_VEHICLE_CLASS = { id = 8, hidden = true },
    HUD_STREET_NAME = { id = 9, hidden = true },
    HUD_CASH_CHANGE = { id = 13, hidden = true },
    HUD_RETICLE = { id = 14, hidden = true },
    HUD_SAVING_GAME = { id = 17, hidden = true },    -- True to hide the hud element
}

Config.DisableVehicleWeapons = true -- True to disable all weapons, false to disable specific weapons AND only use DisableWeapons = false if you are using the Config.VehicleWeapons below
Config.VehicleWeapons = {
    GetHashKey("buzzard"),
    GetHashKey("insurgent"),
}

Config.ManagedDensity = true
Config.GeneratorsDensity = {
    ['vehicle'] = 0.8,
    ['parked'] = 0.8,
    ['multiplier'] = 0.8,
    ['peds'] = 0.8,
    ['actions'] = 0.8
}

Config.DynamicPedSpawner = true -- Adjusts the ped spawn rate based on the time of day and weather conditions
Config.dspawnRadius = 100.0 -- Normal peds spawn density from Config.GeneratorsDensity
Config.dspawnLocations = {
    { x = -73.0, y = -818.0, z = 243.0 },
    { x = 284.0, y = -1313.0, z = 32.0 },
    { x = -164.0, y = -1001.0, z = 233.0 },
    { x = 267.0, y = -1748.0, z = 29.0 }
}

-- If ManagedDensity is enabled this will be kept disabled.
Config.TrafficZones = false -- True to disable generators, false to allow generators of peds and vehicles
Config.TrafficArea = { -- Add or remove generators below
    { pos = vector3( -1539.89, -992.49, 13.02), radius = 100 }, -- Del Perro Pier parking lot
    { pos = vector3( -50.82, -1114.05, 26.44),  radius = 100 }, -- Premium Deluxe Motors Dealership
    { pos = vector3(824.36, -998.82, 26.29),    radius = 100 }, -- La Mesa Gas Station
    { pos = vector3(922.22, 50.87, 80.9),       radius = 200 }, -- Diamond Casino
}

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
  