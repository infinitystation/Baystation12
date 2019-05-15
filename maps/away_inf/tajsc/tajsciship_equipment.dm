
#define CALIBER_TV              	"8.77mm"

/obj/item/clothing/suit/space/void/CCA_EC_AVS
    name = "AVS"
    desc = "Sealed tajara armored suit with reflective panels and the installation of a mechanical exoskeleton. It has the identification marks of EC CCA."
    icon_state = "T-RB"
    icon = 'maps/away_inf/tajsc/tajsciship.dmi'
    item_icons = list(
    slot_l_hand_str = "mining_voidsuit",
    slot_r_hand_str = "mining_voidsuit",
    slot_wear_suit_str = 'maps/away_inf/tajsc/tajsciship.dmi'
    )
    armor = list(melee = 75, bullet = 65, laser = 65,energy = 55, bomb = 55, bio = 100, rad = 100)
    allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/device/suit_cooling_unit,/obj/item/weapon/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/melee/energy/sword,/obj/item/weapon/handcuffs,/obj/item/weapon/storage/toolbox,/obj/item/weapon/storage/briefcase/inflatable,/obj/item/device/t_scanner,/obj/item/weapon/rcd)
    heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
    max_heat_protection_temperature = SPACE_SUIT_MAX_HEAT_PROTECTION_TEMPERATURE
    species_restricted = list(SPECIES_TAJARA)

/obj/item/clothing/head/helmet/space/void/CCA_EC_AVSH
    name = "AVS helmet"
    desc = "AVS helmet with large visor, looks heavy but comfortable. For Tajara."
    icon_state = "T-RH"
    icon = 'maps/away_inf/tajsc/tajsciship.dmi'
    item_icons = list(slot_wear_head_str = 'maps/away_inf/tajsc/tajsciship.dmi')
    item_icons = list(
    slot_l_hand_str = "atmos_helm",
    slot_r_hand_str = "atmos_helm",
    slot_head_str = 'maps/away_inf/tajsc/tajsciship.dmi'
    )

    armor = list(melee = 75, bullet = 65, laser = 65,energy = 55, bomb = 55, bio = 100, rad = 100)
    light_overlay = "helmet_light_dual"
    species_restricted = list(SPECIES_TAJARA)

/obj/item/clothing/suit/space/void/CCA_EC_AVS/prepared
    helmet = /obj/item/clothing/head/helmet/space/void/CCA_EC_AVSH
    boots = /obj/item/clothing/shoes/magboots

/obj/item/clothing/suit/space/void/CCA_EC_AVS/New()
    ..()
    slowdown_per_slot[slot_wear_suit] = 2

/obj/item/weapon/circuitboard/telecomms/allinone/tajsciship
	build_path = /obj/machinery/telecomms/allinone/tajsciship

/obj/machinery/telecomms/allinone/tajsciship
	listening_freqs = list(TAJSCISHIP_FREQ)
	channel_color = COMMS_COLOR_SYNDICATE
	channel_name = "CCA EC"
	circuitboard = /obj/item/weapon/circuitboard/telecomms/allinone/tajsciship

/obj/item/device/radio/headset/tajsciship
	name = "CCA EC headset"
	icon_state = "srv_headset"
	ks1type = /obj/item/device/encryptionkey/tajsciship

/obj/item/device/radio/headset/tajsciship/Initialize()
	. = ..()
	set_frequency(TAJSCISHIP_FREQ)

/obj/item/device/encryptionkey/tajsciship
	name = "CCA EC radio encryption key"
	icon_state = "sci_cypherkey"
	channels = list("CCA EC" = 1)

/obj/item/clothing/under/tajsciship/CCAECjumpsuit
	name = "CCA EC uniform"
	desc = "A comfortable for tajara turtleneck and black utility trousers."
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 5, bomb = 0, bio = 5, rad = 5)
	siemens_coefficient = 0.8
	icon = 'maps/away_inf/tajsc/tajsciship.dmi'
	icon_state = "blackutility"
	item_state = "bl_suit"
	item_icons = list(
	    slot_w_uniform_str = 'maps/away_inf/tajsc/tajsciship.dmi'
	)
	item_state_slots = list(
		slot_w_uniform_str = "blackutility"
	)

/obj/item/weapon/gun/projectile/shotguntaj
	name = "TS-12E"
	desc = "TS-12E shotgun pistol designer for CCA EC. It has tremendous stopping power. This is the weapon of last chance."
	icon = 'maps/away_inf/tajsc/tajsciship.dmi'
	icon_state = "shotguntaj"

	item_icons = list(
		slot_l_hand_str = "revolverleft",
		slot_r_hand_str = "revolverright",
		)
	item_state = "gun"
	max_shells = 4
	force = 10
	w_class = ITEM_SIZE_NORMAL
	caliber = CALIBER_SHOTGUN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/shotguntaj/net
	allowed_magazines = /obj/item/ammo_magazine/shotguntaj
	ammo_type = /obj/item/ammo_casing/shotgun

/obj/item/weapon/gun/projectile/shotguntaj/special_check(user)
	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(H.species && H.species.get_bodytype(H) != SPECIES_TAJARA)
			to_chat(user, "<span class='warning'>\The [src] trigger because of the anatomical structure of your hand is not pressed!</span>")
			return 0
	return ..()

/obj/item/weapon/gun/projectile/shotguntaj/on_update_icon()
	if(ammo_magazine)
		icon_state = "shotguntaj"
	else
		icon_state = "shotguntaj_empty"

/obj/item/ammo_magazine/shotguntaj
	name = "magazine (12 gauge)"
	icon = 'maps/away_inf/tajsc/tajsciship.dmi'
	icon_state = "taj12"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_STEEL = 525)
	caliber = CALIBER_SHOTGUN
	max_ammo = 4

/obj/item/ammo_magazine/shotguntaj/empty
	icon_state = "taj12-0"
	initial_ammo = 0

/obj/item/ammo_magazine/shotguntaj/net
	name = "magazine (12 gauge) - net"
	icon = 'maps/away_inf/tajsc/tajsciship.dmi'
	icon_state = "taj12"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/shotgun/net
	matter = list(MATERIAL_STEEL = 525)
	caliber = CALIBER_SHOTGUN
	max_ammo = 4

/obj/structure/closet/crate/secure/tajquip
	name = "Ammunition crate"
	desc = "A secure weapons crate. It has a CCA mark on him."
	closet_appearance = /decl/closet_appearance/crate/secure/weapon
/obj/structure/closet/crate/secure/tajquip/prespawned/WillContain()
	return list(
		/obj/item/weapon/gun/projectile/shotguntaj = 1,
		/obj/item/ammo_magazine/shotguntaj = 3,
		/obj/item/weapon/gun/projectile/automatic/TV3 = 1,
		/obj/item/ammo_magazine/TV = 2,
		/obj/item/ammo_magazine/TVtcink = 2,
		/obj/item/clothing/suit/space/void/CCA_EC_AVS/prepared = 1,
		/obj/item/weapon/storage/backpack/satchel/grey = 1,
		/obj/item/weapon/storage/firstaid/individual/military = 1
	)

/obj/machinery/alarm/tajsciship/New()
	..()
	temperature = 278.15
	target_temperature = 278.15 //5C
	req_access = list(access_tajsciship)
	TLV["temperature"] =	list(T0C-30, T0C-15, T0C+15, T0C+30)

/obj/machinery/power/apc/taj
	cell_type = /obj/item/weapon/cell/high
	req_access = list(access_tajsciship)

/obj/item/toy/ringbell/tajalarm
	name = "Alarm terminal"
	desc = "Very suspicious red button. I really want to click on it."
	icon = 'maps/away_inf/tajsc/tajsciship.dmi'
	icon_state= "terminal"
	anchored = 1
	req_access = list(access_tajsciship)

/obj/item/toy/ringbell/tajalarm/attack_hand(mob/user as mob)
	if (user.a_intent == I_GRAB)
		user.visible_message("<span class='notice'>[user] press \the [src] orange button, signalling general gathering.</span>")
		playsound(user.loc, 'maps/away_inf/tajsc/sbortj.ogg', 40, extrarange=100)
	else if (user.a_intent == I_HURT)
		user.visible_message("<span class='warning'>[user] hit \the [src] red button, signalling an ALARM!!!</span>")
		playsound(user.loc, 'maps/away_inf/tajsc/tajalarm.ogg', 60, extrarange=100)

/obj/item/clothing/accessory/inf_pin/ccapin
	name = "CCA patch"
	desc = "A small patch, decorated with a CCA symbol pattern embroidered with titanium threads. It looks minimalistic, beautiful and strict. "
	icon = 'maps/away_inf/tajsc/tajsciship.dmi'
	icon_state = "ccapatch"