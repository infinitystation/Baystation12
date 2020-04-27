/datum/map_template/ruin/antag_spawn/abductors
	name = "Abductors' Mothership"
	suffixes = list("abductors/abductors_base_inf.dmm")

/area/map_template/abductors_station
	name = "\improper Abductors' Mothership"
	icon_state = "yellow"
	requires_power = 0
	dynamic_lighting = 0

/turf/unsimulated/wall/alien
	icon = 'infinity/icons/turf/abductors.dmi'
	icon_state = "abductor"

/turf/unsimulated/wall/alien/Initialize(var/newloc)
	. = ..(newloc,MATERIAL_ALIEN)

/turf/unsimulated/floor/alien
	name = "crystaline alloy floor"
	icon = 'infinity/icons/turf/abductors.dmi'
	icon_state = "alienpod1"

/turf/unsimulated/floor/alien/Initialize()
	. = ..()
	icon = 'infinity/icons/turf/abductors.dmi'
	icon_state = "alienpod[rand(1,9)]"

/obj/machinery/optable/abductor
	icon = 'infinity/icons/obj/abductor.dmi'

/obj/machinery/vending/abductor
	name = "Gland Storage"
	desc = "Storage for alien glands, used for experementation."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "dispenser"
	icon_deny = "dispenser"
	icon_vend = "dispenser"
	vend_delay = 5
	base_type = /obj/machinery/vending/abductor

	products = list(/obj/item/random_gland = 12)

/obj/machinery/chemical_dispenser/full/abductor
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "chem_dispenser"

/obj/structure/closet/abductor
	name = "alien closet"
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "closed_unlocked"
	setup = 0
	closet_appearance = null

/obj/machinery/computer/abductor/camera
	name = "human observation console"
	desc = "A strange console, capable of connecting you to the camera network."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "camera"
	var/mob/observer/eye/cameranet/eye
	var/obj/machinery/abductor_tele/console

/obj/machinery/computer/abductor/camera/Initialize()
	eye = new(src)
	eye.name_sufix = "alien camera"
	console = locate(/obj/machinery/abductor_tele)
	. = ..()

/obj/machinery/computer/abductor/camera/attack_hand(mob/user)
	if(istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(locate(/obj/item/weapon/implant/abductors) in H.contents)
			var/obj/item/weapon/implant/abductors/implant = locate(/obj/item/weapon/implant/abductors) in H.contents
			implant.console = src
			implant.verbs += /obj/item/weapon/implant/abductors/proc/deconsole
			implant.verbs += /obj/item/weapon/implant/abductors/proc/teleport_self_pos
			implant.verbs += /obj/item/weapon/implant/abductors/proc/flip_vest
			implant.verbs += /obj/item/weapon/implant/abductors/proc/pull_marked
			implant.verbs += /obj/item/weapon/implant/abductors/proc/push_marked
			eye.possess(user)
			to_chat(eye.owner, "<span class='notice'>You feel disorented for a moment as your mind connects to the camera network.</span>")
			eye.forceMove(locate("landmark*Observer-Start").loc)

/obj/machinery/computer/abductor/camera/proc/deactivate(mob/user)
	if(user == eye.owner)
		var/obj/item/weapon/implant/abductors/implant = locate(/obj/item/weapon/implant/abductors)
		implant.console = null
		implant.verbs -= /obj/item/weapon/implant/abductors/proc/deconsole
		implant.verbs -= /obj/item/weapon/implant/abductors/proc/teleport_self_pos
		implant.verbs -= /obj/item/weapon/implant/abductors/proc/flip_vest
		implant.verbs -= /obj/item/weapon/implant/abductors/proc/pull_marked
		implant.verbs -= /obj/item/weapon/implant/abductors/proc/push_marked
		to_chat(eye.owner, "<span class='notice'>You feel disorented for a moment as your mind disconnects from the camera network.</span>")
		eye.release(eye.owner)
		eye.forceMove(src)

/obj/machinery/abductor_tele
	name = "telepad control console"
	desc = "An alien console, purposed to control a telepad"
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "console"
	density = 1

	var/obj/machinery/abductor_hub/hub
	var/mob/living/carbon/human/marked

/obj/machinery/abductor_tele/Initialize()
	hub = locate(/obj/machinery/abductor_hub)

/obj/machinery/abductor_tele/proc/teleport_from(var/turf/target)
	var/mob/living/M = locate(/mob/living) in get_turf(hub)
	if(M && ishuman(M))
		var/mob/living/carbon/human/H = M
		new /obj/effect/temporary(get_turf(H), 5, icon, "teleport_effect_back")
		H.dir = 2
		spawn(5)
			H.forceMove(target)
			new /obj/effect/temporary(get_turf(H), 5, icon, "teleport_effect")
			spawn(5)
				var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
				sparks.set_up(5, 0, get_turf(H))
				sparks.start()
				playsound(H.loc, "sparks", 50, 1)
				playsound(H.loc, 'sound/effects/phasein.ogg', 25, 1)

/obj/machinery/abductor_tele/proc/teleport_to()
	if(marked && ishuman(marked))
		new /obj/effect/temporary(get_turf(marked), 5, icon, "teleport_effect_back")
		marked.dir = 2
		spawn(5)
			marked.forceMove(get_turf(hub))
			new /obj/effect/temporary(get_turf(marked), 5, icon, "teleport_effect")
			spawn(5)
				var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
				sparks.set_up(5, 0, get_turf(marked))
				sparks.start()
				playsound(marked.loc, "sparks", 50, 1)
				playsound(marked.loc, 'sound/effects/phasein.ogg', 25, 1)

/obj/machinery/abductor_tele/attack_hand(mob/user as mob)
	if(marked)
		teleport_to()

/obj/machinery/abductor_hub
	name = "alien telepad"
	desc = "An alien telepad, capable of teleportation directly to targets."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "tele0"
	density = 0

/obj/item/weapon/weldingtool/electric/alien
	name = "alien arc welder"
	desc = "A strange welding tool of an alien make."
	icon_state = "welder"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)
	cell = null
	fuel_cost_multiplier = 1

/obj/item/weapon/weldingtool/electric/alien/attackby(var/obj/item/W, var/mob/user)
	return

/obj/item/weapon/weldingtool/electric/alien/on_update_icon()
	icon_state = welding ? "welder_on" : "welder"

/obj/item/weapon/weldingtool/electric/alien/get_available_charge()
	. = 1000

/obj/item/weapon/weldingtool/electric/alien/spend_charge(var/amount)
	return

/obj/item/weapon/wirecutters/alien
	name = "alien wirecutters"
	desc = "Strange wirecutters of an alien make."
	icon_state = "cutters"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)
	build_from_parts = FALSE

/obj/item/weapon/wirecutters/alien/Initialize()
	. = ..()
	icon_state = initial(icon_state)
	item_state = initial(item_state)

/obj/item/weapon/screwdriver/alien
	name = "alien screwdriver"
	desc = "A strange screwdriving tool of an alien make."
	icon_state = "screwdriver"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)
	build_from_parts = FALSE

/obj/item/weapon/screwdriver/alien/Initialize()
	. = ..()
	icon_state = initial(icon_state)
	item_state = initial(item_state)

/obj/item/weapon/crowbar/alien
	name = "alien prytool"
	desc = "A prying tool of an alien make."
	icon_state = "crowbar"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)

/obj/item/weapon/crowbar/alien/Initialize()
	. = ..()
	icon_state = initial(icon_state)
	item_state = initial(item_state)

/obj/item/weapon/wrench/alien
	name = "alien wrench"
	desc = "A strange wrenching tool of an alien make."
	icon_state = "wrench"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)

/obj/item/weapon/wrench/alien/Initialize()
	. = ..()
	icon_state = initial(icon_state)
	item_state = initial(item_state)

/obj/item/device/multitool/alien
	name = "alien multitool"
	desc = "An energy patterning tool of an alien make."
	icon_state = "multitool"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)

/obj/item/weapon/storage/belt/utility/alien
	name = "alien toolbelt"
	desc = "A segmented belt of strange crystalline material."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "belt"
	item_state = null

/obj/item/weapon/storage/belt/utility/alien/Initialize()
	. = ..()
	new /obj/item/device/multitool/alien(src)
	new /obj/item/weapon/wrench/alien(src)
	new /obj/item/weapon/crowbar/alien(src)
	new /obj/item/weapon/screwdriver/alien(src)
	new /obj/item/weapon/wirecutters/alien(src)
	new /obj/item/weapon/weldingtool/electric/alien(src)
	update_icon()

/obj/structure/table/alien
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "alien"
	material = MATERIAL_ALIEN

/obj/structure/table/alien/on_update_icon()
	return

/obj/item/weapon/implant/abductors
	name = "abductors implant"
	desc = "Strange implant, used to control alien technologies."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "implant"

	var/obj/machinery/computer/abductor/camera/console

/obj/item/weapon/implant/abductors/proc/teleport_self_pos()
	set name = "Teleport to eye"
	set category = "Abilities"
	set src in usr

	if(!istype(src.loc,/mob/living)) return

	var/mob/living/mob = loc

	if(istype(mob))
		if(ishuman(loc))
			var/mob/living/carbon/human/scientist = loc

			new /obj/effect/temporary(get_turf(scientist), 5, icon, "teleport_effect_back")
			scientist.dir = 2

			spawn(5)
				scientist.forceMove(get_turf(console.eye))

				console.deactivate(mob)

				new /obj/effect/temporary(get_turf(scientist), 5, icon, "teleport_effect")

				spawn(5)
					var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
					sparks.set_up(5, 0, get_turf(scientist))
					sparks.start()
					playsound(scientist.loc, "sparks", 50, 1)
					playsound(scientist.loc, 'sound/effects/phasein.ogg', 25, 1)

/obj/item/weapon/implant/abductors/verb/teleport_ship()

	set name = "Teleport to mothership"
	set category = "Abilities"
	set src in usr

	if(!istype(src.loc,/mob/living)) return

	var/mob/living/mob = loc

	if(istype(mob))


		if(do_after(mob, 4 SECONDS, get_turf(mob), TRUE))

			new /obj/effect/temporary(get_turf(mob), 5, icon, "teleport_effect_back")
			mob.dir = 2

			spawn(5)
				mob.forceMove(locate("landmark*AbductorShip").loc)
				if(locate(/obj/item/grab) in mob.contents)
					var/obj/item/grab/G = locate(/obj/item/grab) in mob.contents
					if(G.affecting.incapacitated())
						G.affecting.forceMove(locate("landmark*AbductorShip").loc)
				new /obj/effect/temporary(get_turf(mob), 5, icon, "teleport_effect")

				spawn(5)
					var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
					sparks.set_up(5, 0, get_turf(mob))
					sparks.start()
					playsound(src.loc, "sparks", 50, 1)
					playsound(src.loc, 'sound/effects/phasein.ogg', 25, 1)

/obj/item/weapon/implant/abductors/proc/pull_marked()

	set name = "Pull marked target to the ship"
	set category = "Abilities"
	set src in usr

	if(!istype(src.loc,/mob/living)) return

	var/mob/living/mob = loc

	if(istype(mob))
		if(console.console.marked)
			var/mob/living/carbon/human/marked = console.console.marked
			if(istype(marked))
				new /obj/effect/temporary(get_turf(marked), 5, icon, "teleport_effect_back")
				marked.dir = 2

				spawn(5)
					marked.forceMove(get_turf(locate("landmark*AbductorShip")))

					new /obj/effect/temporary(get_turf(marked), 5, icon, "teleport_effect")

					spawn(5)
						var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
						sparks.set_up(5, 0, get_turf(marked))
						sparks.start()
						playsound(marked.loc, "sparks", 50, 1)
						playsound(marked.loc, 'sound/effects/phasein.ogg', 25, 1)

/obj/item/weapon/implant/abductors/proc/push_marked()

	set name = "Teleport marked target to the eye"
	set category = "Abilities"
	set src in usr

	if(!istype(src.loc,/mob/living)) return

	var/mob/living/mob = loc

	if(istype(mob))
		if(console.console.marked)
			console.console.teleport_from(get_turf(console.eye))

/obj/item/weapon/implant/abductors/proc/flip_vest()
	set name = "Change agent's vest mode"
	set category = "Abilities"
	set src in usr

	if(!istype(src.loc,/mob/living)) return
	var/mob/living/mob = loc

	if(istype(mob))
		if(locate(/obj/item/clothing/suit/armor/abductor))
			var/obj/item/clothing/suit/armor/abductor/vest = locate(/obj/item/clothing/suit/armor/abductor)
			vest.flip_mode()
			playsound(get_turf(vest), 'sound/effects/phasein.ogg', 25, 1)


/obj/item/weapon/implant/abductors/proc/deconsole()

	set name = "Deactivate camera view"
	set category = "Abilities"
	set src in usr

	if(!istype(src.loc,/mob/living)) return

	var/mob/living/mob = loc

	if(istype(mob))
		if(console == null)
			to_chat(mob, SPAN_NOTICE("You are not linked to the camera network right now"))
			return
		console.deactivate(mob)

/obj/item/clothing/under/thermal/heat/abductor
	name = "alien thermal suit"
	desc = "Stylish fitting alien thermal suit."

/obj/item/clothing/under/thermal/heat/abductor/white
	name = "alien thermal suit"
	desc = "Stylish fitting alien thermal suit."
	icon_state = "thermoskr_2"
	item_state = "thermoskr_2"

/obj/item/clothing/suit/armor/abductor
	name = "alien vest"
	desc = "A strange, mechanical alien vest, made in black and purple colors."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "vest_stealth"
	item_icons = list(
	slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi'
	)
	allowed = list(/obj/item/weapon/gun,/obj/item/weapon/melee/adv_baton, /obj/item/weapon/handcuffs,/obj/item/weapon/tank)
	item_state = "vest_stealth"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

	canremove = 0
	anchored = 1

	var/disguise

	armor = list(
		melee = ARMOR_MELEE_SMALL,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR,
		rad = ARMOR_RAD_SHIELDED
		)

	var/combat_armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_STRONG,
		bomb = ARMOR_BOMB_PADDED,
		rad = ARMOR_RAD_SHIELDED
		)

/obj/item/clothing/suit/armor/abductor/proc/flip_mode()
	if(icon_state == "vest_stealth")
		icon_state = "vest_combat"
		armor = combat_armor
		loc.appearance = initial(loc.appearance)
		loc.update_icon()
	else
		icon_state = "vest_stealth"
		armor = initial(armor)
		if(disguise)
			loc.appearance = disguise

	item_state = icon_state

	update_icon()

	update_clothing_icon()

/obj/item/clothing/suit/armor/abductor/proc/try_disguise(var/disguise_set)
	if(icon_state == "vest_stealth")
		loc.appearance = disguise_set
		disguise = disguise_set

/obj/item/clothing/head/helmet/abductor
	name = "alien helmet"
	desc = "A UFO-like looking alien helmet with two antennas."
	canremove = 0
	anchored = 1
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "alienhelmet"
	item_icons = list(
	slot_wear_head_str = 'infinity/icons/mob/onmob/onmob_head.dmi',
	slot_head_str = 'infinity/icons/mob/onmob/onmob_head.dmi'
	)
	item_state = "alienhelmet"
	armor = list(
		melee = ARMOR_MELEE_SMALL,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_SMALL,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR,
		rad = ARMOR_RAD_SHIELDED
	)


/obj/item/weapon/melee/adv_baton
	name = "advanced stunbaton"
	desc = "An alien kind of stun baton."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "wonderprod"
	item_state = "baton_active"
	origin_tech = list(TECH_COMBAT = 5)

	slot_flags = SLOT_BELT
	force = 15
	sharp = 0
	edge = 0
	throwforce = 7
	w_class = ITEM_SIZE_NORMAL
	attack_verb = list("beaten")
	base_parry_chance = 30

	var/stunforce = 0.2
	var/agonyforce = 45
	var/mode = 0

	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/items/lefthand.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/items/righthand.dmi',
		)

/obj/item/weapon/melee/adv_baton/on_update_icon()
	switch(mode)
		if(0)
			icon_state = "[initial(icon_state)]Stun"
		if(1)
			icon_state = "[initial(icon_state)]Cuff"
		if(2)
			icon_state = "[initial(icon_state)]Sleep"
	loc.update_icon()
	. = ..()

/obj/item/weapon/melee/adv_baton/attack_self(mob/user)
	mode = (mode + 1) % 3
	playsound(loc, "sparks", 75, 1, -1)
	update_icon()
	add_fingerprint(user)

/obj/item/weapon/melee/adv_baton/throw_impact(atom/hit_atom, var/datum/thrownthing/TT)
	if(istype(hit_atom,/mob/living))
		apply_hit_effect(hit_atom, hit_zone = ran_zone(TT.target_zone, 30))
	else
		..()

/obj/item/weapon/melee/adv_baton/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(isrobot(target))
		return ..()

	var/agony = agonyforce
	var/stun = stunforce

	switch(mode)
		if(0)
			playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
			target.stun_effect_act(stun, agony, hit_zone, src)
			msg_admin_attack("[key_name(user)] stunned [key_name(target)] with the [src].")
			user.visible_message(SPAN_DANGER("[user] stuns [target] with [src]!"))

			if(ishuman(target))
				var/mob/living/carbon/human/H = target
				H.forcesay(GLOB.hit_appends)

			if(!istype(target, /mob/living/carbon/human))
				return

		if(1)
			playsound(src.loc, 'sound/weapons/handcuffs.ogg', 30, 1, -2)
			if(ishuman(target))
				var/mob/living/carbon/human/H = target
				user.visible_message("[user] attempts to handcuff [H]!")
				if(do_after(user, 0.5 SECONDS, H, TRUE))
					var/obj/item/weapon/handcuffs/wizard/cuffs = new()
					cuffs.forceMove(H)
					H.handcuffed = cuffs
					H.update_inv_handcuffed()
					user.visible_message(SPAN_DANGER("[user] handcuffs [H] with [src], forming beams of light around his hands!"))
		if(2)
			playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
			if(ishuman(target) && target.incapacitated())
				var/mob/living/carbon/human/H = target
				H.apply_effect(5, STUN)
				H.apply_effect(5, WEAKEN)
				user.visible_message(SPAN_DANGER("[user] stuns [H] with [src]!"))

	return 1

/obj/item/weapon/retractor/abductor
	name = "alien retractor"
	icon = 'infinity/icons/obj/abductor.dmi'
	surgery_speed = 0.2

/obj/item/weapon/hemostat/abductor
	name = "alien hemostat"
	icon = 'infinity/icons/obj/abductor.dmi'
	surgery_speed = 0.2

/obj/item/weapon/cautery/abductor
	name = "alien cautery"
	icon = 'infinity/icons/obj/abductor.dmi'
	surgery_speed = 0.2

/obj/item/weapon/surgicaldrill/abductor
	name = "alien surgical drill"
	icon = 'infinity/icons/obj/abductor.dmi'
	surgery_speed = 0.2

/obj/item/weapon/scalpel/abductor
	name = "alien scalpel"
	icon = 'infinity/icons/obj/abductor.dmi'
	surgery_speed = 0.2

/obj/item/weapon/circular_saw/abductor
	name = "alien circular saw"
	icon = 'infinity/icons/obj/abductor.dmi'
	surgery_speed = 0.2



/obj/structure/closet/experimention_machine
	name = "experimention machine"
	desc = "A strange alien machine, capable of teleporting people with glands back to their ship."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "experiment"
	closet_appearance = null

/obj/structure/closet/experimention_machine/close(mob/user)
	. = ..()
	for(var/mob/living/carbon/human/mob in src.contents)
		if(istype(mob))
			if(locate(/obj/item/organ/internal/gland) in mob.contents)
				mob.dir = 2
				spawn(5)
					mob.forceMove(get_turf(locate("landmark*Observer-Start")))
					new /obj/effect/temporary(get_turf(mob), 5, icon, "teleport_effect")
					spawn(5)
						var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
						sparks.set_up(5, 0, get_turf(mob))
						sparks.start()
						playsound(mob.loc, "sparks", 50, 1)
						playsound(src.loc, 'sound/effects/phasein.ogg', 25, 1)
						mob.Weaken(5)
						src.visible_message(SPAN_NOTICE("[src] beeps, \"Creature successfully teleported. Catalogue updated.\""))
			else
				src.visible_message(SPAN_WARNING("[src] beeps, \"Unable to teleport creature. Creature is missing a gland.\""))

/obj/structure/closet/experimention_machine/on_update_icon()
	if(opened)
		icon_state = "experiment-open"
	else
		icon_state = "experiment"
	overlays.Cut()

/obj/item/weapon/scitool
	name = "science tool"
	desc = "An alien-looking scanner with a toggleable button."
	icon_state = "gizmo_mark"
	icon = 'infinity/icons/obj/abductor.dmi'
	slot_flags = SLOT_BELT
	var/mode = 1
	var/obj/machinery/abductor_tele/console
	var/obj/machinery/abductor_disguise/dis_console

/obj/item/weapon/scitool/Initialize()
	console = locate(/obj/machinery/abductor_tele)
	dis_console = locate(/obj/machinery/abductor_disguise)

/obj/item/weapon/scitool/afterattack(var/mob/living/carbon/human/mob, var/mob/user, proximity)
	if(istype(mob))
		if(mode == 1)
			var/mob/living/carbon/human/H = mob
			if(H.wear_suit == /obj/item/clothing/suit/armor/abductor)
				console.marked = H
				to_chat(user, SPAN_NOTICE("You successfully marked [H] with [src]."))
				return
			else
				if(!proximity)
					return

				else
					user.visible_message(SPAN_WARNING("[user] starts to mark [H] with [src]!"))
					if(do_after(user, 3 SECONDS, H, TRUE))
						console.marked = H
						to_chat(user, SPAN_NOTICE("You successfully marked [H] with [src]."))
		if(mode == 2)
			var/mob/living/carbon/human/H = mob
			if(H.wear_suit == /obj/item/clothing/suit/armor/abductor)
				dis_console.appearances[H.name] = H.appearance
				to_chat(user, SPAN_NOTICE("You successfully scanned [H] with [src]."))
				return
			else
				if(!proximity)
					return

				else
					user.visible_message(SPAN_WARNING("[user] starts to scan [H] with [src]!"))
					if(do_after(user, 3 SECONDS, H, TRUE))
						if(!(H.appearance in dis_console.appearances))
							dis_console.appearances[H.name] = H.appearance
						to_chat(user, SPAN_NOTICE("You successfully scanned [H] with [src]."))

/obj/item/weapon/scitool/attack_self(mob/user as mob)
	if(mode == 1)
		mode = 2
	else
		mode = 1
	update_icon()

/obj/item/weapon/scitool/on_update_icon()
	switch(mode)
		if(1)
			icon_state = "gizmo_mark"
		if(2)
			icon_state = "gizmo_scan"
	loc.update_icon()
	. = ..()

/obj/machinery/abductor_disguise
	name = "disguise control console"
	desc = "An alien console, purposed to control a disguise of alien vest"
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "console-c"
	density = 1

	var/appearances = list()
	var/obj/item/clothing/suit/armor/abductor/vest


/obj/machinery/abductor_disguise/Initialize()
	if(locate(/obj/item/clothing/suit/armor/abductor))
		vest = locate(/obj/item/clothing/suit/armor/abductor)

/obj/machinery/abductor_disguise/attack_hand(mob/user as mob)
	var/app = appearances[input("Choose disguise for the agent.", "Disguise") as null|anything in appearances]
	vest.try_disguise(app)

/obj/item/device/radio/headset/abductor
	name = "alien headset"
	desc = "A strange-looking headset."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "abductor_headset"