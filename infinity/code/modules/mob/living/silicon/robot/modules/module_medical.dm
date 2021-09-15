/obj/item/robot_module/medical
	name = "medical robot module"
	channels = list(
		"Medical" = TRUE
	)
	networks = list(
		NETWORK_MEDICAL
	)
	subsystems = list(
		/datum/nano_module/crew_monitor,
		/datum/nano_module/records
	)
	can_be_pushed = 0

/obj/item/robot_module/medical/surgeon
	name = "surgeon robot module"
	display_name = "Surgeon"
	sprites = list(
		"Basic" = "Medbot",
		"Standard" = "surgeon",
		"Advanced Droid" = "droid-medical",
		"Needles" = "medicalrobot",
//cuz flying		"Ver 06" = "wer6-Surgeon" //inf
		)
	equipment = list(
		/obj/item/device/flash,
		/obj/item/device/scanner/health,
		/obj/item/reagent_containers/spray/cleaner/drone,
		/obj/item/reagent_containers/borghypo/surgeon,
		/obj/item/scalpel/manager,
		/obj/item/hemostat,
		/obj/item/retractor,
		/obj/item/cautery,
		/obj/item/bonegel,
		/obj/item/FixOVein,
		/obj/item/bonesetter,
		/obj/item/circular_saw,
		/obj/item/surgicaldrill,
		/obj/item/gripper/organ,
		/obj/item/shockpaddles/robot,
		/obj/item/reagent_containers/syringe,
		/obj/item/crowbar,
		/obj/item/stack/nanopaste,
		/obj/item/stack/medical/advanced/bruise_pack,
		/obj/item/reagent_containers/dropper
	)
	synths = list(
		/datum/matter_synth/medicine = 10000,
	)
	emag = /obj/item/reagent_containers/spray
	skills = list(
		SKILL_ANATOMY     = SKILL_PROF,
		SKILL_MEDICAL     = SKILL_PROF,
		SKILL_CHEMISTRY   = SKILL_ADEPT,
		SKILL_BUREAUCRACY = SKILL_ADEPT,
		SKILL_DEVICES     = SKILL_EXPERT
	)

/obj/item/robot_module/medical/crisis
	name = "crisis robot module"
	display_name = "Crisis"
	sprites = list(
		"Basic" = "Medbot",
		"Standard" = "surgeon",
		"Advanced Droid" = "droid-medical",
		"Needles" = "medicalrobot",
	)
	equipment = list(
		/obj/item/crowbar,
		/obj/item/device/flash,
		/obj/item/reagent_containers/spray/cleaner/drone,
		/obj/item/device/scanner/health,
		/obj/item/device/scanner/reagent/adv,
		/obj/item/robot_rack/body_bag,
		/obj/item/reagent_containers/borghypo/crisis,
		/obj/item/shockpaddles/robot,
		/obj/item/reagent_containers/dropper/industrial,
		/obj/item/reagent_containers/syringe,
		/obj/item/gripper/chemistry,
		/obj/item/extinguisher/mini,
		/obj/item/taperoll/medical,
		/obj/item/inflatable_dispenser/robot,
		/obj/item/stack/medical/ointment,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/splint
	)
	synths = list(
		/datum/matter_synth/medicine = 15000
	)
	emag = /obj/item/reagent_containers/spray
	skills = list(
		SKILL_ANATOMY     = SKILL_BASIC,
		SKILL_MEDICAL     = SKILL_PROF,
		SKILL_CHEMISTRY   = SKILL_ADEPT,
		SKILL_BUREAUCRACY = SKILL_ADEPT,
		SKILL_EVA         = SKILL_EXPERT
	)
