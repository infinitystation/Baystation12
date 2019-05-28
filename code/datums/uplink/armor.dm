/********************
* Armor and Space Suits *
********************/
/datum/uplink_item/item/armor
	category = /datum/uplink_category/armor

/datum/uplink_item/item/armor/heavy_armor
	name = "Heavy Armor Vest and Helmet"
	item_cost = 30
	antag_costs = list(MODE_MERCENARY = 20)
	path = /obj/item/weapon/storage/backpack/satchel/syndie_kit/armor

/datum/uplink_item/item/armor/space_suit
	name = "Space Combat Suit"
	item_cost = 50
	antag_costs = list(MODE_MERCENARY = 30)
	path = /obj/item/weapon/storage/backpack/satchel/syndie_kit/space

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
