
local aether_info = nil
local net_info = nil
function load_aether_info()
    if aether_info == nil then
        local t = os.clock()
        aether_info = {}
        net_info = {}
        local sheet = Excel.GetSheet("Aetheryte")
        for r = 0, sheet.Count - 1 do
            if os.clock() - t > 1.0 / 10.0 then
                wait(0)
                t = os.clock()
            end
            local row = sheet[r]
            if Instances.Telepo:IsAetheryteUnlocked(r) then
                if row.IsAetheryte then
                    aether_info[row.RowId] = {
                        AetherId = row.RowId,
                        Name = row.PlaceName.Name,
                        TerritoryId = row.Territory.RowId,
                        Position = Instances.Telepo:GetAetherytePosition(r)
                    }
                end
                if row.AethernetName.RowId ~= 0 then
                    net_info[row.RowId] = {
                        Group = row.AethernetGroup,
                        Name = row.AethernetName.Name,
                        TerritoryId = row.Territory.RowId,
                        Position = Instances.Telepo:GetAetherytePosition(r),
                        Invisible = row.Invisible
                    }
                end
            end
        end
    end
    return aether_info, net_info
end

function nearest_aetherite(territory_id, goal_point)
    local closest = nil
    local distance = nil
    for _, row in pairs(load_aether_info()) do
        if row.TerritoryId == territory_id then
            local d = Vector3.Distance(goal_point, row.Position)
            if closest == nil or d < distance then
                closest = row
                distance = d
            end
        end
    end

    return closest
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
        
    if multi then
        for i=0,Svc.Party.Length-1 do
            localPattern="%[(.-)%].-"..Svc.Party[i].Name.TextValue..".-"..pattern.."$"
            lasth = nil
            lastj = nil
            for j=1,#strTab do   
                h = string.match(strTab[j], localPattern)
                if h ~= nil then 
                    lasth = h 
                    lastj = j
                end
            end
            --si pas table de check ou table de check et pattern pas contenu dedans                        
            if lasth and ( (tabLog ~=nil and not(isContainedInTable(tabLog,lasth,localPattern,strTab[lastj])) or (tabLog ==nil))) then
                tabLogTmp[Svc.Party[i].Name.TextValue]={lasth,localPattern,strTab[lastj]}
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
        --Si KO
        else
            do return false, tabLog end
        end     
    --Si pas multi
    else
        localPattern="%[(.-)%]"..pattern.."$"
        lasth=nil
        lasti=nil
        for i=1,#strTab do   
            h = string.match(strTab[i], localPattern)
            if h ~= nil then 
                lasth=h 
                lasti=i
            end
        end    
        if lasth and ((tabLog ~=nil and not(isContainedInTable(tabLog,lasth,localPattern,strTab[lasti])) or (tabLog ==nil) )) then
            tabLogTmp={ {lasth,localPattern,strTab[lasti]} }
        end
        if #tabLogTmp==1 then
            if tabLog~=nil then
                pushAndShift(tabLog,tabLogTmp[1])
            end
            return true,tabLog
        else
            return false, tabLog
        end
    end
    return false,tabLog
end


function isContainedInTable(tableau, ...)
    local valeurs = {...}

    for _, element in ipairs(tableau) do
        if #element == #valeurs then
            local match = true

            for i = 1, #valeurs do
                if element[i] ~= valeurs[i] then
                    match = false
                    break
                end
            end

            if match then
                return true
            end
        end
    end

    return false
end

function pushAndShift(t, element,maxElement)
    maxElement = maxElement or 100
    table.insert(t, element)
    if #t > maxElement then
        table.remove(t, 1)
    end
    return t
end


function strSplit(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end


function tableToString(t, indent, visited)
    indent = indent or 0
    visited = visited or {}

    if type(t) ~= "table" then
        return tostring(t)
    end
    -- évite les références circulaires
    if visited[t] then
        return "<circular>"
    end
    visited[t] = true

    local spacing = string.rep(" ", indent)
    local result = "{\n"

    for k, v in pairs(t) do
        local key
        if type(k) == "string" then
            key = string.format('["%s"]', k)
        else
            key = "[" .. tostring(k) .. "]"
        end

        result = result
            .. spacing .. "  "
            .. key .. " = "
            .. tableToString(v, indent + 2, visited)
            .. ",\n"
    end

    result = result .. spacing .. "}"
    return result
end

--[[
function contient(tableau, v1, v2)
    for _, element in ipairs(tableau) do
        if element[1] == v1 and element[2] == v2 then
            return true
        end
    end
    return false
end

]]
