/obj/item/weapon/storage/backpack/satchel/pocketbook/navy
	name = "navy pocketbook"
	color = "#1c2133"

/obj/item/weapon/storage/backpack/satchel/pocketbook/khaki
	name = "khaki pocketbook"
	color = "#baa481"

/obj/item/weapon/storage/belt/utility/full_buy/New()
	..()
	new /obj/item/weapon/screwdriver(src)
	new /obj/item/weapon/wrench(src)
	new /obj/item/weapon/weldingtool(src)
	new /obj/item/weapon/crowbar(src)
	new /obj/item/weapon/wirecutters(src)
	new /obj/item/device/multitool(src)

/obj/item/weapon/storage/belt/medical/emt/combat
	name = "combat medical belt"

/obj/item/weapon/storage/belt/medical/emt/combat/New()
	..()
	new /obj/item/weapon/storage/pill_bottle/dylovene(src)
	new /obj/item/weapon/storage/pill_bottle/dexalin(src)
	new /obj/item/weapon/storage/pill_bottle/spaceacillin(src)
	new /obj/item/weapon/storage/pill_bottle/bicaridine(src)
	new /obj/item/weapon/storage/pill_bottle/inaprovaline(src)
	new /obj/item/weapon/storage/pill_bottle/tramadol(src)
	new /obj/item/weapon/storage/pill_bottle/kelotane(src)

/obj/item/weapon/storage/belt/holster/security/ocei/New()
	..()
	new /obj/item/taperoll/police(src)
	new /obj/item/weapon/melee/baton/loaded(src)
	new /obj/item/device/flashlight/maglight(src)
	new /obj/item/weapon/handcuffs(src)
	new /obj/item/ammo_magazine/c45m(src)
	new /obj/item/ammo_magazine/c45m(src)
	new /obj/item/weapon/gun/projectile/sec/lethal(src)

/obj/item/weapon/storage/belt/holster/security/tactical/troops/New()
	..()
	new /obj/item/ammo_magazine/mc9mmt(src)
	new /obj/item/ammo_magazine/mc9mmt(src)
	new /obj/item/ammo_magazine/mc9mmt(src)
	new /obj/item/ammo_magazine/mc9mmt(src)
	new /obj/item/ammo_magazine/mc9mmt(src)
	new /obj/item/ammo_magazine/mc9mmt(src)
	new /obj/item/weapon/gun/projectile/sec/lethal(src)
	new /obj/item/ammo_magazine/c45m(src)

/obj/item/weapon/storage/belt/holster/security/tactical/troops_sts/New()
	..()
	new /obj/item/ammo_magazine/c556(src)
	new /obj/item/ammo_magazine/c556(src)
	new /obj/item/ammo_magazine/c556(src)
	new /obj/item/ammo_magazine/c556(src)
	new /obj/item/ammo_magazine/c556(src)
	new /obj/item/ammo_magazine/c556(src)
	new /obj/item/weapon/gun/projectile/sec/lethal(src)
	new /obj/item/ammo_magazine/c45m(src)

//Personal firstaid kit

/obj/item/weapon/storage/firstaid/individual
	name = "master kit"
	icon = 'icons/obj/items_inf.dmi'
	icon_state = "survivalmed"
	slot_flags = SLOT_BELT
	storage_slots  = 10
	can_hold = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/ointment,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/stack/medical/advanced,
		/obj/item/weapon/reagent_containers/syringe
		)

/obj/item/weapon/storage/firstaid/individual/all
	name = "individual medical kit"
	desc = "A small box decorated in warning colors that contains a limited supply of medical reagents."
	startswith = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/inaprovaline,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/ointment
		)

/obj/item/weapon/storage/firstaid/individual/military
	name = "military individual medical kit"
	desc = "A small box decorated in dark colors that contains a limited supply of medical reagents."
	icon_state = "survivalmilmed"
	startswith = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/burn,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/brute,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/pain,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/detox,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/inaprovaline,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/ointment
		)

/obj/item/weapon/storage/firstaid/individual/military/troops
	startswith = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/burn,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/brute,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/inaprovaline,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/pain = 2,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/stack/medical/ointment
		)

/obj/item/weapon/storage/firstaid/combat/special
	startswith = list(
		/obj/item/weapon/storage/pill_bottle/bicaridine,
		/obj/item/weapon/storage/pill_bottle/dermaline,
		/obj/item/weapon/storage/pill_bottle/tramadol,
		/obj/item/weapon/storage/pill_bottle/dexalin_plus,
		/obj/item/weapon/storage/pill_bottle/inaprovaline,
		/obj/item/weapon/storage/pill_bottle/dylovene,
		/obj/item/weapon/storage/pill_bottle/nanoblood
		)

/obj/item/weapon/storage/firstaid/brute
	name = "brute first-aid kit"
	desc = "Use it when your hands will be broken... Or worse."
	icon_state = "radfirstaid3"
	item_state = "firstaid-advanced"

	startswith = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector,
		/obj/item/stack/medical/advanced/bruise_pack = 4,
		/obj/item/stack/medical/splint = 2
		)

/obj/item/weapon/storage/firstaid/fire/special
	startswith = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector,
		/obj/item/stack/medical/advanced/ointment = 4,
		/obj/item/weapon/storage/pill_bottle/kelotane,
		/obj/item/weapon/storage/pill_bottle/paracetamol
		)

/obj/item/weapon/storage/box/survival/troops
	name = "field survival kit"
	startswith = list(/obj/item/clothing/mask/breath = 1,
					/obj/item/weapon/tank/emergency/oxygen = 1,
					/obj/item/device/flashlight/flare/glowstick = 1,
					/obj/item/weapon/crowbar/prybar = 1,
					/obj/item/device/radio/off = 1,
					/obj/item/weapon/reagent_containers/food/snacks/liquidfood = 2)

/obj/item/weapon/storage/backpack/explorer_resomi
	name = "exploratory backpack"
	desc = "A large backpack in which there are a lot of pockets. Too small for tall humanoids."
	icon = 'icons/infinity_custom_items_obj.dmi'
	item_icons = list(slot_back_str = 'icons/infinity_custom_items_mob.dmi')
	icon_state = "explorer_backpack"
	item_state = "explorer_backpack"
	sprite_sheets = list(SPECIES_RESOMI = 'icons/infinity_custom_items_mob.dmi')
