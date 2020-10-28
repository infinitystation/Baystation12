/*/spell/targeted/stealth
	name = "Enter Stealth"
	desc = "This spell creates your ethereal form, temporarily making you invisible and able to pass through walls."
	feedback = "ES"
	school = "Illusion"
	charge_max = 300
	spell_flags = Z2NOCAST | INCLUDEUSER | CONSTRUCT_CHECK
	invocation = "none"
	invocation_type = SpI_NONE
	range = 0	//INF was -1 view(-1) detects usr.content but not usr as itself
	max_targets = 1
	cooldown_min = 15

	hud_state = "const_shift"

/spell/targeted/stealth/cast(list/targets)
	for(var/mob/living/simple_animal/construct/wraith/benemoth/target in targets)
		if(target.alpha > 5)
			target.last_hp = target.health
			target.health = min(target.health, 1)
			target.maxHealth = 1
			target.alpha = 5
			to_chat(target,"<span class='cult'>You are now consealed. Your attacks will deal extra damage, but any hit will kill you instatly.</span>")
			target.melee_damage_lower *= 2
			target.melee_damage_upper *= 2
		else
			target.health = target.last_hp
			target.maxHealth = 75
			target.alpha = 255
			to_chat(target,"<span class='cult'>You are now visible again. Now you have your full health and attack damage.</span>")
			target.melee_damage_lower = 25
			target.melee_damage_upper = 25*/


/spell/aoe_turf/conjure/forcewall_cult

	name = "Shield"
	desc = "Allows you to pull up a shield to protect yourself and allies from incoming threats"

	charge_max = 300
	spell_flags = 0
	invocation = "none"

	school = "conjuration"
	feedback = "FW"
	cast_sound = 'sound/magic/forcewall.ogg'

	invocation_type = SpI_NONE
	range = 0
	summon_type = /obj/effect/forcefield/cult
	duration = 200

	spell_flags = CONSTRUCT_CHECK

	hud_state = "const_juggwall"

/spell/aoe_turf/conjure/forcewall_cult/cast(list/targets, mob/user)
	new summon_type(get_turf(user))
	if(user.dir == SOUTH || user.dir == NORTH)
		new summon_type(get_step(user, EAST))
		new summon_type(get_step(user, WEST))
	else
		new summon_type(get_step(user, NORTH))
		new summon_type(get_step(user, SOUTH))

/obj/effect/forcefield/cult/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(isliving(mover))
		var/mob/living/L = mover
		if(iscultist(L))
			return 1
	. = ..()

/spell/aoe_turf/conjure/forcewall_holy

	name = "Holy Shield"
	desc = "Allows you to pull up a shield to protect yourself and allies from incoming threats"

	charge_max = 300
	spell_flags = 0
	invocation = "none"

	school = "conjuration"
	feedback = "FW"
	cast_sound = 'sound/magic/forcewall.ogg'

	invocation_type = SpI_NONE
	range = 0
	summon_type = /obj/effect/forcefield/holy
	duration = 200

	spell_flags = CONSTRUCT_CHECK | HOLY_CHECK

	hud_state = "const_holywall"

/spell/aoe_turf/conjure/forcewall_holy/cast(list/targets, mob/user)
	new summon_type(get_turf(user))
	if(user.dir == SOUTH || user.dir == NORTH)
		new summon_type(get_step(user, EAST))
		new summon_type(get_step(user, WEST))
	else
		new summon_type(get_step(user, NORTH))
		new summon_type(get_step(user, SOUTH))

/obj/effect/forcefield/holy
	desc = "A blue, glowing wall that looks like it has been pulled from another dimension."
	name = "holy shield"
	icon = 'infinity/icons/effects/cult.dmi'
	icon_state = "holyshield"
	light_color = "#85dfff"
	light_outer_range = 2

/obj/effect/forcefield/holy/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(isliving(mover))
		var/mob/living/L = mover
		if(!iscultist(L))
			return 1
	. = ..()

/spell/targeted/ethereal_jaunt/holy_shift
	name = "Phase Shift"
	desc = "This spell allows you to pass through walls"

	charge_max = 200
	spell_flags = Z2NOCAST | INCLUDEUSER | CONSTRUCT_CHECK | HOLY_CHECK
	invocation_type = SpI_NONE
	range = 0 //INF, was -1
	duration = 50 //in deciseconds

	hud_state = "holy_shift"

/spell/targeted/ethereal_jaunt/holy_shift/jaunt_disappear(var/atom/movable/overlay/animation, var/mob/living/simple_animal/construct/target) //INF, was var/mob/living/target
	animation.icon = 'infinity/icons/mob/cult.dmi'
	animation.icon_state = "phase_shift_angelic"
	animation.dir = target.dir
	flick("phase_shift_angelic",animation)

/spell/targeted/ethereal_jaunt/holy_shift/jaunt_reappear(var/atom/movable/overlay/animation, var/mob/living/simple_animal/construct/target) //INF, was var/mob/living/target
	animation.icon = 'infinity/icons/mob/cult.dmi'
	animation.icon_state = "phase_shift2_angelic"
	animation.dir = target.dir
	flick("phase_shift2_angelic",animation)

/spell/targeted/ethereal_jaunt/holy_shift/jaunt_steam(var/mobloc)
	return

/spell/aoe_turf/conjure/soulstone/holy
	name = "Summon Holy Soulstone"
	desc = "Summon the Holy Soulstone, capable of capturing souls and creating holy constructs"

	spell_flags = HOLY_CHECK | CONSTRUCT_CHECK

	summon_type = list(/obj/item/device/soulstone/heretic/pure)

	hud_state = "holy_stone"
	override_base = "holy"

/spell/aoe_turf/conjure/construct/lesser/holy
	spell_flags = CONSTRUCT_CHECK | HOLY_CHECK
	override_base = "holy"

/spell/targeted/projectile/cult_missile
	name = "Cult Missile"
	desc = "This spell fires several, slow moving, eldritch projectiles at nearby targets."
	feedback = "CM"
	school = "conjuration"
	charge_max = 300
	spell_flags = CONSTRUCT_CHECK
	invocation = "none"
	invocation_type = SpI_NONE
	range = 7
	cooldown_min = 90 //15 deciseconds reduction per rank

	max_targets = 0

	proj_type = /obj/item/projectile/spell_projectile/seeking/cult_missile
	duration = 10
	proj_step_delay = 5

	hud_state = "cult_missile"
	cast_sound = 'sound/magic/magic_missile.ogg'
	amt_paralysis = 0
	amt_stunned = 3

	amt_dam_fire = 10

/spell/targeted/projectile/cult_missile/prox_cast(var/list/targets, atom/spell_holder)
	spell_holder.visible_message("<span class='danger'>\The [spell_holder] pops with a flash!</span>")
	playsound(src, 'sound/magic/mm_hit.ogg', 40)
	for(var/mob/living/M in targets)
		if(!iscultist(M))
			apply_spell_damage(M)
	return

/spell/targeted/projectile/cult_missile/choose_targets(mob/user = usr)
	var/list/targets = list()

	if(max_targets == 0) //unlimited
		if(range == -2)
			targets = GLOB.living_mob_list_
		else
			for(var/mob/living/target in view_or_range(range, holder, selection_type))
				targets += target

	else if(max_targets == 1) //single target can be picked
		if((range == 0 || range == -1) && spell_flags & INCLUDEUSER)
			targets += user
		else
			var/list/possible_targets = list()
			var/list/starting_targets
			if(range == -2)
				starting_targets = GLOB.living_mob_list_
			else
				starting_targets = view_or_range(range, holder, selection_type)

			for(var/mob/living/M in starting_targets)
				if(!(spell_flags & INCLUDEUSER) && M == user)
					continue
				if((spell_flags & NOFACTION) && user.faction == M.faction)
					continue
				if((spell_flags & NONONFACTION) && user.faction != M.faction)
					continue
				if(compatible_mobs && compatible_mobs.len)
					if(!is_type_in_list(M, compatible_mobs)) continue
				if(compatible_mobs && compatible_mobs.len && !is_type_in_list(M, compatible_mobs))
					continue
				possible_targets += M

			if(possible_targets.len)
				if(spell_flags & SELECTABLE) //if we are allowed to choose. see setup.dm for details
					var/mob/temp_target = input(user, "Choose the target for the spell.", "Targeting") as null|mob in possible_targets
					if(temp_target)
						targets += temp_target
				else
					targets += pick(possible_targets)
			//Adds a safety check post-input to make sure those targets are actually in range.


	else
		var/list/possible_targets = list()
		var/list/starting_targets

		if(range == -2)
			starting_targets = GLOB.living_mob_list_
		else
			starting_targets = view_or_range(range, holder, selection_type)

		for(var/mob/living/target in starting_targets)
			if(!(spell_flags & INCLUDEUSER) && target == user)
				continue
			if(compatible_mobs && !is_type_in_list(target, compatible_mobs))
				continue
			possible_targets += target

		if(spell_flags & SELECTABLE)
			for(var/i = 1; i<=max_targets, i++)
				if(!possible_targets.len)
					break
				var/mob/M = input(user, "Choose the target for the spell.", "Targeting") as null|mob in possible_targets
				if(!M)
					break
				if(range != -2)
					if(!(M in view_or_range(range, holder, selection_type)))
						continue
				targets += M
				possible_targets -= M
		else
			for(var/i=1,i<=max_targets,i++)
				if(!possible_targets.len)
					break
				if(target_ignore_prev)
					var/target = pick(possible_targets)
					possible_targets -= target
					targets += target
				else
					targets += pick(possible_targets)

	if(!(spell_flags & INCLUDEUSER) && (user in targets))
		targets -= user

	if(compatible_mobs && compatible_mobs.len)
		for(var/mob/living/target in targets) //filters out all the non-compatible mobs
			if(!is_type_in_list(target, compatible_mobs))
				targets -= target

	for(var/target in targets)
		if(iscultist(target))
			targets -= target

	return targets

/spell/targeted/projectile/holy_missile
	name = "Holy Missile"
	desc = "This spell fires several, slow moving, holy projectiles at nearby targets."
	feedback = "HM"
	school = "conjuration"
	charge_max = 300
	spell_flags = CONSTRUCT_CHECK | HOLY_CHECK
	invocation = "none"
	invocation_type = SpI_NONE
	range = 7
	cooldown_min = 90 //15 deciseconds reduction per rank

	max_targets = 0

	proj_type = /obj/item/projectile/spell_projectile/seeking/holy_missile
	duration = 10
	proj_step_delay = 5

	hud_state = "holy_missile"
	cast_sound = 'sound/magic/magic_missile.ogg'
	amt_paralysis = 0
	amt_stunned = 3

	amt_dam_fire = 10

/spell/targeted/projectile/cult_missile/choose_targets(mob/user = usr)
	var/list/targets = list()

	if(max_targets == 0) //unlimited
		if(range == -2)
			targets = GLOB.living_mob_list_
		else
			for(var/mob/living/target in view_or_range(range, holder, selection_type))
				targets += target

	else if(max_targets == 1) //single target can be picked
		if((range == 0 || range == -1) && spell_flags & INCLUDEUSER)
			targets += user
		else
			var/list/possible_targets = list()
			var/list/starting_targets
			if(range == -2)
				starting_targets = GLOB.living_mob_list_
			else
				starting_targets = view_or_range(range, holder, selection_type)

			for(var/mob/living/M in starting_targets)
				if(!(spell_flags & INCLUDEUSER) && M == user)
					continue
				if((spell_flags & NOFACTION) && user.faction == M.faction)
					continue
				if((spell_flags & NONONFACTION) && user.faction != M.faction)
					continue
				if(compatible_mobs && compatible_mobs.len)
					if(!is_type_in_list(M, compatible_mobs)) continue
				if(compatible_mobs && compatible_mobs.len && !is_type_in_list(M, compatible_mobs))
					continue
				possible_targets += M

			if(possible_targets.len)
				if(spell_flags & SELECTABLE) //if we are allowed to choose. see setup.dm for details
					var/mob/temp_target = input(user, "Choose the target for the spell.", "Targeting") as null|mob in possible_targets
					if(temp_target)
						targets += temp_target
				else
					targets += pick(possible_targets)
			//Adds a safety check post-input to make sure those targets are actually in range.


	else
		var/list/possible_targets = list()
		var/list/starting_targets

		if(range == -2)
			starting_targets = GLOB.living_mob_list_
		else
			starting_targets = view_or_range(range, holder, selection_type)

		for(var/mob/living/target in starting_targets)
			if(!(spell_flags & INCLUDEUSER) && target == user)
				continue
			if(compatible_mobs && !is_type_in_list(target, compatible_mobs))
				continue
			possible_targets += target

		if(spell_flags & SELECTABLE)
			for(var/i = 1; i<=max_targets, i++)
				if(!possible_targets.len)
					break
				var/mob/M = input(user, "Choose the target for the spell.", "Targeting") as null|mob in possible_targets
				if(!M)
					break
				if(range != -2)
					if(!(M in view_or_range(range, holder, selection_type)))
						continue
				targets += M
				possible_targets -= M
		else
			for(var/i=1,i<=max_targets,i++)
				if(!possible_targets.len)
					break
				if(target_ignore_prev)
					var/target = pick(possible_targets)
					possible_targets -= target
					targets += target
				else
					targets += pick(possible_targets)

	if(!(spell_flags & INCLUDEUSER) && (user in targets))
		targets -= user

	if(compatible_mobs && compatible_mobs.len)
		for(var/mob/living/target in targets) //filters out all the non-compatible mobs
			if(!is_type_in_list(target, compatible_mobs))
				targets -= target

	for(var/target in targets)
		if(!iscultist(target))
			targets -= target

	return targets

/spell/targeted/projectile/holy_missile/prox_cast(var/list/targets, atom/spell_holder)
	spell_holder.visible_message("<span class='danger'>\The [spell_holder] pops with a flash!</span>")
	playsound(src, 'sound/magic/mm_hit.ogg', 40)
	for(var/mob/living/M in targets)
		if(iscultist(M))
			apply_spell_damage(M)
	return


//PROJECTILE

/obj/item/projectile/spell_projectile/seeking/holy_missile
	name = "holy missile"
	icon = 'infinity/icons/effects/cult.dmi'
	icon_state = "holym"

	proj_trail = 0

/obj/item/projectile/spell_projectile/seeking/cult_missile
	name = "eldritch missile"
	icon = 'infinity/icons/effects/cult.dmi'
	icon_state = "cultm"

	proj_trail = 0

/spell/targeted/projectile/dumbfire/gauntlet
	name = "Gauntlet Blast"
	desc = "Empower your gauntlet with eldritch force and shoot it towards your target!"
	feedback = "GB"
	proj_type = /obj/item/projectile/spell_projectile/gauntlet

	school = "conjuration"
	charge_max = 10 SECONDS
	spell_flags = CONSTRUCT_CHECK
	invocation_type = SpI_NONE
	range = 20

	duration = 20
	proj_step_delay = 3

	amt_dam_brute = 25
	amt_stunned = 3

	hud_state = "gauntlet"

/obj/item/projectile/spell_projectile/gauntlet
	name = "empowered gauntlet"
	icon = 'infinity/icons/effects/cult.dmi'
	icon_state = "gauntlet"

/spell/targeted/projectile/dumbfire/gauntlet/prox_cast(var/list/targets, spell_holder)
	for(var/mob/living/M in targets)
		if(!iscultist(M))
			apply_spell_damage(M)

/spell/targeted/projectile/dumbfire/gauntlet_holy
	name = "Gauntlet Blast"
	desc = "Empower your gauntlet with holy force and shoot it towards your target!"
	feedback = "GB"
	proj_type = /obj/item/projectile/spell_projectile/gauntlet_holy

	school = "conjuration"
	charge_max = 10 SECONDS
	spell_flags = CONSTRUCT_CHECK | HOLY_CHECK
	invocation_type = SpI_NONE
	range = 20

	duration = 20
	proj_step_delay = 3

	amt_dam_brute = 25
	amt_stunned = 3

	hud_state = "holy_gauntlet"

/obj/item/projectile/spell_projectile/gauntlet_holy
	name = "empowered gauntlet"
	icon = 'infinity/icons/effects/cult.dmi'
	icon_state = "holy_gauntlet"

/spell/targeted/projectile/dumbfire/gauntlet_holy/prox_cast(var/list/targets, spell_holder)
	for(var/mob/living/M in targets)
		if(iscultist(M))
			apply_spell_damage(M)


/spell/aoe_turf/conjure/cult_construction
	name = "Construcion"
	desc = "This spell will allow you to make any cultist structure."
	charge_max = 3000
	spell_flags = CONSTRUCT_CHECK
	invocation = "none"
	invocation_type = SpI_NONE
	range = 0

	hud_state = "const_pylon"

/spell/aoe_turf/conjure/cult_construction/cast(list/targets, mob/user)
	var/list/options = list()
	var/optionals = list("Runic Door" = /obj/machinery/door/unpowered/simple/cult,
						 "Archives" = /obj/structure/cult/tome,
						 "Pylon" = /obj/structure/cult/pylon,
						 "Daemon Forge" = /obj/structure/cult/forge,
						 "Altar" = /obj/structure/cult/talisman,
						 "Bloodstone" = /obj/structure/cult/bloodstone
						 )
	for(var/i in optionals)
		var/obj/I = optionals[i]
		var/obj/optionality = new I(user)
		options[i] = image(icon = 'infinity/icons/obj/cultradial.dmi', icon_state = optionality.icon_state)
		qdel(optionality)

	var/choice = show_radial_menu(user, user, options, radius = 32, require_near = TRUE, menu_icon = 'infinity/icons/obj/cultradial.dmi')
	if(!choice)
		return

	var/choice_type = optionals[choice]
	new choice_type(get_turf(user))
