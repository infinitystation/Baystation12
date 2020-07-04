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

/obj/item/weapon/storage/firstaid/surgery/advanced
	startswith = list(
		/obj/item/weapon/bonesetter/bone_mender,
		/obj/item/weapon/cautery,
		/obj/item/weapon/circular_saw/plasmasaw,
		/obj/item/weapon/hemostat/pico,
		/obj/item/weapon/retractor,
		/obj/item/weapon/scalpel/manager,
		/obj/item/weapon/surgicaldrill,
		/obj/item/weapon/bonegel,
		/obj/item/weapon/FixOVein/clot,
		/obj/item/stack/medical/advanced/bruise_pack,
		)

/*
 * PILL BOTTLES
 * ============
 */

/obj/item/weapon/storage/pill_bottle/nanoblood
	name = "pill bottle (Nanoblood)"
	desc = "Contains pills used to treat extreme cases of oxygen deprivation."
	startswith = list(/obj/item/weapon/reagent_containers/pill/nanoblood = 14)
	wrapper_color = COLOR_BLUE

/obj/item/weapon/storage/pill_bottle/hyronalin
	name = "pill bottle (Hyronalin)"
	desc = "Contains pills used to treat radiation effects."
	startswith = list(/obj/item/weapon/reagent_containers/pill/hyronalin = 14)
	wrapper_color = COLOR_YELLOW

