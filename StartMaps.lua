--[=====[
[[SND Metadata]]
author: Nar
version: 0.0.1
description: "Run maps"

configs:
  mapId:
    default: 0
    description: MapId you want to do (12243 for Dragon / for 24794 special 70)
[[End Metadata]]
--]=====]

local mapId = Config.Get("mapId")


require "NonuLuaLib"
require "luaSharp"
import("System.Numerics")
require "NarLib"
require "runMap"

function spam()
    for i=1,20 do
       yield("/e 1") 
    end
end

function init()
    
    if mapId==0 or (mapId~=12243 and mapId~=24794) then 
        LogInfo("[Map] Wrong map setting")
        do return false end
    end
    return true
end


function openMap()
    local arrayMap = {}
    if mapId==12243 then
        yield("/p openmapdragon")
    elseif mapId==24794 then
        yield("/p openmap70special")
    end
  
    
    while true do
        WaitForAddonVisible("ChatLogPanel_3")
        if checkChatLog(true,GetNodeText("ChatLogPanel_3",1,2,3),"openMapDone") then
            break
        end
        Sleep(1)
    end
    LogInfo("[Map] Open maps done")
    
    --On récupère les coordonnées des maps
    local ChatLogStringArray = cs_instance("FFXIVClientStructs.FFXIV.Client.UI.Arrays.ChatLogStringArray")
    local PayloadType = load_type("Dalamud.Game.Text.SeStringHandling.PayloadType")
    load_type("Dalamud.Utility.CStringExtensions")
    local chat = ChatLogStringArray.Tab4VisibleChatText:AsDalamudSeString()
    local i=1
    for p in luanet.each(chat.Payloads) do
        if p.Type == PayloadType.MapLink then
            table.insert(arrayMap,{p.TerritoryType.RowId,p.RawX,p.RawY}) 
            LogInfo(p)
            LogInfo("[Map] Maps add "..i.." : "..p.TerritoryType.RowId.."  "..p.RawX.." "..p.RawY)
            i=i+1
        end
    end
    LogInfo("[Map] Store maps coordinates done ("..#arrayMap.." maps)")
    return arrayMap

end

-- Chercher les cartes prio à traiter (carte dans la même zone)
local function findPriorityIndex(queue)
    local currentZone = Svc.ClientState.TerritoryType
    for i = 1, #queue do
        if queue[i][1] == currentZone then
            return i
        end
    end
    return 1 -- no priority task → take first
end



function waitParty()
    LogInfo("[Map] Wait party "..Svc.Party.Length.." member(s)")

    local countParty=-1
    while countParty~=Svc.Party.Length do
        countParty=0
        for i=0,Svc.Party.Length-1 do
            yield("/target "..Svc.Party[i].Name.TextValue)
            Sleep(0.5)
            if Entity.Target ~= nil and Entity.Target.Name == Svc.Party[i].Name.TextValue then countParty = countParty + 1 end
        end
    end
    return true    
end


function allTogether()
    LogInfo("[Map] Regroup "..Svc.Party.Length.." member(s)")
    yield("/p autooff")
    Sleep(1)
    yield("/p together")
    yield("/p movedone")
    --Wait they finished to move    

    while true do
        WaitForAddonVisible("ChatLogPanel_3")        
        if checkChatLog(true,GetNodeText("ChatLogPanel_3",1,2,3),"movedone") then
            break
        end
        Sleep(1)
    end
end

function mountAll()
    LogInfo("[Map] Mount incoming")
    yield("/mount \"Regalia Type-G\"")
    yield("/p mount")
    Sleep(1)
    yield("/p mounted")

    while true do
        WaitForAddonVisible("ChatLogPanel_3")
        if checkChatLog(true,GetNodeText("ChatLogPanel_3",1,2,3),"mounted") then 
            break 
        end
        Sleep(1)
    end   
end


function MoveToMap(zoneId,x,y)
    spam()
    
    local distanceAtleast = 200
    local tp=true
    local a, distance =nearest_aetherite(zoneId,Vector3(x,0,y))
        
    if zoneId==Svc.ClientState.TerritoryType then
        if distance > Vector3.Distance(Player.Entity.Position,Vector3(x,0,y))-distanceAtleast then tp=false end
    end

    waitUntilPlayer()
    if tp then 
        LogInfo("[Map] Teleportation incoming "..a.Name)
        Instances.Telepo:Teleport(a.AetherId, 0)
        while Player.Entity.IsCasting ==false do
            Sleep(0.5)
        end
    end
    waitUntilPlayer()
    waitParty()
    allTogether()
    mountAll()

    while not IPC.vnavmesh.IsReady() and t < 10 do
        Sleep(0.1) 
        t = t + 0.1
    end           
    local posMap= IPC.vnavmesh.PointOnFloor(Vector3(x/1000,500,y/1000), true, 0)
    if posMap ~= nil then
        if Movement(posMap.X,posMap.Y,posMap.Z,true)==false then return false end
    else
        LogInfo("[Map]  Coordinates computer ko")
        return false
    end
        
    yield("/mount")
  
    LogInfo("[Map] Move done")      
    return true     
end

function dig()
    LogInfo("[Map] Try dig ")
    Sleep(2)
    waitUntilPlayer()
    while true do
        yield("/p dig")
        Sleep(2)
        WaitForAddonVisible("ChatLogPanel_0")
        if checkChatLog(false,GetNodeText("ChatLogPanel_0",1,2,3),"You discover a treasure coffer!") then 
            break
        end
        waitUntilPlayer()
    end
    return true
end

function openTreasureTrap()
    yield("/p autofollow")
    Sleep(1)
    waitUntilPlayer()
    if AcquireTarget("treasure")==false then return false end
    LogInfo("[Map] Treasure found")
    treasurePos=Entity.Target.Position
    while true do
    --not  do
        yield("/p autooff")
        PathToObject("treasure",false,2)
        spam()
        yield("/p interactt")
        
        while true do
            WaitForAddonVisible("ChatLogPanel_3")
            if checkChatLog(true,GetNodeText("ChatLogPanel_3",1,2,3),"intertdone") then 
                break 
            end
            Sleep(0.1)
        end
        Sleep(1)
        WaitForAddonVisible("ChatLogPanel_0")
        if checkChatLog(false,GetNodeText("ChatLogPanel_0",1,2,3),"A trap springs, releasing a powerful musk into the air!") then 
            break
        end

    end
    LogInfo("[Map] Treasure opened")

    while true do 
        Sleep(1)
        waitUntilPlayer()
        WaitForAddonVisible("ChatLogPanel_0")
        if checkChatLog(false,GetNodeText("ChatLogPanel_0",1,2,3),"You defeat all the enemies drawn by the trap!") then
            break
        end
    end

    LogInfo("[Map] Enemies defeated")
    return true
end

function openTreasure()
    LogInfo("[Map] Try open treasure again")
    waitUntilPlayer()
    yield("/p autofollow")
    Sleep(2)
    if AcquireTarget("treasure")==false then return false end
    LogInfo("[Map] Treasure found again")
    treasurePos=Entity.Target.Position
    while FindNearestObjectByName("treasure",20)~=nil do
        PathToObject("treasure",false,2)
        Sleep(1)
        waitUntilPlayer()
        spam()
        yield("/p interactt")
        
        while true do
            WaitForAddonVisible("ChatLogPanel_3")
            if checkChatLog(true,GetNodeText("ChatLogPanel_3",1,2,3),"intertdone") then
                break
            end
            Sleep(0.1)
        end        
        Sleep(3)
    end
    LogInfo("[Map] Treasure opened give me loot")
    return true
end


function usePortal()
    LogInfo("[Map] Portal are you here ?")
    waitUntilPlayer()
    local wait=8
    local t=0

    while true do
        WaitForAddonVisible("ChatLogPanel_0")
        if checkChatLog(false,GetNodeText("ChatLogPanel_0",1,2,3),"A portal has appeared.") then
            break
        end
        Sleep(1)
        t=t+1
        if t==wait then do return false end end
    end
 
    LogInfo("[Map] Portal appears")
    
    while true do
        waitUntilPlayer()
        if AcquireTarget("portal") then
            portalPos=Entity.Target.Position
            PathToObject("portal",false,2)
        end
        waitUntilPlayer()
        spam()
        yield("/p interactd")
        while true do
            WaitForAddonVisible("ChatLogPanel_3")
            if checkChatLog(true,GetNodeText("ChatLogPanel_3",1,2,3),"interddone") then
                break
            end
            Sleep(0.1)
        end     
        Sleep(4)

        WaitForAddonVisible("ChatLogPanel_0")
        if checkChatLog(false,GetNodeText("ChatLogPanel_0",1,2,3),".-has begun.") then
            break
        end
    end 
    return true
end

function processMap(zoneId, x, y)
    LogInfo("[Map] Start map "..zoneId.." "..x.." "..y)
    if zoneId == nil or x == nil or y == nil then return false end
    if MoveToMap(zoneId,x,y)==false then return false end
    Sleep(2)
    waitUntilPlayer()
    if not dig() then return false end

    if not openTreasureTrap() then return false end

    if not openTreasure() then return false end

    if usePortal() then
        LogInfo("[Map] Let's start duty")
        Sleep(1)
        waitUntilPlayer()
        runMap()
    end

    LogInfo("[Map] Map done")
    Sleep(3)
    waitUntilPlayer()
end

function main()
    local arrayMap = {}    

    --Check
    if not(init()) then do return end end

    --
    while true do 
        arrayMap=openMap()    
    
        if #arrayMap == 0 then 
            LogInfo("[Map] No more map")
            waitUntilPlayer()
            Sleep(1)
            yield("/li Limsa Lominsa")
            return true
        end
        
        while #arrayMap > 0 do
            local indexMap = findPriorityIndex(arrayMap)
            local map = arrayMap[indexMap]
            local zoneId, x, y = map[1], map[2], map[3]

            if processMap(zoneId, x, y)==false then return false end
            table.remove(arrayMap, indexMap)
        end
     end
end


main()
--[[]
    yield("/li Spriggan")
    WaitForLifestream()
    Sleep(1)
    yield("/cwl7 tppp")
    Sleep(20)
    yield("/target Marcel Patoulachi")
    yield"/invite"
    Sleep(1)
    yield("/target Jeanpierre Vidol")
    yield"/invite"
    Sleep(1)
    yield("/target Robert Robichet")
    yield"/invite"
    Sleep(1)
    yield("/maps")
    yield("/p initCombat")
    Sleep(2)
]]