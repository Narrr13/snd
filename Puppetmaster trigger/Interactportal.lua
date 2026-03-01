require("NonuLuaLib") 

function main()
    LogInfo("[Trigger] Interactportal")

    if FindNearestObjectByName("portal",50)~=nil then
        LogInfo("[Trigger] Portal find")
        PathToObject("portal",false,3)
        yield('/target portal')
        yield('/interact')
        Sleep(1)
        yield('/p interddone')
        return true
    end
    yield('/p interddone')
    return false
end

main()





