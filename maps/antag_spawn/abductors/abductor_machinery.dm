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

/obj/machinery/optable/abductor
	icon = 'infinity/icons/obj/abductor.dmi'

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