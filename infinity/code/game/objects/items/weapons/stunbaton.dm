/obj/item/melee/baton/cattleprod
	name = "stunprod"
	desc = "An improvised stun baton."
	icon = 'icons/obj/weapons/melee_physical.dmi'
	icon_state = "stunprod"
	item_state = "prod"
	item_icons = list(slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
					  slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi')
	force = 3
	throwforce = 5
	stunforce = 0
	agonyforce = 60	//same force as a stunbaton, but uses way more charge.
	hitcost = 25
	attack_verb = list("poked")
	slot_flags = null
