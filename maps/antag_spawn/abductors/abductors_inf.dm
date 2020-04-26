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

	products = list(/obj/item/weapon/reagent_containers/glass/bottle/antitoxin = 4,
					/obj/item/weapon/reagent_containers/glass/bottle/inaprovaline = 4,
					/obj/item/weapon/reagent_containers/glass/bottle/stoxin = 4,
					/obj/item/weapon/reagent_containers/glass/bottle/hyronalin = 4,
					/obj/item/weapon/reagent_containers/syringe/antiviral = 8,
					/obj/item/weapon/reagent_containers/syringe = 12,
					/obj/item/device/scanner/health = 5,
					/obj/item/weapon/reagent_containers/glass/beaker = 4,
					/obj/item/weapon/reagent_containers/dropper = 2,
					/obj/item/stack/medical/advanced/bruise_pack = 8,
					/obj/item/stack/medical/advanced/ointment = 8,
					/obj/item/stack/medical/splint = 4,
					/obj/item/weapon/reagent_containers/hypospray/autoinjector/pain = 4
					)

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
	name = "alien camera console"
	desc = "A strange console, capable of connecting you to the camera network."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "camera"


/obj/machinery/computer/abductor/camera/attack_hand(mob/user)
	if(istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = user

		if(H.wear_mask)
			H.drop_from_inventory(H.wear_mask)

		var/obj/item/clothing/mask/ai/abductor/mask = new(src.loc)
		mask.console = src
		H.equip_to_slot_if_possible(mask, slot_wear_mask)
		mask.engage_mask(H)

/obj/item/clothing/mask/ai/abductor
	var/obj/console

/obj/item/clothing/mask/ai/abductor/Process()
	if(get_dist(src, console) > 1)
		if(istype(loc, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = loc

			if(H.wear_mask)
				H.drop_from_inventory(H.wear_mask)
		else
			src.visible_message(SPAN_NOTICE("[src] rapidly retracts back into the console."))
			qdel(src)

/obj/item/clothing/mask/ai/abductor/dropped(var/mob/user)
	. = ..()
	src.visible_message(SPAN_NOTICE("[src] retracts back into the console as [user] drops it."))
	qdel(src)

/obj/item/clothing/mask/ai/abductor/engage_mask(var/mob/user)
	. = ..()
	eye.forceMove(locate("landmark*Observer-Start").loc)

/obj/machinery/computer/teleporter/abductor
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "console"

/obj/machinery/teleport/hub/abductor
	icon = 'infinity/icons/obj/abductor.dmi'

/obj/item/weapon/weldingtool/electric/alien
	name = "crystalline arc welder"
	desc = "A crystalline welding tool of an alien make."
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
	name = "crystalline shears"
	desc = "A crystalline shearing tool of an alien make."
	icon_state = "cutters"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)
	build_from_parts = FALSE

/obj/item/weapon/wirecutters/alien/Initialize()
	. = ..()
	icon_state = initial(icon_state)
	item_state = initial(item_state)

/obj/item/weapon/screwdriver/alien
	name = "crystalline screwdriver"
	desc = "A crystalline screwdriving tool of an alien make."
	icon_state = "screwdriver"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)
	build_from_parts = FALSE

/obj/item/weapon/screwdriver/alien/Initialize()
	. = ..()
	icon_state = initial(icon_state)
	item_state = initial(item_state)

/obj/item/weapon/crowbar/alien
	name = "crystalline prytool"
	desc = "A crystalline prying tool of an alien make."
	icon_state = "crowbar"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)

/obj/item/weapon/crowbar/alien/Initialize()
	. = ..()
	icon_state = initial(icon_state)
	item_state = initial(item_state)

/obj/item/weapon/wrench/alien
	name = "crystalline wrench"
	desc = "A crystalline wrenching tool of an alien make."
	icon_state = "wrench"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)

/obj/item/weapon/wrench/alien/Initialize()
	. = ..()
	icon_state = initial(icon_state)
	item_state = initial(item_state)

/obj/item/device/multitool/alien
	name = "crystalline multitool"
	desc = "A crystalline energy patterning tool of an alien make."
	icon_state = "multitool"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)

/obj/item/weapon/storage/belt/utility/alien
	name = "crystalline tool harness"
	desc = "A segmented belt of strange crystalline material."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "belt"

/obj/item/weapon/storage/belt/utility/crystal/Initialize()
	new /obj/item/device/multitool/alien(src)
	new /obj/item/weapon/wrench/alien(src)
	new /obj/item/weapon/crowbar/alien(src)
	new /obj/item/weapon/screwdriver/alien(src)
	new /obj/item/weapon/wirecutters/alien(src)
	new /obj/item/weapon/weldingtool/electric/alien(src)
	update_icon()
	. = ..()

/obj/structure/table/alien
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "alien"
	material = MATERIAL_ALIEN

	var/pos = 0

/obj/structure/table/alien/on_update_icon()
	return

/obj/structure/table/alien/Initialize()
	if(pos == 1)
		icon_state = "alien_up"
	if(pos == 2)
		icon_state = "alien_down"

/obj/item/weapon/implant/abductors
	name = "abductors implant"
	desc = "Strange implant, used to control alien technologies."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "implant"

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

/obj/item/weapon/implant/abductors/verb/teleport_agent()

	set name = "Teleport to agent"
	set category = "Abilities"
	set src in usr

	if(!istype(src.loc,/mob/living)) return

	var/mob/living/mob = loc

	if(istype(mob))


		if(do_after(mob, 2 SECONDS, get_turf(mob), TRUE))

			new /obj/effect/temporary(get_turf(mob), 5, icon, "teleport_effect_back")
			mob.dir = 2

			spawn(5)
				mob.forceMove(get_turf(locate(/obj/item/weapon/implant/abductors/agent)))

				new /obj/effect/temporary(get_turf(mob), 5, icon, "teleport_effect")

				spawn(5)
					var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
					sparks.set_up(5, 0, get_turf(mob))
					sparks.start()
					playsound(src.loc, "sparks", 50, 1)
					playsound(src.loc, 'sound/effects/phasein.ogg', 25, 1)

/obj/item/weapon/implant/abductors/agent

/obj/item/clothing/under/thermal/heat/abductor
	name = "alien thermal suit"
	desc = "Stylish fitting alien thermal suit."

/decl/hierarchy/outfit/abductor
	uniform = /obj/item/clothing/under/thermal/heat/abductor
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset
	hierarchy_type = /decl/hierarchy/outfit/abductor
	flags = OUTFIT_RESET_EQUIPMENT