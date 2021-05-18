#define MAX_PROGRESS 150 //wass 100, too fast

/obj/structure/alien/egg
	desc = "It looks like a weird egg."
	name = "egg"
	icon_state = "egg_growing"
	density = FALSE
	anchored = TRUE
	var/progress = 0

/obj/structure/alien/egg/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/structure/alien/egg/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/structure/alien/egg/CanUseTopic(var/mob/user)
	return isghost(user) ? STATUS_INTERACTIVE : STATUS_CLOSE

/obj/structure/alien/egg/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["spawn"])
		attack_ghost(usr)

/obj/structure/alien/egg/Process()
	if(progress == MAX_PROGRESS)
		update_icon()
		progress++
	else if(progress < MAX_PROGRESS)
		progress++

	/*if(progress >= MAX_PROGRESS)
		for(var/mob/living/carbon/human/H in range(3, get_turf(src)))
			if(istype(H) && !isxenomorph(H))
				flick("egg_opening",src)
				progress = -1 // No harvesting pls.
				sleep(5)
				var/obj/item/clothing/mask/facehugger/hugger = new(get_turf(src))
				hugger.icon_state = "facehugger_thrown"
				hugger.throw_at(H,3,1)
				update_icon()
				return*/

/obj/structure/alien/egg/on_update_icon()
	if(progress == -1)
		icon_state = "egg_hatched"
	else if(progress < MAX_PROGRESS)
		icon_state = "egg_growing"
	else
		icon_state = "egg"

/*/obj/structure/alien/egg/attack_hand(mob/user)
	if(progress == -1)
		return
	if(progress < MAX_PROGRESS)
		return
	flick("egg_opening",src)
	progress = -1 // No harvesting pls.
	sleep(5)
	var/obj/item/clothing/mask/facehugger/hugger = new(get_turf(src))
	if(!isxenomorph(user))
		hugger.icon_state = "facehugger_thrown"
		hugger.throw_at(user,3,1)
	update_icon()
	return 1

/obj/structure/alien/egg/attackby(mob/user)
	if(progress == -1)
		. = ..()
		return
	if(progress < MAX_PROGRESS)
		. = ..()
		return
	flick("egg_opening",src)
	progress = -1 // No harvesting pls.
	sleep(5)
	var/obj/item/clothing/mask/facehugger/hugger = new(get_turf(src))
	if(!isxenomorph(user))
		hugger.icon_state = "facehugger_thrown"
		hugger.throw_at(user,3,1)
	update_icon()
	return 1*/

/obj/item/clothing/mask/facehugger
	name = "facehugger"
	desc = "A gross - looking alien. It is moving!"
	icon = 'infinity/icons/mob/alien.dmi'
	icon_state = "facehugger"
	item_state = "facehugger"
	tint = 7
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	var/dead = 0
	var/live_time = 150

/obj/item/clothing/mask/facehugger/bullet_act()
	if(dead)
		qdel(src)
	else
		dead = 1
		icon_state = "facehugger_dead"

/obj/item/clothing/mask/facehugger/ex_act()
	if(dead)
		qdel(src)
	else
		dead = 1
		icon_state = "facehugger_dead"

/obj/item/clothing/mask/facehugger/afterattack(var/obj/target as obj, mob/user as mob, proximity)
	if(!proximity)
		return
	if(!istype(target))
		return
	if(dead == 0)
		leap(target)

/obj/item/clothing/mask/facehugger/proc/leap(atom/movable/A)
	var/mob/living/carbon/human/H = A

	if(!istype(H))
		return

	if(dead)
		return

	if(isxenomorph(H))
		return


	if(H.head && (istype(H.head, /obj/item/clothing/head/bio_hood) || istype(H.head, /obj/item/clothing/head/helmet/riot) || istype(H.head, /obj/item/clothing/head/helmet/space) || istype(H.head, /obj/item/clothing/head/welding)))
		return

	var/obj/item/organ/aff_head = H.get_organ(BP_HEAD)
	var/obj/item/organ/aff_chest = H.get_organ(BP_CHEST)
	if(!aff_head || BP_IS_ROBOTIC(aff_head))
		return
	if(!aff_chest || BP_IS_ROBOTIC(aff_chest))
		return

	if(H.wear_mask && istype(H.wear_mask, /obj/item/clothing/mask/facehugger))
		return

	var/was_mask = 0
	if(H.wear_mask)
		H.drop_from_inventory(H.wear_mask)
		was_mask = 1
	if(H.equip_to_slot_if_possible(src, slot_wear_mask))
		canremove = 0
		if(was_mask)
			H.visible_message(SPAN_DANGER("[src] jumps onto [H] and tears his mask off!"), SPAN_DANGER("[src] jumps onto you and tears your mask off!"))
		else
			H.visible_message(SPAN_DANGER("[src] jumps onto [H]!"), SPAN_DANGER("[src] jumps onto you!"))
		src.pickup(H)
		var/obj/item/organ/affecting = H.get_organ(BP_CHEST)
		//var/obj/item/organ/internal/xeno/larva/larva = new(affecting)
		H.apply_damage(90, PAIN, affecting)
		//larva.replaced(H, affecting)
		H.Weaken(8)
		H.Stun(3)
		addtimer(CALLBACK(src, .proc/detach), live_time)

/obj/item/clothing/mask/facehugger/Crossed(atom/movable/A)
	if(dead == 0)
		leap(A)
	else
		icon_state = "facehugger_dead"

/obj/item/clothing/mask/facehugger/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(dead == 0)
		leap(hit_atom)

/obj/item/clothing/mask/facehugger/proc/detach()
	var/mob/living/carbon/human/H = src.loc
	if(!istype(H))
		return
	dead = 1
	canremove = 1
	H.drop_from_inventory(src)
	H.visible_message(SPAN_DANGER("[src] falls after violating [H]'s face!"), SPAN_DANGER("[src] falls after violating your face!"))
	icon_state = "facehugger_impregnated"

/obj/structure/alien/egg/attack_ghost(var/mob/observer/ghost/user)
	if(progress == -1) //Egg has been hatched.
		return

	if(progress < MAX_PROGRESS)
		to_chat(user, "\The [src] has not yet matured.")
		return

	if(!user.MayRespawn(1))
		return

	// Check for bans properly.
	if(jobban_isbanned(user, MODE_XENOMORPH))
		to_chat(user, "<span class='danger'>You are banned from playing a Xenophage.</span>")
		return

	var/confirm = alert(user, "Are you sure you want to join as a Xenophage larva?", "Become Larva", "No", "Yes")

	if(!src || confirm != "Yes")
		return

	if(!user || !user.ckey)
		return

	if(progress == -1) //Egg has been hatched.
		to_chat(user, "Too slow...")
		return

	flick("egg_opening",src)
	progress = -1 // No harvesting pls.
	sleep(5)

	if(!src || !user)
		visible_message("<span class='alium'>\The [src] writhes with internal motion, but nothing comes out.</span>")
		progress = MAX_PROGRESS // Someone else can have a go.
		return // What a pain.

	// Create the mob, transfer over key.
	var/mob/living/carbon/alien/larva/larva = new(get_turf(src))
	larva.ckey = user.ckey
	GLOB.xenomorphs.add_antagonist(larva.mind, 1)
	spawn(-1)
		if(user) qdel(user) // Remove the keyless ghost if it exists.

	visible_message("<span class='alium'>\The [src] splits open with a wet slithering noise, and \the [larva] writhes free!</span>")

	// Turn us into a hatched egg.
	name = "hatched alien egg"
	desc += " This one has hatched."
	update_icon()

#undef MAX_PROGRESS
