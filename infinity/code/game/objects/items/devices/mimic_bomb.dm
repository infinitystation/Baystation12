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
		color = target.color
		icon_state = target.icon_state
		active = TRUE
		to_chat(user, "\The [src] is now active.")
		playsound(get_turf(src), 'sound/weapons/flash.ogg', 100, 1, -6)
		update_icon()
	else
		to_chat(user, "\The [target] is too big for \the [src] hologramm")

/obj/item/device/mimic_bomb/attack_self(mob/user)
	trigger(user)

/obj/item/device/mimic_bomb/emp_act()
	trigger()

/obj/item/device/mimic_bomb/attack_hand(mob/user)
	. = ..()
	if(!mode)
		trigger(user)

/obj/item/device/mimic_bomb/proc/switch_mode(var/mob/user)
	mode = !mode
	if(mode)
		to_chat(user, "Now \the [src] will explode upon activation.")
	else
		to_chat(user, "Now \the [src] will explode as soon as they pick it up or upon activation")

/obj/item/device/mimic_bomb/proc/trigger(var/mob/user)
	if(!active)
		switch_mode(user)
		return
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(!user)
		return
	var/obj/item/organ/external/O = H.get_organ(pick(BP_L_HAND, BP_R_HAND))
	if(!O)
		return

	var/dam = rand(25, 30)
	H.visible_message("<span class='danger'>\The [src] in \the [H]'s hand explodes with a loud bang!</span>")
	H.apply_damage(dam, BRUTE, O, damage_flags = DAM_SHARP, used_weapon = "explode")
	explosion(src.loc, 0,0,1,1)
	H.Stun(5)
	qdel(src)