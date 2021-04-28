/obj/item/clothing/gloves/daft_punk //By KaReTa
	name = "Daft Punk gloves"
	desc = "DJs' most comfortable gloves."
	icon = 'infinity/icons/obj/clothing/obj_hands.dmi'
	icon_override = 'infinity/icons/mob/onmob/onmob_hands.dmi'
	icon_state = "daft_gloves"
	item_state = null

/obj/item/clothing/gloves/insulated/black
	name = "black insulated gloves"
	desc = "These gloves will protect the wearer from electric shocks. A great choice for stylish hackers."
	color = null
	icon_state = "black"
	item_state = "bgloves"

/obj/item/clothing/gloves/insulated/white
	name = "white insulated gloves"
	desc = "These gloves will protect the wearer from electric shocks. A great choice for ladies and gentlemen."
	color = null
	icon_state = "latex"
	item_state = "lgloves"

/obj/item/clothing/gloves/thick/combat/marine
	desc = "These combat gloves are somewhat fire and impact resistant."
	name = "combat gloves"
	icon_state = "black"
	item_state = "swat_gl"
	armor = list(melee = 30, bullet = 30, laser = 30,energy = 15, bomb = 20, bio = 0, rad = 0)

/obj/item/clothing/gloves/insulated/combat
	name = "combat insulated gloves"
	color = "#80868e"
	icon_state = "black"
	item_state = "bgloves"
	armor = list(melee = 20, bullet = 20, laser = 30,energy = 25, bomb = 20, bio = 0, rad = 0)

/obj/item/clothing/gloves/wristwatch
	name = "watch"
	desc = "A wristwatch. This one is silver and EMP-resistance."
	icon = 'infinity/icons/obj/clothing/obj_hands.dmi'
	item_icons = list(slot_gloves_str = 'infinity/icons/mob/onmob/onmob_hands.dmi')
	icon_state = "watch_black"
	item_state = "watch_black"

/obj/item/clothing/gloves/wristwatch/gold
	name = "gold watch"
	desc = "A wristwatch. This one is golden and in makes you feel like a boss."
	icon_state = "watch_gold"
	item_state = "watch_gold"

/obj/item/clothing/gloves/wristwatch/examine(mob/user)
	. = ..()
	to_chat(user, "It displays " + stationtime2text())
