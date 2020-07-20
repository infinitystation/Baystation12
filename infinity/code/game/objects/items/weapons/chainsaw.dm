/obj/item/weapon/chainsaw
	name = "chainsaw"
	desc = "A versatile power tool. Useful for limbing trees and delimbing humans."

	icon = 'infinity/icons/obj/chainsaw.dmi'
	icon_state = "chainsaw_off"
	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
		)

	w_class = ITEM_SIZE_HUGE
	attack_verb = list("sawed", "tore", "lacerated", "cut", "chopped", "diced")
	hitsound = "swing_hit"
	force = 6

	throwforce = 5
	throw_speed = 1
	throw_range = 1

	sharp = 1
	edge = 1

	var/force_on = 24
	var/on = 0

/obj/item/weapon/chainsaw/attack_self(mob/user)
	if(!src.is_held_twohanded(user))
		to_chat(user, SPAN_WARNING("You can't manage to start the [src] with one hand!"))
		change_status(0)
		return

	change_status(!on)
	to_chat(user, "As you pull the starting cord dangling from [src], [on ? "it begins to whirr." : "the chain stops moving."]")


/obj/item/weapon/chainsaw/update_twohanding()
	var/mob/user
	if(!istype(user))
		return
	if(!src.is_held_twohanded(user))
		to_chat(user, SPAN_WARNING("You can't manage to use the [src] with one hand!"))
		change_status(0)
	update_icon()

/obj/item/weapon/chainsaw/proc/change_status(var/set_to = 1)
	if(set_to == on)
		return
	on = set_to
	force = on ? force_on : initial(force)
	throwforce = on ? force_on : initial(throwforce)
	icon_state = "chainsaw_[on ? "on" : "off"]"

	if(on)
		hitsound = 'sound/weapons/circsawhit.ogg'
	else
		hitsound = "swing_hit"

	update_icon()