
/client
	var/list/hidden_atoms = list()
	var/list/hidden_mobs = list()

/datum/species
	var/standart_fov = FOV270

/obj/item/clothing
	var/change_fov = null

/mob/living/face_direction()
	. = ..()
	if(fixeye)
		fixeye.icon_state = facing_dir ? "fixeye_on" : "fixeye"

/mob/living
	var/l_turn_time = 0
	var/turn_delay = 4

// /mob/living/is_invisible_to(mob/living/viewer)
// 	return (src.InCone(viewer, viewer.dir) || ..())
