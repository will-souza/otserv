local table = 
{
    -- [level] = type = "item", id = {ITEM_ID, QUANTIDADE}, msg = "MENSAGEM"},
    -- [level] = type = "bank", id = {QUANTIDADE, 0}, msg = "MENSAGEM"},
    -- [level] = type = "addon", id = {ID_ADDON_FEMALE, ID_ADDON_MALE}, msg = "MENSAGEM"},
    -- [level] = type = "mount", id = {ID_MOUNT, 0}, msg = "MENSAGEM"},

    [20] = {type = "item", id = {2160, 5}, msg = "Voce ganhou 5 crystal coins por alcancar o level 20!"},
    [50] = {type = "addon", id = {136, 128}, msg = "Voce ganhou o addon citizen full por alcancar o level 50!"},
    [100] = {type = "bank", id = {150000, 0}, msg = "Foi depositado em seu bank 150000 gold coints!"},
    [100] = {type = "item", id = {2195, 1}, msg = "Voce ganhou uma boots of haste por alcancar o level 100!"},
    [150] = {type = "item", id = {5942, 1}, msg = "Voce ganhou uma blessed wooden stake por alcancar o level 150!"},
    [150] = {type = "addon", id = {148, 144}, msg = "Voce ganhou o addon Druid full por alcancar o level 150!"},
    [200] = {type = "bank", id = {300000, 0}, msg = "Foi depositado em seu bank 300000 gold coints!"},
    [200] = {type = "addon", id = {158, 154}, msg = "Voce ganhou o addon Shaman full por alcancar o level 200!"},
    [300] = {type = "addon", id = {156, 152}, msg = "Voce ganhou o addon Assassin full por alcancar o level 300!"},
    [300] = {type = "bank", id = {200000, 0}, msg = "Foi depositado em seu bank 200000 gold coints!"},
    [300] = {type = "item", id = {20620, 1}, msg = "Voce ganhou 1 Zaoan chess box por alcancar o level 300!"},
    [400] = {type = "addon", id = {279, 278}, msg = "Voce ganhou o addon Brotherhood full por alcancar o level 400!"},
    [400] = {type = "item", id = {18511, 1}, msg = "Voce ganhou 1 Music box por alcancar o level 40!"},
    [400] = {type = "bank", id = {200000, 0}, msg = "Foi depositado em seu bank 200000 gold coints!"},
    [500] = {type = "item", id = {18511, 1}, msg = "Voce ganhou 1 Music box por alcancar o level 500!"},
    [500] = {type = "addon", id = {1128, 1127}, msg = "Voce ganhou o addon Pumpkin Mummy full por alcancar o level 500!"},
    [500] = {type = "bank", id = {200000, 0}, msg = "Foi depositado em seu bank 200000 gold coints!"},
    [600] = {type = "mount", id = {1209, 0}, msg = "Voce ganhou a montaria Cerberus Champion!"},
}

local storage = 15000

function onAdvance(player, skill, oldLevel, newLevel)

    if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
        return true
    end

    for level, _ in pairs(table) do
        if newLevel >= level and player:getStorageValue(storage) < level then
            if table[level].type == "item" then 
                player:addItem(table[level].id[1], table[level].id[2])
            elseif table[level].type == "bank" then
                player:setBankBalance(player:getBankBalance() + table[level].id[1])
            elseif table[level].type == "addon" then
                player:addOutfitAddon(table[level].id[1], 3)
                player:addOutfitAddon(table[level].id[2], 3)
            elseif table[level].type == "mount" then
                player:addMount(table[level].id[1])
            else
                return false
            end

            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, table[level].msg)
            player:setStorageValue(storage, level)
        end
    end

    player:save()

    return true
end