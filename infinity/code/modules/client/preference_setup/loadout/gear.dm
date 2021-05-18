/datum/gear
	var/price = 0
	var/required_donate_level = 0

/datum/category_item/player_setup_item/loadout/proc/gear_allowed_to_equip(datum/gear/G, mob/user)
	if(G && user?.client?.DonateData)
		return user.client.DonateData.CheckGear(G)
	return TRUE
