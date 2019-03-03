/obj/item/weapon/melee/arm_blade
	name = "armblade"
	desc = "A grotesque blade made out of bone and flesh that cleaves through people as a hot knife through butter."
	icon = 'icons/obj/changeling.dmi'
	icon_state = "arm_blade"
	item_state = "arm_blade"
	item_icons = list(
		slot_l_hand_str = 'icons/obj/changeling.dmi',
		slot_r_hand_str = 'icons/obj/changeling.dmi')
	item_state_slots = list(
		slot_l_hand_str = "arm_blade_rh",
		slot_r_hand_str = "arm_blade_lh")
	hitsound = 'sound/weapons/bloodyslice.ogg'
	w_class = 4
	force = 23
	siemens_coefficient = 0.4
	base_parry_chance = 40
	canremove = 0
	sharp = 1
	edge = 1
	anchored = 1
	throwforce = 0 //Just to be on the safe side
	throw_range = 0
	throw_speed = 0
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	var/mob/living/creator

/obj/item/weapon/melee/arm_blade/dropped(var/mob/living/user)
	visible_message("<span class='danger'>With a sickening crunch, [user] reforms their armblade into an arm!</span>",
	"<span class='warning'>You hear organic matter ripping and tearing!</span>")
	playsound(loc, 'sound/effects/blobattack.ogg', 30, 1)
	QDEL_IN(src, 1)

/obj/item/weapon/melee/arm_blade/Process()
	if(!creator || loc != creator || (creator.l_hand != src && creator.r_hand != src))
		// Tidy up a bit.
		if(istype(loc,/mob/living))
			var/mob/living/carbon/human/host = loc
			if(istype(host))
				for(var/obj/item/organ/external/organ in host.organs)
					for(var/obj/item/O in organ.implants)
						if(O == src)
							organ.implants -= src
			host.pinned -= src
			host.embedded -= src
			host.drop_from_inventory(src)
		QDEL_IN(src, 1)

/obj/item/weapon/melee/arm_blade/afterattack(atom/target, mob/user, proximity)
	if(!proximity)
		return

	if(istype(target, /obj/machinery/door/airlock))
		var/obj/machinery/door/airlock/D = target

		if(D.allowed(user) || !D.requiresID())
			return

		else if(D.locked)
			to_chat(user, SPAN_NOTICE("The airlock's bolts prevent it from being forced."))
			return

	else if(istype(target, /obj/structure/table))
		var/obj/structure/table/T = target
		T.break_to_parts()

/obj/item/weapon/shield/riot/changeling
	name = "shield-like mass"
	desc = "A mass of tough, boney tissue. You can still see the fingers as a twisted pattern in the shield."
	icon = 'icons/obj/changeling.dmi'
	icon_state = "ling_shield"
	item_state = "ling_shield"
	item_icons = list(
		slot_l_hand_str = 'icons/obj/changeling.dmi',
		slot_r_hand_str = 'icons/obj/changeling.dmi')
	item_state_slots = list(
		slot_l_hand_str = "ling_shield_rh",
		slot_r_hand_str = "ling_shield_lh")
	slot_flags = null
	siemens_coefficient = 0.1
	canremove = 0
	anchored = 1
	throwforce = 0 //Just to be on the safe side
	throw_range = 0
	throw_speed = 0
	max_block = 15
	can_block_lasers = TRUE
	var/mob/living/creator

/obj/item/weapon/shield/riot/changeling/dropped(var/mob/living/user)
	visible_message("<span class='danger'>With a sickening crunch, [user] reforms their shield into an arm!</span>",
	"<span class='warning'>You hear organic matter ripping and tearing!</span>")
	playsound(loc, 'sound/effects/blobattack.ogg', 30, 1)
	QDEL_IN(src, 1)

/obj/item/weapon/shield/riot/changeling/Process()
	if(!creator || loc != creator || (creator.l_hand != src && creator.r_hand != src))
		// Tidy up a bit.
		if(istype(loc,/mob/living))
			var/mob/living/carbon/human/host = loc
			if(istype(host))
				for(var/obj/item/organ/external/organ in host.organs)
					for(var/obj/item/O in organ.implants)
						if(O == src)
							organ.implants -= src
			host.pinned -= src
			host.embedded -= src
			host.drop_from_inventory(src)
		QDEL_IN(src, 1)

/obj/item/weapon/bone_dart
	name = "bone dart"
	desc = "A sharp piece of bone shapped as small dart."
	icon = 'icons/obj/changeling.dmi'
	icon_state = "bone_dart"
	item_state = "bolt"
	sharp = 1
	edge = 0
	throwforce = 5
	w_class = 2
