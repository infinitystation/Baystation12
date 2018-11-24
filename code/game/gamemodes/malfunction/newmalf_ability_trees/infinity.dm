/* todo
/datum/malf_research_ability/passive/disable_dr
	ability = new /datum/game_mode/malfunction/verb/disable_dr()
	price = 1500
	name = "T2 - Remote Control Pulsation"

/datum/game_mode/malfunction/verb/disable_dr()
	set name = "Disable DRs"
	set desc = "Free - Send a specialised pulse to break all DR devices on the station."
	set category = "Software"
	var/price = 0
	var/mob/living/silicon/ai/user = usr
	if(!ability_prechecks(user, price, 1))
		return
	var/turf/T = get_turf(user)
	for(var/obj/item/device/remote_device/dr in GetConnectedZlevels(T.z))
		dr.disabled = TRUE
	to_chat(src, "<span class='notice'>DR-disabling pulse emitted.</span>")*/