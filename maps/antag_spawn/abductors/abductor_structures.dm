/obj/structure/closet/abductor
	name = "alien closet"
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "closed_unlocked"
	setup = 0
	anchored = TRUE
	closet_appearance = null

/obj/structure/table/alien
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "alien"
	material = MATERIAL_ALIEN

/obj/structure/table/alien/on_update_icon()
	return

/obj/structure/closet/experimention_machine
	name = "experimention machine"
	desc = "A strange alien machine, capable of teleporting people with glands back to their ship."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "experiment"
	anchored = TRUE
	closet_appearance = null
	var/experiments = 0 //For rewards and other shit
	var/rewards = 0
	var/list/experimented = list()

/obj/structure/closet/experimention_machine/proc/teleport_target(var/mob/mob, var/turf/target)
	mob.dir = 2
	mob.forceMove(target)
	new /obj/effect/temporary(target, 5, icon, "teleport_effect")
	addtimer(CALLBACK(src, .proc/teleport_effect, mob, target), 5)

/obj/structure/closet/experimention_machine/proc/teleport_effect(var/mob/mob, var/turf/target)
	var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
	sparks.set_up(5, 0, target)
	sparks.start()
	playsound(mob.loc, "sparks", 50, 1)
	playsound(src.loc, 'sound/effects/phasein.ogg', 25, 1)
	mob.Weaken(5)
	src.visible_message(SPAN_NOTICE("[src] beeps, \"Creature successfully teleported. Catalogue updated.\""))
	experiments++
	experimented += mob
	var/obj/item/organ/internal/gland/gland = locate(/obj/item/organ/internal/gland) in mob.contents
	gland.activated = 1
	if(mob.mind)
		GLOB.abducted.add_antagonist_mind(mob.mind, 1, GLOB.abducted.faction_role_text, gland.mind_text)

/obj/structure/closet/experimention_machine/close(mob/user)
	. = ..()
	for(var/mob/living/carbon/human/mob in src.contents)
		if(istype(mob))
			if(locate(/obj/item/organ/internal/gland) in mob.contents)
				if(mob in experimented)
					src.visible_message(SPAN_WARNING("[src] beeps, \"Creature already was scanned. Procedure aborted.\""))
					return

				mob.dir = 2
				addtimer(CALLBACK(src, .proc/teleport_target, mob, get_turf(locate("landmark*Observer-Start"))), 5)

			else
				src.visible_message(SPAN_WARNING("[src] beeps, \"Unable to teleport creature. Creature is missing a gland.\""))

	reward()

/obj/structure/closet/experimention_machine/open(mob/user)
	. = ..()
	reward()

/obj/structure/closet/experimention_machine/proc/reward()
	if(experiments == 2 && rewards != 1)
		rewards++
		var/obj/item/mindtool/reward = new(get_turf(src))
		src.visible_message(SPAN_NOTICE("[src] suddenly buzzes and [reward] drops from small hole on it's side"))

	if(experiments == 4 && rewards != 2)
		rewards++
		var/obj/machinery/chemical_dispenser/full/abductor/reward = new(get_turf(src))
		src.visible_message(SPAN_NOTICE("[src] suddenly buzzes and opens it's backdoor. There is a [reward] in here!"))

	if(experiments == 6 && rewards != 3)
		rewards++
		var/obj/item/gun/energy/ionrifle/small/abductor/reward = new(get_turf(src))
		src.visible_message(SPAN_NOTICE("[src] suddenly buzzes and [reward] drops from small hole on it's side"))

/obj/structure/closet/experimention_machine/on_update_icon()
	if(opened)
		icon_state = "experiment-open"
	else
		icon_state = "experiment"
	overlays.Cut()