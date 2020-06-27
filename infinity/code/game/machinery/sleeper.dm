//Survival/Stasis sleepers
/obj/machinery/sleeper/survival_pod
	name = "stasis pod"
	desc = "A comfortable pod for stasing of wounded occupants. Similar pods were on first humanity's colonial ships. Now days, you can see them in EMT centers with stasis setting from 20x to 22x."
	icon = 'infinity/icons/obj/Cryogenic2.dmi'
	icon_state = "stasis_0"
	stasis = 20
	active_power_usage = 55000

/obj/machinery/sleeper/survival_pod/ui_interact(var/mob/user, var/ui_key = "main", var/datum/nanoui/ui = null, var/force_open = 1, var/datum/topic_state/state = GLOB.outside_state)
	var/data[0]

	data["power"] = stat & (NOPOWER|BROKEN) ? 0 : 1

	if(occupant)
		var/scan = user.skill_check(SKILL_MEDICAL, SKILL_ADEPT) ? medical_scan_results(occupant) : "<span class='white'><b>Contains: \the [occupant]</b></span>"
		scan = replacetext(scan,"'scan_notice'","'white'")
		scan = replacetext(scan,"'scan_warning'","'average'")
		scan = replacetext(scan,"'scan_danger'","'bad'")
		data["occupant"] = scan
	else
		data["occupant"] = 0

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "stasis.tmpl", "Stasis Pod UI", 400, 300, state = state)
		ui.set_initial_data(data)
		ui.open()
