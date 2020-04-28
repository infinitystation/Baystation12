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