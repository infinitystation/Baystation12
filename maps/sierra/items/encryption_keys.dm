/obj/item/device/encryptionkey/heads/sierra_captain
	name = "captain's encryption key"
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "Exploration" = 1)

/obj/item/device/encryptionkey/sierra_roboticist
	name = "roboticist's encryption key"
	icon_state = "eng_cypherkey"
	channels = list("Science" = 1, "Medical" = 1)

/obj/item/device/encryptionkey/sierra_quartermaster
	name = "quartermaster's encryption key"
	icon_state = "qm_cypherkey"
	channels = list("Supply" = 1, "Command" = 1)

/obj/item/device/encryptionkey/sierra_adjutant
	name = "adjutant's encryption key"
	icon_state = "com_cypherkey"
	channels = list("Command" = 1, "Engineering" = 1, "Exploration" = 1)

/obj/item/device/encryptionkey/heads/ai_integrated
	name = "ai integrated encryption key"
	desc = "Integrated encryption key."
	icon_state = "cap_cypherkey"
	channels = list("Command" = 1, "Security" = 1, "Engineering" = 1, "Science" = 1, "Medical" = 1, "Supply" = 1, "Service" = 1, "Exploration" = 1, "AI Private" = 1)

/obj/item/device/encryptionkey/sierra_exploration
	name = "exploration radio encryption key"
	icon_state = "srv_cypherkey"
	channels = list("Exploration" = 1)

/obj/item/device/encryptionkey/sierra_headset_pilot
	name = "pilot radio encryption key"
	icon_state = "srv_cypherkey"
	channels = list("Exploration" = 1, "Supply" = 1, "Science" = 1)

/obj/item/device/encryptionkey/sierra_headset_mining
	name = "prospector radio encryption key"
	icon_state = "srv_cypherkey"
	channels = list("Exploration" = 1, "Supply" = 1)

/obj/item/weapon/storage/box/encryptionkey/exploration
	name = "box of spare exploration radio keys"
	desc = "A box full of exploration department radio keys."
	startswith = list(/obj/item/weapon/screwdriver, /obj/item/device/encryptionkey/sierra_exploration = 5)

/obj/item/device/encryptionkey/sierra_el
	name = "exploration_leader's encryption key"
	icon_state = "com_cypherkey"
	channels = list("Exploration" = 1, "Command" = 1)

/obj/item/weapon/storage/box/radiokeys
	name = "box of radio encryption keys"
	desc = "A box full of assorted encryption keys."
	startswith = list(/obj/item/device/encryptionkey/headset_sec = 3,
					  /obj/item/device/encryptionkey/headset_med = 3,
					  /obj/item/device/encryptionkey/headset_cargo = 3)

/obj/item/weapon/storage/box/radiokeys/Initialize()
	. = ..()
	make_exact_fit()