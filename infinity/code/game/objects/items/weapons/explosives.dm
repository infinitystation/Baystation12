/obj/item/plastique/super
	name = "X-4 explosives"
	desc = "Military version of plastique explosions."
	icon = 'infinity/icons/obj/assemblies.dmi'
	origin_tech = list(TECH_ESOTERIC = 4)
	explosion_strengh = 1

/obj/item/door_charge
	name = "door charge"
	desc = "This is a booby trap, planted on doors. When door opens, it will explode!."
	gender = PLURAL
	icon = 'infinity/icons/obj/door_charge.dmi'
	icon_state = "door_charge"
	item_state = "door_charge"
	item_flags = ITEM_FLAG_NO_BLUDGEON
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_ESOTERIC = 4)
	var/ready = 0

/obj/item/door_charge/afterattack(atom/movable/target, mob/user, flag)
	if (!flag)
		return
	if (ismob(target) || !istype(target, /obj/machinery/door/airlock))
		return
	to_chat(user, "Planting explosives...")
	user.do_attack_animation(target)

	if(do_after(user, 50, target) && in_range(user, target))
		if(!user.unequip_item())
			return
		forceMove(target)

		log_and_message_admins("planted \a [src] on \the [target].")

		to_chat(user, "Bomb has been planted.")

		GLOB.density_set_event.register(target, src, .proc/explode)


/obj/item/door_charge/proc/explode(var/obj/machinery/door/airlock/airlock)
	if(!airlock.density)
		explosion(get_turf(airlock), -1, 1, 2, 3)
		airlock.ex_act(1)
		qdel(src)
