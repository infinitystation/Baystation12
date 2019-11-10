/obj/item/weapon/robot_module/standard
	name = "standard robot module"
	display_name = "Standard"
	sprites = list(
		"Basic" = "robot_old",
		"Android" = "droid",
		"Default" = "robot",
		"Drone" = "drone-standard",
		"Doot" = "eyebot-standard",
		"Ver 06" = "wer6-Standard",
		"Motile" = "motile"
	)
	equipment = list(
		/obj/item/device/flash,
		/obj/item/weapon/melee/baton/loaded,
		/obj/item/weapon/extinguisher,
		/obj/item/weapon/wrench,
		/obj/item/weapon/crowbar,
		/obj/item/device/scanner/health
	)
//	emag = /obj/item/weapon/melee/energy/sword //rly? this borgie already has stunbaton & flash, i think it's enough
	skills = list(
		SKILL_COMBAT       = SKILL_ADEPT,
		SKILL_MEDICAL      = SKILL_ADEPT,
		SKILL_CONSTRUCTION = SKILL_ADEPT,
		SKILL_BUREAUCRACY  = SKILL_ADEPT,
		SKILL_PILOT        = SKILL_ADEPT //INF
	)
