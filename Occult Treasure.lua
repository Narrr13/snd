import("System.Numerics")
require("NonuLuaLib")
require("NarLib")

TIME_CHECK=180
posAetheryte=Vector3(830.7468,72.98389,-695.97925)


local positions = {
    { pos = Vector3(618.74, 66.30, -701.76) },  --1
    { pos = Vector3(489.91, 62.48, -590.22) },  --2
    { pos = Vector3(388.70, 96.81, -454.23) },  --3 v2
    { pos = Vector3(378.89, 22.23, -742.00) },  --4 
    { pos = Vector3(141.60, 15.80, -579.49) },  --5 v2
    { pos = Vector3(-117.80, 4.99, -705.32) },  --6 v2
    { pos = Vector3(-444.14, 3.00, -769.50) },  --7
    { pos = Vector3(-576.86, 5.00, -865.29) },  --8
    { pos = Vector3(-728.52, 5.00, -724.35) },  --9
    { pos = Vector3(-826.74, 3.00, -830.31) },  --10
    { pos = Vector3(-883.11, 3.80, -683.80) },  --11
--Pos path----------------------------------------------------
    { pos = Vector3(-737.07, 4.99, -625.86), posPath=true },
--------------------------------------------------------------

    { pos = Vector3(-662.05, 3.04, -582.18) },  --12
    { pos = Vector3(-489.50, 3.00, -529.91) },   --13
    { pos = Vector3(-140.53, 22.51, -410.34) },  --14
    { pos = Vector3(-341.19, 52.27, -382.36) },  --15
    { pos = Vector3(-492.53, 98.60, -203.12) },  --16
    { pos = Vector3(-444.87, 90.75, 24.05) },    --17 v2 
    { pos = Vector3(-398.02, 106.30, 172.54) },  --18
    { pos = Vector3(-709.20, 63.65, 194.17) },   --19
    { pos = Vector3(-759.98, 76.18, 88.97) },    --20
    { pos = Vector3(-682.17, 135.65, -192.85) }, --21
}

local positions2 = {
    { pos = Vector3(666.80, 79.08, -482.91) },   --22 v2
    { pos = Vector3(870.52, 95.56, -392.11) },   --23 v2
    { pos = Vector3(779.77, 96.10, -257.70) },   --24
    { pos = Vector3(766.81, 108.00, -139.02) },  --25
    { pos = Vector3(729.50, 108.15, -66.26) },   --26
    { pos = Vector3(471.89, 95.99, -84.43) },    --27 v2
    { pos = Vector3(607.34, 107.99, 115.98) },   --28 v2
    { pos = Vector3(788.29, 120.39, 106.95) },   --29
    { pos = Vector3(829.28, 122.00, 435.45) },   --30
    { pos = Vector3(867.06, 110, 578.96) },      --31 v2
    { pos = Vector3(837.16, 70.00, 698.68) },    --32
    { pos = Vector3(706.96, 70.00, 597.95) },    --33
    { pos = Vector3(590.78, 70.30, 616.86) },    --34
    { pos = Vector3(436.40, 70.30, 678.83) },    --35
    { pos = Vector3(297.17, 56.10, 646.52) },    --36
    { pos = Vector3(143.59, 56.01, 777.42) },    --37
    { pos = Vector3(42.11,  65.25, 652.90) },    --38 V2
    { pos = Vector3(257.97, 72.36, 498.35) },    --39 V2
    { pos = Vector3(467.91, 70.3, 531.64) },     --40 v2
    { pos = Vector3(636.79, 69.99, 408.52) },    --41 
    { pos = Vector3(522.54, 67.90, 236.50) },    --42
    { pos = Vector3(281.85, 103.49, 244.07) },   --43
    { pos = Vector3(242.32, 109.49, -10.93) },   --44
    { pos = Vector3(349.69, 95.69, -283.02) },   --45 v2
    { pos = Vector3(61.32, 111.40, -288.14) },   --46
    { pos = Vector3(-155.06, 98.65, -135.07) },  --47
    { pos = Vector3(-22.13, 102.83, 146.69) },   --48 V2
    { pos = Vector3(-249.45, 121.00, 126.76) },  --49
    { pos = Vector3(-397.19, 85.14, 331.70) },   --50
    { pos = Vector3(-282.78, 116.08, 368.68) },  --51
    { pos = Vector3(15.06, 103.33, 429.49) },    --52
    { pos = Vector3(-193.41, 74.89, 617.39) },   --53
    { pos = Vector3(-221.66, 75.00, 797.26) },   --54
    { pos = Vector3(-372.17, 75.59, 531.80) },   --55
    { pos = Vector3(-646.64, 75.00, 406.09) },   --56
}



function coffer()
    local i = 0
    local treasureOpen = 0
    yield("/return")
    Sleep(7)
--    while not IsPlayerAvailable() do
--        Sleep(0.1)
--    end
    
    if not GetCharacterCondition(4) then 
        yield("/ac Mount Roulette")
        Sleep(2)
    end

    for _, p in ipairs(positions) do
        i=i+1
        if p.posPath == nil then yield("/echo "..i.." : "..p.pos.X.."  "..p.pos.Y.." "..p.pos.Z) end
        Movement(p.pos.X,p.pos.Y,p.pos.Z,false)
        if p.posPath == nil then
            if PathToObject("Trea") then 
                yield('/target trea')
                yield('/interact')
                Sleep(0.5)    
                treasureOpen = treasureOpen + 1
            end
        end
    end

    yield("/return")
    Sleep(7)

    for _, p in ipairs(positions2) do
        i=i+1
        --if p.posPath == nil then yield("/echo "..i.." : "..p.pos.X.."  "..p.pos.Y.." "..p.pos.Z) end
        Movement(p.pos.X,p.pos.Y,p.pos.Z,false)
        if p.posPath == nil then           
            yield('/target trea')
            yield('/interact')
            Sleep(0.5)    
            yield("/echo Coffre ouvert")
            treasureOpen = treasureOpen + 1
        end
    end

    yield("/echo Nombres de coffres ouverts : "..treasureOpen)     
    yield("/return")
end

function main()
    
    local oldh = "hh"
    local oldm = "mm"
    local pattern = "%[(%d+):(%d+)%]You sense the presence of (%d+) silver coffers and (%d+) bronze coffers?"
    
--    yield("/li occult")
--    WaitForNavmesh()
--    Sleep(3)
    yield("/gearset change 30")

    local lastCheckTime = os.time()
    local lastPos = Player.Entity.Position

    while true do
        if Svc.ClientState.TerritoryType ~= 1252 then
            yield("/li occult")
            while IPC.Lifestream.IsBusy() or not(IsPlayerAvailable("Really")) do
                Sleep(1)
            end
            if IPC.Lifestream.IsBusy() then Echo("busy") else Echo("pas busy") end
            Sleep(5)
            local lastPos = Player.Entity.Position    
        else    
            yield("/bocchiillegal on")
            yield("/rotation manual")
            yield("/bmrai on")
            local test = GetNodeText("ChatLogPanel_0",1,2,3)
            lasth = nil
            lastm = nil
            lasts = nil
            lastb = nil

            for h,m,s,b in string.gmatch(test, pattern) do
                lasth = h
                lastm = m
                lasts = s
                lastb = b
                --yield("/echo Coffers: "..lasth..":"..lastm.." Silver: " .. lasts .. " | Bronze: " .. lastb)
            end

            if lasth and lastm and lasts and lastb then
                yield("/echo Coffers: "..lasth..":"..lastm.." Silver: " .. lasts .. " | Bronze: " .. lastb)
           

                if tonumber(lastb) >= 30 and (lasth ~= oldh or lastm ~= oldm) then 
                    oldh = lasth
                    oldm = lastm    
                    yield("/bocchiillegal off")                
            
                    while not IsPlayerAvailable() do
                        Sleep(1)
                    end
                    yield("/echo Démarrage treasure hunt dans 5 sec")
                    Sleep(5)
                    coffer()
          
                    yield("/bocchiillegal on")                                
                end        
            end

            Sleep(20)

            if os.time() - lastCheckTime >= TIME_CHECK then 
                Echo("[Check] Stuck")
                if Vector3.Distance(Player.Entity.Position,posAetheryte) > 4 then
                    Echo("[Check] loin aetheryte")
                    if lastPos.X == Player.Entity.Position.X and lastPos.Y == Player.Entity.Position.Y and lastPos.Z == Player.Entity.Position.Z then
                        --Stuck
                        Echo("[Check] Destuck")
                        yield("/bocchiillegal off")  
                        yield("/return")
                        Sleep(1)
                        waitUntilPlayer()
                        Movement(posAetheryte.X,posAetheryte.Y,posAetheryte.Z,false,3)
                        yield("/bocchiillegal on")  
                    end
                lastCheckTime = os.time()
                lastPos = Player.Entity.Position
            end
        
    end

        
        end
    end
end

main()


