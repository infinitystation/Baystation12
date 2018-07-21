
	/////////
	//CARDS//
	/////////

/obj/item/weapon/card/id/patrol/marine
	desc = "An identification card issued to SolGov crewmembers aboard the Sol Patrol Craft."
	icon_state = "solgov"
	access = list(access_maint_tunnels, access_external_airlocks, access_emergency_storage,
	 access_solgov_crew, access_barracks)

/obj/item/weapon/card/id/patrol/marine/leader
	desc = "An identification card issued to SolGov crewmembers aboard the Sol Patrol Craft."
	icon_state = "solgov"
	access = list(access_maint_tunnels, access_external_airlocks, access_emergency_storage,
	 access_solgov_crew, access_barracks, access_troopsarm, access_heads, access_keycard_auth, access_albatross)

/obj/item/weapon/card/id/patrol/officer
	desc = "An identification card issued to SolGov crewmembers aboard the Sol Patrol Craft."
	icon_state = "solgov"
	access = list(access_security, access_medical, access_engine, access_maint_tunnels, access_emergency_storage,
			            access_heads, access_janitor, access_kitchen, access_cargo, access_RC_announce, access_keycard_auth,
			            access_solgov_crew, access_albatross)

/obj/item/weapon/card/id/patrol/captain
	desc = "An identification card issued to SolGov crewmembers aboard the Sol Patrol Craft."
	icon_state = "solgov"
	access = list(access_security, access_brig, access_armory,
			            access_medical, access_engine, access_maint_tunnels, access_external_airlocks,
			            access_heads, access_atmospherics, access_kitchen, access_network, access_surgery, access_RC_announce, access_keycard_auth, access_tcomsat,
			            access_solgov_crew, access_gun, access_albatross, access_barracks, access_troopsarm)

	//////////////
	//RADIOHEADS//
	//////////////

/obj/item/device/radio/headset/rescue
	name = "rescue team radio headset"
	desc = "The headset of the rescue team member."
	icon_state = "com_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/rescue

/obj/item/device/radio/headset/rescue/leader
	name = "rescue team leader radio headset"
	desc = "The headset of the rescue team member."
	icon_state = "com_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/rescue/leader

/obj/item/device/encryptionkey/rescue //for events
	name = "\improper rescue radio encryption key"
	icon_state = "cargo_cypherkey"
	channels = list("Response Team" = 1)

/obj/item/device/encryptionkey/rescue/leader
	name = "\improper rescue leader radio encryption key"
	channels = list("Response Team" = 1, "Command" = 1, )

	////////////
	//BACKPACK//
	////////////

/obj/item/weapon/storage/backpack/ert/medical/marine
	name = "marine corps medical backpack"
	desc = "A spacious backpack with lots of pockets, used by enlisted members of the SCG Marine Corps."
	startswith = list(
		/obj/item/weapon/storage/firstaid/brute,
		/obj/item/weapon/storage/firstaid/fire/special,
		/obj/item/weapon/storage/firstaid/combat/special,
		/obj/item/bodybag/cryobag = 3
		)

	/////////
	//MINOR//
	/////////

/obj/item/weapon/storage/belt/security/patrol/New()
	..()
	new /obj/item/weapon/gun/projectile/sec/lethal(src)
	new /obj/item/ammo_magazine/c45m(src)

/obj/item/clothing/accessory/storage/bandolier/patrol/New()
	..()

	for(var/i = 0, i < slots, i++)
		new /obj/item/ammo_casing/shotgun/pellet(hold)

/obj/item/clothing/suit/space/void/military/prepared/patrol
	starting_accessories = list(/obj/item/clothing/accessory/solgov/fleet_patch/fifth)
