/obj/structure/closet/abductor
	name = "alien closet"
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "closed_unlocked"
	setup = 0
	anchored = 1
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
	anchored = 1
	closet_appearance = null
	var/experiments = 0 //For rewards and other shit
	var/rewards = 0
	var/list/experimented = list()

/obj/structure/closet/experimention_machine/close(mob/user)
	. = ..()
	for(var/mob/living/carbon/human/mob in src.contents)
		if(istype(mob))
			if(locate(/obj/item/organ/internal/gland) in mob.contents)
				if(mob in experimented)
					src.visible_message(SPAN_WARNING("[src] beeps, \"Creature already was scanned. Procedure aborted.\""))
					return

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
						experiments++
						experimented += mob
						var/obj/item/organ/internal/gland/gland = locate(/obj/item/organ/internal/gland) in mob.contents
						gland.activated = 1
						if(mob.mind)
							GLOB.abducted.add_antagonist_mind(mob.mind, 1, GLOB.abducted.faction_role_text, gland.mind_text)
			else
				src.visible_message(SPAN_WARNING("[src] beeps, \"Unable to teleport creature. Creature is missing a gland.\""))

	if(experiments == 2 && rewards != 1)
		rewards++
		var/obj/item/weapon/mindtool/reward = new(get_turf(src))
		src.visible_message(SPAN_NOTICE("[src] suddenly buzzes and [reward] drops from small hole on it's side"))

	if(experiments == 4 && rewards != 2)
		rewards++
		var/obj/machinery/chemical_dispenser/full/abductor/reward = new(get_turf(src))
		src.visible_message(SPAN_NOTICE("[src] suddenly buzzes and opens it's backdoor. There is a [reward] in here!"))

	if(experiments == 6 && rewards != 3)
		rewards++
		var/obj/item/weapon/gun/energy/ionrifle/small/abductor/reward = new(get_turf(src))
		src.visible_message(SPAN_NOTICE("[src] suddenly buzzes and [reward] drops from small hole on it's side"))

/obj/structure/closet/experimention_machine/on_update_icon()
	if(opened)
		icon_state = "experiment-open"
	else
		icon_state = "experiment"
	overlays.Cut()