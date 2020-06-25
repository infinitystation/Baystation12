
/obj/item/weapon/stock_parts/circuitboard/telecomms/allinone/tajsciship
	build_path = /obj/machinery/telecomms/allinone/tajsciship

/obj/machinery/telecomms/allinone/tajsciship
	listening_freqs = list(TAJSCISHIP_FREQ)
	channel_color = COMMS_COLOR_SYNDICATE
	channel_name = "CCA EC"
	circuitboard = /obj/item/weapon/stock_parts/circuitboard/telecomms/allinone/tajsciship

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

/obj/item/clothing/under/tajsciship/ccaecjumpsuit
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

/obj/structure/closet/crate/secure/tajquip
	name = "Ammunition crate"
	desc = "A secure weapons crate. It has a CCA mark on him."
	closet_appearance = /decl/closet_appearance/crate/secure/weapon
/obj/structure/closet/crate/secure/tajquip/prespawned/WillContain()
	return list(
		/obj/item/weapon/gun/projectile/shotgun/shotguntaj = 1,
		/obj/item/ammo_magazine/shotguntaj = 3,
		/obj/item/weapon/gun/projectile/automatic/tv3 = 1,
		/obj/item/ammo_magazine/tv = 3,
		/obj/item/ammo_magazine/tvtcink = 2,
		/obj/item/clothing/suit/space/void/avs/prepared = 1,
		/obj/item/weapon/storage/backpack/satchel/grey = 1,
		/obj/item/weapon/storage/firstaid/individual/military = 1
	)

/obj/machinery/alarm/tajsciship/New()
	..()
	temperature = 278.15
	target_temperature = 278.15 //5C
	req_access = list(access_tajsciship)
	TLV["temperature"] =	list(T0C-30, T0C-15, T0C+15, T0C+30)

/obj/machinery/power/apc/shuttle/tajaran
	cell_type = /obj/item/weapon/cell/high
	req_access = list(access_tajsciship)
