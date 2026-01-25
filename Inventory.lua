require("NonuLuaLib")

function ContainerWithFreeSlot()
    if Inventory.GetInventoryContainer(InventoryType.Inventory1).Items.Count < 35 then 
--        yield("/echo Inv 1 pas full "..Inventory.GetInventoryContainer(InventoryType.Inventory1).Items.Count)
        return InventoryType.Inventory1
    end
    if Inventory.GetInventoryContainer(InventoryType.Inventory2).Items.Count < 35 then 
--        yield("/echo Inv 2 pas full "..Inventory.GetInventoryContainer(InventoryType.Inventory2).Items.Count)
        return InventoryType.Inventory2
    end
    if Inventory.GetInventoryContainer(InventoryType.Inventory3).Items.Count < 35 then 
--        yield("/echo Inv 3 pas full "..Inventory.GetInventoryContainer(InventoryType.Inventory3).Items.Count)
        return InventoryType.Inventory3
    end
    if Inventory.GetInventoryContainer(InventoryType.Inventory4).Items.Count < 35 then 
--        yield("/echo Inv 4 pas full "..Inventory.GetInventoryContainer(InventoryType.Inventory4).Items.Count)
        return InventoryType.Inventory4
    end
    return nil
end


-- Move item dont itemId = Id depuis le container source = containerSource vers le premier inventory non plein
function moveItem(id,containerSource)
    obj = containerSource
    if obj and obj.Items then
        local count = obj.Items.Count
        for i = 0, count - 1 do
            local item = obj.Items[i]
            if item and item.ItemId ~= 0 then
                if item.ItemId == id then 
                    free = ContainerWithFreeSlot()    
                    if free == nil then return false end
                    item:MoveItemSlot(free) 
                    Sleep(0.1)
                    --if Inventory.GetItemCount(id) == 0 then yield("/p move ko") else yield("/p move ok") end
                    return true
                end
            end
        end
    end
    return false
end


function moveItemFromSaddle(id)
    yield ('/hold SHIFT+CONTROL')
    yield ('/send I')
    Sleep(1)
    yield ('/send I')
    yield ('/release SHIFT+CONTROL')
    if moveItem(id,Inventory.GetInventoryContainer(InventoryType.SaddleBag1)) then
        return true
    elseif moveItem(id,Inventory.GetInventoryContainer(InventoryType.SaddleBag2)) then
        return true
    else
        return false 
    end
end


function searchItem(id,container)
    obj = Inventory.GetInventoryContainer(container)  
    if obj and obj.Items then
        local count = obj.Items.Count
        for i = 0, count - 1 do
            local item = obj.Items[i]
            if item and item.ItemId ~= 0 then
                if item.ItemId == id then 
                    return true 
                end
            end
        end
    end
    return false
end


-- Affiche en loginfo les Id des items
function listItem(container)
    obj = Inventory.GetInventoryContainer(container)  
    if obj and obj.Items then
        local count = obj.Items.Count
        for i = 0, count - 1 do
            local item = obj.Items[i]
            if item and item.ItemId ~= 0 then
               LogInfo(item.ItemId)
            end
        end
    end
end

