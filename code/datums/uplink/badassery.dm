/************
* Badassery *
************/
/datum/uplink_item/item/badassery
	category = /datum/uplink_category/badassery

/datum/uplink_item/item/badassery/balloon
	name = "For showing that You Are The BOSS (Useless Balloon)"
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	path = /obj/item/toy/balloon

/datum/uplink_item/item/badassery/balloon/corporate
	name = "For showing that you love the company SOO much (Useless Balloon)"
	path = /obj/item/toy/balloon/nanotrasen

/datum/uplink_item/item/badassery/balloon/random
	name = "For showing 'Whatevah~' (Useless Balloon)"
	desc = "Randomly selects a ballon for you!"
	path = /obj/item/toy/balloon

/datum/uplink_item/item/badassery/money_cannon
	name = "Modified Money Cannon"
	item_cost = 48
	path = /obj/item/weapon/gun/launcher/money/hacked
	desc = "Too much money? Not enough screaming? Try the Money Cannon."

/datum/uplink_item/item/badassery/balloon/random/get_goods(var/obj/item/device/uplink/U, var/loc)
	var/balloon_type = pick(typesof(path))
	var/obj/item/I = new balloon_type(loc)
	return I

/datum/uplink_item/item/badassery/crayonmre
	name = "Crayon MRE"
	desc = "Exceptionally robust MRE"
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	path = /obj/item/weapon/storage/mre/menu11/special

/**************
* Random Item *
**************/
/datum/uplink_item/item/badassery/random_one
	name = "Random Item"
	desc = "Buys you a random item for at least 1 TC. Be careful, this can spend any amount of telecrystals!"
	item_cost = 1

/datum/uplink_item/item/badassery/random_one/buy(var/obj/item/device/uplink/U, var/mob/user)
	var/datum/uplink_random_selection/uplink_selection = get_uplink_random_selection_by_type(/datum/uplink_random_selection/default)
	var/datum/uplink_item/item = uplink_selection.get_random_item(U.uses, U)
	return item && item.buy(U, user)

/datum/uplink_item/item/badassery/random_one/can_buy(obj/item/device/uplink/U)
	return U.uses

/datum/uplink_item/item/badassery/random_many
	name = "Random Items"
	desc = "Buys you as many random items as you can afford. Convenient packaging NOT included!"

/datum/uplink_item/item/badassery/random_many/cost(var/telecrystals, obj/item/device/uplink/U)
	return max(1, telecrystals)

/datum/uplink_item/item/badassery/random_many/get_goods(var/obj/item/device/uplink/U, var/loc)
	var/list/bought_items = list()
	for(var/datum/uplink_item/UI in get_random_uplink_items(U, U.uses, loc))
		UI.purchase_log(U)
		var/obj/item/I = UI.get_goods(U, loc)
		if(istype(I))
			bought_items += I

	return bought_items

/datum/uplink_item/item/badassery/random_many/purchase_log(obj/item/device/uplink/U)
	SSstatistics.add_field_details("traitor_uplink_items_bought", "[src]")
	log_and_message_admins("used \the [U.loc] to buy \a [src]")

/****************
* Surplus Crate *
****************/
/datum/uplink_item/item/badassery/surplus
	name = "\improper Surplus Crate"
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT * 4
	var/item_worth = DEFAULT_TELECRYSTAL_AMOUNT * 6
	var/icon

/datum/uplink_item/item/badassery/surplus/New()
	..()
	antag_roles = list(MODE_MERCENARY)
	desc = "A crate containing [item_worth] telecrystal\s worth of surplus leftovers. If you can find some help to pay for it, you might strike gold."

/datum/uplink_item/item/badassery/surplus/get_goods(var/obj/item/device/uplink/U, var/loc)
	var/obj/structure/largecrate/C = new(loc)
	var/random_items = get_random_uplink_items(U, item_worth, C)
	for(var/datum/uplink_item/I in random_items)
		I.purchase_log(U)
		I.get_goods(U, C)

	return C

/datum/uplink_item/item/badassery/surplus/log_icon()
	if(!icon)
		var/obj/structure/largecrate/C = /obj/structure/largecrate
		icon = image(initial(C.icon), initial(C.icon_state))

	return "\icon[icon]"


/datum/uplink_item/item/badassery/bioterror
	name = "Bioterror Kit"
	desc = "Kit, filled with bioweaponery. It contains: Voidsuit, sprayer with poisons, bioterror grenade and military pistol. Don't forget to turn your internals on!"
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/bioterror

/datum/uplink_item/item/badassery/pyro
	name = "Pyro Kit"
	desc = "Kit, used for making FIRES! It contains: Special pyro voidsuit, flamethrower with 2 phoron tanks, 2 incendiary grenades and military pistol."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/pyro

/datum/uplink_item/item/badassery/classic
	name = "Classic Kit"
	desc = "Old and faithful kit. It contains: Heavy armor, assault rifle, cryptographic sequencer and grenade."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/classic

/datum/uplink_item/item/badassery/stealthy
	name = "Stealthy Kit"
	desc = "A special kit for stealthy operations. It contains: Chameleon kit, fake crew annoncement, freedom implant, cryptographic sequencer, military pistol and clerical kit."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/stealthy

/datum/uplink_item/item/badassery/sniper
	name = "Sniper Kit"
	desc = "Fashionable briefcase for fashionable operatives. It contains: Cool-looking armor vest, disguised as a suit, thermal googles and sniper rifle with ammo."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/briefcase/syndie_kit/sniper

/datum/uplink_item/item/badassery/spaceass
	name = "Space Assault Kit"
	desc = "Buy this kit if you want to raid the ship from the space. It contains: Voidsuit, X-4 explosive, assault rifle and cryptographic sequencer."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/spaceass

/datum/uplink_item/item/badassery/saboteur
	name = "Saboteur Kit"
	desc = "You want to sabotage ship systems? This kit is specially for you. It contains: Heavy armor, military pistol, flashdark, chameleon projector, cryptographic sequencer and some C-4 explosives."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/saboteur

/datum/uplink_item/item/badassery/medic
	name = "Field Medic Kit"
	desc = "This kit can provide almost everything for combat medic. It contains: Heavy armor, military pistol, combat medkit, combat defibrilator and surgery kit."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/medic