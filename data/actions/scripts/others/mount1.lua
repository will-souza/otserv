function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	if not player:hasMount(438) then
		player:addMount(438)
		player:say(mount.message, TALKTYPE_MONSTER_SAY)
		item:remove(1)
	else
		player:sendTextMessage(19, "You already have this mount")
	end
	return true
end
