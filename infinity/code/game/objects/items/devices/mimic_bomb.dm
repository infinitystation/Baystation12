/obj/item/device/mimic_bomb
	name = "mini bomb"
	desc = "A small explosive charge with a holoprojector designed to disable the curious guards. It has two modes, an explosion when activated and an explosion when picked up. Be careful."
	icon = 'infinity/icons/obj/weapons.dmi'
	icon_state = "minibomb"
	item_state = "nothing"
	slot_flags = SLOT_EARS
	w_class = ITEM_SIZE_SMALL
	var/active = FALSE
	var/mode = 0

/obj/item/device/mimic_bomb/afterattack(obj/item/target, mob/user , proximity)
	if(!proximity)
		return
	if(!target)
		return
	if(target.w_class <= w_class)
		name = target.name
		desc = target.desc
		icon = target.icon
		icon_state = target.icon_state
		active = TRUE
		to_chat(user, "\The [src] is now active.")
		playsound(get_turf(src), 'sound/weapons/flash.ogg', 100, 1, -6)
		update_icon()
	else
		to_chat(user, "\The [target] is too big for \the [src] hologramm")

/obj/item/device/mimic_bomb/attack_self()
	trigger()

/obj/item/device/mimic_bomb/emp_act()
	trigger()

/obj/item/device/mimic_bomb/attack_hand()
	..()
	if(!mode)
		trigger()

/obj/item/device/mimic_bomb/proc/switch_mode()
	mode = !mode
	if(mode)
		to_chat(usr, "Now \the [src] will explode upon activation.")
	else
		to_chat(usr, "Now \the [src] will explode as soon as they pick it up or upon activation")

/obj/item/device/mimic_bomb/proc/trigger()
	if(!active)
		switch_mode()
		return
	var/mob/living/carbon/human/user = usr
	if(!user)
		return
	var/obj/item/organ/external/O = user.get_organ(pick(BP_L_HAND, BP_R_HAND))
	if(!O)
		return

	var/dam = rand(25, 30)
	user.visible_message("<span class='danger'>\The [src] in \the [user]'s hand explodes with a loud bang!</span>")
	user.apply_damage(dam, BRUTE, O, damage_flags = DAM_SHARP, used_weapon = "explode")
	explosion(src.loc, 0,0,1,1)
	user.Stun(5)
	qdel(src)
