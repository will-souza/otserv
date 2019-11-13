function onUse(cid, item, fromPosition, itemEx, toPosition)

local effect = 30 -- efeito ao clicar no baú
local storage = 34530 

if(getPlayerStorageValue(cid, 34530) > 0) then
doPlayerSendTextMessage(cid, 25, "Você já recebeu sua mount.")
return TRUE
end
﻿
doPlayerAddMount(cid, 437) -- Aqui é o ID da montaria, você pode encontrar em DATA/XML/mounts.xml.
doPlayerSendTextMessage(cid, 25, "Você ganhou uma nova mount.")
doSendMagicEffect(getPlayerPosition(cid), effect)

return TRUE
end
