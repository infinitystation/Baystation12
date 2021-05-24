#define COIN_HEADS "heads-up"
#define COIN_TAILS "tails-up"
#define COIN_EDGE  "on the side"

/obj/item/material/coin
	var/side = COIN_HEADS
	var/list/sides = list(COIN_HEADS, COIN_TAILS, COIN_EDGE)

/obj/item/material/coin/proc/coinflip(var/mob/user, thrown, rigged = FALSE)
	var/matrix/flipit = matrix()
	flipit.Scale(0.2, 1)
	animate(src, transform = flipit, time = 2, easing = QUAD_EASING)
	flipit.Scale(5, 1)
	flipit.Invert()
	flipit.Turn(rand(1, 359))
	animate(src, transform = flipit, time = 2, easing = QUAD_EASING)
	flipit.Scale(0.2, 1)
	animate(src, transform = flipit, time = 2, easing = QUAD_EASING)

	side = sides[pick(1, 2)]
	flipit.Scale(5, 1)
	if (pick(0, 1))
		flipit.Invert()
	flipit.Turn(rand(1, 359))
	animate(src, transform = flipit, time = 2, easing = QUAD_EASING)

	if (prob(0.1) || rigged)
		flipit.Scale(0.2, 1)
		animate(src, transform = flipit, time = 2, easing = QUAD_EASING)
		side = sides[3]

	playsound(src, 'infinity/sound/items/coinflip.ogg', 50, 1)
	if (!thrown)
		user.visible_message(
		"<span class='notice'>[user] flips [src]. It lands [side].</span>", \
		"<span class='notice'>You flip [src]. It lands [side].</span>", \
		"<span class='notice'>You hear [src] landing.</span>")
	else
		if(!throwing) //coin was thrown and is coming to rest
			visible_message("<span class='notice'>[src] stops spinning, landing [side].</span>")

/obj/item/material/coin/examine(var/mob/user)
	..()
	to_chat(user, "<span class='notice'>[src] is [side].</span>")

/obj/item/material/coin/equipped(var/mob/user)
	..()
	side = COIN_HEADS
	transform = null

/obj/item/material/coin/attack_self(var/mob/user)
	coinflip(user, 0)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

/obj/item/material/coin/throw_impact(atom/hit_atom, speed, user)
	..()
	coinflip(user, 1)
