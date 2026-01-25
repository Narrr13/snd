

function ConvertMapCoordToWorldCoord(mapCoord, zoneId)
    local scaleOffset = 2048 / scale
    local offsetAdjustment = 0.02 * offset
    return (mapCoord - 1.0 - scaleOffset - offsetAdjustment) * 50.0
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
    maxElement = mexElement or 100
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

--function qui affiche un tableau à 2dimension en loginfo
function logTab2dim(tab)
    for i=1,#tab do
        s="{"
        for j=1,#tab[i] do
            s = s..tab[i][j]..","
        end
        s=s.."}"
        ss=ss..s
    end
    LogInfo(ss)
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
