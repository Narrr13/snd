require 

--1 min ET = 3 sec real time


fishs= {
{id=0,namePreset="",fly=true, zoneId=0, pos=Vector3(x,y,z), timeFish={year=2026 month=7 day=17 hour=16 min=44 sec=0},durationPrep=0,durationBigFish=0 }

}

function pushMsg(msg)
    LogInfo(msg)
    yield("/e "..os.date(%Y/%m/%d %H:%M:%S,os.time()).." "..msg)
end

table.sort(fishs, function(a, b) return os.time(a.timeFish)-a.durationPrep*60 < os.time(b.timeFish)-b.durationPrep*60)

for i, fish in ipairs(fishs) do
--
end
