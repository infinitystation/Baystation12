/obj/structure/battle_data_server
	name = "battle data server"
	desc = "Impact resistant server rack holding data of battles of the past of (MAPNAME). You might be able to pry a disk out."
	icon = 'icons/obj/machines/research.dmi'
	icon_state = "server"
	var/disk_looted
	var/obj/item/stock_parts/computer/hard_drive/cluster/drive
	density = TRUE

/obj/structure/battle_data_server/Initialize()
	. = ..()
	desc = replacetext(desc, "(MAPNAME)", GLOB.using_map.full_name)
	drive = new(src)
	drive.origin_tech = list(TECH_COMBAT = rand(2,5))

	var/datum/computer_file/file = new/datum/computer_file{filename = "ships_battle_statistic";filetype = "BDT"; undeletable = 1; unsendable = 1;}()
	file.size = rand(1400, 1900)
	drive.store_file(file)

/obj/structure/battle_data_server/examine(mob/user)
	. = ..()
	if(drive) to_chat(user, "It seems, that \the [src] have [drive] with battle data in.")

/obj/structure/battle_data_server/attackby(obj/item/W, mob/user, var/click_params)
	. = ..()
	if(isCrowbar(W) && !disk_looted)
		to_chat(user, SPAN_NOTICE("You pry out \the [drive] from \the [src]."))
		playsound(loc, 'sound/items/Crowbar.ogg', 50, 1)
		drive.dropInto(get_turf(src))
		disk_looted = 1
