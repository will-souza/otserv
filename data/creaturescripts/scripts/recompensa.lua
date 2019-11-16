local tabela = 
{
    -- [level] = type = "item", id = ITEM_ID, id2 = QUANTIDADE, msg = "MENSAGEM"},
    -- [level] = type = "addon", id = ID_ADDON_FEMALE, id2 = ID_ADDON_MALE, msg = "MENSAGEM"},
    -- [level] = type = "mount", id = ID_MOUNT, id2 = 0, msg = "MENSAGEM"},

    [20] = {type = "item", id = 2160, id2 = 5, msg = "Voce ganhou 5 crystal coins por alcancar o level 20!"},
    [50] = {type = "addon", id = 136, id2 = 128, msg = "Voce ganhou o addon citizen full por alcancar o level 50!"},
    [60] = {type = "mount", id = 2, id2 = 0, msg = "Voce ganhou a montaria x!"},
}

local storage = 15000

function onAdvance(player, skill, oldLevel, newLevel)

    if (skill == 8) then
        for level, _ in pairs(tabela) do
            if player:getLevel() >= level and player:getStorageValue(storage) < level then
                if tabela[level].type == "item" then    
                    player:addItem(tabela[level].id, tabela[level].id2)
                elseif tabela[level].type == "addon" then
                    player:addOutfitAddon(tabela[level].id, 3)
                    player:addOutfitAddon(tabela[level].id2, 3)
                elseif tabela[level].type == "mount" then
                    player:addMount(tabela[level].id)
                else
                    return false
                end

                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, tabela[level].msg)
                player:setStorageValue(storage, level)
            end
        end
    end

    player:save() -- salvando player   

    return true
end
