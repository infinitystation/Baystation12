/obj/item/clothing/glasses/hud/health/cultblind
	name = "zealot's blindfold"
	desc = "May Nar'Sie guide you through the darkness and shield you from the light."
	icon_state = "blindfold"
	item_state = "blindfold"
	flash_protection = FLASH_PROTECTION_MAJOR
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	darkness_view = 7

/obj/item/weapon/reagent_containers/glass/beaker/unholywater
	name = "flask of unholy water"
	desc = "Toxic to nonbelievers; reinvigorating to the faithful - this flask may be sipped or thrown."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "holyflask"
	color = "#333333"

/obj/item/weapon/reagent_containers/glass/beaker/unholywater/New()
	..()
	reagents.add_reagent(/datum/reagent/hell_water, 50)
	update_icon()

obj/item/weapon/handcuffs/wizard/shadow
	name = "shadow shackles"
	desc = "A pair of shadow handcuffs, usually seen in Nar'Sien armies."
	elastic = 1

/obj/item/weapon/handcuffs/wizard/shadow/place_handcuffs(var/mob/living/carbon/target, var/mob/user, var/silent)
	var/mob/living/carbon/human/H = target
	if(!istype(H))
		return 0

	if (!H.has_organ_for_slot(slot_handcuffed))
		to_chat(user, "<span class='danger'>\The [H] needs at least two wrists before you can cuff them together!</span>")
		return 0

	var/obj/item/weapon/handcuffs/cuffs = src
	if(dispenser)
		cuffs = new(get_turf(user))
	else if(!user.unEquip(cuffs))
		return 0

	admin_attack_log(user, H, "Attempted to handcuff the victim", "Was target of an attempted handcuff", "attempted to handcuff")
	SSstatistics.add_field_details("handcuffs","H")

	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	user.do_attack_animation(H)

	if(!silent)
		user.visible_message("<span class='danger'>\The [user] forms [src] around [target] wrists!</span>")

	target.equip_to_slot(cuffs,slot_handcuffed)
	return 1

/obj/item/device/flashlight/flashdark/stone
	name = "shadowstone shard"
	desc = "The stone is blacker than the night itself, it seems to dim all the light around."
	icon = 'infinity/icons/obj/objects.dmi'
	icon_state = "hellstone"
	item_state = "electronic"

/obj/item/clothing/glasses/tacgoggles/cult
	name = "hell goggles"
	desc = "Its look equally funny and frightening."
	item_icons = list(slot_glasses_str = 'infinity/icons/mob/onmob/onmob_eyes.dmi')
	icon = 'infinity/icons/obj/clothing/obj_eyes.dmi'
	icon_state = "hg"
	item_state = "hg"
	off_state = "hg_off"
	darkness_view = 5
