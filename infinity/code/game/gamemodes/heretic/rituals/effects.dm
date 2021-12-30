/obj/effect/cultwall
	name = "red shield"
	desc = "A strange red shield, emanating from a rune below it."
	icon = 'infinity/icons/effects/cult.dmi'
	icon_state = "cultshield"
	color = "#ff0000"
	anchored = TRUE
	density = TRUE
	unacidable = TRUE
	var/obj/effect/rune/rune
	var/health
	var/max_health = 200

/obj/effect/cultwall/New(var/loc, var/bcolor, var/obj/effect/rune/creator)
	..()
	health = max_health
	rune = creator
	if(bcolor)
		color = bcolor

/obj/effect/cultwall/Destroy()
	if(rune)
		rune = null
	return ..()

/obj/effect/cultwall/examine(mob/user)
	. = ..()
	if(iscultist(user))
		if(health == max_health)
			to_chat(user, "<span class='notice'>It is fully intact.</span>")
		else if(health > max_health * 0.5)
			to_chat(user, "<span class='warning'>It is damaged.</span>")
		else
			to_chat(user, "<span class='danger'>It is about to dissipate.</span>")

/obj/effect/cultwall/attack_hand(var/mob/living/user)
	if(iscultist(user))
		flick("cultwall", src)
		sleep(7)
		user.visible_message("<span class='notice'>\The [user] touches \the [src], and it fades.</span>", "<span class='notice'>You touch \the [src], whispering the old ritual, making it disappear.</span>")
		qdel(src)
	else
		to_chat(user, "<span class='notice'>You touch \the [src]. It feels wet and becomes harder the further you push your arm.</span>")

/obj/effect/cultwall/attackby(var/obj/item/I, var/mob/living/user)
	if(istype(I, /obj/item/nullrod))
		user.visible_message("<span class='notice'>\The [user] touches \the [src] with \the [I], and it disappears.</span>", "<span class='notice'>You disrupt the vile magic with the deadening field of \the [I].</span>")
		qdel(src)
	else if(I.force)
		user.visible_message("<span class='notice'>\The [user] hits \the [src] with \the [I].</span>", "<span class='notice'>You hit \the [src] with \the [I].</span>")
		take_damage(I.force)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		user.do_attack_animation(src)

/obj/effect/cultwall/bullet_act(var/obj/item/projectile/Proj)
	if(!(Proj.damage_type == BRUTE || Proj.damage_type == BURN))
		return
	take_damage(Proj.damage)
	..()

/obj/effect/cultwall/proc/take_damage(var/amount)
	health -= amount
	if(health <= 0)
		visible_message("<span class='warning'>\The [src] dissipates.</span>")
		qdel(src)

/obj/effect/cultwall/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(isliving(mover))
		var/mob/living/L = mover
		if(iscultist(L))
			return 1
	. = ..()

/obj/effect/temporary/cult_floor
	layer = DECAL_LAYER
