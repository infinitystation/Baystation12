/obj/structure/closet/abductor
	name = "alien closet"
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "closed_unlocked"
	setup = 0
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