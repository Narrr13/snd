require("NonuLuaLib")

function main()
    LogInfo("[Trigger] InteractTreasure")
    PathToObject("trea",false,2)
    yield('/target trea')
    yield('/interact')
    Sleep(1)
    yield('/p interacttdone')
end


main()