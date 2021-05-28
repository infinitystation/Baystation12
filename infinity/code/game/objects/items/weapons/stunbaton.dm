/obj/item/melee/baton/cattleprod
	icon_state = "stunprod"
	item_state = "prod"
	item_icons = list(slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
					  slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi')

/obj/item/melee/baton/cattleprod/Initialize()
	. = ..()
	icon_state = "[base_icon_state]_nocell"
