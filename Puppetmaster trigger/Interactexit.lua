require("NonuLuaLib") 

function main()
    LogInfo("[Trigger] Interactexit")

    if FindNearestObjectByName("exit",50)~=nil then
        LogInfo("[Trigger] Exit find")
        PathToObject("exit",false,3)
        yield('/target exit')
        yield('/interact')
        Sleep(1)
        yield('/p interddone')
        return true
    end
    yield('/p interddone')
    return false
end

main()

