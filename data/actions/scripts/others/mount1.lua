function onUse(cid, item, fromPosition, itemEx, toPosition, isHotkey)
local player = Player(cid)
if not player:hasMount(23) then
player:addMount(23)
player:getPosition():sendMagicEffect(15)
doCreatureSay(cid, "You received Armoured War Horse.", TALKTYPE_ORANGE_1)
else
player:getPosition():sendMagicEffect(3)
player:sendTextMessage(MESSAGE_INFO_DESCR, "You already have this mount.")
end
return true
end