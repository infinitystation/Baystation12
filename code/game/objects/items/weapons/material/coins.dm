/obj/item/weapon/material/coin
	name = "coin"
	icon = 'icons/obj/coin.dmi'
	icon_state = "coin1"
	applies_material_colour = TRUE
	randpixel = 8
	force = 0.2
	throwforce = 0.1
	w_class = 1
	slot_flags = SLOT_EARS
	var/string_colour

	var/list/sideslist = list("heads","tails")
	var/cooldown = 0
	var/coinflip


/obj/item/weapon/material/coin/New()
	icon_state = "coin[rand(1,10)]"
	..()

/obj/item/weapon/material/coin/on_update_icon()
	if(!isnull(string_colour))
		var/image/I = image(icon = icon, icon_state = "coin_string_overlay")
		I.appearance_flags |= RESET_COLOR
		I.color = string_colour
		overlays += I
	else
		overlays.Cut()

/obj/item/weapon/material/coin/attackby(var/obj/item/W, var/mob/user)
	if(isCoil(W) && isnull(string_colour))
		var/obj/item/stack/cable_coil/CC = W
		if(CC.use(1))
			string_colour = CC.color
			to_chat(user, "<span class='notice'>You attach a string to the coin.</span>")
			update_icon()
			return
	else if(isWirecutter(W) && !isnull(string_colour))
		new /obj/item/stack/cable_coil/single(get_turf(user))
		string_colour = null
		to_chat(user, "<span class='notice'>You detach the string from the coin.</span>")
		update_icon()
	else ..()

/obj/item/weapon/material/coin/attack_self(mob/user as mob)
	if(cooldown < world.time)
		if(string_colour) //does the coin have a wire attached
			to_chat(user, "<span class='warning'>The coin won't flip very well with something attached!</span>" )
			return FALSE//do not flip the coin
		coinflip = pick(sideslist)
		cooldown = world.time + 15
//		flick("coin_[default_material]_flip", src)
//		icon_state = "coin_[default_material]_[coinflip]"
		playsound(user.loc, 'sound/items/coinflip.ogg', 50, 1)
		var/oldloc = loc
		sleep(15)
		if(loc == oldloc && user && !user.incapacitated())
			user.visible_message("<span class='notice'>[user] has thrown \the [src]. It lands on [coinflip]! </span>", \
								 "<span class='notice'>You throw \the [src]. It lands on [coinflip]! </span>", \
								 "<span class='italics'>You hear the clattering of loose change.</span>")

// Subtypes.
/obj/item/weapon/material/coin/gold
	default_material = MATERIAL_GOLD

/obj/item/weapon/material/coin/silver
	default_material = MATERIAL_SILVER

/obj/item/weapon/material/coin/diamond
	default_material = MATERIAL_DIAMOND

/obj/item/weapon/material/coin/iron
	default_material = MATERIAL_IRON

/obj/item/weapon/material/coin/uranium
	default_material = MATERIAL_URANIUM

/obj/item/weapon/material/coin/platinum
	default_material = MATERIAL_PLATINUM

/obj/item/weapon/material/coin/phoron
	default_material = MATERIAL_PHORON
