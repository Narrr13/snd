require("NonuLuaLib")

if Svc.Party.Length ~= 0 then
    local partyLeaderName=Svc.Party[Svc.Party.PartyLeaderIndex].Name.TextValue
    
    while Entity.Target==nil or Entity.Target.Name~=partyLeaderName do
        yield("/target "..partyLeaderName)
        Sleep(0.5)
    end

    if Movement(Entity.Target.Position.X,Entity.Target.Position.Y,Entity.Target.Position.Z,false,1) then 
        yield("/p movedone")
    end
end
