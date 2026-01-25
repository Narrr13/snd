import("System.Numerics")
require("NonuLuaLib")

action = {}
GtabLog = {}

local map60_558 = {
    zoneId = 558, 
    actions = {
        -- Coffre 1
        { pos = Vector3(-0.40,0.19,339.54), action = { cmd="interact", arg={true, "treasure"} }, checkOk = "%[(%d+):(%d+)%]The 1st chamber is no longer sealed!", wait=1 },
        { action = { cmd="cleanBag", arg={true} } },
        -- Door left
        { pos = Vector3(-18.52,0.09,321.60), action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The gate to the 2nd chamber opens." ,wait=1 },
        -- Path to coffer 2
        { pos = Vector3(-3.54,-7.52,269.17) },    
        -- Coffre 2
        { pos = Vector3(0.04,-7.8,214.89), action = { cmd="interact", arg={true, "treasure"} }, checkOk = "%[(%d+):(%d+)%]The 2nd chamber is no longer sealed!", wait=1 },
        { action = { cmd="cleanBag", arg={true} } },
        -- Door left
        { pos = Vector3(-18.23,-7.8,196.82), action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The gate to the 3rd chamber opens." ,wait=1 },   
        -- Path to coffer 3    
        { pos = Vector3(-3.32,-15.52,144.47) },       
        -- Coffre3
        { pos = Vector3(0.26,-15.80,90.19), action = { cmd="interact", arg={true, "treasure"} }, checkOk = "%[(%d+):(%d+)%]The 3rd chamber is no longer sealed!", wait=1 },
        { action = { cmd="cleanBag", arg={true} } },
        -- Door left    
        { pos = Vector3(-18.41,-15.90,71.42), action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The gate to the 4th chamber opens." ,wait=1 },      
        -- Path to coffer 4    
        { pos = Vector3(-3.571,-23.45,19.36) },
        -- Coffre4
        { pos = Vector3(0.009,-23.73,-34.92), action = { cmd="interact", arg={true, "treasure"} }, checkOk = "%[(%d+):(%d+)%]The 4th chamber is no longer sealed!", wait=1 },
        { action = { cmd="cleanBag", arg={true} } },
        -- Door left
        { pos = Vector3(-19.98,-23.8,-55.15), action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The gate to the 5th chamber opens." ,wait=1 },       
        -- Path to coffer 5
        { pos = Vector3(-4.37 , -31.46 , -105.58) },    
        -- Coffre5
        { pos = Vector3(-0.79,-31.74,-159.86), action = { cmd="interact", arg={true, "treasure"} }, checkOk = "%[(%d+):(%d+)%]The 5th chamber is no longer sealed!", wait=1 },
        { action = { cmd="cleanBag", arg={true} } },
        -- Door left
        { pos = Vector3(-20.15,-31.90,-179.38), action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The gate to the 6th chamber opens." ,wait=1 },       
        -- Path to coffer 6
        { pos = Vector3(-4.18 , -39.49 , -229.39) },    
        -- Coffre6
        { pos = Vector3(-0.60,-39.77,-283.67), action = { cmd="interact", arg={true, "treasure"} }, checkOk = "%[(%d+):(%d+)%]The 6th chamber is no longer sealed!", wait=1 },
        { action = { cmd="cleanBag", arg={true} } },
        -- Door left
        { pos = Vector3(-18.67,-39.89,-303.83), action = { cmd="interact", arg={true, "door"} }, checkOk = "%[(%d+):(%d+)%]The gate to the final chamber opens." ,wait=1 },       
        -- Path to coffer 7
        { pos = Vector3(-3.80 , -47.50 , -353.90) },    
        -- Coffre7
        { pos = Vector3(-0.22,-47.78,-408.18), action = { cmd="interact", arg={true, "treasure"} }, checkOk = "%[(%d+):(%d+)%]The 7th chamber is no longer sealed!", wait=1 },
        { action = { cmd="cleanBag", arg={true} } },
        -- Exit
        { pos = Vector3(-0.21,-47.97,-424.38), action = { cmd="interact", arg={true, "door"} } }      
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


function action.interact(type,multi)
    multi = multi or false
    if type==nil then do return end end

    if type == "treasure" then
        yield("/p autooff")
        Sleep(1)
        yield("/p interactt")      
    elseif type == "door" then
        yield("/p autooff")
        Sleep(1)
        yield("/p interactd")      
    end
end

function action.cleanBag (multi)
    -- defaut multi false
    multi = multi or false
    
    if multi then
        yield("/p autooff")
        Sleep(1)
        yield("/p cleanBag")
                
        -- Check all have finished
        --Svc.Party.Length
        local obj1, dist1 = FindNearestObjectByName("Trea")
        local obj2 ,dist2 = FindNearestObjectByName("lea")
        local try=0
        while true  do
            Sleep(1)
            local obj1, dist1 = FindNearestObjectByName("Trea")
            local obj2 ,dist2 = FindNearestObjectByName("lea")
            if (obj1==nil and obj2==nil) or try > 11
            then
                break 
            end
    --                    if obj1~=nil then Movement(obj1.pos.X,p.pos.Y,p.pos.Z,false)
            if dist1 < 1 then try=try+1 end
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
    yield ('/hold Z')
    Sleep(1)
    yield ('/release Z')    
end

-- Vérifie si pattern présents dans str
-- Mode multi, ajout le nom du personnage dans le pattern et vérifie que pour tous les personnages du groupe, le pattern est présent
-- Peux vérifier dans un tableau tabLog si pattern déjà enregistré
-- Si match & tableau, on enrichie le tableau
-- pas multi, enregistre dans tablelog le dernier qui match
function checkChatLog(multi,str,pattern,tabLog)
    multi=multi or false

    local strTab={}
    local localPattern = ""
    local tabLogTmp = {}

    strTab=strSplit(str,"\r")

    if (strTab==nil) or (multi and Svc.Party.Length==0) then do return false end end
    --if (multi and Svc.Party.Length==0)
    
    if multi then
        for i=0,Svc.Party.Length-1 do
            localPattern="%[(.-)%].-"..Svc.Party[i].Name.TextValue..".-"..pattern.."$"
            for j=1,#strTab do   
                h = string.match(strTab[j], localPattern)
                if h ~= nil then
                    --si pas table de check ou table de check et pattern pas contenu dedans                        
                    if (tabLog ~=nil and not(isContainedInTable(tabLog,h,localPattern)) or (tabLog ==nil) ) then
                        tabLogTmp[Svc.Party[i].Name.TextValue]={h,localPattern}
                    end
                end
            end
        end

        --Si OK
        local count=0
        for _ in pairs(tabLogTmp) do count = count + 1 end
        if count == Svc.Party.Length then 
            -- Si il faut insérer dans table de suivi
            if tabLog~=nil then
                for i=0,Svc.Party.Length-1 do
                    --insert dans table tabLog
                    pushAndShift(tabLog,tabLogTmp[Svc.Party[i].Name.TextValue])
                end
            end

            do return true , tabLog end
        Si KO
        else
            do return false, tabLog end
        end     
    --Si pas multi
    else
        localPattern="%[(.-)%]"..pattern.."$"
        for i=1,#strTab do   
            h = string.match(strTab[i], localPattern)
            if h ~= nil then
                if (tabLog ~=nil and not(isContainedInTable(tabLog,h,localPattern)) or (tabLog ==nil) ) then
                    tabLogTmp={{h,localPattern}}
                end
            end
        end    

        If 
    end
    return false,tabLog
end

function main()

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
        if p.pos ~= nil then Movement(p.pos.X,p.pos.Y,p.pos.Z,false) end

        if p.action ~= nil then 
            local f = action[p.action.cmd]
            if type(f) == "function" then
                f(table.unpack(p.action.arg))
            end
        end

        if p.checkOk ~= nil then

            while not(checkDone) do
                lasth = nil
                lastm = nil

                for h,m in string.gmatch(GetNodeText("ChatLogPanel_0",1,2,3), p.checkOk) do
                    lasth = h
                    lastm = m
                end

                if lasth and lastm then
                    if isContainedInTable(tabLog,lasth..":"..lastm,p.checkOk) == false then
                        LogInfo("Pattern ajouté dans tableau")                                
                        pushAndShift(GtabLog,{lasth..":"..lastm,p.checkOk})
                        checkDone = true 
                    end
                end
                

                if Svc.ClientState.TerritoryType~=mapPlan.zoneId then 
                    yield("/p autofollow")
                    do return end 
                end

                Sleep(1)

            end

            checkDone = false
 
        end    

        if p.wait ~= nil then Sleep(p.wait) end
            

        while IsPlayerAvailable("Really") ~= true do
            Sleep(0.5)
        end
            
        yield("/p autofollow")
    end

end



main()
