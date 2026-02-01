require("NonuLuaLib") 

function main()
    PathToObject("Arcane",false,2)
    yield('/target Arcane')
    Sleep(1)
    yield('/interact')

    PathToObject("door",false,2)
    yield('/target door')
    Sleep(1)
    yield('/interact')

    PathToObject("Gate",false,2)
    yield('/target Gate')
    Sleep(1)
    yield('/interact')

    PathToObject("Portal",false,2)
    yield('/target Portal')
    Sleep(1)
    yield('/interact')

    PathToObject("exit",false,2)
    yield('/target Exit')
    Sleep(1)
    yield('/interact')
end

main()
