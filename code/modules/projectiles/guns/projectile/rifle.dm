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
	force = 15
	slot_flags = SLOT_BACK
	caliber = "3006"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING | SPEEDLOADER
	ammo_type = /obj/item/ammo_casing/a3006
	handle_casings = HOLD_CASINGS
	one_hand_penalty = 2
	allowed_magazines = list(/obj/item/ammo_magazine/a3006)

	load_sound = 'sound/weapons/guns/interaction/rifle_load.ogg'

	var/recentbolt = 0 // to prevent spammage

/obj/item/weapon/gun/projectile/rifle/bolt/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/rifle/bolt/attack_self(mob/living/user as mob)
	if(world.time >= recentbolt + 10)
		bolt(user)
		recentbolt = world.time

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

/obj/item/weapon/gun/projectile/rifle/bolt/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1
	toggle_scope(usr, 1.3)

/obj/item/weapon/gun/projectile/rifle/bolt/govt
	name = "H010AW Henry rifle"
	desc = "The Replica of the rifle of the 20th century. This expensive rifle was popular with hunters and sheriffs in the 20th century. Use .45-70 Govt. rounds."
	icon_state = "henry"
	icon = 'icons/obj/infinity_guns.dmi'
	item_state = "mosin"
	item_icons = list(
		slot_r_hand_str = 'icons/event/right1.dmi',
		slot_l_hand_str = 'icons/event/left1.dmi',
		)
	max_shells = 8
	w_class = ITEM_SIZE_HUGE
	force = 15
	slot_flags = SLOT_BACK
	caliber = "4570"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/a4570
	allowed_magazines = list()
	one_hand_penalty = 2
	load_sound = 'sound/weapons/guns/interaction/rifle_load.ogg'
