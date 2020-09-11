#define ROBOT_MODULE_TYPE_NETWORKED "networked drone"
#define DRONE_CLASS_LIGHT "lightweight"
#define DRONE_CLASS_MEDIUM "medium"
#define DRONE_CLASS_HEAVY "heavy"
#define DRONE_CLASS_LIST list(DRONE_CLASS_LIGHT, DRONE_CLASS_MEDIUM, DRONE_CLASS_HEAVY)

/obj/item/weapon/robot_module/network
	name = "standard network module"
	display_name = "standard networked module"
	hide_on_manifest = 1
	no_slip = 1
	module_category = ROBOT_MODULE_TYPE_NETWORKED
	var/class = null //Class of drone, affects modules & other variables.
	var/list/base_equipment = list(/obj/item/weapon/crowbar) //Added to all modules after spawn.
	var/medium_eq = list() //Medium version equipment        <==
	var/heavy_eq = list() //Heavy version equipment, also adds ^
	var/class_restrict = null //If set, will force module to use this class only.

/obj/item/weapon/robot_module/network/Initialize()
	equipment += base_equipment
	..()

/obj/item/weapon/robot_module/network/proc/class_update()
	var/mob/living/silicon/robot/network/R = loc
	if(class_restrict)
		class = class_restrict
		to_chat(R,SPAN_NOTICE("Unfortunately, this module is restricted to [class] class."))
	if(class == DRONE_CLASS_HEAVY)
		equipment += medium_eq
		equipment += heavy_eq
		R.speed = 0
		R.icon_state = "constructiondrone"
		R.health *= 4
		R.secure = TRUE
		R.cell.maxcharge = 500
		//You can identify it, can't you?
		R.name = "heavy " + initial(R.name)
	if(class == DRONE_CLASS_MEDIUM)
		equipment += medium_eq
		R.speed = -1
		R.health *= 2
		R.cell.maxcharge = 250
	R.recalculate_synth_capacities()
	build_equipment(1)
	finalize_equipment()

/obj/item/weapon/robot_module/network/build_equipment(var/update)
	if(update)
		return ..()
	return

/obj/item/weapon/gripper/sheets
	name = "sheet grasping device"
	desc = "A small arm that allows drones grab and use material sheets."
	icon_state = "gripper-sheet"
	can_hold = list(
		/obj/item/stack/material
		)

/obj/item/weapon/robot_module/network/mechanical
	name = "mechanical maintenance"
	display_name = "mechanical maintenance"
	skills = list(SKILL_CONSTRUCTION = SKILL_PROF)
	equipment = list(/obj/item/weapon/weldingtool,/obj/item/borg/sight/meson)
	medium_eq = list(/obj/item/weapon/wrench,/obj/item/weapon/screwdriver,/obj/item/weapon/wirecutters,/obj/item/weapon/gripper/sheets,/obj/item/weapon/gripper)
	heavy_eq = list(/obj/item/device/floor_painter,/obj/item/device/t_scanner)

/obj/item/weapon/robot_module/network/electrical
	name = "electrical maintenance"
	display_name = "electrical maintenance"
	skills = list(SKILL_ELECTRICAL   = SKILL_PROF)
	equipment = list(/obj/item/stack/cable_coil/cyborg,/obj/item/weapon/wirecutters)
	medium_eq = list(/obj/item/weapon/screwdriver,/obj/item/device/multitool,/obj/item/weapon/gripper)
	heavy_eq = list(/obj/item/device/t_scanner)
	synths = list(/datum/matter_synth/wire = 60)

/obj/item/weapon/robot_module/network/electrical/finalize_synths()
	var/datum/matter_synth/wire/wire = locate() in synths
	var/obj/item/stack/cable_coil/cyborg/C = locate() in equipment
	C.synths = list(wire)

/obj/item/weapon/robot_module/network/complex
	name = "complex machines handling"
	display_name = "complex machines handling"
	class_restrict = DRONE_CLASS_MEDIUM
	skills = list(SKILL_DEVICES = SKILL_PROF, SKILL_COMPUTER = SKILL_PROF)
	equipment = list(/obj/item/weapon/gripper/sheets,/obj/item/weapon/gripper,/obj/item/weapon/screwdriver,/obj/item/weapon/wrench)

/obj/item/weapon/robot_module/network/atmospherics
	name = "atmospheric maintenance"
	display_name = "atmospheric maintenance"
	skills = list(SKILL_ATMOS = SKILL_PROF, SKILL_CONSTRUCTION = SKILL_ADEPT)
	equipment = list(/obj/item/weapon/wrench,/obj/item/device/t_scanner,/obj/item/device/scanner/gas)
	medium_eq = list(/obj/item/weapon/inflatable_dispenser/robot,/obj/item/device/plunger/robot,/obj/item/device/geiger)
	heavy_eq = list(/obj/item/weapon/weldingtool,/obj/item/weapon/rpd)

/obj/item/weapon/robot_module/network/fire
	name = "firefighting"
	display_name = "firefighting"
	class_restrict = DRONE_CLASS_LIGHT
	skills = list(SKILL_ATMOS = SKILL_PROF, SKILL_CONSTRUCTION = SKILL_ADEPT)
	equipment = list(/obj/item/weapon/extinguisher,/obj/item/weapon/inflatable_dispenser/robot,/obj/item/device/scanner/gas)

/obj/item/weapon/robot_module/network/diag
	name = "diagnostics"
	display_name = "diagnostics"
	class_restrict = DRONE_CLASS_LIGHT
	equipment = list(/obj/item/device/scanner/gas,/obj/item/device/t_scanner,/obj/item/device/multitool,/obj/item/taperoll/engineering,/obj/item/taperoll/atmos,/obj/item/borg/sight/meson)

/obj/item/weapon/robot_module/network/military
	name = "malfunction handling"
	display_name = "malfunction handling"
	equipment = list(/obj/item/device/multitool,/obj/item/device/flash) //Multitool is given to blow up bots (see network.dm)
	medium_eq = list(/obj/item/weapon/gun/energy/taser/mounted/cyborg)
	skills = list(SKILL_COMPUTER = SKILL_PROF, SKILL_WEAPONS = SKILL_PROF)

/obj/item/weapon/robot_module/network/database
	name = "database interconnection"
	display_name = "database interconnection"
	class_restrict = DRONE_CLASS_LIGHT
	skills = list(
		SKILL_EVA = SKILL_PROF,
		SKILL_PILOT = SKILL_PROF,
		SKILL_COMPUTER = SKILL_PROF,
		SKILL_BOTANY = SKILL_PROF,
		SKILL_COOKING = SKILL_PROF,
		SKILL_CONSTRUCTION = SKILL_PROF,
		SKILL_ATMOS = SKILL_PROF,
		SKILL_ELECTRICAL = SKILL_PROF,
		SKILL_ENGINES = SKILL_PROF,
		SKILL_ANATOMY = SKILL_PROF,
		SKILL_MEDICAL = SKILL_PROF,
		SKILL_CHEMISTRY = SKILL_PROF
	)