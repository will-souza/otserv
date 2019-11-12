local config = {
	[0] = {
		--Legion Helmet, Chain Armor, Chain Legs ,Crocodile Boots, Rapier, Wooden Shield, Expedition Backpack, 5x Fish, Rope, Shovel
		items = {{2480, 1}, {2464, 1}, {2648, 1}, {2384, 1}, {2512, 1}, {11241, 1}, {3982, 1}},
		--container rope, shovel, red apple
		container = {{2120, 1}, {2554, 1}, {6984, 5}}
	},
	[1] = {
		--equipment spellbook, wand of vortex, magician's robe, mage hat, studded legs, leather boots, scarf
		items = {{2175, 1}, {2190, 1}, {8819, 1}, {8820, 1}, {2468, 1}, {2643, 1}, {2661, 1}},
		--container platinum coin, rope, shovel, mana potion
		container = {{2152, 20}, {7620, 5}, {18559, 1}, {2120, 1}}
	},
	[2] = {
		--equipment spellbook, snakebite rod, magician's robe, mage hat, studded legs, leather boots scarf
		items = {{2175, 1}, {2182, 1}, {8819, 1}, {8820, 1}, {2468, 1}, {2643, 1}, {2661, 1}},
		--container platinum coin, rope, shovel, mana potion
		container = {{2152, 20}, {7620, 5}, {18559, 1}, {2120, 1}}
	},
	[3] = {
		--equipment dwarven shield, 5 spear, ranger's cloak, ranger legs scarf, legion helmet
		items = {{2525, 1}, {2664, 1}, {2647, 1}, {11303, 1}, {2455, 1}, {2661, 1}, {10521, 1}},
		--container platinum coin, rope, shovel, health potion, mana potion
		container = {{2518, 1}, {2410, 1}, {2456, 1}, {2789, 25}, {2543, 1}, {2554, 1}}
	},
	[4] = {
		--Scarf, Crown Helmet, Crown Armor, Crown Legs, Zaoan Shoes, Spike Sword, Bonelord Shield, Moon Backpack
		items = {{2491, 1}, {2487, 1}, {2488, 1}, {11303, 1}, {29151, 1}, {2518, 1}, {10521, 1}},
		--container  Morning Star, Orcish Axe, 25x Brown Mushroom, Shovel, 20x Health Potion, 5x Mana Potion
		container = {{2394, 1}, {2428, 1}, {2789, 25}, {5710, 1}, {7588, 20}, {18559, 1}, {7589, 5}}
	}

}

function onLogin(player)
	local targetVocation = config[player:getVocation():getId()]
	if not targetVocation then
		return true
	end

	if player:getLastLoginSaved() ~= 0 then
		return true
	end

	if (player:getSlotItem(CONST_SLOT_LEFT)) then
		return true
	end

	for i = 1, #targetVocation.items do
		player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
	end

	local backpack = player:getVocation():getId() == 0 and player:addItem(10521) or player:addItem(10521)
	if not backpack then
		return true
	end

	for i = 1, #targetVocation.container do
		backpack:addItem(targetVocation.container[i][1], targetVocation.container[i][2])
	end
	return true
end
