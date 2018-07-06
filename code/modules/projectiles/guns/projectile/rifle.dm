/obj/item/weapon/gun/projectile/rifle/bolt
	name = "M1930 bolt rifle"
	desc = "The Replica of the rifle of the 20th century.It is popular with criminals and poor citizens because of its cheapness. 250 thalers for a reliable rifle - good suggestion. Use .30-06 rounds."
	icon_state = "moistnugget"
	icon = 'icons/obj/infinity_guns.dmi'
	item_state = "mosin"
	item_icons = list(
		slot_r_hand_str = 'icons/event/right1.dmi',
		slot_l_hand_str = 'icons/event/left1.dmi',
		)
	max_shells = 5
	w_class = ITEM_SIZE_HUGE
	force = 10
	slot_flags = SLOT_BACK
	caliber = "3006"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SPEEDLOADER
	ammo_type = /obj/item/ammo_casing/a3006
	handle_casings = HOLD_CASINGS
	one_hand_penalty = 2
	var/recentpump = 0 // to prevent spammage
	wielded_item_state = "gun_wielded"
	load_sound = 'sound/weapons/guns/interaction/rifle_load.ogg'

/obj/item/weapon/gun/projectile/rifle/bolt/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/rifle/bolt/attack_self(mob/living/user as mob)
	if(world.time >= recentpump + 10)
		bolt(user)
		recentpump = world.time

/obj/item/weapon/gun/projectile/rifle/bolt/proc/bolt(mob/M as mob)
	playsound(M, 'sound/weapons/riflebolt.ogg', 60, 1)

	if(chambered)//We have a shell in the chamber
		chambered.forceMove(get_turf(src))//Eject casing
		if(LAZYLEN(chambered.fall_sounds))
			playsound(loc, pick(chambered.fall_sounds), 50, 1)
		chambered = null

	if(loaded.len)
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		chambered = AC

	update_icon()