/obj/item/weapon/stock_parts/circuitboard/telecomms/allinone/tajsciship
	build_path = /obj/machinery/telecomms/allinone/tajsciship

/obj/machinery/telecomms/allinone/tajsciship
	listening_freqs = list(TAJSCISHIP_FREQ)
	channel_color = COMMS_COLOR_ENTERTAIN
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

/obj/item/clothing/under/tajsciship
	name = "CCA EC uniform"
	desc = "A comfortable for tajara turtleneck and black utility trousers."
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

/obj/machinery/power/apc/tajaran
	cell_type = /obj/item/weapon/cell/crap
	req_access = list(access_tajsciship)

/obj/machinery/power/smes/buildable/preset/tajsciship/configure_and_install_coils()
	component_parts += new /obj/item/weapon/stock_parts/smes_coil(src)
	component_parts += new /obj/item/weapon/stock_parts/smes_coil(src)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE

/obj/machinery/power/smes/buildable/preset/tajsciship/substation/configure_and_install_coils()
	component_parts += new /obj/item/weapon/stock_parts/smes_coil/weak(src)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE

/turf/simulated/wall/r_wall/hull/tajsciship
	color = COLOR_SUN

/obj/structure/wall_frame/hull/tajsciship
	paint_color = COLOR_SUN

/obj/effect/wallframe_spawn/reinforced/hull/tajsciship
	frame_path = /obj/structure/wall_frame/hull/tajsciship
