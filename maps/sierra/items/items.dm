/*******************
sierra specific items
*******************/

/obj/item/weapon/storage/backpack/explorer
	name = "explorer backpack"
	desc = "A rugged backpack."
	icon_state = "exppack"

/obj/item/weapon/storage/backpack/satchel_explorer
	name = "explorer satchel"
	desc = "A rugged satchel for field work."
	icon_state = "satchel-exp"

/obj/item/weapon/storage/backpack/messenger/explorer
	name = "explorer messenger bag"
	desc = "A rugged backpack worn over one shoulder."
	icon_state = "courierbagexp"

/***********
Unique items
***********/

/obj/item/weapon/pen/multi/cmd/hop
	name = "head of personnel's pen"
	icon = 'maps/sierra/icons/obj/uniques.dmi'
	icon_state = "pen_xo"
	desc = "A slightly bulky pen with a silvery case. Twisting the top allows you to switch the nib for different colors."

/obj/item/weapon/pen/multi/cmd/captain
	name = "captain's pen"
	icon = 'maps/sierra/icons/obj/uniques.dmi'
	icon_state = "pen_co"
	desc = "A slightly bulky pen with a golden case. Twisting the top allows you to switch the nib for different colors."

/obj/item/weapon/pen/multi/cmd/attack_self(mob/user)
	if(++selectedColor > 3)
		selectedColor = 1
	colour = colors[selectedColor]
	to_chat(user, "<span class='notice'>Changed color to '[colour].'</span>")

/obj/item/weapon/storage/fakebook
	name = "Workplace Crisis Management"
	desc = "Also known as 'I fucked up, what do?'. A very popular book among the NanoTrasen management."
	icon = 'icons/obj/library.dmi'
	icon_state = "booknanoregs"
	attack_verb = list("bashed", "whacked", "educated")
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = 2
	startswith = list(
			/obj/item/weapon/reagent_containers/pill/cyanide,
			/obj/item/weapon/paper/liason_note
	)

/******
Weapons
******/

/obj/item/weapon/gun/projectile/revolver/medium/captain
	desc = "A shiny al-Maliki & Mosley Autococker automatic revolver, with black accents. Marketed as the 'Revolver for the Modern Era'. Uses .357 magnum rounds. This one has 'To the Captain of NSV Sierra' engraved."

/obj/item/weapon/gun/energy/stunrevolver/secure/nanotrasen
	name = "corporate stun revolver"
	desc = "This A&M X6 is fitted with an NT1019 chip which allows remote authorization of weapon functionality. It has a NanoTrasen emblem on the grip."
	req_access = list(list(access_brig, access_heads, access_rd))

/obj/item/weapon/gun/projectile/pistol/liaison
	magazine_type = /obj/item/ammo_magazine/mc9mm/oneway

/obj/item/ammo_magazine/mc9mm/oneway
	initial_ammo = 1

/obj/effect/paint/hull
	color = COLOR_HULL

/obj/item/device/boombox/anchored //for bar's private rooms
	name = "stationary boombox"
	anchored = 1

/obj/item/device/boombox/anchored/attack_hand(var/mob/user)
	interact(user)

/obj/item/tape/research
	req_access = list(list(access_research, access_explorer))