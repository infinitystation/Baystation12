/obj/item/weapon/gun/projectile/automatic/wt550/lethal
	ammo_type = /obj/item/ammo_casing/c9mm
	magazine_type = /obj/item/ammo_magazine/mc9mmt

/obj/item/weapon/gun/projectile/automatic/nt41
	name = "NT41 submachine gun"
	desc = "The NT41 Enforcer is a self-defense weapon made on bullpup system. Produced by NanoTrasen for it's Security Force. Looks cool and stylish, but sometimes too uncomfortably to run with it. Uses 5.7x28mm rounds."
	icon_state = "nt41"
	item_state = "nt41"
	icon = 'icons/obj/infinity_guns.dmi'
	wielded_item_state = "nt41-wielded"
	item_icons = list(
		slot_r_hand_str = 'icons/mob/infinity/misc.dmi',
		slot_l_hand_str = 'icons/mob/infinity/misctwo.dmi',
		)

	w_class = ITEM_SIZE_NORMAL
	caliber = "57x28mm"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3)
	slot_flags = SLOT_BELT
	ammo_type = /obj/item/ammo_casing/nt28mm
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/n10mm
	allowed_magazines = /obj/item/ammo_magazine/n10mm
	one_hand_penalty = 2

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=1, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2, fire_delay=null, move_delay=2,    one_hand_penalty=3, burst_accuracy=list(0,-1),       dispersion=list(0.0, 0.8)),
		list(mode_name="short bursts",   burst=4, fire_delay=null, move_delay=4,    one_hand_penalty=4, burst_accuracy=list(0,-1,-1.5,-2), dispersion=list(0.6, 0.8, 1.0, 1.4)),
		)

/obj/item/weapon/gun/projectile/automatic/nt41/on_update_icon()
	..()
	icon_state = (ammo_magazine)? "nt41" : "nt41-e"

/obj/item/weapon/gun/projectile/automatic/amrcarabine
	name = "LDC-542 carabine"
	desc = "The sielent and deadly and manufactured by Aussec Armory, bullpup carabine LDC-542 is a common weapon for a long-medium ranged combat units in Private Military Companies. Uses 12.7x55mm rounds."
	icon = 'icons/obj/infinity_guns.dmi'
	icon_state = "amrcarabine"
	item_state = null
	w_class = ITEM_SIZE_HUGE
	force = 10
	caliber = "127x55"
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/c12755
	allowed_magazines = /obj/item/ammo_magazine/c12755
	ammo_type = /obj/item/ammo_casing/a12755
	one_hand_penalty = 7
	wielded_item_state = "z8carbine-wielded"
	burst_delay = 2
	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=4, move_delay=1, one_hand_penalty=7, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2,    fire_delay=6, move_delay=1, one_hand_penalty=15, burst_accuracy=list(0,-0.8), dispersion=list(0.0, 0.4)),
		)

/obj/item/weapon/gun/projectile/automatic/amrcarabine/on_update_icon()
	icon_state = (ammo_magazine)? "amrcarabine" : "amrcarabine-e"
	..()

/obj/item/weapon/gun/projectile/automatic/amrcarabine/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1
	toggle_scope(usr, 1.5)


/obj/item/weapon/gun/projectile/automatic/z9
	name = "Z9 carabine"
	desc = "The assault carabine Z9 'Viper' made by Aussec Armory from blueprints of Z8 'Bulldog' manufactured the now defunct Zendai Foundries. Old design was swapped with more futuristic one. 'Viper' conting as one of newest weapon on market, so you cannot buy it easy. You don't know who may hold that gun, but they should be pretty rich... Like governments special forces or famouse PMC companies like SAARE."
	icon = 'icons/obj/infinity_guns.dmi'
	icon_state = "bullpup"
	item_state = "bullpup"
	item_icons = list(
		slot_r_hand_str = 'icons/mob/infinity/misc.dmi',
		slot_l_hand_str = 'icons/mob/infinity/misctwo.dmi',
		)
	wielded_item_state = "bullpup-wielded"
	w_class = ITEM_SIZE_HUGE
	force = 12
	caliber = "a762"
	origin_tech = list(TECH_COMBAT = 9, TECH_MATERIAL = 4)
	ammo_type = /obj/item/ammo_casing/a762
	slot_flags = SLOT_BELT|SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a762/extended
	allowed_magazines = /obj/item/ammo_magazine/a762
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	one_hand_penalty = 4
	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=0,    move_delay=null, use_launcher=null, one_hand_penalty=3, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3,    fire_delay=0,	  move_delay=null, use_launcher=null, one_hand_penalty=5, burst_accuracy=list(0,-0.6,-1.2), dispersion=list(0.4, 0.8, 1.2)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, move_delay=null, use_launcher=1,    one_hand_penalty=3, burst_accuracy=null, dispersion=null)
		)

	var/use_launcher = 0
	var/obj/item/weapon/gun/launcher/grenade/underslung/launcher

/obj/item/weapon/gun/projectile/automatic/z9/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/z9/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/z9/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/z9/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/weapon/gun/projectile/automatic/z9/on_update_icon()
	icon_state = (ammo_magazine)? "bullpup" : "bullpup-e"
	..()

/obj/item/weapon/gun/projectile/automatic/bp15
	name = "BP-15 PDW"
	desc = "The BP-15 'Moloh' is a  personal defense weapon, produced by Aussec Armory for use by police spec ops or solders. Uses 5.7x28 mm rounds."
	icon = 'icons/event/guns.dmi'
	icon_state = "pdw"
	item_state = "c20r"
	item_icons = list(
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_guns.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_guns.dmi',
		)
	w_class = ITEM_SIZE_NORMAL
	caliber = "57"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	ammo_type = /obj/item/ammo_casing/c57
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mc57
	allowed_magazines = /obj/item/ammo_magazine/mc57

	//machine pistol, like SMG but easier to one-hand with
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    one_hand_penalty=1, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",   burst=5, fire_delay=null, move_delay=2,    one_hand_penalty=2, burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.6, 0.6, 1.0, 1.0, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/bp15/on_update_icon()
	icon_state = (ammo_magazine)? "pdw" : "pdw-empty"
	..()

/obj/item/weapon/gun/projectile/automatic/invider
	name = "Invider submachine gun"
	desc = "The Invider is a Hi-tech and rapid firing SMG. Uses 4.6x30mm universal rounds."
	icon = 'icons/event/guns.dmi'
	icon_state = "pdw"
	item_state = "c20r"
	w_class = ITEM_SIZE_LARGE
	var/projetcile_type = 0
	force = 10
	caliber = "46x30mm"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)
	slot_flags = SLOT_BELT|SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/uni46x30mm
	allowed_magazines = /obj/item/ammo_magazine/uni46x30mm
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	one_hand_penalty = 0

	//SMG
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    one_hand_penalty=0, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		)

/obj/item/weapon/gun/projectile/automatic/invider/modify_projectile(obj/item/projectile/p, var/list/params = list())
	if (params["Charged"] == 1 && loaded.len)
		p = new /obj/item/projectile/bullet/smg/uni46x30mm_charged
	return p

/obj/item/weapon/gun/projectile/automatic/invider/CtrlAltClick(mob/user)
	if(user.incapacitated())
		to_chat(user, "<span class='warning'>You can't do that right now!</span>")
		return

	else
		if(src == user.get_active_hand())
			projetcile_type = !projetcile_type
			playsound(user, 'sound/weapons/selector.ogg', 50, 1)
			to_chat(user, "<span class='notice'>You toggle the bullet penetration mode [projetcile_type ? "on":"off"].</span>")

/obj/item/weapon/gun/projectile/automatic/invider/Fire(atom/target, mob/living/user, clickparams, pointblank=0, reflex=0, var/list/params = list())
	if (projetcile_type == 1)
		..(target, user, clickparams, pointblank, reflex, list("Charged" = 1))
	else
		..(target, user, clickparams, pointblank, reflex, list("Charged" = 0))

/obj/item/weapon/gun/projectile/automatic/invider/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "pdw"
	else
		icon_state = "pdw-empty"
	return