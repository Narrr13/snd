require("NonuLuaLib")

function main()
    LogInfo("[Trigger] InteractTreasure")
    PathToObject("trea",false,3)
    yield('/target trea')
    yield('/interact')
    Sleep(1)
    yield('/p intertdone')
end



main()
