

/* SAARE CUSTOM KIT
 * ===============
 */

/obj/item/clothing/glasses/sunglasses/sechud/custom_ballistic/orange
	desc = "A ballistic glasses with medium shatter protection."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "ballistic_glasses_orange"
	item_state = "ballistic_glasses_orange"
	item_icons = list(slot_glasses_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/head/helmet/jackinghelm
	name = "\improper Altyn P1"
	desc = "It looks like a helmet of 2 protection class, you can see abrasions and scratches on the visor"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "jackinghelmet"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
	)
	item_state_slots = list(
		slot_head_str = "jackinghelmet"
	)
	trade_blacklisted = TRUE
	action_button_name = "Toggle Visor"
	var/isVisorUp = 0

/obj/item/clothing/head/helmet/jackinghelm/on_update_icon()
	. = ..()
	var/tmp = "[initial(icon_state)][isVisorUp ? "_up" : ""]"
	item_state_slots = list(slot_head_str = tmp)
	icon_state = tmp
	update_clothing_icon()

/obj/item/clothing/head/helmet/jackinghelm/attack_self(mob/user as mob)
	isVisorUp = !isVisorUp
	to_chat(user, "You [isVisorUp ? "raise" : "lower"] the visor on the [src].")
	update_icon()


/obj/item/gun/projectile/automatic/nt41/jacking
	name = "AK105 rifle"
	desc = "AK105 - export version of the AK, characterized by installing a “high” picatinny rail instead of a carrying handle on top of the receiver. The guide is equipped with a 3x4 double sight, and then a thin longitudinal groove is used. In addition, on the XR36 modification, a “cheek” is installed on the standard frame stock."
	icon_state = "AK105-f"

	item_state = "AK105-wielded"
	icon = 'infinity/icons/obj/guns/AK105.dmi'
	wielded_item_state = "AK105-wielded-f"
	item_icons = list(
		slot_r_hand_str = 'infinity/icons/customs/infinity_custom_guns_slot_r_hand.dmi',
		slot_l_hand_str = 'infinity/icons/customs/infinity_custom_guns_slot_l_hand.dmi',
		)
	trade_blacklisted = TRUE
	mag_insert_sound = 'sound/weapons/guns/interaction/ltrifle_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/ltrifle_magout.ogg'

/obj/item/gun/projectile/automatic/nt41/jacking/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "AK105-f"
		wielded_item_state = "AK105-wielded-f"
	else
		icon_state = "AK105-e"
		wielded_item_state = "AK105-wielded-e"


/obj/item/custkit/custom_saare
	name = "NT41 customization kit"
	input = /obj/item/gun/projectile/automatic/nt41/armory
	output = /obj/item/gun/projectile/automatic/nt41/jacking

/obj/item/clothingbag/custom_saare
	name = "SAARE tactical ops"
	desc = "Just bag"
	trade_blacklisted = TRUE

/obj/item/clothingbag/custom_saare/Initialize()
	. = ..()
	new /obj/item/clothing/glasses/sunglasses/sechud/custom_ballistic/orange(src)
	new /obj/item/clothing/head/helmet/jackinghelm(src)
	new /obj/item/custkit/custom_saare(src)

