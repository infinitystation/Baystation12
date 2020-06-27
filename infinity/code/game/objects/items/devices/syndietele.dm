/obj/item/device/syndietele
	name = "telebeacon"
	desc = "A beacon, capable of teleporting jaunter to it."
	icon = 'infinity/icons/obj/syndiejaunter.dmi'
	icon_state = "beacon"
	item_state = "signaler"
	origin_tech = list(TECH_BLUESPACE = 4, TECH_ESOTERIC = 3)

	w_class = ITEM_SIZE_SMALL

	var/animation_icon = 'infinity/icons/effects/bs_silk.dmi'
	var/back_animation = "silc_teleport_back"
	var/onhub_animation = "silc_get_hub"

/obj/item/device/syndietele/proc/teleport_back(mob/target)
	to_chat(target, SPAN_WARNING("You feel like something pull you in bluespace."))
	var/obj/effect/temporary/A = new(get_turf(target), 24.5, animation_icon, back_animation)
	target.dir = 2
	target.forceMove(A)
	addtimer(CALLBACK(src, .proc/teleport_effect, target), 23)

/obj/item/device/syndietele/proc/teleport_effect(mob/target)
	target.forceMove(src)
	target.dir = 2
	new /obj/effect/temporary(get_turf(src), 26.5, animation_icon, onhub_animation)
	addtimer(CALLBACK(src, .proc/teleport_move, target), 24)

/obj/item/device/syndietele/proc/teleport_move(mob/target)
	target.forceMove(loc)

/obj/item/device/syndiejaunter
	name = "telejaunter"
	desc = "A pinpointer for telebeacon. Only one use!"
	icon = 'infinity/icons/obj/syndiejaunter.dmi'
	icon_state = "jaunter"
	item_state = "jaunter"
	w_class = ITEM_SIZE_SMALL
	var/obj/item/device/syndietele/beacon

/obj/item/device/syndiejaunter/attack_self(mob/user)
	if(!beacon)
		return 0
	if(!istype(beacon))
		return 0

	beacon.teleport_back(user)
	qdel(src)

/obj/item/device/syndiejaunter/afterattack(atom/target, mob/user , proximity)
	if(!proximity) return
	if(istype(target,/obj/item/device/syndietele))
		beacon = target
		to_chat(user, "You succesfully linked [src] to [target]!")
	else
		to_chat(user, "You can't link [src] to [target]!")
