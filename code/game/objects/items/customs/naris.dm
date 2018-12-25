/obj/item/naris_box
	name = "E.P.D #NARIS"
	desc = "..."
	icon = 'icons/obj/infinity_items/naris.dmi'
	icon_state = "naris_box"

/obj/item/naris_box/New()
		pixel_x = 0
		pixel_y = 0
		pixel_z = 0

/obj/item/naris_box/attack_self(mob/user)
	if (is_processing || !user)
		return
	is_processing = 1	
	user.visible_message("<span class='notice'>[user] began setting Naris.</span>")
	if (do_after(user, 100, src))
		user.unEquip(src)
		new /obj/naris_struct(user.loc)
		qdel(src)
	else 
		is_processing = 0

/obj/naris_struct
	name = "E.P.D #NARIS"
	desc = "..."
	icon = 'icons/obj/infinity_items/naris.dmi'
	icon_state = "naris_struct"	

	anchored = 0
	density = 1

	var/list/valid_ckeys = list(
		"redknighthero",
		"nikita588",
		"nicknam",
		"iskorkinmrazb",
		"cre77"
		)

/obj/naris_struct/attack_ghost(mob/user)
	if (!(user.ckey in valid_ckeys))
		return
	var/turf/T = loc
	qdel(src)
	var/mob/living/silicon/robot/custom/naris/N = new /mob/living/silicon/robot/custom/naris(T)
	message_admins("<span class='adminnotice'>[user.ckey] has joined as Naris.</span>")
	log_admin("[user.ckey] has joined as Naris..")
	N.ckey = user.ckey
	qdel(user)