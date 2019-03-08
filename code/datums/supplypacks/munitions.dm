/decl/hierarchy/supply_pack/munition
	name = "Ship Munitions"
	containertype = /obj/structure/largecrate
	containername = "Ammunition crate"

/decl/hierarchy/supply_pack/munition/md_slug
	name = "Ammo - Mass Driver Slug"
	contains = list(/obj/structure/ship_munition/md_slug)
	cost = 100

/decl/hierarchy/supply_pack/munition/ap_slug
	name = "Ammo - Armor Piercing Mass Driver Slug"
	contains = list(/obj/structure/ship_munition/ap_slug)
	cost = 120

/decl/hierarchy/supply_pack/munition/bsa_charge_explosive
	name = "BSA Ammo - improper BSA-XP4-INDARRA charge - type: explosive"
	contains = list(/obj/structure/ship_munition/bsa_charge/explosive)
	cost = 150

/decl/hierarchy/supply_pack/munition/bsa_charge_fire
	name = "BSA Ammo - improper BSA-FR1-ENFER charge - type: Fire"
	contains = list(/obj/structure/ship_munition/bsa_charge/fire)
	cost = 140

/decl/hierarchy/supply_pack/munition/bsa_charge_emp
	name = "BSA Ammo - improper BSA-EM2-QUASAR charge - type: EMP"
	contains = list(/obj/structure/ship_munition/bsa_charge/emp)
	cost = 130

/decl/hierarchy/supply_pack/munition/bsa_charge_mining
	name = "BSA Ammo - improper BSA-MN3-BERGBAU charge - type: mining"
	contains = list(/obj/structure/ship_munition/bsa_charge/mining)
	cost = 120