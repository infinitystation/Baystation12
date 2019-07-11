/obj/item/weapon/storage/part_replacer
	var/works_from_distance = 0
	var/pshoom_or_beepboopblorpzingshadashwoosh = 'infinity/sound/items/rped.ogg'

/obj/item/weapon/storage/part_replacer/bluespace
	name = "bluespace rapid part exchange device"
	desc = "A version of the RPED that allows for replacement of parts and scanning from a distance, along with higher capacity for parts."
	icon = 'infinity/icons/obj/bluespace_rped.dmi'
	icon_state = "BS_RPED"
	w_class = ITEM_SIZE_NORMAL
	storage_slots = 400
	max_w_class = 3
	max_storage_space = 200
	works_from_distance = 1
	pshoom_or_beepboopblorpzingshadashwoosh = 'infinity/sound/items/PSHOOM.ogg'

/obj/item/weapon/storage/part_replacer/proc/play_rped_sound()
	//Plays the sound for RPED exhanging or installing parts.
	playsound(src, pshoom_or_beepboopblorpzingshadashwoosh, 40, 1)

/obj/item/weapon/storage/part_replacer/afterattack(obj/machinery/T as obj, mob/living/carbon/human/user as mob, flag, params)
	if(flag) return
	if(istype(T) && works_from_distance)
		if(T.component_parts)
			T.default_part_replacement(user, src)
			user.Beam(T, icon_state = "rped_upgrade", icon = src.icon, time = 5)
