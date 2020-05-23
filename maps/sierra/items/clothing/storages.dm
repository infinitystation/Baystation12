/obj/item/weapon/storage/backpack/toxins
	name = "research backpack"
	desc = "It's a stain-resistant light backpack modeled for use in laboratories and other scientific institutions."
	icon = 'maps/sierra/icons/obj/storages.dmi'
	item_icons = list(slot_back_str = 'maps/sierra/icons/mob/back.dmi')
	icon_state = "natpack"

/obj/item/weapon/storage/backpack/satchel/tox
	name = "research satchel"
	desc = "Useful for holding research materials. The colors on it denote it as a nanotrasen bag."
	icon = 'maps/sierra/icons/obj/storages.dmi'
//ORIG	item_icons = list(slot_back_str = 'maps/sierra/icons/mob/back.dmi')
	icon_state = "satchel-nat"
//[INF]
	item_icons = list(
//		slot_belt_str = 'maps/sierra/icons/mob/belt.dmi',
		slot_back_str = 'maps/sierra/icons/mob/back.dmi',
		)
	item_state_slots = list(
		slot_belt_str = "satchel-nat-belt_inf",
//		slot_back_str = "satchel-nat_inf",
		)
//[/INF]
/obj/item/weapon/storage/backpack/messenger/tox
	name = "research messenger bag"
	desc = "A backpack worn over one shoulder.  Useful for holding science materials. The colors on it denote it as a nanotrasen bag."
	icon = 'maps/sierra/icons/obj/storages.dmi'
	item_icons = list(slot_back_str = 'maps/sierra/icons/mob/back.dmi')
	icon_state = "courierbagnat"
