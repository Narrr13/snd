--[=====[
[[SND Metadata]]
author: Nar
version: 0.0.1
description: "Fish Big fish"

configs:
  discordMsg:
    default: false
    description: Push Echo Msg & discord msg
  stopGameAndComputer:
    default: false
    description: Stop FF14 & computer
[[End Metadata]]
--]=====]


require "luaSharp"
require("NonuLuaLib")
require("NarLib")
import("System.Numerics")


local discordMsg= Config.Get("discordMsg")
local stopGameAndComputer= Config.Get("stopGameAndComputer")

SCRIPTNAME = "[BigFish]"

--1 min ET = 3 sec real time

fishs= {
--{id=33242,namePreset="Ealad Skaan",fly=true, zoneId=816, pos=Vector3(-73.53161,-0.014478505,273.29678), timeFish={year=2026, month=7, day=17, hour=00, min=01, sec=0},durationPrep=0,durationBigFish=1 }
--{id=33241,namePreset="Cinder Surprise",fly=false, zoneId=815, pos=Vector3(459.8518,-48.823772,-491.5291), timeFish={year=2026, month=7, day=18, hour=15, min=50, sec=0},durationPrep=30,durationBigFish=7 }
{id=52004,namePreset="Bitterbark Caiman",fly=false, zoneId=1189, pos=Vector3(157.62902832031,-151.18807983398,851.85687255859), timeFish={year=2026, month=7, day=17, hour=15, min=50, sec=0},durationPrep=20,durationBigFish=7 }

}

function pushMsg(msg)
    LogInfo(SCRIPTNAME.." "..msg)
    if discordMsg then 
        --active discord bridge plugin
        yield("/e "..os.date("%Y/%m/%d %H:%M:%S",os.time()).." "..SCRIPTNAME.." "..msg) 
    end
end

if stopGameAndComputer then
    os.execute('start "" "C:\\Users\\pafle\\OneDrive\\Bureau\\Stop FF14.bat"')
end

table.sort(fishs, function(a, b) return os.time(a.timeFish)-a.durationPrep*60 < os.time(b.timeFish)-b.durationPrep*60 end)

yield("/gearset change "..18)

pushMsg("Start BishFish with "..#fishs.." fish(s)")

for i, fish in ipairs(fishs) do
    pushMsg(i.." - "..fish.namePreset)

    --Wait 
    waitTimeFish=os.time(fish.timeFish)-fish.durationPrep*60
    pushMsg(i.." - Wait until "..os.date("%Y/%m/%d %H:%M:%S",waitTimeFish))
    while waitTimeFish > os.time() do
        Sleep(20)
    end
    
    --TP & MOVE
    local a, distance = nearest_aetherite(fish.zoneId,fish.pos)
    pushMsg(i.." - TP to "..a.Name)
    Instances.Telepo:Teleport(a.AetherId, 0)
    while Player.Entity.IsCasting ==false do
        Sleep(0.5)
    end
    waitUntilPlayer()
    
    yield("/ac Mount Roulette")
    Sleep(2)
    
    pushMsg(i.." - Move to fishing spot ")
    Movement(fish.pos.X,fish.pos.Y,fish.pos.Z,fish.fly,0)

    yield("/mount")

    -- Let's GO FISHING
    IPC.AutoHook.SetPreset(fish.namePreset)
    IPC.AutoHook.SetPluginState(true)

    pushMsg(i.." - Let's go fishing")    

     while Svc.Condition[43]==false do
         yield("/ahstart")
         Sleep(2)      
     end


    -- WAIT
    Sleep(fish.durationPrep*60+fish.durationBigFish*60)

    -- STOP Fishing
    
     while Svc.Condition[43] do
         Actions.ExecuteAction(299, ActionType.Action)
         Sleep(2)      
     end
     Actions.ExecuteAction(299, ActionType.Action)        

     pushMsg(i.." - Stop fishing")    

     if Inventory.GetItemCount(fish.id) == 0
     then
         pushMsg(i.." - Fish not found")    
     else
         pushMsg(i.." - Fish found !") 
     end

    -- TP
     pushMsg(i.." - TP ")    
     yield("/li Limsa Lominsa")
     Sleep(20)

end


pushMsg("Done")

if stopGameAndComputer then
    pushMsg("Shutdown...")   
    yield("/shutdown")
    Sleep(1)
    yield("/click SelectYesno Yes")
end


--{id=52001,namePreset="Excavator Catfish",fly=true, zoneId=1188, pos=Vector3(148.56398,109.20923,563.06085), timeFish={year=2026, month=7, day=18, hour=05, min=31, sec=0},durationPrep=10,durationBigFish=7 }