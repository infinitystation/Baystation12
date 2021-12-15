/datum/uplink_item/item/services/assault_declaration
	name = "Telecrystal Request"
	desc = "An telecrystal request, which will give you boost of 780 telecrystals, but their teleportation will be detected by sensor arrays of NSV Sierra. Can be bought obly in the five fist minutes of the round."
	item_cost = 1
	antag_roles = list(MODE_MERCENARY)

/datum/uplink_item/item/services/assault_declaration/get_goods(var/obj/item/device/uplink/U, var/loc)
	if(world.time > 10 MINUTES)
		U.visible_message("[U.loc] buzzez and declares, \"Unable to teleport telecrystals.\"")
		return 0
	command_announcement.Announce("В секторе была замечена телепортация большого объема телекристаллов, использующихся Горлекскими Мародерами. Рекомендуется вызвать поддержку с ЦК для урегулирования ситуации.", "Показания датчиков [station_name()]" , msg_sanitized = 1, zlevels = GLOB.using_map.station_levels)
	return new /obj/item/stack/telecrystal(loc, 781)
