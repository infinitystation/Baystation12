/********************
* Armor and Space Suits *
********************/
/datum/uplink_item/item/armor
	category = /datum/uplink_category/armor

//[INF]

/datum/uplink_item/item/armor/cheap_space
	name = "Cheap Space Suit"
	desc = "A cheap space kit, including space suit, gas mask and an oxygen tank. Better than nothing."
	item_cost = 15
	antag_costs = list(MODE_MERCENARY = 10)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/space_cheap

//[/INF]

/datum/uplink_item/item/armor/heavy_armor
	name = "Heavy Armor Vest and Helmet"
	item_cost = 30
	antag_costs = list(MODE_MERCENARY = 20)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/armor

/datum/uplink_item/item/armor/space_suit
	name = "Space Combat Suit"
	item_cost = 50
	antag_costs = list(MODE_MERCENARY = 30)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/space

/datum/uplink_item/item/armor/combat_rig
	name = "Crimson combat RIG"
	item_cost = 120
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/rig/merc/empty

/datum/uplink_item/item/armor/heavy_rig
	name = "Crimson heavy combat RIG"
	item_cost = 200
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/rig/merc/heavy/empty
