/mob/observer/eye/blob
	name = "Inactive Blob Overmind"
	name_sufix = "Blob Overmind"
	icon_state = "block2"
	icon = 'infinity/icons/mob/blob.dmi'
	invisibility = INVISIBILITY_EYE - 3
	see_invisible = INVISIBILITY_EYE - 2

/mob/observer/eye/blob/Initialize()
	. = ..()
	set_see_invisible(INVISIBILITY_EYE - 2)


/mob/living/blobHolder
	name = "blob"
	see_in_dark = 7
	faction = "blob"
	invisibility = INVISIBILITY_ABSTRACT
	see_invisible = INVISIBILITY_EYE - 2
	var/obj/effect/biomass/core/core
	var/mob/observer/eye/blob/eye

	var/last_announce = 0
	var/obj/effect/biomass/oldmass

/mob/living/blobHolder/Initialize()
	. = ..()
	verbs += /mob/living/blobHolder/proc/blob_factory
	verbs += /mob/living/blobHolder/proc/blob_node
	verbs += /mob/living/blobHolder/proc/blob_spore
	verbs += /mob/living/blobHolder/proc/reroll_strain
	verbs += /mob/living/blobHolder/proc/blobbernaut
	set_see_invisible(INVISIBILITY_EYE - 2)
	last_announce = world.time

/mob/living/blobHolder/proc/announceOfDanger(var/obj/effect/biomass/mass)
	if(world.time - last_announce >= 15 SECONDS && mass != oldmass)
		to_chat(src, SPAN_NOTICE("Your biomass was attacked! (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[mass.x];Y=[mass.y];Z=[mass.z]'>JMP</a>)"))
		oldmass = mass
		last_announce = world.time

/mob/living/blobHolder/Life()
	. = ..()
	set_see_invisible(INVISIBILITY_EYE - 2)

/mob/living/blobHolder/ClickOn(var/atom/A, params)
	if(world.time <= next_click)
		return
	next_click = world.time + 1

	var/list/modifiers = params2list(params)
	if(modifiers["ctrl"] && modifiers["alt"])
		CtrlAltClickOn(A)
		return
	if(modifiers["shift"] && modifiers["ctrl"])
		CtrlShiftClickOn(A)
		return
	if(modifiers["middle"])
		MiddleClickOn(A)
		return
	if(modifiers["shift"])
		ShiftClickOn(A)
		return
	if(modifiers["alt"])
		AltClickOn(A)
		return
	if(modifiers["ctrl"])
		CtrlClickOn(A)
		return

	expandTo(get_turf(A))
	next_click = world.time + 3

/mob/living/blobHolder/CtrlAltClickOn(var/atom/A)
	if(locate(/mob/living) in get_turf(A))
		rally_spores(get_turf(A))
	. = ..()

/mob/living/blobHolder/ShiftClickOn(var/atom/A)
	. = ..()

/mob/living/blobHolder/CtrlClickOn(var/atom/A)
	if(locate(/obj/effect/biomass) in get_turf(A))
		reinforce(get_turf(A))

/mob/living/blobHolder/AltClickOn(var/atom/A)
	if(locate(/obj/effect/biomass) in get_turf(A))
		var/obj/effect/biomass/blob = locate(/obj/effect/biomass) in get_turf(A)
		if(!istype(blob, /obj/effect/biomass/core))
			core.resources += blob.refund_value
			qdel(blob)
	. = ..()

/mob/living/blobHolder/MiddleClickOn(var/atom/A)
	if(locate(/mob/living) in get_turf(A))
		rally_spores(get_turf(A))
	. = ..()

/mob/living/blobHolder/Stat()
	. = ..()
	if(statpanel("Status"))
		if(core)
			stat("Resources:",   "[round(core.resources)]")
			stat("Core Health:", "[core.health]/[core.maxHealth]")


/mob/living/blobHolder/proc/expandTo(var/turf/T)
	for(var/obj/effect/biomass/blob in range(T, 1))
		if(blob.core == core)
			blob.expand(T, 1)
			return

	to_chat(src, SPAN_WARNING("There is no blob ajustent this tile!"))

/mob/living/blobHolder/proc/reinforce(var/turf/T)
	if(locate(/obj/effect/biomass) in T)
		var/obj/effect/biomass/blob = locate(/obj/effect/biomass) in T
		if(blob.core == core)
			blob.reinforce(1)



/obj/effect/biomass/core/attack_ghost(var/mob/observer/ghost/user)
	if(blobHolder)
		return

	var/confirm = alert(user, "Are you sure you want to join as a Blob?", "Become Blob", "Yes", "No")

	if(!src || confirm != "Yes")
		return

	if(!user || !user.ckey)
		return

	var/mob/observer/eye/blob/eye = new(get_turf(src))
	blobHolder = new(eye)
	blobHolder.ckey = user.ckey
	blobHolder.core = src
	blobHolder.eye = eye
	eye.possess(blobHolder)
	qdel(user)
