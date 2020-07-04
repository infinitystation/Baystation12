/***********
* Grenades *
************/
/datum/uplink_item/item/grenades
	category = /datum/uplink_category/grenades

/datum/uplink_item/item/grenades/anti_photon
	name = "1x Photon Disruption Grenade"
	desc = "An experimental device for temporarily removing light in a limited area for a small amount of time."
	item_cost = 2
	path = /obj/item/weapon/grenade/anti_photon

/datum/uplink_item/item/grenades/anti_photons
	name = "5x Photon Disruption Grenades"
	item_cost = 8
	path = /obj/item/weapon/storage/box/anti_photons
//[INF]
/datum/uplink_item/item/grenades/anti_photons
	name = "1x Photon Disruption Grenades"
	item_cost = 2
	path = /obj/item/weapon/grenade/anti_photon/shell

/datum/uplink_item/item/grenades/anti_photons
	name = "6x Photon Disruption Grenades"
	item_cost = 10
	path = /obj/item/weapon/storage/box/aphotshells
//[/INF]
/datum/uplink_item/item/grenades/smoke
	name = "1x Smoke Grenade"
	desc = "A grenade that will erupt into a vision obscuring cloud of smoke. Makes for great getaways!"
	item_cost = 2
	path = /obj/item/weapon/grenade/smokebomb

/datum/uplink_item/item/grenades/smokes
	name = "5x Smoke Grenades"
	item_cost = 8
	path = /obj/item/weapon/grenade/smokebomb/shell //INF, WAS /obj/item/weapon/storage/box/smokes
//[INF]
/datum/uplink_item/item/grenades/smokeshell
	name = "1x Smoke Grenades"
	item_cost = 2
	path = /obj/item/weapon/storage/box/smokeshells

/datum/uplink_item/item/grenades/smokeshells
	name = "6x Smoke Grenades"
	item_cost = 10
	path = /obj/item/weapon/storage/box/smokeshells
//[/INF]
/datum/uplink_item/item/grenades/emp
	name = "1x EMP Grenade"
	desc = "A grenade that will send electronics into a frenzy, or possibly fry them altogether. The timer is adjustable with a screwdriver."
	item_cost = 5
	path = /obj/item/weapon/grenade/empgrenade

/datum/uplink_item/item/grenades/emps
	name = "5x EMP Grenades"
	item_cost = 15
	path = /obj/item/weapon/storage/box/emps
//[INF]
/datum/uplink_item/item/grenades/empshell
	name = "1x EMP Shells"
	item_cost = 5
	path = /obj/item/weapon/grenade/empgrenade/shell

/datum/uplink_item/item/grenades/empshells
	name = "6x EMP Shells"
	item_cost = 20
	path = /obj/item/weapon/storage/box/empshells
//[/INF]
/datum/uplink_item/item/grenades/frag_high_yield
	name = "Fragmentation Bomb"
	item_cost = 24
	antag_roles = list(MODE_MERCENARY) // yeah maybe regular traitors shouldn't be able to get these
	path = /obj/item/weapon/grenade/frag/high_yield

/datum/uplink_item/item/grenades/fragshell
	name = "1x Fragmentation Shell"
	desc = "Weaker than standard fragmentation grenades, these devices can be fired from a grenade launcher."
	item_cost = 8
	path = /obj/item/weapon/grenade/frag/shell

/datum/uplink_item/item/grenades/fragshells
	name = "5x Fragmentation Shells"
	desc = "Weaker than standard fragmentation grenades, these devices can be fired from a grenade launcher."
	item_cost = 32
	path = /obj/item/weapon/storage/box/fragshells

/datum/uplink_item/item/grenades/frag
	name = "1x Fragmentation Grenade"
	item_cost = 8
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/grenade/frag

/datum/uplink_item/item/grenades/frags
	name = "5x Fragmentation Grenades"
	item_cost = 32
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/box/frags

/datum/uplink_item/item/grenades/supermatter
	name = "1x Supermatter Grenade"
	desc = "This grenade contains a small supermatter shard which will delaminate upon activation and pull in nearby objects, irradiate lifeforms, and eventually explode."
	item_cost = 13
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/grenade/supermatter

/datum/uplink_item/item/grenades/supermatters
	name = "5x Supermatter Grenades"
	desc = "These grenades contains a small supermatter shard which will delaminate upon activation and pull in nearby objects, irradiate lifeforms, and eventually explode."
	item_cost = 52
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/box/supermatters
