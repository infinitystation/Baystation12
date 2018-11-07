/obj/item/weapon/chainsword
	name = "CS-9 \"Martha\""
	desc = "The experimental chain sword version of CS-9. Reds with a black color give a special entourage. Most such swords use razor-sharp monomolecular teeth. When working, the chain sword emits an angry buzz that grows into a shrill scream when the chain begins to bite into something."

	icon = 'icons/obj/infinity_items/chainsword.dmi'
	icon_state = "chainsword_off"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/guns/guns_l.dmi',
		slot_r_hand_str = 'icons/mob/onmob/guns/guns_r.dmi',
		)

	force = 5
	sharp = 1
	edge = 1
	throwforce = 5
	throw_speed = 3
	throw_range = 5

	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT

	attack_verb = list("ripped", "slashed", "torn")

	hitsound = 'sound/items/chainsword_attack.ogg'

	var/force_off = 5
	var/force_on = 18
	var/status = 0
	var/icon_state_off = "chainsword_off"
	var/icon_state_on = "chainsword_on"
	var/fuel = 50

/obj/item/weapon/chainsword/proc/set_status(new_status, mob/user)
	if (!new_status)
		status = new_status
		force = force_off
		update_icon()
		return
	if (fuel)
		status = new_status
		playsound(get_turf(user), 'sound/items/chainsword_on.ogg', 50, 1)
		force = force_on
		update_icon()
		return
	to_chat(user, "<span class='notice'>You need more fuel for this.</span>")

/obj/item/weapon/chainsword/on_update_icon()
	if (status)
		icon_state = icon_state_on
	else
		icon_state = icon_state_off

/obj/item/weapon/chainsword/attack_self(mob/user as mob)
	set_status(!status, user)

/obj/item/weapon/chainsword/afterattack(obj/O as obj, mob/user as mob)
	if (!istype(O, /obj/structure/reagent_dispensers/fueltank) || (get_dist(src,O) > 1) || status)
		return
	fuel += O.reagents.remove_any(50 - fuel)
	to_chat(user, "<span class='notice'>You refuel [name]</span>")
	playsound(src.loc, 'sound/effects/refill.ogg', 50, 1, -6)

/obj/item/weapon/chainsword/attack(mob/M, mob/user)
	if (status)
		fuel -= 1
		if (fuel <= 0)
			fuel = 0
			set_status(!status, user)
			to_chat(user, "<span class='notice'>Out of fuel.</span>")
	..()

/obj/item/custkit/chainsword
	name = "CS-9 \"Martha\" customization kit"
	input = /obj/item/weapon/material/hatchet/machete/deluxe
	output = /obj/item/weapon/chainsword
