/**********
* Medical *
**********/
/datum/uplink_item/item/medical
	category = /datum/uplink_category/medical

/datum/uplink_item/item/medical/sinpockets
	name = "Box of Sin-Pockets"
	item_cost = 8
	antag_costs = list(MODE_MERCENARY = 5)
	path = /obj/item/weapon/storage/box/sinpockets

/datum/uplink_item/item/medical/surgery
	name = "Surgery kit"
	item_cost = 40
	antag_costs = list(MODE_MERCENARY = 20)
	path = /obj/item/weapon/storage/firstaid/surgery

/datum/uplink_item/item/medical/combat
	name = "Combat medical kit"
	item_cost = 48
	antag_costs = list(MODE_MERCENARY = 20)
	path = /obj/item/weapon/storage/firstaid/combat
