--require "utils"
require "NonuLuaLib"
require "Inventory"

--map = {id = 12243, label = "dragon", decipherId = 2001764}

function open_map(map_name, partial_ok)
    partial_ok = default(partial_ok, false)
    local ready = false
    repeat
        local addon = Addons.GetAddon("SelectIconString")
        if addon.Ready then
            title = addon:GetAtkValue(0)
            if title ~= nil then
                title = title.ValueString
            end
            if title == "Decipher" then
                ready = true
            else
                log_(LEVEL_ERROR, log, "SelectIconString found with unexpected title:", title)
                close_addon("SelectIconString")
            end
        end
        if not ready then
            Actions.ExecuteGeneralAction(19)
            Sleep(0.5)
        end
    until ready

    rech = RechercheIndex(map_name, "SelectIconString", partial_ok)
    if rech ~= nil then
        yield("/callback SelectIconString true "..rech)
    else
--        yield("/echo Plus de carte")
 --       yield("/p Plus de carte")
    end
    Sleep(2)
end

function default(value, default_value)
    if value == nil then return default_value end
    return value
end

function list_index(base, index)
    if index == 0 then
        return base
    end
    return base * 10000 + 1000 + index
end


function RechercheIndex(name, menu, partial_ok)
    partial_ok = default(partial_ok, false)
    local string = name
    local click
    menu = default(menu, "ContextMenu")
    if string then
        for i = 0, 21 do
            local a = Addons.GetAddon(menu)
            local entry = a:GetNode(1, 3, list_index(5, i), 2)          
            if entry == nil then 
                 break
             end
            local match = entry.Text:upper() == string:upper()
            if not match and partial_ok then
                match = entry.Text:upper():find(string:upper())
            end
            if match then
                click = i
                break
            end
        end
    end
    return click
end


function openMap(id,label,decipherId)
    if searchItem(decipherId,InventoryType.KeyItems) ~= true then
        if Inventory.GetItemCount(id) > 0 or moveItemFromSaddle(id) then
            open_map(label,true)
            yield("/tmap")
            Sleep(0.5)
            yield("/p <flag>")
            Sleep(1)
            yield("/p openMapDone")
        else
            yield("/p openMapDone")
        end
    else
        yield("/tmap")
        Sleep(0.5)
        yield("/p <flag>")
        Sleep(1)
        yield("/p openMapDone")
    end
end

