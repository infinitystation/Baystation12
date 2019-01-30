/decl/hierarchy/supply_pack/munition
	name = "Ship Munitions"
	containertype = /obj/structure/largecrate
	containername = "mass driver munition crate"

/decl/hierarchy/supply_pack/munition/md_slug
	name = "Ammo - Mass Driver Slug"
	contains = list(/obj/structure/ship_munition/md_slug)
	cost = 100


/decl/hierarchy/supply_pack/munition/ap_slug
	name = "Ammo - Armor Piercing Mass Driver Slug"
	contains = list(/obj/structure/ship_munition/ap_slug)
	cost = 120

/obj/structure/ship_munition/bsa_charge/explosive
	name = "BSA Ammo - improper BSA-XP4-INDARRA charge - type: explosive"
	contains = list(/obj/structure/ship_munition/ap_slug)
	cost = 120

/obj/structure/ship_munition/bsa_charge/fire
	name = "BSA Ammo - improper BSA-FR1-ENFER charge - type: Fire"
	contains = list(/obj/structure/ship_munition/ap_slug)
	cost = 100

/obj/structure/ship_munition/bsa_charge/emp
	name = "BSA Ammo - improper BSA-EM2-QUASAR charge - type: EMP"
	contains = list(/obj/structure/ship_munition/ap_slug)
	cost = 90

/obj/structure/ship_munition/bsa_charge/mining
	name = "BSA Ammo - improper BSA-MN3-BERGBAU charge - type: mining"
	contains = list(/obj/structure/ship_munition/ap_slug)
	cost = 80

