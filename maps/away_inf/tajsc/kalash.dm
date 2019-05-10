
/obj/item/projectile/bullet/rifle/TV
	fire_sound = 'maps/away_inf/tajsc/tjgun.ogg'
	damage = 30
	armor_penetration = 50
	penetration_modifier = 1
	stun = 1
	weaken = 1
	distance_falloff = 0.5

/obj/item/weapon/gun/projectile/automatic/TV3/special_check(user)
	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(H.species && H.species.get_bodytype(H) != SPECIES_TAJARA)
			to_chat(user, "<span class='warning'>\The [src] trigger because of the anatomical structure of your hand is not pressed!</span>")
			return 0
	return ..()

/obj/item/ammo_casing/rifle/TV
	desc = "A strange hight-caliber casing. You think its bigger than 7.62, but smaller than 12.7."
	caliber = CALIBER_TV
	projectile_type = /obj/item/projectile/bullet/rifle/TV
	icon = 'maps/away_inf/tajsc/TV.dmi'
	icon_state = "TVb"
	spent_icon = "TVs"

/obj/item/ammo_magazine/TV
	name = "Large black magazine."
	icon = 'maps/away_inf/tajsc/TV.dmi'
	icon_state = "TVm"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = CALIBER_TV
	matter = list(MATERIAL_STEEL = 7000)
	ammo_type = /obj/item/ammo_casing/rifle/TV
	max_ammo = 26
	multiple_sprites = 1

/obj/item/weapon/gun/projectile/automatic/TV3
	name = "TV-3S carabine"
	desc = "The TV-3S carabine is the one of traditional carabines of CCA."
	icon = 'maps/away_inf/tajsc/TV.dmi'
	icon_state = "TV-3Sm"
	item_state = null
	w_class = ITEM_SIZE_HUGE
	force = 10
	caliber = CALIBER_TV
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	ammo_type = /obj/item/ammo_casing/rifle/TV
	slot_flags = SLOT_BELT | SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/TV
	allowed_magazines = /obj/item/ammo_magazine/TV
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	accuracy = 4
	accuracy_power = 7
	one_hand_penalty = 8
	bulk = GUN_BULK_RIFLE
	burst_delay = 3
	wielded_item_state = "arifle-wielded"
	mag_insert_sound = 'sound/weapons/guns/interaction/batrifle_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/batrifle_magout.ogg'

	firemodes = list(
		list(mode_name="semi auto",       burst=1, fire_delay=null,    move_delay=null, one_hand_penalty=8, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2, fire_delay=null, move_delay=2,    one_hand_penalty=9, burst_accuracy=null, dispersion=null),
		)

/obj/item/weapon/gun/projectile/automatic/TV3/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "TV-3Sm"
	else
		icon_state = "TV-3S"

/obj/item/ammo_magazine/TVtcink
	name = "Tcink"
	desc = "Tcink of 8.77mm bullets. If someone proebet this - it will be bad."
	icon = 'maps/away_inf/tajsc/TV.dmi'
	icon_state = "tcink"
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = CALIBER_TV
	matter = list(MATERIAL_STEEL = 20000)
	ammo_type = /obj/item/ammo_casing/rifle/TV
	max_ammo = 130