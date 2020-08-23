/obj/structure/cult
	density = 1
	anchored = 1
	icon = 'infinity/icons/obj/cult.dmi'

	var/animated = FALSE

/obj/structure/cult/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)
	if(animated)
		flick("[icon_state]_spawn", src)

/obj/structure/cult/Destroy()
	if(animated)
		flick("[icon_state]_conceal", src)
	STOP_PROCESSING(SSobj, src)
	. = ..()



/obj/structure/cult/talisman
	name = "altar"
	desc = "A bloodstained altar dedicated to Nar-Sie."
	icon = 'infinity/icons/obj/cult.dmi'
	icon_state = "altar"

	animated = TRUE

	var/cooldown_time = 0
	var/obj/item/weapon/melee/blade

/obj/structure/cult/talisman/attack_hand(mob/user as mob)

	if(blade)
		if(!iscultist(user))
			to_chat(user, SPAN_WARNING("You can't manage to pull the [blade] out of [src]!"))
			return

		user.put_in_hands(blade)
		user.visible_message(SPAN_WARNING("[user] pulls the [blade] our of [src]!"))
		blade = null
		update_icon()
		return

	if(!iscultist(user))
		to_chat(user, SPAN_WARNING("You don't understand anything written on [src]!"))
		return
	if(cooldown_time > world.time)
		to_chat(user, SPAN_WARNING("[src] is not ready yet for this!"))
		return

	var/list/options = list()
	var/optionals = list("Flask of Unholy Water" = /obj/item/weapon/reagent_containers/glass/beaker/unholywater, "Ritual Dagger" = /obj/item/weapon/melee/cultblade/dagger, "Construct Shell" = /obj/structure/constructshell/cult)
	for(var/i in optionals)
		var/obj/I = optionals[i]
		var/obj/optionality = new I(src)
		options[i] = image(icon = 'infinity/icons/obj/cultradial.dmi', icon_state = optionality.icon_state)
		qdel(optionality)

	var/choice = show_radial_menu(user, src, options, radius = 32, require_near = TRUE, menu_icon = 'infinity/icons/obj/cultradial.dmi')
	if(!choice)
		return

	var/choice_type = optionals[choice]

	new choice_type(get_turf(src))

	cooldown_time = world.time + 3 MINUTES

	visible_message(SPAN_WARNING("With flash of bright light, [choice] appears on the [src]."))

	var/obj/effect/temporary/effect = new(get_turf(src), 6, 'infinity/icons/effects/cult.dmi', "bloodsparkles")
	effect.dir = src.dir

/obj/structure/cult/talisman/on_update_icon()
	overlays.Cut()
	if(!blade)
		return
	var/overlay_icon = "altar_cultblade"
	if(istype(blade, /obj/item/weapon/melee/cultbastard))
		overlay_icon = "altar_cultbastard"

	var/image/sword = overlay_image(icon, overlay_icon)
	overlays += sword

/obj/structure/cult/talisman/attackby(var/obj/item/I, var/mob/living/user)
	if(!iscultist(user))
		to_chat(user, SPAN_WARNING("You don't understand anything written on [src]!"))
		return

	if(blade)
		to_chat(user, SPAN_WARNING("There is already a blade in [src]!"))
		return

	if(istype(I, /obj/item/weapon/melee/cultbastard) || istype(I, /obj/item/weapon/melee/cultblade))
		user.unEquip(I)
		I.forceMove(src)
		blade = I
		user.visible_message(SPAN_WARNING("[user] droves the [I] into [src]!"))
		on_update_icon()
		return

	. = ..()

/obj/structure/cult/bloodstone
	name = "bloodstone"
	desc = "A dark onyx stone, with a large bloody crystal on top."
	icon = 'infinity/icons/obj/cult64x64.dmi'
	icon_state = "bloodstone"
	pixel_x = -16
	pixel_y = -2
	layer = ABOVE_HUMAN_LAYER
	var/blood_stored = 0

	animated = TRUE

/obj/structure/cult/bloodstone/Initialize()
	. = ..()
	update_icon()
	GLOB.cult.bloodstones.Add(src)

/obj/structure/cult/bloodstone/Destroy()
	GLOB.cult.bloodstones.Remove(src)
	. = ..()

/obj/structure/cult/bloodstone/attack_hand(var/mob/living/carbon/human/H)
	if(!istype(H) || !iscultist(H))
		return

	if(H.should_have_organ(BP_HEART) && H.vessel && !H.vessel.has_reagent(/datum/reagent/blood, H.species.blood_volume * 0.5))
		to_chat(H, "<span class = 'cult italic'>You feel too weak for this...</span>")
		return
	H.visible_message(SPAN_WARNING("[H] cuts the hand on the [src] and it starts sucking the blood in!"))
	var/can_do = TRUE
	var/next_harvest = 1
	while(can_do && blood_stored <= 2800)
		next_harvest = min(next_harvest, 2800 - blood_stored)
		can_do = H.should_have_organ(BP_HEART) && H.vessel && H.vessel.has_reagent(/datum/reagent/blood, H.species.blood_volume * 0.5 + next_harvest)
		if(!do_after(H, 5, src))
			return
		H.vessel.remove_reagent(/datum/reagent/blood, next_harvest)
		blood_stored += next_harvest
		next_harvest += 1
		update_icon()

/obj/structure/cult/bloodstone/on_update_icon()
	overlays.Cut()
	if(blood_stored)
		var/overlay_icon = "bloodstone[Floor(blood_stored / 280)]"
		var/image/I = image(icon, overlay_icon)
		overlays += I



/obj/structure/cult/forge
	name = "daemon forge"
	desc = "A forge used in crafting the unholy weapons used by the armies of Nar-Sie."
	icon = 'infinity/icons/obj/cult64x64.dmi'
	icon_state = "forge"

	animated = TRUE

	pixel_x = -16
	pixel_y = -16
	var/cooldown_time = 0

/obj/structure/cult/forge/attack_hand(mob/user as mob)

	if(!iscultist(user))
		to_chat(user, SPAN_WARNING("The heat radiating from [src] pushes you back!"))
		return
	if(cooldown_time > world.time)
		to_chat(user, SPAN_WARNING("[src] is not ready yet for this!"))
		return

	var/list/options = list()
	var/optionals = list("Shielded Robe" = /obj/item/clothing/suit/storage/hooded/cultrobes/cult_shield, "Flagellant's Robe" = /obj/item/clothing/suit/storage/hooded/cultrobes/berserker, "Mirror Shield" = /obj/item/weapon/shield/mirror)
	for(var/i in optionals)
		var/obj/I = optionals[i]
		var/obj/optionality = new I(src)
		options[i] = image(icon = 'infinity/icons/obj/cultradial.dmi', icon_state = optionality.icon_state)
		qdel(optionality)

	var/choice = show_radial_menu(user, src, options, radius = 32, require_near = TRUE, menu_icon = 'infinity/icons/obj/cultradial.dmi')

	if(!choice)
		return

	var/choice_type = optionals[choice]

	new choice_type(get_turf(src))

	cooldown_time = world.time + 3 MINUTES

	visible_message(SPAN_WARNING("With flash of bright light, [choice] appears on the [src]."))

	var/obj/effect/temporary/effect = new(get_turf(src), 6, 'infinity/icons/effects/cult.dmi', "bloodsparkles")
	effect.dir = src.dir



/obj/structure/cult/pylon
	name = "pylon"
	desc = "A floating crystal that hums with an unearthly energy."
	icon = 'icons/obj/pylon.dmi'
	icon_state = "pylon"
	var/isbroken = 0
	light_max_bright = 0.5
	light_inner_range = 1
	light_outer_range = 13
	light_color = "#3e0000"

	var/range = 0

/obj/structure/cult/pylon/attack_hand(mob/M as mob)
	attackpylon(M, 5)

/obj/structure/cult/pylon/attack_generic(var/mob/user, var/damage)
	attackpylon(user, damage)

/obj/structure/cult/pylon/attackby(obj/item/W as obj, mob/user as mob)

	if(istype(W, /obj/item/stack/material/cult))
		var/obj/item/stack/material/cult/S = W
		S.set_amount(S.amount - 1)
		repair(user)
		return

	attackpylon(user, W.force)

/obj/structure/cult/pylon/proc/attackpylon(mob/user as mob, var/damage)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!isbroken)
		if(prob(1+ damage * 5))
			user.visible_message(
				"<span class='danger'>[user] smashed the pylon!</span>",
				"<span class='warning'>You hit the pylon, and its crystal breaks apart!</span>",
				"You hear a tinkle of crystal shards"
				)

			var/obj/effect/temporary/effect = new(get_turf(src), 6, 'infinity/icons/effects/cult.dmi', "bloodsparkles")
			effect.dir = src.dir

			user.do_attack_animation(src)
			playsound(get_turf(src), 'sound/effects/Glassbr3.ogg', 75, 1)
			isbroken = 1
			set_density(0)
			icon_state = "pylon-broken"
			set_light(0)
		else
			to_chat(user, SPAN_WARNING("You hit the pylon!"))
			playsound(get_turf(src), 'sound/effects/Glasshit.ogg', 75, 1)
	else
		if(prob(damage * 2))
			to_chat(user, SPAN_WARNING("You pulverize what was left of the pylon!"))
			qdel(src)
		else
			to_chat(user, SPAN_WARNING("You hit the pylon!"))
		playsound(get_turf(src), 'sound/effects/Glasshit.ogg', 75, 1)

	update_icon()

/obj/structure/cult/pylon/proc/repair(mob/user as mob)
	if(isbroken)
		to_chat(user, "You repair the pylon.")
		isbroken = 0
		set_density(1)
		icon_state = "pylon"
		set_light(light_max_bright, light_inner_range, light_outer_range, light_color)

/obj/structure/cult/pylon/Process()
	if(isbroken)
		return

	for(var/mob/living/L in range(5, src))
		if(iscultist(L))
			if(L.health != L.maxHealth)
				if(ishuman(L))
					var/mob/living/carbon/human/H = L
					H.adjustBruteLoss(-0.5)
					H.adjustFireLoss(-0.5)
					H.updatehealth()
					if(H.should_have_organ(BP_HEART) && H.vessel && !H.vessel.has_reagent(/datum/reagent/blood, H.species.blood_volume * 0.7))
						H.vessel.add_reagent(/datum/reagent/blood, 1)
				else
					var/mob/living/simple_animal/M = L
					if(M.health < M.maxHealth)
						M.adjustBruteLoss(-1)
						M.adjustFireLoss(-1)

	if(prob(75))
		return

	var/list/turfs = list()
	var/list/turfs_old = list()

	for(var/turf/simulated/turf in range(range - 1, src))
		turfs_old.Add(turf)

	for(var/turf/simulated/turf in range(range + rand(0, 2), src))
		if(turf in turfs_old)
			continue
		if(turf.icon_state == "cult" || turf.icon_state == "cult-narsie")
			continue
		turfs.Add(turf)

	if(turfs.len == 0)
		range = min(range + 1, 7)
		return

	var/turf/simulated/T = pick(turfs)
	T.cultify()

/obj/effect/veil_walker_spawner
	icon = 'infinity/icons/obj/cult.dmi'
	icon_state = "shifter"

/obj/effect/veil_walker_spawner/Initialize()
	. = ..()
	new /obj/item/weapon/cult_shift(loc)
	new /obj/item/device/flashlight/flare/culttorch(loc)
	return INITIALIZE_HINT_QDEL

/obj/structure/cult/tome
	name = "archives"
	desc = "A desk covered in arcane manuscripts and tomes in unknown languages. Looking at the text makes your skin crawl."
	icon = 'infinity/icons/obj/cult.dmi'
	icon_state = "tomealtar"
	light_color = "#ed9200"
	light_outer_range = 3
	light_color= "ed9200"

	animated = TRUE

	var/cooldown_time = 0

/obj/structure/cult/tome/attack_hand(mob/user as mob)

	if(!iscultist(user))
		to_chat(user, SPAN_WARNING("These books won't open and it hurts to even try and read the covers!"))
		return
	if(cooldown_time > world.time)
		to_chat(user, SPAN_WARNING("[src] is not ready yet for this!"))
		return

	var/list/options = list()
	var/optionals = list("Zealot's Blindfold" = /obj/item/clothing/glasses/hud/health/cultblind, "Veil Walker Set" = /obj/effect/veil_walker_spawner, "Blood Halberd" = /obj/item/weapon/melee/cult_spear)
	for(var/i in optionals)
		var/obj/I = optionals[i]
		var/obj/optionality = new I(src)
		options[i] = image(icon = 'infinity/icons/obj/cultradial.dmi', icon_state = optionality.icon_state)
		qdel(optionality)

	var/choice = show_radial_menu(user, src, options, radius = 32, require_near = TRUE, menu_icon = 'infinity/icons/obj/cultradial.dmi')
	if(!choice)
		return

	var/choice_type = optionals[choice]

	new choice_type(get_turf(src))

	cooldown_time = world.time + 3 MINUTES

	var/obj/effect/temporary/effect = new(get_turf(src), 6, 'infinity/icons/effects/cult.dmi', "bloodsparkles")
	effect.dir = src.dir

	visible_message(SPAN_WARNING("With flash of bright light, [choice] appears on the [src]."))

/obj/effect/gateway
	name = "gateway"
	desc = "You're pretty sure that abyss is staring back."
	icon = 'icons/obj/cult.dmi'
	icon_state = "hole"
	density = 1
	unacidable = 1
	anchored = 1.0
	var/spawnable = null

/obj/effect/gateway/active
	light_outer_range=5
	light_color="#ff0000"
	spawnable=list(
		/mob/living/simple_animal/hostile/scarybat,
		/mob/living/simple_animal/hostile/creature,
		/mob/living/simple_animal/hostile/faithless
	)

/obj/effect/gateway/active/cult
	light_max_bright	= 0.5
	light_inner_range	= 2
	light_outer_range	= 5
	light_color			= "#ff0000"
	spawnable=list(
		/mob/living/simple_animal/hostile/scarybat/cult,
		/mob/living/simple_animal/hostile/creature/cult,
		/mob/living/simple_animal/hostile/faithless/cult
	)

/obj/effect/gateway/active/New()
	..()
	addtimer(CALLBACK(src, .proc/create_and_delete), rand(30,60) SECONDS)


/obj/effect/gateway/active/proc/create_and_delete()
	var/t = pick(spawnable)
	new t(src.loc)
	qdel(src)

/obj/effect/gateway/active/Crossed(var/atom/A)
	if(!istype(A, /mob/living))
		return

	var/mob/living/M = A

	if(M.stat != DEAD)
		if(M.HasMovementHandler(/datum/movement_handler/mob/transformation))
			return
		if(M.has_brain_worms())
			return //Borer stuff - RR

		if(iscultist(M)) return
		if(!ishuman(M) && !isrobot(M)) return

		M.AddMovementHandler(/datum/movement_handler/mob/transformation)
		M.icon = null
		M.overlays.len = 0
		M.set_invisibility(101)

		if(istype(M, /mob/living/silicon/robot))
			var/mob/living/silicon/robot/Robot = M
			if(Robot.mmi)
				qdel(Robot.mmi)
		else
			for(var/obj/item/W in M)
				M.drop_from_inventory(W)
				if(istype(W, /obj/item/weapon/implant))
					qdel(W)

		var/mob/living/new_mob = new /mob/living/simple_animal/construct/harvester(A.loc)
		new_mob.a_intent = I_HURT
		if(M.mind)
			M.mind.transfer_to(new_mob)
		else
			new_mob.key = M.key

		to_chat(new_mob, SPAN_WARNING("<B>You suddenly morph into a Harvester!</B>"))

		GLOB.cult.add_antagonist(new_mob.mind, ignore_role = 1, do_not_equip = 1)

/obj/machinery/door/unpowered/simple/cult
	name = "runed door"
	material = MATERIAL_CULT
	req_access = list("ACCESS_CENT_CAPTAIN") //I don't want bots to open those
	icon = 'infinity/icons/obj/cult.dmi'

/obj/machinery/door/unpowered/simple/cult/New()
	. = ..()
	color = "#ffffff"
	flick("cultdoor_create", src)

/obj/machinery/door/unpowered/simple/cult/allowed(mob/M)
	if(!iscultist(M))
		M.Weaken(2)
		playsound(get_turf(src),'infinity/sound/TG/cult/invoke_general.ogg',50,1)
		return 0
	return ..(M)

/obj/machinery/door/unpowered/simple/cult/open(var/forced = 0)
	if(forced)
		return
	. = ..()

/obj/machinery/door/unpowered/simple/cult/attack_hand(mob/user)
	if(iscultist(user))
		if(density)
			open()
		else
			close()
		return
	. = ..()

/obj/structure/cult/spire
	name = "spire"
	desc = "A strange eerie looking construction, used by Nar'Sien cultists."
	icon = 'infinity/icons/obj/cult64x64.dmi'
	icon_state = "spire_1"

	layer = ABOVE_HUMAN_LAYER

	pixel_x = -16

	var/cult_level = 1
	var/debug_mode = FALSE

/obj/structure/cult/spire/Initialize()
	. = ..()
	update_icon()
	GLOB.cult.spires.Add(src)

/obj/structure/cult/spire/Destroy()
	GLOB.cult.spires.Remove(src)
	. = ..()

/obj/structure/cult/spire/on_update_icon()
	flick("spire_[GLOB.cult.cult_level]_morph", src)
	icon_state = "spire_[GLOB.cult.cult_level]"
	cult_level = GLOB.cult.cult_level

/obj/structure/cult/spire/attack_hand(var/mob/living/carbon/human/user)
	if(!iscultist(user))
		return

	var/list/user_tattoos = list()
	for(var/datum/active_effect/cult_tattoo/tattoo in user.active_effects)
		user_tattoos.Add(tattoo.type)

	var/list/optionals = list()
	var/list/options = list()
	for(var/tattoo_type in subtypesof(/datum/active_effect/cult_tattoo))
		if(tattoo_type in user_tattoos)
			continue
		var/datum/active_effect/cult_tattoo/tattoo = new tattoo_type
		if(tattoo.tier > cult_level && !debug_mode)
			qdel(tattoo)
			continue
		optionals[tattoo.name] = tattoo_type
		options[tattoo.name] = image(icon = 'infinity/icons/obj/cultradial2.dmi', icon_state = tattoo.icon_state)
		qdel(tattoo)

	var/choice = show_radial_menu(user, src, options, radius = 32, require_near = TRUE, menu_icon = 'infinity/icons/obj/cultradial2.dmi')
	if(!choice)
		return
	var/choice_type = optionals[choice]
	var/datum/active_effect/cult_tattoo/tattoo = new choice_type
	tattoo.add_to_human(user)

/obj/structure/cult/spire/Initialize()
	. = ..()
	flick("spire_[GLOB.cult.cult_level]_spawn", src)

/obj/structure/cult/spire/Destroy()
	flick("spire_[GLOB.cult.cult_level]_conceal", src)
	. = ..()

/obj/effect/sigil
	name = "sigil"
	desc = "An eerie-looking symbol painted on a wall."
	icon = 'infinity/icons/obj/cult.dmi'
	icon_state = "sigil"

/obj/effect/sigil/Initialize()
	. = ..()
	flick("sigil_spawn", src)

/obj/effect/sigil/Destroy()
	flick("sigil_conceal", src)
	. = ..()

/obj/effect/sigil/attack_hand(mob/user)
	if(!iscultist(user))
		return

	var/push_dir = get_dir(user, src)
	var/obj/effect/temporary/effect = new(get_turf(user), 8, 'infinity/icons/effects/effects.dmi', "cultout")
	effect.dir = user.dir
	user.forceMove(get_step(get_turf(src), push_dir))
	var/obj/effect/temporary/effect2 = new(get_turf(user), 8, 'infinity/icons/effects/effects.dmi', "cultin")
	effect2.dir = user.dir