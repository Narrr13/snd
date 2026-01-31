
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
