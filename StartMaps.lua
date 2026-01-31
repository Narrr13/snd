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

function init()
    
    if mapId==0 or (mapId~=12243 and mapId~=24794) then 
        LogInfo("[Map] Wrong map setting")
        do return false end
    end
--[[
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
--]]
    return true
end

function MoveTo()
end

function openMap()
    local arrayMap = {}
    if mapId==12243 then
        yield("/p openmapdragon")
    elseif mapId==24794 then
        yield("/p openmap70special")
    end
  
    while checkChatLog(true,GetNodeText("ChatLogPanel_3",1,2,3),"openMapDone")==false do
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
            table.insert(arrayMap,{i,p}) 
            LogInfo("[Map] Maps add "..i.." : "..p.TerritoryType.RowId.."  "..p.rawX.." "..p.rawY)
            i=i+1
        end
    end
    LogInfo("[Map] Store maps coordinates done ("..#arrayMap.." maps)")
    return arrayMap

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
            return true
        end

        for _, map in ipairs(arrayMap) do

            --[[if checkChat("ChatLogPanel_3","stopMap")>=1 then 
                LogInfo("[Map] Map script stop")
                do return end 
            end 
            ]]       

            a=nearest_aetherite(map.TerritoryType.RowId,Vector3(p.rawX,0,P.rawY))
            LogInfo(a.AetherId)

--Move Coordinate
            

        end



        Sleep(1)
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