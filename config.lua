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

Config.PID = true -- Toggle Player ID above their head with left alt
Config.PIDToggleKey = Keys["LEFTALT"]

Config.DisconnectReason = true -- Send a message in the console for all clients with who disconnected and the reason
Config.DisconnectTest = true -- if you want to test it
Config.DisconnectCmdName = "disconnecttest" -- command name for test

Config.Heli = true -- Helicopter HUD and Realisitc takeoff/landing

Config.Dispatch = true -- Disable police and ems native dispatch

Config.HealthRegen = false -- True stops native health regeneration, false allows native health regeneration to happen

Config.PVP = true

Config.HornFlash = true -- Flash headlights when car horn is active
Config.HeadLightsStrength = 10 -- There's no limit, recommended to go above 10.0 to blind em people
Config.HornFlashEmerg = false -- for emergency vehicles only

Config.IdleCam = true -- True Stops the native camera from panning around when player stands idle, false allows

Config.DisableAmbientSounds = true -- True Lowers the noises of ammunations gun range, false leaves native ambiance

Config.PistolWhip = true -- True to turn off pistol whipping, false to allow

Config.Crouch = true -- True to add updated crouch feature, false to ignore (Left Ctrl to use crouch)

Config.JumpSpam = true -- True to stop players from jumping spamming, gives rag doll chance when jumping. False to disable

Config.StaminaBuff = true -- True to give staminia buff, allowing longer running. False to disable.

Config.BlindFire = true -- True to stop players from blind firing around corners. False to allow blind firing around corners

Config.WeaponDrops = true -- True to stop NPC wewapon drop rewards. False to allow NPC to drop weapon rewards

Config.VehRewards = true -- True to disable vehicle rewards (guns from cars). False to enable vehicle rewards

Config.AimAssist = true -- True to remove aim assist on controllers. False to allow

Config.DriveBy = true -- True to stop players from shooting from a moving vehicle going above 30mph. False to diable.(Find the lines below in client.lua and change 30 to whatever speed you want set)
Config.DriveBySpeed = 30 -- In MPH

Config.HandsUp = true -- Enables the handsup emote by using the keybind below
Config.HandsUpKeybind = Keys["X"]

Config.CustomPlates = false -- Custom California plates stream

Config.PointKeybind = Keys["B"]


Config.HideHud = true -- hide hud element below
Config.HudElements = {
    HUD_WANTED_STARS = { id = 1, hidden = true }, -- True to hide the hud element
    HUD_CASH = { id = 3, hidden = true },
    HUD_MP_CASH = { id = 4, hidden = true },
    HUD_MP_MESSAGE = { id = 5, hidden = true },
    HUD_VEHICLE_NAME = { id = 6, hidden = true },
    HUD_AREA_NAME = { id = 7, hidden = true },
    HUD_VEHICLE_CLASS = { id = 8, hidden = true },
    HUD_STREET_NAME = { id = 9, hidden = true },
    HUD_HELP_TEXT = { id = 10, hidden = false },
    HUD_FLOATING_HELP_TEXT_1 = { id = 11, hidden = false },
    HUD_FLOATING_HELP_TEXT_2 = { id = 12, hidden = false },
    HUD_CASH_CHANGE = { id = 13, hidden = true },
    HUD_SAVING_GAME = { id = 17, hidden = true },
}

Config.Blips = true
Config.TheBlips = {
    {title="Del Perro Pier", colour=266, id=38, x = -1662.0057, y = -1124.9044, z = 13.6933},
    {title="FBI", colour=40, id=498, x =141.5096, y =-743.9552, z = 39.8927},
  }
  