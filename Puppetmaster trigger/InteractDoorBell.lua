require("NonuLuaLib") 

function main()
    PathToObject("Arcane")
    yield('/target Arcane')
    Sleep(1)
    yield('/interact')

    PathToObject("door")
    yield('/target door')
    Sleep(1)
    yield('/interact')

    PathToObject("Gate")
    yield('/target Gate')
    Sleep(1)
    yield('/interact')

    PathToObject("Portal")
    yield('/target Portal')
    Sleep(1)
    yield('/interact')

    yield('/target Exit')
    Sleep(1)
    yield('/interact')
end

main()
