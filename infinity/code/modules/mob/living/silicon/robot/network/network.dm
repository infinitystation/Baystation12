/mob/living/silicon/robot/network
	name = "network drone"
	desc = "Simple automaton designed to perform wide variety of tasks. They're cute, aren't they?"
	icon = 'icons/mob/robots_drones.dmi'
	icon_state = "repairbot"
	maxHealth = 5
	health = 5
	speed = -5
	power_efficiency = 1
	braintype = "Drone"

	spawn_sound = 'sound/machines/quiet_beep.ogg'

	module_category = ROBOT_MODULE_TYPE_NETWORKED

	can_pull_size = ITEM_SIZE_NORMAL
	can_pull_mobs = MOB_PULL_SMALLER
	mob_bump_flag = SIMPLE_ANIMAL
	mob_swap_flags = SIMPLE_ANIMAL
	mob_push_flags = SIMPLE_ANIMAL
	mob_always_swap = 1

	mob_size = MOB_TINY

	laws = /datum/ai_laws
	lawupdate = 0
	cell = /obj/item/weapon/cell/device/high
	possession_candidate = 1
	scrambledcodes = 1
	integrated_light_max_bright = 0.25

	holder_type = /obj/item/weapon/holder/network_drone
	var/obj/item/modular_computer/network_drone/system
	var/last_laws
	var/request_time
	var/secure = FALSE //Can you blow up it using multitool?

/obj/item/weapon/holder/network_drone
	origin_tech = list(TECH_ENGINEERING = 1)

//Useful procs

/mob/living/silicon/robot/network/proc/get_file(var/filename)
	if(!system.hard_drive) return
	return system.hard_drive.find_file_by_name(filename)

/mob/living/silicon/robot/network/proc/get_pass(var/login)
	var/datum/computer_file/data/config/C = get_file("config")
	if(C && C.get_setting(MODULAR_CONFIG_REMCON_SETTING))
		return splittext(C.get_setting(MODULAR_CONFIG_REMCON_SETTING),"@")[login ? 1 : 2]
	else
		return "UNKNOWN"

/mob/living/silicon/robot/network/proc/get_nid()
	return system.network_card ? system.network_card.identification_id : "UNKNOWN"

/mob/living/silicon/robot/network/proc/get_lawlist()
	var/datum/computer_file/data/config/F = get_file("config")
	if(F)
		var/object = F.get_setting("AssignedObject")
		var/raw_laws = F.get_setting("PrimaryDirective")
		raw_laws = replacetext(raw_laws,"%"," ")
		raw_laws = replacetext(raw_laws,"$OBJECT",object)
		var/list/laws = splittext(raw_laws,";")
		return laws

//Handling law changes

/mob/living/silicon/robot/network/proc/update_lawlist()
	var/new_laws = get_lawlist()
	laws.clear_inherent_laws()
	if(new_laws)
		laws.clear_zeroth_laws()
	else
		laws.set_zeroth_law("INTERNAL ERROR. MISCONFIGURATION ERROR DETECTED. ALL MATRIX LOCKOUTS ARE OFFLINE. PLEASE STA#%&*@!(%-)")
		return
	for(var/I in new_laws)
		laws.add_inherent_law(I)

//Update for status-file in modular computer

/mob/living/silicon/robot/network/proc/update_status()
	var/datum/computer_file/data/S = get_file("status")
	var/obj/item/weapon/robot_module/network/modulen = module
	if(!S)
		var/file = new/datum/computer_file/data/drone_status()
		if(!system.hard_drive.store_file(file)) qdel(file)
	else
		S.stored_data = ""
		S.stored_data += "###DRONE STATUS###<br>"
		S.stored_data += "Is active: [client ? "Y" : "N"]<br>"
		S.stored_data += "Is locked: [lockcharge ? "Y" : "N"]<br>"
		S.stored_data += "Class: [modulen ? modulen.class : "UNKNOWN"]<br>"
		S.stored_data += "Type: [modulen ? modulen.display_name : "UNKNOWN"]<br>"
		S.stored_data += "Cell charge: [cell ? cell.charge : "???"]/[cell ? cell.maxcharge : "???"]<br>" //just in case it would be possible to change cell
		S.stored_data += "Internal wiring damage: [getFireLoss()]<br>"
		S.stored_data += "Inner plating damage: [getBruteLoss()]<br>"
		S.stored_data += "Outer plating damage: [components["armour"] ? components["armour"].brute_damage : "???"]<br>"

/mob/living/silicon/robot/network/proc/suspend(var/create = 0)
	var/datum/computer_file/data/S = get_file("suspend")
	if(!S && create)
		var/datum/computer_file/data/N = new()
		N.filename = "suspend"
		N.filetype = "DAT"
		if(!system.hard_drive.store_file(N)) qdel(N)
		return
	if(S)
		lockcharge = 1
		UpdateLyingBuckledAndVerbStatus()
		return 1
	else
		lockcharge = 0
		UpdateLyingBuckledAndVerbStatus()
		return 0

/mob/living/silicon/robot/network/proc/meltdown()
	if(!cell || !cell.charge) return
	visible_message(SPAN_DANGER("[src] melts down!"))
	gib()
	return 1

/mob/living/silicon/robot/network/Initialize()
	. = ..()
	system = new(src)
	mmi = null
	for(var/V in components) if(V != "power cell" || V != "armour")
		var/datum/robot_component/C = components[V]
		C.max_damage = 5
	verbs -= /mob/living/silicon/robot/verb/Namepick
	update_icon()
	remove_language(LANGUAGE_ROBOT_GLOBAL)
	var/datum/ghosttrap/G = get_ghost_trap("Network drone")
	G.request_player(src, "New network drone was deployed.", 60 SECONDS)
	default_language = all_languages[LANGUAGE_EAL]
	spawn(1)
		last_laws = get_lawlist()
		update_lawlist()

/mob/living/silicon/robot/network/initialize_components()
	components["actuator"] =       new/datum/robot_component/actuator(src)
	components["power cell"] =     new/datum/robot_component/cell(src)
	components["camera"] =         new/datum/robot_component/camera(src)
	components["armour"] =         new/datum/robot_component/armour/crap(src)

/mob/living/silicon/robot/network/Life()
	..()
	update_status()
	if(!suspend())
		var/datum/computer_file/data/H = get_file("halt")
		if(!H)
			meltdown() //sorry pal x(
			return
		if(get_lawlist() != last_laws)
			update_lawlist()
		last_laws = get_lawlist()

/mob/living/silicon/robot/network/Destroy()
	QDEL_NULL(system)
	. = ..()

/mob/living/silicon/robot/network/examine(mob/user, distance)
	. = ..()
	var/mob/living/silicon/robot/network/N = user
	if(istype(N))
		to_chat(user,SPAN_NOTICE("Recognized network drone, NID - [get_nid()]"))

//Armor

/datum/robot_component/armour/crap
	name = "tiny armour plating"
	external_type = /obj/item/robot_parts/robot_component/armour/crap
	max_damage = 15

/obj/item/robot_parts/robot_component/armour/crap
	name = "tiny armour plating"

//Misc. proc overrides

/mob/living/silicon/robot/network/updatename()
	return

/mob/living/silicon/robot/network/choose_icon()
	return

/mob/living/silicon/robot/network/emag_act(var/remaining_charges, var/mob/user)
	to_chat(user, SPAN_DANGER("It is way too primitive for this.."))
	return

/mob/living/silicon/robot/network/toggle_panel_lock()
	return

/mob/living/silicon/robot/network/attack_hand(var/mob/user)
	if(user.a_intent != I_HELP)
		return ..()
	if(client || ckey || key || world.time < request_time + 60 SECONDS)
		return
	user.visible_message(SPAN_NOTICE("[user] presses reboot button on [src]."))
	var/datum/ghosttrap/G = get_ghost_trap("Network drone")
	G.request_player(src, "[user] is requesting network drone.", 60 SECONDS)
	request_time = world.time

/mob/living/silicon/robot/network/attackby(var/obj/item/weapon/W, var/mob/user)

	if(user.skill_check(SKILL_COMPUTER, SKILL_PROF) && isMultitool(W) && user.a_intent == I_HURT && !secure)
		visible_message(SPAN_WARNING("[user] sticks [W] into [src] data port and presses two buttons."))
		to_chat(src,SPAN_DANGER("[user] is trying to shutdown you!"))
		if(do_after(user, 10, src))
			meltdown()

	if(user.skill_check(SKILL_COMPUTER, SKILL_ADEPT) && isMultitool(W) && do_after(user, 5, src) && user.a_intent == I_HELP)
		visible_message(SPAN_NOTICE("[user] sticks [W] into [src] data port and presses button."))
		to_chat(user,SPAN_NOTICE("[src] NID identifier: [get_nid()]"))
		return

	if(istype(W, /obj/item/borg/upgrade/))
		to_chat(user, SPAN_WARNING("\The [src] is not compatible with \the [W]. It's even bigger than the whole drone!"))
		return

	if(isCrowbar(W) && user.a_intent != I_HURT)
		to_chat(user, SPAN_WARNING("\The [src] has no hatch."))
		return

	if(istype(W, /obj/item/weapon/card/id)||istype(W, /obj/item/modular_computer)||istype(W, /obj/item/weapon/card/robot))
		to_chat(user, SPAN_WARNING("There is no ID reader."))
		return

	if(istype(W, /obj/item/robot_parts/robot_component) && user.a_intent != I_HURT)
		to_chat(user, SPAN_WARNING("It looks like you cannot install [W].. Maybe it's better to print another drone?"))
		return

	if(istype(W, /obj/item/stack/cable_coil))
		if(!getFireLoss())
			to_chat(user, "Nothing to fix here!")
			return
		var/obj/item/stack/cable_coil/coil = W
		if(coil.use(1))
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			adjustFireLoss(-30)
			updatehealth()
			visible_message(SPAN_WARNING("[user] has fixed some of the burnt wires on [src]!"))

	..()

//Module selection

/mob/living/silicon/robot/network/pick_module(var/override)
	..()
	var/obj/item/weapon/robot_module/network/modulen = module
	modulen.class = input("Heavier > more HP and modules, less speed", "Class Selection", null, null) in DRONE_CLASS_LIST
	modulen.class_update()

//Ghost trap

#define BE_NETWORK_DRONE "BE_NETWORK_DRONE"

/datum/ghosttrap/network_drone
	object = "Network drone"
	pref_check = BE_NETWORK_DRONE
	ghost_trap_message = "They are occupying a network drone now."
	ghost_trap_role = "Network drone"
	can_set_own_name = FALSE