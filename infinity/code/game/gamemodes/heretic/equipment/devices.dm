/obj/item/device/flashlight/flare/culttorch
	name = "void torch"
	desc = "Used by veteran cultists to instantly transport items to their needful brethren."
	color = "#cc0000"
	icon_state = "torch"
	icon = 'infinity/icons/obj/cult.dmi'
	on_damage = 15
	slot_flags = null
	on = TRUE
	var/charges = 5
	var/lit = 0

/obj/item/device/flashlight/flare/culttorch/attack_self(var/mob/user)
	if(lit || charges == 0)
		return
	icon_state = "torch-on"
	lit = 1
	to_chat(user, "<span class='cult italic'>You ignite [src], prepairing it to use.</span>")

/obj/item/device/flashlight/flare/culttorch/afterattack(atom/movable/A, mob/user, proximity)
	if(!lit)
		return
	if(!proximity)
		return
	if(!iscultist(user))
		to_chat(user, SPAN_NOTICE("That doesn't seem to do anything useful."))
		return

	if(istype(A, /obj/item))

		var/list/cultists = list()
		for(var/datum/mind/M in GLOB.cult.current_antagonists)
			if(M.current && M.current.stat != DEAD)
				cultists |= M.current
		var/mob/living/cultist_to_receive = input(user, "Who do you wish to call to [src]?", "Followers of the Geometer") as null|anything in (cultists - user)
		if(!Adjacent(user) || !src || QDELETED(src) || user.incapacitated())
			return
		if(!cultist_to_receive)
			to_chat(user, "<span class='cult italic'>You require a destination!</span>")
			log_game("Void torch failed - no target")
			return
		if(cultist_to_receive.stat == DEAD)
			to_chat(user, "<span class='cult italic'>[cultist_to_receive] has died!</span>")
			log_game("Void torch failed  - target died")
			return
		if(!iscultist(cultist_to_receive))
			to_chat(user, "<span class='cult italic'>[cultist_to_receive] is not a follower of the Geometer!</span>")
			log_game("Void torch failed - target was deconverted")
			return
		if(A in user.GetAllContents())
			to_chat(user, "<span class='cult italic'>[A] must be on a surface in order to teleport it!</span>")
			return
		user.visible_message("<span class='cult italic'>You ignite [A] with \the [src], turning it to ash, but through the torch's flames you see that [A] has reached [cultist_to_receive]!</span>", SPAN_WARNING("[user] ignites [A] with [src], burning it into the ashes!"))
		cultist_to_receive.put_in_hands(A)
		charges--
		to_chat(user, SPAN_NOTICE("\The [src] now has [charges] charge\s."))
		if(charges == 0)
			icon_state = "torch-off"
			lit = 0
			name = "burnt out void torch"

	else
		..()
		to_chat(user, "<span class='warning'>\The [src] can only transport items!</span>")

/obj/item/weapon/cult_shift
	name = "veil shifter"
	desc = "This relic instantly teleports you, and anything you're pulling, forward by a moderate distance."
	icon = 'infinity/icons/obj/cult.dmi'
	icon_state ="shifter"
	var/uses = 4

/obj/item/weapon/cult_shift/examine(mob/user)
	. = ..()
	if(uses)
		. += "<span class='cult'>It has [uses] use\s remaining.</span>"
	else
		. += "<span class='cult'>It seems drained.</span>"

/obj/item/weapon/cult_shift/proc/handle_teleport_grab(turf/T, mob/user)
	var/mob/living/carbon/C = user
	if(C.pulling)
		var/atom/movable/pulled = C.pulling
		pulled.forceMove(T)
		. = pulled

/obj/item/weapon/cult_shift/attack_self(mob/user)
	if(!uses || !iscarbon(user))
		to_chat(user, "<span class='warning'>\The [src] is dull and unmoving in your hands.</span>")
		return
	if(!iscultist(user))
		if(user.unEquip(src))
			throw_at(get_edge_target_turf(src, pick(GLOB.alldirs)), rand(1,3), throw_speed)
		to_chat(user, "<span class='warning'>\The [src] flickers out of your hands, your connection to this dimension is too strong!</span>")
		return

	var/mob/living/carbon/C = user
	var/turf/mobloc = get_turf(C)
	var/turf/destination = get_teleport_loc(mobloc,C,9,1,3,1,0,1)

	if(destination)
		uses--
		if(uses <= 0)
			icon_state ="shifter_drained"
		playsound(mobloc, "sparks", 50, TRUE)
		var/obj/effect/temporary/effect = new(mobloc, 8, 'infinity/icons/effects/effects.dmi', "cultout")
		effect.dir = C.dir

		var/atom/movable/pulled = handle_teleport_grab(destination, C)
		C.forceMove(destination)
		if(pulled)
			C.start_pulling(pulled) //forcemove resets pulls, so we need to re-pull
		var/obj/effect/temporary/effect2 = new(destination, 8, 'infinity/icons/effects/effects.dmi', "cultin")
		effect2.dir = C.dir
		playsound(destination, 'sound/effects/phasein.ogg', 25, TRUE)
		playsound(destination, "sparks", 50, TRUE)

	else
		to_chat(C, "<span class='warning'>The veil cannot be torn here!</span>")


/obj/item/clothing/glasses/god_eye
	name = "Eye Of God"
	desc = "Allows you to see anything, that your cult can see."

	icon = 'infinity/icons/obj/cult.dmi'
	icon_state ="godeye"

	action_button_name = "Toggle Eye Of God"
	var/activex = FALSE
	var/mob/observer/eye/cult/eye

/datum/visualnet/narnarnet
	valid_source_types = list(/mob/living/, /obj/structure/cult)
	chunk_type = /datum/chunk/narnarnet

/datum/chunk/narnarnet/acquire_visible_turfs(var/list/visible)
	for(var/source in sources)
		if(istype(source, /mob/living))
			var/mob/living/L = source
			if(L.stat == DEAD)
				continue

		for(var/turf/t in seen_turfs_in_range(source, world.view))
			visible[t] = t

/obj/item/clothing/glasses/god_eye/New()
	var/visualnet = new /datum/visualnet/narnarnet()
	eye = new(src, visualnet)
	eye.name_sufix = "Eye Of God"
	..()

/obj/item/clothing/glasses/god_eye/Destroy()
	if(eye)
		if(activex)
			disengage_eye(eye.owner)
		qdel(eye)
		eye = null
	..()

/obj/item/clothing/glasses/god_eye/attack_self(var/mob/user)
	if(user.incapacitated())
		return
	activex = !activex
	to_chat(user, "<span class='notice'>You [activex ? "start to seek through" : "return to your mortal body from"] \the [src].</span>")
	if(activex)
		engage_eye(user)
	else
		disengage_eye(user)

/obj/item/clothing/glasses/god_eye/equipped(var/mob/user, var/slot)
	..(user, slot)
	engage_eye(user)

/obj/item/clothing/glasses/god_eye/dropped(var/mob/user)
	..()
	disengage_eye(user)

/obj/item/clothing/glasses/god_eye/proc/engage_eye(var/mob/user)
	if(!activex)
		return
	if(user.get_equipped_item(slot_glasses) != src)
		return

	eye.possess(user)
	to_chat(eye.owner, "<span class='notice'>You feel disorented for a moment as your mind starts to seek through \the [src].</span>")

/obj/item/clothing/glasses/god_eye/proc/disengage_eye(var/mob/user)
	if(user == eye.owner)
		to_chat(eye.owner, "<span class='notice'>You feel disorented for a moment as you return to your mortal body from \the [src].</span>")
		eye.release(eye.owner)
		eye.forceMove(src)
