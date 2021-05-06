/obj/item/weldingtool/electric/alien
	name = "alien arc welder"
	desc = "A strange welding tool of an alien make."
	icon_state = "welder"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)
	cell = null
	fuel_cost_multiplier = 1

/obj/item/weldingtool/electric/alien/attackby(var/obj/item/W, var/mob/user)
	return

/obj/item/weldingtool/electric/alien/on_update_icon()
	icon_state = welding ? "welder_on" : "welder"

/obj/item/weldingtool/electric/alien/get_available_charge()
	. = 1000

/obj/item/weldingtool/electric/alien/spend_charge(var/amount)
	return

/obj/item/wirecutters/alien
	name = "alien wirecutters"
	desc = "Strange wirecutters of an alien make."
	icon_state = "cutters"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)
	build_from_parts = FALSE

/obj/item/wirecutters/alien/Initialize()
	. = ..()
	icon_state = initial(icon_state)
	item_state = initial(item_state)

/obj/item/screwdriver/alien
	name = "alien screwdriver"
	desc = "A strange screwdriving tool of an alien make."
	icon_state = "screwdriver"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)
	build_from_parts = FALSE

/obj/item/screwdriver/alien/Initialize()
	. = ..()
	icon_state = initial(icon_state)
	item_state = initial(item_state)

/obj/item/crowbar/alien
	name = "alien prytool"
	desc = "A prying tool of an alien make."
	icon_state = "crowbar"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)

/obj/item/crowbar/alien/Initialize()
	. = ..()
	icon_state = initial(icon_state)
	item_state = initial(item_state)

/obj/item/wrench/alien
	name = "alien wrench"
	desc = "A strange wrenching tool of an alien make."
	icon_state = "wrench"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)

/obj/item/wrench/alien/Initialize()
	. = ..()
	icon_state = initial(icon_state)
	item_state = initial(item_state)

/obj/item/device/multitool/alien
	name = "alien multitool"
	desc = "An energy patterning tool of an alien make."
	icon_state = "multitool"
	icon = 'infinity/icons/obj/abductor.dmi'
	matter = list(MATERIAL_ALIEN = 1250)

/obj/item/storage/belt/utility/alien
	name = "alien toolbelt"
	desc = "A segmented belt of strange crystalline material."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "belt"
	item_state = null

/obj/item/storage/belt/utility/alien/Initialize()
	. = ..()
	new /obj/item/device/multitool/alien(src)
	new /obj/item/wrench/alien(src)
	new /obj/item/crowbar/alien(src)
	new /obj/item/screwdriver/alien(src)
	new /obj/item/wirecutters/alien(src)
	new /obj/item/weldingtool/electric/alien(src)
	update_icon()

/obj/item/retractor/abductor
	name = "alien retractor"
	icon = 'infinity/icons/obj/abductor.dmi'
	surgery_speed = 0.2

/obj/item/hemostat/abductor
	name = "alien hemostat"
	icon = 'infinity/icons/obj/abductor.dmi'
	surgery_speed = 0.2

/obj/item/cautery/abductor
	name = "alien cautery"
	icon = 'infinity/icons/obj/abductor.dmi'
	surgery_speed = 0.2

/obj/item/surgicaldrill/abductor
	name = "alien surgical drill"
	icon = 'infinity/icons/obj/abductor.dmi'
	surgery_speed = 0.2

/obj/item/scalpel/abductor
	name = "alien scalpel"
	icon = 'infinity/icons/obj/abductor.dmi'
	surgery_speed = 0.2

/obj/item/circular_saw/abductor
	name = "alien circular saw"
	icon = 'infinity/icons/obj/abductor.dmi'
	surgery_speed = 0.2

/obj/item/scitool
	name = "science tool"
	desc = "An alien-looking scanner with a toggleable button."
	icon_state = "gizmo_mark"
	icon = 'infinity/icons/obj/abductor.dmi'
	slot_flags = SLOT_BELT
	var/mode = 1
	var/obj/machinery/abductor_tele/console
	var/obj/machinery/abductor_disguise/dis_console

/obj/item/scitool/Initialize()
	. = ..()
	console = locate(/obj/machinery/abductor_tele)
	dis_console = locate(/obj/machinery/abductor_disguise)

/obj/item/scitool/afterattack(var/mob/living/carbon/human/mob, var/mob/user, proximity)
	if(istype(mob))
		if(mode == 1)
			var/mob/living/carbon/human/H = mob
			if(istype(H.wear_suit, /obj/item/clothing/suit/armor/abductor))
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
			dis_console.appearances[H.name] = H.appearance
			to_chat(user, SPAN_NOTICE("You successfully scanned [H] with [src]."))

/obj/item/scitool/attack_self(mob/user as mob)
	if(mode == 1)
		mode = 2
	else
		mode = 1
	update_icon()

/obj/item/scitool/on_update_icon()
	switch(mode)
		if(1)
			icon_state = "gizmo_mark"
		if(2)
			icon_state = "gizmo_scan"
	loc.update_icon()
	. = ..()



/obj/item/mindtool
	name = "Mind Interface Device"
	desc = "An alien-looking tool with two electrodes."
	icon_state = "mind_device_control"
	icon = 'infinity/icons/obj/abductor.dmi'
	slot_flags = SLOT_BELT
	var/mode = 1

/obj/item/mindtool/afterattack(var/mob/living/carbon/human/mob, var/mob/user, proximity)
	if(istype(mob))
		if(mode == 1)
			var/mob/living/carbon/human/H = mob

			if(locate(/obj/item/organ/internal/gland) in H.contents)
				var/text = input("What would you like to ask for?", "Speak to creature", null, null)
				text = sanitize(text)

				if(!text) return

				to_chat(H, "<span class='danger'>Вы внезапно чувствуете очень явный и требовательный приказ: <i>[text]</i>. Вы понимаете, что должны выполнить его любой ценой.</span>")

		if(mode == 2)
			var/mob/living/carbon/human/H = mob
			var/text = input("What would you like to say to the creature?", "Speak to creature", null, null)
			text = sanitize(text)

			if(!text) return

			to_chat(H, "<span class='danger'>Внезапно, вы слышите странные слова: <i>[text]</i>...</span>")

/obj/item/mindtool/attack_self(mob/user as mob)
	if(mode == 1)
		mode = 2
	else
		mode = 1
	update_icon()

/obj/item/mindtool/on_update_icon()
	switch(mode)
		if(1)
			icon_state = "mind_device_control"
		if(2)
			icon_state = "mind_device_message"
	loc.update_icon()
	. = ..()

/obj/item/gun/energy/ionrifle/small/abductor
	name = "alien silencer"
	desc = "An alien-looking gun, capable of creating EMP to disable radio equipment."
	icon = 'infinity/icons/obj/abductor.dmi'
	item_state = "secgundark"
	icon_state = "silencer"

/obj/item/device/encryptionkey/alien
	name = "alien encryption key"
	desc = "Integrated encryption key."
	icon_state = "sci_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "Exploration" = 1, "AI Private" = 1)
