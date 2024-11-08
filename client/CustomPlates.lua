if Config.CustomPlates then

    local plates = {{"plate01", "https://i.ibb.co/g7Mr88k/plate01.png", 370, 188},
                    {"plate01_n", "https://i.ibb.co/t85VbNW/plate01-n.png", 370, 189},
                    {"plate02", "https://i.ibb.co/D5MGRsN/plate02-1.png", 370, 188},
                    {"plate02_n", "https://i.ibb.co/jZ8yNcg/plate02-n-1.png", 370, 189},
                    {"plate03", "https://i.ibb.co/XD0RwL2/plate03.png", 370, 188},
                    {"plate03_n", "https://i.ibb.co/GkXPtNk/plate03-n.png", 370, 189},
                    {"plate04", "https://i.ibb.co/xXTDrmk/plate04.png", 370, 188},
                    {"plate04_n", "https://i.ibb.co/FY4qbBW/plate04-n.png", 370, 189}}

    local txd = CreateRuntimeTxd("testing")

    for _, p in ipairs(plates) do
        local duiObj = CreateDui(p[2], p[3], p[4])
        local dui = GetDuiHandle(duiObj)
        local tx = CreateRuntimeTextureFromDuiHandle(txd, "test", dui)
        AddReplaceTexture("vehshare", p[1], "testing", "test")
    end
end