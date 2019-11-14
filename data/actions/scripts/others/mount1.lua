function onUse(cid, item, fromPosition, itemEx, toPosition)

local effect = 30 -- efeito ao clicar no baú
local storage = 34530 

if(player:getStorageValue(cid, 34530) > 0) then
return TRUE
end
﻿
player:addMount(437) -- Aqui é o ID da montaria, você pode encontrar em DATA/XML/mounts.xml.
toPosition:sendMagicEffect(CONST_ME_SOUND_RED)

return TRUE
end
