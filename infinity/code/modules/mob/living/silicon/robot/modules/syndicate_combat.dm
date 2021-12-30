/obj/item/robot_module/assault
	name = "assault robot module"
	display_name = "Assault"
	hide_on_manifest = 1
	upgrade_locked = TRUE

	no_slip = 1

	icon = 'infinity/icons/mob/robots.dmi'

	sprites = list(
		"Dread" = "synd_sec"
	)
	equipment = list(
		/obj/item/device/flash,
		/obj/item/melee/energy/sword,
		/obj/item/gun/energy/pulse_burster,
		/obj/item/crowbar/red,
		/obj/item/card/emag/cyborg,
		/obj/item/tank/jetpack/carbondioxide,
		/obj/item/gun/energy/l6_saw,
		/obj/item/pinpointer/nukeop
	)
	var/id

/obj/item/robot_module/assault/Initialize()
	for(var/decl/hierarchy/skill/skill in GLOB.skills)
		skills[skill.type] = SKILL_EXPERT
	. = ..()

/obj/item/robot_module/assault/build_equipment(var/mob/living/silicon/robot/R)
	. = ..()
	id = R.idcard
	equipment += id

/obj/item/robot_module/assault/finalize_equipment(var/mob/living/silicon/robot/R)
	var/obj/item/tank/jetpack/carbondioxide/jetpack = locate() in equipment
	R.internals = jetpack
	. = ..()

/obj/item/robot_module/assault/Destroy()
	equipment -= id
	id = null
	. = ..()


//The borg


/mob/living/silicon/robot/mercenary
	lawupdate = 0
	scrambledcodes = 1
	icon = 'infinity/icons/mob/robots.dmi'
	icon_state = "synd_sec"
	modtype = "Assault"
	lawchannel = "State"
	laws = /datum/ai_laws/syndicate_override
	idcard = /obj/item/card/id/syndicate
	module = /obj/item/robot_module/assault
	silicon_radio = /obj/item/device/radio/borg/syndicate
	spawn_sound = 'sound/mecha/nominalsyndi.ogg'
	cell = /obj/item/cell/super
	pitch_toggle = 0

/mob/living/silicon/robot/mercenary
	silicon_subsystems = list(
		/datum/nano_module/law_manager,
		/datum/nano_module/email_client
	)

/mob/living/silicon/robot/mercenary/get_alarm_cameras()
	return list()


//Equipment


/obj/item/gun/energy/pulse_burster
	name = "burst pulse pistol"
	desc = "A modified pulse pistol, capable of shooting short bursts of pulses. This one is cyborg-mounted."
	icon = 'icons/obj/guns/pulse_pistol.dmi'
	icon_state = "pulse_pistol"
	force = 6
	projectile_type = /obj/item/projectile/beam/pulse
	burst = 3
	max_shots = 21
	burst_delay = 1.5
	wielded_item_state = null

	bulk = GUN_BULK_PISTOL
	w_class = ITEM_SIZE_NORMAL
	one_hand_penalty = 0

	self_recharge = 1
	use_external_power = 1
	has_safety = FALSE

	charge_cost = 40

/obj/item/gun/energy/l6_saw
	name = "L6 machine gun"
	desc = "A rather traditionally made L6 SAW with a pleasantly lacquered wooden pistol grip. This one is modified to make ammo out of internal cell."
	icon = 'icons/obj/guns/saw.dmi'
	icon_state = "l6closed50"
	w_class = ITEM_SIZE_HUGE
	bulk = GUN_BULK_MACHINEGUN
	force = 10
	one_hand_penalty = 0

	projectile_type = /obj/item/projectile/bullet/pistol/medium/fast //Balance...

	firemodes = list(
		list(mode_name="short bursts",	can_autofire=0, burst=5, fire_delay=5, move_delay=12, one_hand_penalty=0, burst_accuracy = list(0,-1,-1,-2,-2),          dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="long bursts",	can_autofire=0, burst=8, fire_delay=5, one_hand_penalty=0, burst_accuracy = list(0,-1,-1,-2,-2,-2,-3,-3), dispersion = list(1.0, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="full auto",		can_autofire=1, burst=1, fire_delay=1, one_hand_penalty=0, burst_accuracy = list(0,-1,-1,-2,-2,-2,-3,-3), dispersion = list(1.0, 1.0, 1.0, 1.0, 1.2)),
		)

	self_recharge = 1
	use_external_power = 1
	has_safety = FALSE

	charge_meter = 0

	charge_cost = 80 //This shit is ROBUST

/obj/item/card/emag/cyborg/proc/get_external_power_supply()
	if(isrobot(loc) || istype(loc, /obj/item/rig_module) || istype(loc, /obj/item/mech_equipment))
		return loc.get_cell()

/obj/item/card/emag/cyborg/resolve_attackby(atom/A, mob/user)
	var/obj/item/cell/external = get_external_power_supply()

	if(external.charge < 250)
		to_chat(user, "<span class='warning'>System Error: Not enough power.</span>")
		return 0

	. = ..()

	if(.)
		uses = 10
		external.use(250) //Take power from the borg...
