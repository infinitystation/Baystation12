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

/obj/item/device/radio/headset/abductor
	name = "alien headset"
	desc = "A strange-looking headset."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "abductor_headset"