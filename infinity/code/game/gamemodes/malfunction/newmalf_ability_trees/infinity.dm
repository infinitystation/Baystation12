/datum/malf_research_ability/passive/disable_dr
	ability = new/datum/game_mode/malfunction/verb/disable_dr()
	price = 1000
	name = "T2 - Airlock Remote Control Pulsation"

/datum/game_mode/malfunction/verb/disable_dr()
	set name = "Disable DRs"
	set desc = "Free - Send a specialised pulse to break all DR devices on the station."
	set category = "Software"
	var/price = 500
	var/mob/living/silicon/ai/user = usr
	if(!ability_prechecks(user, price, 1))
		return
	for(var/obj/item/device/remote_device/dr in world)
		if(dr.disabled == 1)
			dr.disabled = FALSE
			to_chat(src, SPAN_NOTICE("DR was turned on again."))
		else
			dr.disabled = TRUE
			to_chat(src, SPAN_NOTICE("DR-disabling pulse emitted."))
