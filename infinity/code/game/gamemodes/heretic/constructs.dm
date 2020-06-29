/obj/item/device/soulstone/heretic/attack(var/mob/living/M, var/mob/user)
	if(M == shade)
		to_chat(user, "<span class='notice'>You recapture \the [M].</span>")
		M.forceMove(src)
		return
	if(full == SOULSTONE_ESSENCE)
		to_chat(user, "<span class='notice'>\The [src] is already full.</span>")
		return
	if(M.stat != DEAD && !M.is_asystole())
		to_chat(user, "<span class='notice'>Kill or maim the victim first.</span>")
		return
	for(var/obj/item/W in M)
		M.drop_from_inventory(W)

	shade = new(src)
	shade.ckey = M.ckey

	M.dust()
	set_full(SOULSTONE_ESSENCE)