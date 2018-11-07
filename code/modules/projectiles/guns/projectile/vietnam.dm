/obj/item/weapon/gun/projectile/automatic/m16
	name = "M16A1"
	desc = "The assault rifle M16A1 made by Colt's Manufacturing LLC from blueprints of AR-15. A perfect choice for spreading democracy."
	icon = 'icons/event/guns.dmi'
	icon_state = "m16a1gl"
	item_state = "m16gl"
	item_icons = list(
		slot_r_hand_str = 'icons/event/right1.dmi',
		slot_l_hand_str = 'icons/event/left1.dmi',
		)
	wielded_item_state = "m16gl-wielded"
	w_class = ITEM_SIZE_HUGE
	force = 12
	caliber = "a556"
	origin_tech = list(TECH_COMBAT = 9, TECH_MATERIAL = 4)
	ammo_type = /obj/item/ammo_casing/a556
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/c556
	allowed_magazines = /obj/item/ammo_magazine/c556
	auto_eject = 0
	one_hand_penalty = 4
	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=0,    move_delay=null, use_launcher=null, one_hand_penalty=3, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3,    fire_delay=0,	  move_delay=null, use_launcher=null, one_hand_penalty=5, burst_accuracy=list(0,-0.6,-1.2), dispersion=list(0.4, 0.8, 1.2)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, move_delay=null, use_launcher=1,    one_hand_penalty=3, burst_accuracy=null, dispersion=null)
		)

	var/use_launcher = 0
	var/obj/item/weapon/gun/launcher/grenade/underslung/launcher

/obj/item/weapon/gun/projectile/automatic/m16/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/m16/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m16/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m16/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m16/on_update_icon()
	icon_state = (ammo_magazine)? "m16a1gl" : "m16a1gl-empty"
	item_state = (ammo_magazine)? "m16gl" : "m16gl-empty"
	wielded_item_state = (ammo_magazine)? "m16gl-wielded" : "m16gl-wielded-empty"
	..()



/obj/item/weapon/gun/projectile/automatic/m60
	name = "M60 machine gun"
	desc = "A rather traditionally made M60 SAW with a pleasantly lacquered plastic pistol grip. Has 'Saco Defense - 1961' engraved on the reciever." //probably should refluff this
	icon = 'icons/event/guns.dmi'
	item_icons = list(
	slot_r_hand_str = 'icons/event/right1.dmi',
	slot_l_hand_str = 'icons/event/left1.dmi',
	)
	icon_state = "m60closed200"
	item_state = "m60"
	w_class = ITEM_SIZE_HUGE
	force = 10
	slot_flags = 0
	max_shells = 50
	caliber = "a556"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 2)
	slot_flags = 0 //need sprites for SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a556
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/box/a556
	allowed_magazines = list(/obj/item/ammo_magazine/box/a556, /obj/item/ammo_magazine/c556)
	one_hand_penalty = 6
	wielded_item_state = "m60-wielded"


	//LMG, better sustained fire accuracy than assault rifles (comparable to SMG), higer move delay and one-handing penalty
	//No single-shot or 3-round-burst modes since using this weapon should come at a cost to flexibility.
	firemodes = list(
		list(mode_name="short bursts",	burst=5, move_delay=12, one_hand_penalty=8, burst_accuracy = list(0,-1,-1,-2,-2),          dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="long bursts",	burst=8, move_delay=15, one_hand_penalty=9, burst_accuracy = list(0,-1,-1,-2,-2,-2,-3,-3), dispersion = list(1.0, 1.0, 1.0, 1.0, 1.2)),
		)

	var/cover_open = 0

/obj/item/weapon/gun/projectile/automatic/m60/mag
	magazine_type = /obj/item/ammo_magazine/c556

/obj/item/weapon/gun/projectile/automatic/m60/special_check(mob/user)
	if(cover_open)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return 0
	return ..()

/obj/item/weapon/gun/projectile/automatic/m60/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	to_chat(user, "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/m60/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/m60/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/m60/on_update_icon()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/box))
		icon_state = "m60[cover_open ? "open" : "closed"][round(ammo_magazine.stored_ammo.len, 100)]"
		item_state = "m60"
	else
		icon_state = "m60[cover_open ? "open" : "closed"]-empty"
		item_state = "m60-empty"
	..()

/obj/item/weapon/gun/projectile/automatic/m60/load_ammo(var/obj/item/A, mob/user)
	if(!cover_open)
		to_chat(user, "<span class='warning'>You need to open the cover to load that into [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/m60/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_open)
		to_chat(user, "<span class='warning'>You need to open the cover to unload [src].</span>")
		return
	..()



/obj/item/weapon/gun/projectile/automatic/m14
	name = "M14 rifle"
	desc = "The M14 - rifle of the Vietnam War. Uses 7.62mm rounds."
	icon = 'icons/event/guns.dmi'
	item_icons = list(
	slot_r_hand_str = 'icons/event/right1.dmi',
	slot_l_hand_str = 'icons/event/left1.dmi',
	)
	var/obj/item/weapon/scope/scoped = null
	icon_state = "m14"
	item_state = "m14"
	w_class = ITEM_SIZE_HUGE
	force = 10
	caliber = "a762"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 5)
	slot_flags = SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a762
	allowed_magazines = /obj/item/ammo_magazine/a762
	one_hand_penalty = 3
	wielded_item_state = "m14-wielded"

	//Assault rifle, burst fire degrades quicker than SMG, worse one-handing penalty, slightly increased move delay
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=null,    one_hand_penalty=5, burst_accuracy=list(0,-1,-1),       dispersion=list(0.6, 1.0, 1.2)),
		list(mode_name="long bursts",   burst=5, fire_delay=null, move_delay=null,    one_hand_penalty=6, burst_accuracy=list(0,-1,-2,-3,-3), dispersion=list(1.0, 1.0, 1.2, 1.2, 1.5)),
		)

/obj/item/weapon/gun/projectile/automatic/m14/on_update_icon()
	if(scoped)
		icon_state = (ammo_magazine)? "m14scoped" : "m14scoped-empty"
	else
		icon_state = (ammo_magazine)? "m14" : "m14-empty"
	wielded_item_state = (ammo_magazine)? "m14-wielded" : "m14-wielded-empty"
	..()

/obj/item/weapon/gun/projectile/automatic/m14/attackby(var/obj/item/A as obj, mob/user as mob)
	if (istype(A, /obj/item/weapon/scope) && user.unEquip(A))
		A.loc = src
		scoped = A
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/m14/verb/unscope()
	set category = "Object"
	set name = "De-Scope"
	set popup_menu = 1

	De_scope()

/obj/item/weapon/gun/projectile/automatic/m14/proc/De_scope()
	toggle_scope(usr, 1)
	if (!scoped)
		to_chat(usr, "GDE PRICEL?!!!")
		return
	if (ismob(loc.loc))
		var/mob/M = loc.loc
		M.put_in_hands(scoped)
		to_chat(usr, "PRICEL NASH!!")
	else
		scoped.loc = get_turf(src)
	scoped = null
	update_icon()

/obj/item/weapon/gun/projectile/automatic/m14/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, scoped.scope_zoom)