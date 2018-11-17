/obj/item/stack/cable_coil/verb/make_noose()
	set name = "Make Noose"
	set category = "Object"
	var/mob/M = usr

	if(ishuman(M) && M.incapacitated())
		if(!isturf(usr.loc))
			return FALSE
		if(!(locate(/obj/item/weapon/stool) in get_turf(usr)) && !(locate(/obj/structure/bed) in get_turf(usr)) && !(locate(/obj/structure/table) in get_turf(usr)) && !(locate(/obj/structure/hygiene/toilet) in get_turf(usr)))
			to_chat(usr, "<span class='warning'>You have to be standing on top of a chair/table/bed to make a noose!</span>")
			return FALSE
		var/turf/above = GetAbove(get_turf(src))
		if(above && isopenspace(above))
			to_chat(usr, "<span class='warning'>There no roof above us, we can't make noose without surface.</span>")
			return FALSE
		if(src.amount <= 24)
			to_chat(usr, "<span class='warning'> You need at least 25 lengths to make a noose!</span>")
			return FALSE
		new /obj/structure/noose(get_turf(usr))
		to_chat(usr, "<span class='notice'>You wind some cable together to make a noose, tying it to the ceiling.</span>")
		src.use(25)
	else
		to_chat(usr, "<span class='notice'>You cannot do that.</span>")
	return

/obj/structure/noose // From Aurora
	name = "noose"
	desc = "A morbid apparatus."
	icon_state = "noose"
	buckle_lying = 0
	icon = 'icons/obj/noose.dmi'
	anchored = 1
	can_buckle = 1
	layer = 5
	var/image/over = null
	var/ticks = 0

/obj/structure/noose/attackby(obj/item/W, mob/user, params)
	if(is_sharp(W))
		user.visible_message("[user] cuts the noose.", "<span class='notice'>You cut the noose.</span>")
		if(buckled_mob)
			buckled_mob.visible_message("<span class='danger'>[buckled_mob] falls over and hits the ground!</span>",\
										"<span class='danger'>You fall over and hit the ground!</span>")
			buckled_mob.adjustBruteLoss(10)
			buckled_mob.silent = 0
		var/obj/item/stack/cable_coil/C = new(get_turf(src))
		C.amount = 25
		qdel(src)
		return
	..()

/obj/structure/noose/Initialize()
	. = ..()
	pixel_y += 16 //Noose looks like it's "hanging" in the air
	over = image(icon, "noose_overlay")
	over.layer = MOB_LAYER + 0.1

/obj/structure/noose/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/structure/noose/post_buckle_mob(mob/living/M)
	if(M == buckled_mob)
		layer = MOB_LAYER
		overlays += over
		START_PROCESSING(SSobj, src)
		M.pixel_y = initial(M.pixel_y) + 8 //rise them up a bit
		M.dir = SOUTH
	else
		layer = initial(layer)
		overlays -= over
		STOP_PROCESSING(SSobj, src)
		pixel_x = initial(pixel_x)
		M.pixel_x = initial(M.pixel_x)
		M.pixel_y = initial(M.pixel_y)

/obj/structure/noose/user_unbuckle_mob(mob/living/user)
	if(buckled_mob && buckled_mob.buckled == src)
		var/mob/living/M = buckled_mob
		if(M != user)
			user.visible_message("<span class='notice'>[user] begins to untie the noose over [M]'s neck...</span>",\
								"<span class='notice'>You begin to untie the noose over [M]'s neck...</span>")
			if(do_mob(user, M, 100))
				user.visible_message("<span class='notice'>[user] unties the noose over [M]'s neck!</span>",\
									"<span class='notice'>You untie the noose over [M]'s neck!</span>")
			else
				return
		else
			M.visible_message(\
				"<span class='warning'>[M] struggles to untie the noose over their neck!</span>",\
				"<span class='notice'>You struggle to untie the noose over your neck.</span>")
			if(!do_after(M, 150))
				if(M && M.buckled)
					to_chat(M, "<span class='warning'>You fail to untie yourself!</span>")
				return
			if(!M.buckled)
				return
			M.visible_message(\
				"<span class='warning'>[M] unties the noose over their neck!</span>",\
				"<span class='notice'>You untie the noose over your neck!</span>")
			M.Weaken(3)
		buckled_mob.silent = 0
		unbuckle_mob()
		add_fingerprint(user)

/obj/structure/noose/user_buckle_mob(mob/living/carbon/human/M, mob/user)
	if(!in_range(user, src) || user.stat || user.restrained() || !istype(M))
		return FALSE

	if (ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(BP_HEAD)
		if(!affecting)
			to_chat(user, "<span class='danger'>They don't have a head.</span>")
			return

	if(M.loc != src.loc)
		return FALSE //Can only noose someone if they're on the same tile as noose

	add_fingerprint(user)

	if(M == user && buckle_mob(M))
		M.visible_message(\
			"<span class='warning'>[M] ties \the [src] over their neck!</span>",\
			"<span class='warning'>You tie \the [src] over your neck!</span>")
		playsound(src, 'sound/effects/noosed.ogg', 50, 1, -1)
		return TRUE
	else
		M.visible_message(\
			"<span class='danger'>[user] attempts to tie \the [src] over [M]'s neck!</span>",\
			"<span class='danger'>[user] ties \the [src] over your neck!</span>")
		to_chat(user, "<span class='notice'>It will take 20 seconds and you have to stand still.</span>")
		if(do_after(user, 200))
			if(buckle_mob(M))
				M.visible_message(\
					"<span class='danger'>[user] ties \the [src] over [M]'s neck!</span>",\
					"<span class='userdanger'>[user] ties \the [src] over your neck!</span>")
				playsound(user.loc, 'sound/effects/noosed.ogg', 50, 1, -1)
				return TRUE
			else
				user.visible_message(\
					"<span class='warning'>[user] fails to tie \the [src] over [M]'s neck!</span>",\
					"<span class='warning'>You fail to tie \the [src] over [M]'s neck!</span>")
				return FALSE
		else
			user.visible_message(\
				"<span class='warning'>[user] fails to tie \the [src] over [M]'s neck!</span>",\
				"<span class='warning'>You fail to tie \the [src] over [M]'s neck!</span>")
			return FALSE

/obj/structure/noose/Process(mob/living/carbon/human/M, mob/user)
	if(!buckled_mob)
		buckled_mob.pixel_x = initial(buckled_mob.pixel_x)
		pixel_x = initial(pixel_x)
		return PROCESS_KILL

	ticks++
	switch(ticks)
		if(1)
			pixel_x -= 1
			buckled_mob.pixel_x -= 1
		if(2)
			pixel_x = initial(pixel_x)
			buckled_mob.pixel_x = initial(buckled_mob.pixel_x)
		if(3) //Every third tick it plays a sound and RNG's a flavor text
			pixel_x += 1
			buckled_mob.pixel_x += 1
			if(buckled_mob)
				if (ishuman(buckled_mob))
					var/mob/living/carbon/human/H = buckled_mob
					if(!H.can_feel_pain() || H.isSynthetic())
						return
				if(prob(15))
					var/flavor_text = list("<span class='warning'>[buckled_mob]'s legs flail for anything to stand on.</span>",\
											"<span class='warning'>[buckled_mob]'s hands are desperately clutching the noose.</span>",\
											"<span class='warning'>[buckled_mob]'s limbs sway back and forth with diminishing strength.</span>")
					if(buckled_mob.stat == DEAD)
						flavor_text = list("<span class='warning'>[buckled_mob]'s limbs lifelessly sway back and forth.</span>",\
											"<span class='warning'>[buckled_mob]'s eyes stare straight ahead.</span>")
					buckled_mob.visible_message(pick(flavor_text))
				playsound(buckled_mob.loc, 'sound/effects/noose_idle.ogg', 50, 1, -3)
		if(4)
			pixel_x = initial(pixel_x)
			buckled_mob.pixel_x = initial(buckled_mob.pixel_x)
			ticks = 0

	if(buckled_mob)
		if (ishuman(buckled_mob))
			var/mob/living/carbon/human/H = buckled_mob
			if(!H.can_feel_pain() || H.isSynthetic())
				return
		buckled_mob.adjustOxyLoss(5)
		buckled_mob.adjustBrainLoss(1)
		buckled_mob.silent = max(buckled_mob.silent, 10)
		if(prob(25)) //to reduce gasp spam
			buckled_mob.emote("gasp")
