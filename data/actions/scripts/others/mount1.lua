function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local mount = 438

	if not mount then
		return true
	end
	if not player:hasMount(438) then
		player:addMount(438)
		player:say(mount.message, TALKTYPE_MONSTER_SAY)
	else
		player:sendTextMessage(19, "You already have this mount")
	end
	return true
end
