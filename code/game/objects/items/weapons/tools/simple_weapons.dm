//Those are all weapons that don't had tool modding at some point, but should have it for balance purposes.

/obj/item/tool/broken_bottle
	name = "broken bottle"
	desc = "A bottle with a sharp broken bottom."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "broken_bottle"
	matter = list(MATERIAL_GLASS = 2)
	worksound = WORKSOUND_HARD_SLASH
	melleDamages = list(ARMOR_POINTY = list(DELEM(BRUTE,10)))
	attackDelay = -2
	throwforce = WEAPON_FORCE_WEAK
	item_state = "beer"
	attack_verb = list("stabbed", "slashed", "attacked")
	sharp = TRUE
	edge = FALSE
	maxUpgrades = 1 //it's not even a tool
	tool_qualities = list(QUALITY_CUTTING = 10)
	var/icon/broken_outline = icon('icons/obj/drinks.dmi', "broken")
	spawn_tags = SPAWN_TAG_JUNKTOOL

/obj/item/tool/nailstick
	name = "nailed stick"
	desc = "Stick with some nails in it. Looks sharp enough."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hm_spikeclub"
	item_state = "hm_spikeclub"
	melleDamages = list(ARMOR_POINTY = list(DELEM(BRUTE,19)))
	throwforce = WEAPON_FORCE_PAINFUL
	volumeClass = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 2)
	attack_verb = list("beaten", "slammed", "smacked", "struck", "battered")
	hitsound = 'sound/weapons/melee/blunthit.ogg'
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	maxUpgrades = 5
	tool_qualities = list(QUALITY_HAMMERING = 10)
	spawn_tags = SPAWN_TAG_JUNKTOOL

/obj/item/tool/hatchet
	name = "hatchet"
	desc = "A very sharp axe blade upon a short fibremetal handle. It has a long history of chopping things, but now it is used for chopping wood."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hatchet"
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTIC = 3)
	worksound = WORKSOUND_HARD_SLASH
	melleDamages = list(ARMOR_SLASH = list(DELEM(BRUTE,23)))
	throwforce = 16
	volumeClass = ITEM_SIZE_SMALL
	sharp = TRUE
	edge = TRUE
	origin_tech = list(TECH_MATERIAL = 2, TECH_COMBAT = 1)
	attack_verb = list("chopped", "torn", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	tool_qualities = list(QUALITY_CUTTING = 20)

/obj/item/tool/makeshiftaxe
	name = "makeshift axe"
	desc = "A heavy plasteel blade affixed to a welded metal shaft, for close up carnage."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "makeshift_axe"
	item_state = "makeshift_axe"
	wielded_icon = "makeshift_axe_wielded"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTEEL = 3)
	worksound = WORKSOUND_HARD_SLASH
	melleDamages = list(ARMOR_SLASH = list(DELEM(BRUTE,15)))
	wieldedMultiplier = 3
	WieldedattackDelay = 20
	throwforce = 18
	volumeClass = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BACK
	sharp = TRUE
	edge = TRUE
	attack_verb = list("chopped", "torn", "cut", "cleaved", "slashed")
	hitsound = 'sound/weapons/melee/heavystab.ogg'
	tool_qualities = list(QUALITY_CUTTING = 10)
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	embed_mult = 1.1
	degradation = 1.5 //not quite as sturdy as a normal weapon
	maxUpgrades = 5 //all makeshift tools get more mods to make them actually viable for mid-late game
	rarity_value = 60
	spawn_tags = SPAWN_TAG_JUNKTOOL

/obj/item/tool/fireaxe
	name = "fire axe"
	desc = "Truly, the weapon of a madman. Who would think to fight fire with an axe?"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "fireaxe0"
	wielded_icon = "fireaxe1"
	sharp = TRUE
	edge = TRUE
	armor_divisor = 1.3
	tool_qualities = list(QUALITY_CUTTING = 10, QUALITY_PRYING = 20)
	volumeClass = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	melleDamages = list(ARMOR_BLUNT = list(DELEM(BRUTE,20)))
	wieldedMultiplier = 2.3
	attackDelay = 4
	WieldedattackDelay = 9
	attack_verb = list("attacked", "chopped", "cleaved", "torn", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 5, MATERIAL_STEEL = 5)
	embed_mult = 1.2 //Axes cut deep, and their hooked shape catches on things
	rarity_value = 48

/obj/item/tool/fireaxe/afterattack(atom/A as mob|obj|turf|area, mob/user, proximity)
	if(!proximity) return
	..()
	if(A && wielded)
		if(istype(A,/obj/effect/plant))
			var/obj/effect/plant/P = A
			P.die_off()

/obj/item/tool/minihoe
	name = "mini hoe"
	desc = "It's used for removing weeds or scratching your back."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hoe"
	item_state = "hoe"
	matter = list(MATERIAL_PLASTEEL = 2, MATERIAL_PLASTIC = 2)
	throwforce = WEAPON_FORCE_WEAK
	maxUpgrades = 2
	tool_qualities = list(QUALITY_SHOVELING = 10)
	volumeClass = ITEM_SIZE_SMALL
	attack_verb = list("slashed", "sliced", "cut", "clawed")

/obj/item/tool/scythe
	name = "scythe"
	desc = "A sharp and curved blade on a long fibremetal handle, this tool makes it easy to reap what you sow."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "scythe0"
	matter = list(MATERIAL_PLASTEEL = 7, MATERIAL_PLASTIC = 3)
	sharp = TRUE
	edge = TRUE
	worksound = WORKSOUND_HARD_SLASH
	melleDamages = list(ARMOR_SLASH = list(DELEM(BRUTE,12)))
	throwforce = 13
	volumeClass = ITEM_SIZE_BULKY
	slot_flags = SLOT_BACK
	attack_verb = list("chopped", "sliced", "cut", "reaped")
	hitsound = 'sound/weapons/bladeslice.ogg'
	tool_qualities = list(QUALITY_CUTTING = 15)
	spawn_tags = SPAWN_TAG_KNIFE
	rarity_value = 30

//Swords
/obj/item/tool/sword
	name = "claymore"
	desc = "What are you standing around staring at this for? Get to killing!"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "claymore"
	item_state = "claymore"
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 5)
	sharp = TRUE
	edge = TRUE
	volumeClass = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT | SLOT_BACK
	worksound = WORKSOUND_HARD_SLASH
	melleDamages = list(ARMOR_SLASH = list(DELEM(BRUTE,30)))
	wieldedMultiplier = 1.3
	WieldedattackDelay = 3
	throwforce = 20
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/melee/sharphit.ogg'
	tool_qualities = list(QUALITY_CUTTING = 10)
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	spawn_frequency = 8
	spawn_tags = SPAWN_TAG_SWORD
	rarity_value = 25

/obj/item/tool/sword/saber
	name = "officer's saber"
	desc = "A saber with golden grip, for the real heads of this ship."
	icon_state = "saber"
	item_state = "saber"
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_WOOD = 10, MATERIAL_GOLD = 10, MATERIAL_DIAMOND = 1)
	slot_flags = SLOT_BELT
	melleDamages = list(ARMOR_SLASH = list(DELEM(BRUTE,35)))
	wieldedMultiplier = 1.2
	spawn_blacklisted = TRUE
	price_tag = 10000

/obj/item/tool/sword/improvised
	name = "junkblade"
	desc = "Hack and slash!"
	icon_state = "msword"
	item_state = "msword"
	melleDamages = list(ARMOR_SLASH = list(DELEM(BRUTE,25)))
	wieldedMultiplier = 1.5
	attackDelay = 4
	/// heavy hitter but slow attack
	WieldedattackDelay = 6
	tool_qualities = list(QUALITY_CUTTING = 15) // a little better than the regular swords.
	degradation = 1.5 //not quite as sturdy as a normal weapon
	maxUpgrades = 5 //all makeshift tools get more mods to make them actually viable for mid-late game
	rarity_value = 60
	spawn_tags = SPAWN_TAG_JUNKTOOL

/obj/item/tool/sword/katana //slightly less penetration, slightly more damage
	name = "katana"
	desc = "Modern japanese-style blade that has no curve to it. This one looks pretty sharp."
	icon_state = "katana"
	item_state = "katana"
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 5, MATERIAL_DIAMOND = 1) //sharpened using diamond dust or whatever
	melleDamages = list(ARMOR_SLASH = list(DELEM(BRUTE,30)))
	wieldedMultiplier = 1.2
	rarity_value = 120

/obj/item/tool/sword/katana/nano
	name = "\improper Moebius \"Muramasa\" katana"
	desc = "After an extensive binge of ancient animated recordings, a scientist decided to upgrade a recovered katana."
	icon_state = "eutactic_katana"
	item_state = "eutactic_katana"
	toggleable = TRUE
	maxUpgrades = 1

	suitable_cell = /obj/item/cell/small
	melleDamages = list(ARMOR_BLUNT = list(DELEM(BRUTE,5)))

	use_power_cost = 0.4
	passive_power_cost = 0.4

	switched_on_qualities = list(QUALITY_CUTTING = 25)
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 6)
	switchedOn = list(ARMOR_SLASH = list(DELEM(BURN,25)))
	spawn_blacklisted = TRUE

/obj/item/tool/sword/katana/nano/turn_on(mob/user)
	.=..()
	if(.)
		embed_mult = 0
		playsound(user, 'sound/weapons/saberon.ogg', 50, 1)

/obj/item/tool/sword/katana/nano/turn_off(mob/user)
	..()
	embed_mult = initial(embed_mult)
	playsound(user, 'sound/weapons/saberoff.ogg', 50, 1)

/obj/item/tool/sword/katana/nano/update_icon()
	..()
	if(cell)
		overlays += "[icon_state]_cell"
	if(switched_on)
		overlays += "[icon_state]_power_on"
	else
		overlays += "[icon_state]_power_off"

//Flails
/obj/item/tool/chainofcommand
	name = "chain of command"
	desc = "A tool used by great men to placate the frothing masses."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "chain"
	item_state = "chain"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	melleDamages = list(ARMOR_BLUNT = list(DELEM(BRUTE,5), DELEM(HALLOSS,10)))
	wieldedMultiplier = 2
	throwforce = 23
	volumeClass = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 4)
	attack_verb = list("flogged", "whipped", "lashed", "disciplined")
	maxUpgrades = 2
	tool_qualities = list(QUALITY_HAMMERING = 5)
	spawn_blacklisted = TRUE
