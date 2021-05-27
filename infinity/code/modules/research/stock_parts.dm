/obj/item/storage/part_replacer
	var/remote_interaction = FALSE
	var/pshoom_or_beepboopblorpzingshadashwoosh = 'infinity/sound/items/rped.ogg'

/obj/item/storage/part_replacer/bluespace
	name = "bluespace rapid part exchange device"
	desc = "A version of the RPED that allows for replacement of parts and scanning from a distance, along with higher capacity for parts."
	icon = 'infinity/icons/obj/rped_bs.dmi'
	icon_state = "rped_bs"
	w_class = ITEM_SIZE_NORMAL
	storage_slots = 400
	max_w_class = 3
	max_storage_space = 200
	remote_interaction = TRUE
	pshoom_or_beepboopblorpzingshadashwoosh = 'infinity/sound/items/PSHOOM.ogg'

/obj/item/storage/part_replacer/proc/part_replacement_sound()
	//Plays the sound for RPED exhanging or installing parts.
	playsound(src, pshoom_or_beepboopblorpzingshadashwoosh, 40, 1)

/obj/item/storage/part_replacer/afterattack(obj/machinery/machine as obj, mob/living/carbon/human/user as mob, flag, params)
	if(flag) return
	if(istype(machine) && remote_interaction)
		if(machine.component_parts)
			machine.part_replacement(user, src)
			machine.display_parts(user)
			user.Beam(machine, icon_state = "rped_upgrade", icon = src.icon, time = 5)
