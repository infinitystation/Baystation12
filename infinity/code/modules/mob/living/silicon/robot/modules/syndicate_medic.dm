/obj/item/weapon/robot_module/syndi_medical
	name = "combat medical robot module"
	display_name = "Combat Medical"
	hide_on_manifest = 1
	upgrade_locked = TRUE

	icon = 'infinity/icons/mob/robots.dmi'

	sprites = list(
		"Hover" = "synd_medical"
	)
	equipment = list(
		/obj/item/device/flash,
		/obj/item/weapon/crowbar/red,
		/obj/item/weapon/card/emag/cyborg,
		/obj/item/weapon/tank/jetpack/carbondioxide,
		/obj/item/weapon/pinpointer/nukeop,
		/obj/item/weapon/shockpaddles/robot/combat,
		/obj/item/borg/sight/hud/med,
		/obj/item/device/scanner/health,
		/obj/item/stack/nanopaste,
		/obj/item/stack/medical/advanced/bruise_pack,
		/obj/item/weapon/reagent_containers/dropper,
		/obj/item/weapon/scalpel/manager,
		/obj/item/weapon/hemostat,
		/obj/item/weapon/retractor,
		/obj/item/weapon/cautery,
		/obj/item/weapon/bonegel,
		/obj/item/weapon/FixOVein,
		/obj/item/weapon/bonesetter,
		/obj/item/weapon/circular_saw,
		/obj/item/weapon/surgicaldrill,
		/obj/item/weapon/gripper/organ,
		/obj/item/weapon/extinguisher/mini,
		/obj/item/weapon/reagent_containers/borghypo/combat
	)
	var/id

	synths = list(
		/datum/matter_synth/medicine = 10000,
	)

/obj/item/weapon/robot_module/syndi_medical/Initialize()
	for(var/decl/hierarchy/skill/skill in GLOB.skills)
		skills[skill.type] = SKILL_EXPERT
	. = ..()

/obj/item/weapon/robot_module/syndi_medical/build_equipment(var/mob/living/silicon/robot/R)
	. = ..()
	id = R.idcard
	equipment += id

/obj/item/weapon/robot_module/syndi_medical/finalize_equipment(var/mob/living/silicon/robot/R)
	var/obj/item/weapon/tank/jetpack/carbondioxide/jetpack = locate() in equipment
	R.internals = jetpack

	. = ..()

	for(var/thing in list(
		 /obj/item/stack/nanopaste,
		 /obj/item/stack/medical/advanced/bruise_pack
		))
		var/obj/item/stack/medical/stack = locate(thing) in equipment
		stack.uses_charge = 1
		stack.charge_costs = list(1000)


/obj/item/weapon/robot_module/syndi_medical/Destroy()
	equipment -= id
	id = null
	. = ..()

/obj/item/weapon/robot_module/syndi_medical/finalize_synths()
	. = ..()
	var/datum/matter_synth/medicine/medicine = locate() in synths
	for(var/thing in list(
		 /obj/item/stack/nanopaste,
		 /obj/item/stack/medical/advanced/bruise_pack
		))
		var/obj/item/stack/medical/stack = locate(thing) in equipment
		stack.synths = list(medicine)


//The borg


/mob/living/silicon/robot/mercenary/medical
	icon_state = "synd_medical"
	modtype = "Combat Medical"
	module = /obj/item/weapon/robot_module/syndi_medical

	speed = -1


//Equipment


/obj/item/weapon/shockpaddles/robot/combat
	name = "combat defibrillator paddles"
	desc = "A pair of advanced shockpaddles powered by a robot's internal power cell, able to penetrate thick clothing. This ones have no safeties"
	chargecost = 100
	combat = 1
	safety = 0
	icon_state = "defibpaddles0"
	item_state = "defibpaddles0"
	cooldowntime = (1.5 SECONDS)

/obj/item/weapon/reagent_containers/borghypo/combat
	reagent_ids = list(/datum/reagent/alkysine,
					   /datum/reagent/bicaridine,
					   /datum/reagent/dexalinp,
					   /datum/reagent/dermaline,
					   /datum/reagent/dylovene,
					   /datum/reagent/inaprovaline,
					   /datum/reagent/tramadol,
					   /datum/reagent/tricordrazine)
