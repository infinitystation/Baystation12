/*****************************Coin********************************/

/obj/item/weapon/coin
	icon = 'icons/obj/coins.dmi'
	name = "Coin"
	icon_state = "coin__heads"
	randpixel = 8
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	force = 0.0
	throwforce = 0.0
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	var/string_attached
	var/list/sideslist = list("heads","tails")
	var/cmineral = null
	var/cooldown = 0
	var/value = 1
	var/coinflip

/obj/item/weapon/coin/gold
	name = "gold coin"
	icon_state = "coin_gold_heads"
	cmineral = "gold"
	value = 50

/obj/item/weapon/coin/silver
	name = "silver coin"
	icon_state = "coin_silver_heads"
	cmineral = "silver"
	value = 20

/obj/item/weapon/coin/diamond
	name = "diamond coin"
	icon_state = "coin_diamond_heads"
	cmineral = "diamond"
	value = 500

/obj/item/weapon/coin/iron
	name = "iron coin"
	icon_state = "coin_iron_heads"
	cmineral = "iron"
	value = 1

/obj/item/weapon/coin/phoron
	name = "solid phoron coin"
	icon_state = "coin_phoron_heads"
	cmineral = "phoron"
	value = 100

/obj/item/weapon/coin/uranium
	name = "uranium coin"
	icon_state = "coin_uranium_heads"
	cmineral = "uranium"
	value = 80

/obj/item/weapon/coin/platinum
	name = "platinum coin"
	icon_state = "coin_adamantine_heads"
	cmineral = "adamantine"
	value = 1500

/obj/item/weapon/coin/bananium
	name = "bananium coin"
	icon_state = "coin_bananium_heads"
	cmineral = "bananium"
	value = 1000

/obj/item/weapon/coin/mythril
	name = "mythril coin"
	icon_state = "coin_mythril_heads"
	cmineral = "mythril"
	value = 3000

/obj/item/weapon/coin/twoheaded
	desc = "Hey, this coin's the same on both sides!"
	icon_state = "coin_iron_heads"
	cmineral = "iron"
	sideslist = list("heads")
	value = 1

/obj/item/weapon/coin/antagtoken
	name = "antag token"
	desc = "A novelty coin that helps the heart know what hard evidence cannot prove."
	icon_state = "coin_valid_valid"
	cmineral = "valid"
	sideslist = list("valid", "salad")
	value = 0

/obj/item/weapon/coin/examine(mob/user)
	..()
	if(value)
		to_chat(user, "<span class='info'>It's worth [value] Thaler\s.</span>")

/obj/item/weapon/coin/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(isCoil(W))
		var/obj/item/stack/cable_coil/CC = W
		if(string_attached)
			to_chat(user, "<span class='notice'>There already is a string attached to this coin.</span>")
			return
		if (CC.use(1))
			overlays += image('icons/obj/items.dmi',"coin_string_overlay")
			string_attached = 1
			to_chat(user, "<span class='notice'>You attach a string to the coin.</span>")
		else
			to_chat(user, "<span class='notice'>This cable coil appears to be empty.</span>")
		return
	else if(isWirecutter(W))
		if(!string_attached)
			..()
			return

		var/obj/item/stack/cable_coil/CC = new/obj/item/stack/cable_coil(user.loc)
		CC.amount = 1
		CC.update_icon()
		overlays = list()
		string_attached = null
		to_chat(user, "<span class='notice'>You detach the string from the coin.</span>")
	else ..()

/obj/item/weapon/coin/attack_self(mob/user as mob)
	if(cooldown < world.time)
		if(string_attached) //does the coin have a wire attached
			to_chat(user, "<span class='warning'>The coin won't flip very well with something attached!</span>" )
			return FALSE//do not flip the coin
		coinflip = pick(sideslist)
		cooldown = world.time + 15
		flick("coin_[cmineral]_flip", src)
		icon_state = "coin_[cmineral]_[coinflip]"
		playsound(user.loc, 'sound/items/coinflip.ogg', 50, 1)
		var/oldloc = loc
		sleep(15)
		if(loc == oldloc && user && !user.incapacitated())
			user.visible_message("<span class='notice'>[user] has thrown \the [src]. It lands on [coinflip]! </span>", \
								 "<span class='notice'>You throw \the [src]. It lands on [coinflip]! </span>", \
								 "<span class='italics'>You hear the clattering of loose change.</span>")
