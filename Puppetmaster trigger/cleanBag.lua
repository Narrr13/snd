import("System.Numerics")
require("NonuLuaLib")

LogInfo("[Trigger] cleanBag")

for i = 0, Svc.Objects.Length - 1 do
    local obj = Svc.Objects[i]
    if obj then
        local name = obj.Name.TextValue
        if name and (string.find(string.lower(name), string.lower("trea")) or string.find(string.lower(name), string.lower("leather"))) then
            Movement(obj.Position.X,obj.Position.Y,obj.Position.Z,false)
            yield("/target "..obj.Name.TextValue)
            yield("/interact")
            Sleep(1)            
        end
     end
end

yield("/p finiCleanbag")
