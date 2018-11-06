/obj/item/modular_computer/laptop
	name = "laptop computer"
	desc = "A portable clamshell computer."
	icon = 'icons/obj/modular_laptop_inf.dmi'
	icon_state = "laptop-open"
	icon_state_unpowered = "laptop-open"
	var/icon_state_closed = "laptop-closed"
	anchored = 0
	w_class = ITEM_SIZE_NORMAL
	base_idle_power_usage = 5
	base_active_power_usage = 50
	light_strength = 3
	max_damage = 200
	broken_damage = 100
	max_hardware_size = 2
	hardware_flag = PROGRAM_LAPTOP

/obj/item/modular_computer/laptop/CouldUseTopic(var/mob/user)
	..()
	if(istype(user, /mob/living/carbon))
		if(prob(50))
			playsound(src, "keyboard", 20)
		else
			playsound(src, "keystroke", 20)

/obj/item/modular_computer/laptop/AltClick(var/mob/user)
// Prevents carrying of open laptops inhand.
// While they work inhand, i feel it'd make tablets lose some of their high-mobility advantage they have over laptops now.
	if(!CanPhysicallyInteract(user))
		return
	if(!istype(loc, /turf/))
		to_chat(usr, "\The [src] has to be on a stable surface first!")
		return
	anchored = !anchored
	screen_on = anchored
	update_icon()

/obj/item/modular_computer/laptop/on_update_icon()
	if(anchored)
		..()
	else
		overlays.Cut()
		icon_state = icon_state_closed

/obj/item/modular_computer/laptop/verb/rotatelaptop()
	set name = "Rotate laptop"
	set category = "Object"
	set src in view(1)

	if(usr.stat == DEAD)
		if(!round_is_spooky())
			to_chat(src, "<span class='warning'>The veil is not thin enough for you to do that.</span>")
			return

	src.set_dir(turn(src.dir, -90))

/obj/item/modular_computer/laptop/update_verbs()
	..()
	verbs |= /obj/item/modular_computer/laptop/verb/rotatelaptop