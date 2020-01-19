obj/structure/battle_data_server
	name = "battle data server"
	desc = "Impact resistant server rack holding data of battles of the past of (MAPNAME). You might be able to pry a disk out."
	icon = 'icons/obj/machines/research.dmi'
	icon_state = "server"
	var/disk_looted
	var/obj/item/weapon/stock_parts/computer/hard_drive/cluster/drive

/obj/structure/battle_data_server/Initialize()
	. = ..()
	desc = replacetext(desc, "(MAPNAME)", GLOB.using_map.full_name)
	drive = new(src)
	drive.origin_tech = list(TECH_COMBAT = rand(2,5))
	var/newdata
	var/i = 0
	while(i < 100)
		var/list/L = list()
		for(var/a in 1 to 6)
			L += rand(100000, 999999)
		newdata += "[L.Join(" ")]"
		i+=1
	var/datum/computer_file/data/file = new/datum/computer_file/data{filename = "ships_battle_statistic";filetype = "DAT"; read_only = 1; undeletable = 1;}()
	file.stored_data = newdata
	drive.store_file()

/obj/structure/battle_data_server/examine(mob/user)
	. = ..()
	if(drive) to_chat(user, "It seems, that \the [src] have [drive] with battle data in.")

obj/structure/battle_data_server/attackby(obj/item/W, mob/user, var/click_params)
	. = ..()
	if(isCrowbar(W) && !disk_looted)
		to_chat(user, SPAN_NOTICE("You pry out \the [drive] from \the [src]."))
		playsound(loc, 'sound/items/Crowbar.ogg', 50, 1)
		drive.dropInto(get_turf(src))
		disk_looted = 1