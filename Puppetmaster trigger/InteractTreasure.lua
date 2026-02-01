require("NonuLuaLib")

function main()
    PathToObject("trea",false,2)
    yield('/target trea')
    Sleep(1)
    yield('/interact')
end


main()