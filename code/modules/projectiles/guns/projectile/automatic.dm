/obj/item/weapon/gun/projectile/automatic //Hopefully someone will find a way to make these fire in bursts or something. --Superxpdude
	name = "prototype SMG"
	desc = "A protoype lightweight, fast firing gun. Uses 9mm rounds."
	icon_state = "saber"	//ugly
	w_class = ITEM_SIZE_NORMAL
	load_method = SPEEDLOADER //yup. until someone sprites a magazine for it.
	max_shells = 22
	caliber = "9mm"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	ammo_type = /obj/item/ammo_casing/c9mm
	multi_aim = 1
	burst_delay = 1.1
	mag_insert_sound = 'sound/weapons/guns/interaction/smg_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/smg_magout.ogg'

	//machine pistol, easier to one-hand with
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    one_hand_penalty=1, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",   burst=5, fire_delay=null, move_delay=2,    one_hand_penalty=2, burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.6, 0.6, 1.0, 1.0, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/machine_pistol
	name = "MP6 machine pistol"
	desc = "The Lumoco Arms MP6 Vesper, A fairly common machine pistol. Sometimes refered to as an 'uzi' by the backwater spacers it is often associated with. Uses .45 rounds."
	icon_state = "mpistolen"
	item_state = "wt550"
	w_class = ITEM_SIZE_NORMAL
	load_method = MAGAZINE
	caliber = ".45"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 3)
	slot_flags = SLOT_BELT
	ammo_type = /obj/item/ammo_casing/c45
	magazine_type = /obj/item/ammo_magazine/c45uzi
	allowed_magazines = /obj/item/ammo_magazine/c45uzi //more damage compared to the wt550, smaller mag size

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    one_hand_penalty=1, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",   burst=5, fire_delay=null, move_delay=2,    one_hand_penalty=2, burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.6, 0.6, 1.0, 1.0, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/mini_uzi/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "mpistolen"
	else
		icon_state = "mpistolen-empty"

/obj/item/weapon/gun/projectile/automatic/c20r
	name = "C-20r submachine gun"
	desc = "The C-20r is a lightweight and rapid firing SMG, for when you REALLY need someone dead. Uses 10mm rounds. Has a 'Scarborough Arms - Per falcis, per pravitas' buttstamp."
	icon_state = "c20r"
	item_state = "c20r"
	w_class = ITEM_SIZE_LARGE
	force = 10
	caliber = "10mm"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)
	slot_flags = SLOT_BELT|SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a10mm
	allowed_magazines = /obj/item/ammo_magazine/a10mm
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	one_hand_penalty = 1

	//SMG
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=2, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    one_hand_penalty=3, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",   burst=5, fire_delay=null, move_delay=2,    one_hand_penalty=4, burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.6, 0.6, 1.0, 1.0, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/c20r/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "c20r-[round(ammo_magazine.stored_ammo.len,4)]"
	else
		icon_state = "c20r"
	return

/obj/item/weapon/gun/projectile/automatic/sts35
	name = "STS-35 assault rifle"
	desc = "The rugged STS-35 is a durable automatic weapon of a make popular on the frontier worlds. The serial number has been scratched off. Uses 5.56mm rounds."
	icon_state = "arifle"
	item_state = null
	w_class = ITEM_SIZE_HUGE
	force = 10
	caliber = "a556"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 5)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/c556
	allowed_magazines = /obj/item/ammo_magazine/c556
	one_hand_penalty = 3
	wielded_item_state = "arifle-wielded"
	mag_insert_sound = 'sound/weapons/guns/interaction/ltrifle_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/ltrifle_magout.ogg'

	//Assault rifle, burst fire degrades quicker than SMG, worse one-handing penalty, slightly increased move delay
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=null,    one_hand_penalty=5, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",   burst=5, fire_delay=null, move_delay=null,    one_hand_penalty=6, burst_accuracy=list(0,-1,-2,-3,-3), dispersion=list(0.6, 1.0, 1.2, 1.2, 1.5)),
		)

/obj/item/weapon/gun/projectile/automatic/sts35/on_update_icon()
	icon_state = (ammo_magazine)? "arifle" : "arifle-empty"
	wielded_item_state = (ammo_magazine)? "arifle-wielded" : "arifle-wielded-empty"
	..()

/obj/item/weapon/gun/projectile/automatic/wt550
	name = "WT-550 submachine gun"
	desc = "The WT-550 Saber is a cheap self-defense weapon, mass-produced by Ward-Takahashi for paramilitary and private use. Uses 9mm rounds."
	icon_state = "wt550"
	item_state = "wt550"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9mm"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	ammo_type = /obj/item/ammo_casing/c9mm/rubber
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mc9mmt/rubber
	allowed_magazines = /obj/item/ammo_magazine/mc9mmt

	//machine pistol, like SMG but easier to one-hand with
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=2,    one_hand_penalty=1, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",   burst=5, fire_delay=null, move_delay=2,    one_hand_penalty=2, burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.6, 0.6, 1.0, 1.0, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/wt550/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "wt550-[round(ammo_magazine.stored_ammo.len,4)]"
	else
		icon_state = "wt550"
	return

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

/obj/item/weapon/gun/projectile/automatic/z8
	name = "Z8 carabine"
	desc = "The Z8 Bulldog is an older model bullpup carbine, made by the now defunct Zendai Foundries. Uses armor piercing 7.62mm rounds. Makes you feel like a space marine when you hold it."
	icon_state = "carbine"
	item_state = "z8carbine"
	w_class = ITEM_SIZE_HUGE
	force = 10
	caliber = "a762"
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 3)
	ammo_type = /obj/item/ammo_casing/a762
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a762
	allowed_magazines = /obj/item/ammo_magazine/a762
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	one_hand_penalty = 5
	wielded_item_state = "z8carbine-wielded"
	mag_insert_sound = 'sound/weapons/guns/interaction/batrifle_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/batrifle_magout.ogg'
	//would have one_hand_penalty=4,5 but the added weight of a grenade launcher makes one-handing even harder
	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=0,    move_delay=null, use_launcher=null, one_hand_penalty=5, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3,    fire_delay=0,	  move_delay=null, use_launcher=null, one_hand_penalty=8, burst_accuracy=list(0,-1,-2), dispersion=list(0.6, 0.8, 1.0)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, move_delay=null, use_launcher=1,    one_hand_penalty=5, burst_accuracy=null, dispersion=null)
		)

	var/use_launcher = 0
	var/obj/item/weapon/gun/launcher/grenade/underslung/launcher

/obj/item/weapon/gun/projectile/automatic/z8/Initialize()
	. = ..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/z8/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/z8/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/z8/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/weapon/gun/projectile/automatic/z8/on_update_icon()
	..()
	if(ammo_magazine)
		if(ammo_magazine.stored_ammo.len)
			icon_state = "carbine-loaded"
		else
			icon_state = "carbine-empty"
	else
		icon_state = "carbine"
	return

/obj/item/weapon/gun/projectile/automatic/z8/examine(mob/user)
	. = ..()
	if(launcher.chambered)
		to_chat(user, "\The [launcher] has \a [launcher.chambered] loaded.")
	else
		to_chat(user, "\The [launcher] is empty.")

/obj/item/weapon/gun/projectile/automatic/l6_saw
	name = "L6 machine gun"
	desc = "A rather traditionally made L6 SAW with a pleasantly lacquered wooden pistol grip. Has 'Aussec Armoury- 2531' engraved on the reciever." //probably should refluff this
	icon_state = "l6closed100"
	item_state = "l6closedmag"
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
	wielded_item_state = "gun_wielded"
	mag_insert_sound = 'sound/weapons/guns/interaction/lmg_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/lmg_magout.ogg'


	//LMG, better sustained fire accuracy than assault rifles (comparable to SMG), higer move delay and one-handing penalty
	//No single-shot or 3-round-burst modes since using this weapon should come at a cost to flexibility.
	firemodes = list(
		list(mode_name="short bursts",	burst=5, move_delay=12, one_hand_penalty=8, burst_accuracy = list(0,-1,-1,-2,-2),          dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="long bursts",	burst=8, move_delay=15, one_hand_penalty=9, burst_accuracy = list(0,-1,-1,-2,-2,-2,-3,-3), dispersion = list(1.0, 1.0, 1.0, 1.0, 1.2)),
		)

	var/cover_open = 0

/obj/item/weapon/gun/projectile/automatic/l6_saw/mag
	magazine_type = /obj/item/ammo_magazine/c556

/obj/item/weapon/gun/projectile/automatic/l6_saw/special_check(mob/user)
	if(cover_open)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return 0
	return ..()

/obj/item/weapon/gun/projectile/automatic/l6_saw/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	to_chat(user, "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/l6_saw/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/l6_saw/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/l6_saw/on_update_icon()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/box))
		icon_state = "l6[cover_open ? "open" : "closed"][round(ammo_magazine.stored_ammo.len, 25)]"
		item_state = "l6[cover_open ? "open" : "closed"]"
	else if(ammo_magazine)
		icon_state = "l6[cover_open ? "open" : "closed"]mag"
		item_state = "l6[cover_open ? "open" : "closed"]mag"
	else
		icon_state = "l6[cover_open ? "open" : "closed"]-empty"
		item_state = "l6[cover_open ? "open" : "closed"]-empty"
	..()

/obj/item/weapon/gun/projectile/automatic/l6_saw/load_ammo(var/obj/item/A, mob/user)
	if(!cover_open)
		to_chat(user, "<span class='warning'>You need to open the cover to load that into [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/l6_saw/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_open)
		to_chat(user, "<span class='warning'>You need to open the cover to unload [src].</span>")
		return
	..()

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