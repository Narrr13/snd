require("NonuLuaLib")

LogInfo("[Trigger] Together")

if Svc.Party.Length ~= 0 then
    local partyLeaderName=Svc.Party[Svc.Party.PartyLeaderIndex].Name.TextValue
    if Vector3.Distance(Entity.Player.Position,Svc.Party[Svc.Party.PartyLeaderIndex].Position) > 3 then
    
        while Entity.Target==nil or Entity.Target.Name~=partyLeaderName do
            yield("/target "..partyLeaderName)
            Sleep(0.5)
        end

        LogInfo("[Trigger] Together move incoming")
        Movement(Entity.Target.Position.X,Entity.Target.Position.Y,Entity.Target.Position.Z,false,1)
        yield("/p movedone")
    else
        yield("/p movedone")
    end
end

