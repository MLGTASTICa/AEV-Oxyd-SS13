/obj/item/projectile/bullet/grenade
	name = "grenade shell"
	icon_state = "grenade"
	damage_types = list(
		ARMOR_BULLET = list(
			DELEM(BRUTE,10),
			DELEM(HALLOSS, 10)
		)
	)
	armor_divisor = 1
	embed = FALSE
	sharp = FALSE
	step_delay = 1.2
	recoil = 7 // Unlike shotgun shells, this one doesn't rely on velocity, but payload instead
	can_ricochet = FALSE

/obj/item/projectile/bullet/grenade/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0, glide_size_override = 0, initiator = src)	//Makes grenade shells cause their effect when they arrive at their target turf
	if(get_turf(src) == get_turf(original))
		grenade_effect(get_turf(src))
		qdel(src)
	else
		..()

/obj/item/projectile/bullet/grenade/on_hit(atom/target)	//Allows us to cause different effects for each grenade shell on hit
	grenade_effect(target)

/obj/item/projectile/bullet/grenade/proc/grenade_effect(target)
	qdel(src) // DO NOT ALLOW SRC TO SURVIVE THIS
	SHOULD_CALL_PARENT(TRUE)

/obj/item/projectile/bullet/grenade/blast
	name = "blast shell"
	var/explosion_power = 200
	var/explosion_falloff = 50

/obj/item/projectile/bullet/grenade/blast/grenade_effect(target)
	explosion(get_turf(target), explosion_power, explosion_falloff)
	. = ..()

/obj/item/projectile/bullet/grenade/heatwave
	name = "heatwave shell"
	var/heat_damage = 40
	var/penetration = 10
	var/heavy_range = 1
	var/weak_range = 3
	var/fire_stacks = TRUE

/obj/item/projectile/bullet/grenade/heatwave/grenade_effect(target)
	heatwave(target, heavy_range, weak_range, heat_damage, fire_stacks, penetration)
	. = ..()

/obj/item/projectile/bullet/grenade/frag
	name = "frag shell"
	var/range = 4
	var/f_type = /obj/item/projectile/bullet/pellet/fragment
	var/f_amount = 30
	var/f_damage = 12
	var/f_step = 8 // Less amount of fragment means range will be shorter despite same step
	var/same_turf_hit_chance = 15
	var/hasBlown = FALSE

/obj/item/projectile/bullet/grenade/frag/weak
	name = "frag shell"
	f_damage = 8
	f_step = 4

/obj/item/projectile/bullet/grenade/frag/sting
	name = "sting shell"
	f_type = /obj/item/projectile/bullet/pellet/fragment/rubber
	f_amount = 18
	f_damage = 5
	f_step = 8

/obj/item/projectile/bullet/grenade/frag/grenade_effect(target)
	if(!hasBlown)
		fragment_explosion(target, range, f_type, f_amount, f_damage, f_step, same_turf_hit_chance)
		explosion(get_turf(target), 60, 40)
		hasBlown = TRUE

/obj/item/projectile/bullet/grenade/frag/sting/weak
	name = "sting shell"
	f_type = /obj/item/projectile/bullet/pellet/fragment/rubber/weak
	f_amount = 18
	f_damage = 3
	f_step = 8

/obj/item/projectile/bullet/grenade/emp
	var/heavy_emp_range = 3
	var/light_emp_range = 8

/obj/item/projectile/bullet/grenade/emp/grenade_effect(target)
	empulse(target, heavy_emp_range, light_emp_range)
	. = ..()

/obj/item/projectile/bullet/grenade/emp/low_yield
	heavy_emp_range = 4
	light_emp_range = 1

//handgrenade shell: Drops a grenade that insta detonates for effects like gas
/obj/item/projectile/bullet/grenade/handgrenade
	icon_state = "grenade"
	name = "cs grenade"
	var/obj/item/grenade/hand_gren = /obj/item/grenade/chem_grenade/teargas

/obj/item/projectile/bullet/grenade/handgrenade/grenade_effect(target)
	var/obj/item/grenade/G = new hand_gren(src)
	G.prime()
	. = ..()

/obj/item/projectile/bullet/grenade/handgrenade/teargas    // Because why not
	name = "cs shell"

