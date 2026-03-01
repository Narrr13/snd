require("NonuLuaLib") 

function main()
    LogInfo("[Trigger] InteractDoorDell")

    if FindNearestObjectByName("door",50)~=nil then
        LogInfo("[Trigger] Door find")
        PathToObject("door",false,3)
        yield('/target door')
        yield('/interact')
        Sleep(1)
        yield('/p interddone')
        return true
    elseif FindNearestObjectByName("arcane",50)~=nil then
        LogInfo("[Trigger] Arcane find")
        PathToObject("arcane",false,3)
        yield('/target Arcane')
        yield('/interact')
        Sleep(1)
        yield('/p interddone')
        return true
    elseif FindNearestObjectByName("gate",50)~=nil then
        LogInfo("[Trigger] Gate find")
        PathToObject("gate",false,3)
        yield('/target gate')
        yield('/interact')
        Sleep(1)
        yield('/p interddone')
        return true
    elseif FindNearestObjectByName("exit",50)~=nil then
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





