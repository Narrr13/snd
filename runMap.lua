import("System.Numerics")
require("NonuLuaLib")
require("NarLib")

action = {}
checkIn = {}
checkOut = {}

GtabLog = {}

local map60_558 = {
    zoneId = 558, 
    actions = {

        -- Coffre 1
        { action = { "moveTo", {Vector3(-0.40, 0.19, 339.54)} } },
        { action = { "interact", {true, "treasure"} }, checkOut = {"checkMsg", {"The 1st chamber is no longer sealed!"}}, wait=1 },
        { action = { "cleanBag", {true} } },
        -- Door 
        { action = { "interact", {true, "door"} }, checkOut = {"checkMsg", {"The gate to the 2nd chamber opens.","A trap is triggered! You are expelled from the area!"}}, wait=1 },
        -- Path to coffer 2 if door left
        { checkIn = { "maxDistBetweenPlayerAndPos", {Vector3(-18.24386, 0.09999728, 321.8423), 10} }, action = { "moveTo", {Vector3(-3.54, -7.52, 269.17)} } },
        -- Path to coffer 2 if door right
        { checkIn = { "maxDistBetweenPlayerAndPos", {Vector3(18.988, 0.09999683, 321.5335), 10} }, action = { "moveTo", {Vector3(-0.008636862, -7.96638, 263.09412)} } },
      
        -- Coffre 2
        { action = { "moveTo", {Vector3(0.04, -7.8, 214.89)} } },
        { action = { "interact", {true, "treasure"} }, checkOut = {"checkMsg", {"The 2nd chamber is no longer sealed!"}}, wait=1 },
        { action = { "cleanBag", {true} } },
        -- Door left
        { action = { "interact", {true, "door"} }, checkOut = {"checkMsg", {"The gate to the 3rd chamber opens.","A trap is triggered! You are expelled from the area!"}}, wait=1 },
        -- Path to coffer 3 if door left
        { checkIn = { "maxDistBetweenPlayerAndPos", {Vector3(-18.72284, -7.827942, 196.0631), 10} }, action = { "moveTo", {Vector3(-3.32, -15.52, 144.47)} } },
        -- Path to coffer 3 if door right
        { checkIn = { "maxDistBetweenPlayerAndPos", {Vector3(18.84485, -7.827942, 196.1852), 10} }, action = { "moveTo", {Vector3(-1.9026, -15.92, 137.43)} } },
        
        -- Coffre 3
        { action = { "moveTo", {Vector3(0.26, -15.80, 90.19)} } },
        { action = { "interact", {true, "treasure"} }, checkOut = {"checkMsg", {"The 3rd chamber is no longer sealed!"}}, wait=1 },
        { action = { "cleanBag", {true} } },
        -- Door     
        { action = { "interact", {true, "door"} }, checkOut = {"checkMsg", {"The gate to the 4th chamber opens.","A trap is triggered! You are expelled from the area!"}}, wait=1 },
        -- Path to coffer 4 if door left
        { checkIn = { "maxDistBetweenPlayerAndPos", {Vector3(-18.71966, -15.8052, 71.15055), 10} }, action = { "moveTo", {Vector3(-3.571, -23.45, 19.36)} } },
        -- Path to coffer 4 if door right
        { checkIn = { "maxDistBetweenPlayerAndPos", {Vector3(18.66609, -15.8, 71.34743), 10} }, action = { "moveTo", {Vector3(-0.6318162, -23.96077, 12.559897)} } },
        
        -- Coffre 4
        { action = { "moveTo", {Vector3(0.009, -23.73, -34.92)} } },
        { action = { "interact", {true, "treasure"} }, checkOut = {"checkMsg", {"The 4th chamber is no longer sealed!"}}, wait=1 },
        { action = { "cleanBag", {true} } },
        -- Door 
        { action = { "interact", {true, "door"} }, checkOut = {"checkMsg", {"The gate to the 5th chamber opens.","A trap is triggered! You are expelled from the area!"}}, wait=1 },
        -- Path to coffer 5 if door left
        { checkIn = { "maxDistBetweenPlayerAndPos", {Vector3(-18.68655,-23.79719,-53.73579), 10} }, action = { "moveTo", {Vector3(-4.37, -31.46, -105.58)} } },
        -- Path to coffer 5 if door right
        { checkIn = { "maxDistBetweenPlayerAndPos", {Vector3(18.56171,-23.79719,-53.38192), 10} }, action = { "moveTo", {Vector3(-1.0583991,-31.999752,-113.785385)} } },

        -- Coffre 5
        { action = { "moveTo", {Vector3(-0.79, -31.74, -159.86)} } },
        { action = { "interact", {true, "treasure"} }, checkOut = {"checkMsg", {"The 5th chamber is no longer sealed!"}}, wait=1 },
        { action = { "cleanBag", {true} } },
        -- Door 
        { action = { "interact", {true, "door"} }, checkOut = {"checkMsg", {"The gate to the 6th chamber opens.","A trap is triggered! You are expelled from the area!"}}, wait=1 },
        -- Path to coffer 6 if door left
        { checkIn = { "maxDistBetweenPlayerAndPos", {Vector3(-18.82081,-31.78539,-179.0466), 10} }, action = { "moveTo", {Vector3(-4.18, -39.49, -229.39)} } },
        -- Path to coffer 6 if door right
        { checkIn = { "maxDistBetweenPlayerAndPos", {Vector3(18.59067,-31.78539,-178.6838), 10} }, action = { "moveTo", {Vector3(0.0074997693,-39.9235,-237.82237)} } },


        -- Coffre 6
        { action = { "moveTo", {Vector3(-0.60, -39.77, -283.67)} } },
        { action = { "interact", {true, "treasure"} }, checkOut = {"checkMsg", {"The 6th chamber is no longer sealed!"}}, wait=1 },
        { action = { "cleanBag", {true} } },
        -- Door 
        { action = { "interact", {true, "door"} }, checkOut = {"checkMsg", {"The gate to the final chamber opens.","A trap is triggered! You are expelled from the area!"}}, wait=1 }
--       ,
--[[
        -- Path to coffer 7 if door left
        { checkIn = { "maxDistBetweenPlayerAndPos", {Vector3(-18.63135,-39.81079,-303.5477), 10} }, action = { "moveTo", {Vector3(-3.80, -47.50, -353.90)} } },
        -- Path to coffer 7 if door right
        { checkIn = { "maxDistBetweenPlayerAndPos", {Vector3(18.84708,-39.78058,-304.0876), 10} }, action = { "moveTo", {Vector3()} } },

        -- Coffre 7
        { action = { "moveTo", {Vector3(-0.22, -47.78, -408.18)} } },
        { action = { "interact", {true, "treasure"} }, checkOut = {"checkMsg", {"The 7th chamber is no longer sealed!"}}, wait=1 },
        { action = { "cleanBag", {true} } },
        -- Exit
        { action = { "interact", {true, "exit"} } wait=1 }
--        { action = { "moveTo", {Vector3(-0.21, -47.97, -424.38)} }, action = { "interact", {true, "exit"} } }      
        ]]
    }
}



local map70_794 = {
    zoneId = 794,
    actions = {
        -- Summon 1    
        { pos = Vector3(99.9,0.10,107.55), wait=2 },
        { action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The summon is dispelled."},
        { pos = Vector3(100.08,0.10,99.97), action = { cmd="interact", arg={true, "treasure"} }, wait=7 },
        { action = { cmd="cleanBag", arg={true} } },
        { pos = Vector3(100.08,0.10,99.97), wait=2 },
        -- Summon 2
        { pos = Vector3(100.10,0,110.60), wait=3 },
        { action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The summon is dispelled."},
        { pos = Vector3(100.08,0.10,99.97), action = { cmd="interact", arg={true, "treasure"} }, wait=7 },
        { action = { cmd="cleanBag", arg={true} } },
        { pos = Vector3(100.08,0.10,99.97), wait=2 },
        -- Summon 3
        { pos = Vector3(100.10,0,110.60), wait=3 },
        { action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The summon is dispelled."},
        { pos = Vector3(100.08,0.10,99.97), action = { cmd="interact", arg={true, "treasure"} }, wait=7 },
        { action = { cmd="cleanBag", arg={true} } },
        { pos = Vector3(100.08,0.10,99.97), wait=2 },
        -- Summon 4
        { pos = Vector3(100.10,0,110.60), wait=3 },
        { action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The summon is dispelled."},
        { pos = Vector3(100.08,0.10,99.97), action = { cmd="interact", arg={true, "treasure"} }, wait=7 },
        { action = { cmd="cleanBag", arg={true} } },
        { pos = Vector3(100.08,0.10,99.97), wait=2 },
        -- Summon 5
        { pos = Vector3(100.10,0,110.60), wait=3 },
        { action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The summon is dispelled."},  
        { pos = Vector3(100.08,0.10,99.97), action = { cmd="interact", arg={true, "treasure"} }, wait=7 },
        { action = { cmd="cleanBag", arg={true} } },
        { pos = Vector3(100.24,0,83.49), action = { cmd="interact", arg={true, "door"} }, wait=2 }
    }
}

        
local map70_712 = {
    zoneId = 712,
    actions = {
        -- Path to coffer 1
        { pos = Vector3(-0.07,149.99,392.68) },
        { action = { cmd="movealittle", arg={} }, wait=5},   
        -- Coffre 1
        { pos = Vector3(0.082,100.39,299.91), action = { cmd="interact", arg={true, "treasure"} }, checkOk = "%[(%d+):(%d+)%]The First Sluice is no longer sealed!", wait=5 },
        { pos = Vector3(0.082,100.39,299.91), action = { cmd="interact", arg={true, "treasure"} }, wait=5 },
        { action = { cmd="cleanBag", arg={true} } },
        -- Door left
        { pos = Vector3(-20.18,100.00,279.70), action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The gate to the 2nd chamber opens." ,wait=7 },
        -- Path to coffer 2
        { action = { cmd="movealittle", arg={} }, wait=5},   
        -- Coffre 2
        { pos = Vector3(-0.098,50.4,179.63), action = { cmd="interact", arg={true, "treasure"} }, checkOk = "%[(%d+):(%d+)%]The Second Sluice is no longer sealed!", wait=5 },
        { pos = Vector3(-0.098,50.4,179.63), action = { cmd="interact", arg={true, "treasure"} }, wait=5 },
        { action = { cmd="cleanBag", arg={true} } },
        -- Door left
        { zoneId = 712, pos = Vector3(-20.19,50.00,159.78), action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The gate to the 3rd chamber opens." ,wait=7 },
        -- Path to coffer 3    
        { action = { cmd="movealittle", arg={} }, wait=5},     
        -- Coffre3
        { pos = Vector3(0.02,0.40,60.21), action = { cmd="interact", arg={true, "treasure"} }, checkOk = "%[(%d+):(%d+)%]The Third Sluice is no longer sealed!", wait=5 },
        { pos = Vector3(0.02,0.40,60.21), action = { cmd="interact", arg={true, "treasure"} }, wait=5 },
        { action = { cmd="cleanBag", arg={true} } },
        -- Door left    
        { zoneId = 712, pos = Vector3(-20.20,0.00,39.73), action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The gate to the 4th chamber opens." ,wait=7 },   
        -- Path to coffer 4    
        { action = { cmd="movealittle", arg={} }, wait=5}, 
        -- Coffre4
        { pos = Vector3(0.04,-49.59,-60.14), action = { cmd="interact", arg={true, "treasure"} }, checkOk = "%[(%d+):(%d+)%]The Fourth Sluice is no longer sealed!", wait=5 },
        { pos = Vector3(0.04,-49.59,-60.14), action = { cmd="interact", arg={true, "treasure"} }, wait=5 },
        { action = { cmd="cleanBag", arg={true} } },
        -- Door left
        { pos = Vector3(-19.75,-49.89,-79.70), action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The gate to the 5th chamber opens." ,wait=7 },
        -- Path to coffer 5
        { action = { cmd="movealittle", arg={} }, wait=5},
        -- Coffre5
        { pos = Vector3(-0.45,-99.59,-179.02), action = { cmd="interact", arg={true, "treasure"} }, checkOk = "%[(%d+):(%d+)%]The Fifth Sluice is no longer sealed!", wait=5 },
        { pos = Vector3(-0.45,-99.59,-179.02), action = { cmd="interact", arg={true, "treasure"} }, wait=5 },
        { action = { cmd="cleanBag", arg={true} } },
        -- Door left
        { pos = Vector3(-20.40,-99.99,-200.06), action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The gate to the 6th chamber opens." ,wait=7 },       
        -- Path to coffer 6
        { action = { cmd="movealittle", arg={} }, wait=5},
        -- Coffre6
        { pos = Vector3(-0.06,-149.59,-299.76), action = { cmd="interact", arg={true, "treasure"} }, checkOk = "%[(%d+):(%d+)%]The Sixth Sluice is no longer sealed!", wait=5 },
        { pos = Vector3(-0.06,-149.59,-299.76), action = { cmd="interact", arg={true, "treasure"} }, wait=5 },
        { action = { cmd="cleanBag", arg={true} } },
        -- Door left
        { pos = Vector3(-20.45,-149.99,-320.02), action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The gate to the final chamber opens." ,wait=7 },       
        -- Path to coffer 7
        { action = { cmd="movealittle", arg={} }, checkOk = "%[(%d+):(%d+)%]The Sevventh Sluice is no longer sealed!", wait=5},   
        -- Coffre7
        { pos = Vector3(-0.18,-199.60,-420.02), action = { cmd="interact", arg={true, "treasure"} }, wait=5 },
        { action = { cmd="cleanBag", arg={true} } },
        -- Exit
        { pos = Vector3(0.08,-200.00,-436.21), action = { cmd="interact", arg={true, "door"} } }
    }
}

--[[
ACTION FUNCTION
]]


function action.moveTo(vect3)
    LogInfo("[Run Map] Move to")
    if vect3.X == nil or vect3.Y == nil or vect3.Z == nil then return false end
    LogInfo("[Run Map] "..vect3.X.." "..vect3.Y.." "..vect3.Z)
    return Movement(vect3.X,vect3.Y,vect3.Z,false)
end


function action.interact(multi,type)
    LogInfo("[Run Map] Interact to")
    multi = multi or false
    if type==nil then return end

    LogInfo("[Run Map] "..type)
    if type == "treasure" then
        yield("/p autooff")
        Sleep(1)
        yield("/p interactt")      
    elseif type == "door" or type == "bell" or type == "gate" or type == "exit" then
        PathToObject(type,false)
        Sleep(2)
        yield("/p autooff")
        Sleep(1)
        yield("/p interactd")      
    end
end

function action.cleanBag (multi)
    -- defaut multi false
    LogInfo("[Run Map] CleanBag")
    multi = multi or false
    
    if multi then
        yield("/p autooff")
        Sleep(1)
        yield("/p cleanBag")
                
        -- Check all have finished
        --Svc.Party.Length
        while checkChatLog(true,GetNodeText("ChatLogPanel_3",1,2,3),"finiCleanbag",GtabLog)==false do
            Sleep(2)
        end
        Sleep(1)
        yield("/p autofollow")
    elseif multi == false then
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
    end
end

function action.movealittle()
    LogInfo("[Run Map] Move a little")
    yield ('/hold Z')
    Sleep(1)
    yield ('/release Z')    
end

--[[
FIN ACTION IN FUNCTION
]]


--[[
CHECK IN FUNCTION
]]

function checkIn.maxDistBetweenPlayerAndPos(vect3,distance)
    LogInfo("[Run Map] Check In")
    if vect3.X==nil or vect3.Y==nil or vect3.Z==nil or type(distance)~="number" then return false end
    local pos = Player.Entity.Position
    local dx = vect3.X - pos.X
    local dy = vect3.Y - pos.Y
    local dz = vect3.Z - pos.Z
    if math.sqrt(dx * dx + dy * dy + dz * dz) < distance then return true else return false end
end

--[[
FIN CHECK IN FUNCTION
]]



--[[
CHECK OUT FUNCTION
]]

function checkOut.checkMsg(...)
    LogInfo("[Run Map] Check msg")
    local patterns = {...}
    if #patterns == 0 then return false end

    while true do
        for _, pattern in ipairs(patterns) do
            if checkChatLog(false, GetNodeText("ChatLogPanel_0",1,2,3), pattern, GtabLog) then
                LogInfo("[Run Map] Check msg OK")                    
                return true
            end
        end
        Sleep(1)
    end
end

--[[
function checkout.checkMsg(pattern)
    if pattern == nil then return false end
    while checkChatLog(false,GetNodeText("ChatLogPanel_0",1,2,3),pattern,GtabLog) == false do
        Sleep(1)
        if Svc.ClientState.TerritoryType~=mapPlan.zoneId then 
            yield("/p autofollow")
            do return false end 
        end
    end
    return true
and
]]


--[[
FIN CHECK OUT FUNCTION
]]


    
function runMap()

    yield("/p autofollow")
    Sleep(1)
    local checkDone = false
    local mapPlan = nil
        
    if Svc.ClientState.TerritoryType == 558
    then
        mapPlan = map60_558
    elseif Svc.ClientState.TerritoryType == 794
    then
        mapPlan = map70_794
    elseif Svc.ClientState.TerritoryType == 712
    then
        mapPlan = map70_712
    else
        do return end
    end

    for _, p in ipairs(mapPlan.actions) do
        local canContinue = true
        if p.checkIn~=nil then
            local f = checkIn[p.checkIn[1]]
            if type(f) == "function" then
                LogInfo("[Run Map] Call "..p.checkIn[1])
                canContinue = f(table.unpack(p.checkIn[2]))
            else
                canContinue = false
            end
        end
            
        if canContinue then

            if p.action ~= nil then 
                local f = action[p.action[1]]
                if type(f) == "function" then
                    LogInfo("[Run Map] Call "..p.action[1])
                    f(table.unpack(p.action[2]))
                else
                    return false
                end
            end

            if p.checkOut ~= nil then
                local f = checkOut[p.checkOut[1]]
                if type(f) == "function" then
                    LogInfo("[Run Map] Call "..p.checkout[1])
                    if f(table.unpack(p.checkOut[2])) == false then return false end
                else
                    return false
                end   
            end    

            if p.wait ~= nil then Sleep(p.wait) end
                

            while IsPlayerAvailable("Really") ~= true do
                Sleep(0.5)
            end
           
        end
            
            yield("/p autofollow")
            Sleep(1)
            if Svc.ClientState.TerritoryType ~= mapPlan.zoneId then
                return false
            end           
    end

end



--main()
