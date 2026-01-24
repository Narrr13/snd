

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
