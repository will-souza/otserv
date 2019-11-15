function onClick(player, item, fromPosition, target, toPosition, isHotkey)

	local chest = config[item.uid]
	if not chest then
		return true
	end
	if player:getStorageValue(item.uid) >= 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The chest is empty.')
		return true
	end
	if not player:hasMount(438) then
		player:setStorageValue(item.uid, 1)
		player:addMount(438)
		player:say(mount.message, TALKTYPE_MONSTER_SAY)

	else
		player:sendTextMessage(19, "You already have this mount")
	end
	return true
end
