local price_aol = 10000

f﻿unction onSay(player, words, param)

    if player:removeMoney(price_aol) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
        player:addItem(2173, 1)    
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("You don't have enought money.")
    end

      return true
end
