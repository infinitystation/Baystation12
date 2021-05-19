/obj/item/storage/firstaid/brute
	name = "brute first-aid kit"
	desc = "Use it when your hands will be broken... Or worse."
	icon_state = "radfirstaid3"
	item_state = "firstaid-advanced"

	startswith = list(
		/obj/item/reagent_containers/hypospray/autoinjector,
		/obj/item/stack/medical/advanced/bruise_pack = 4,
		/obj/item/stack/medical/splint = 2
		)

/obj/item/storage/firstaid/fire/special
	startswith = list(
		/obj/item/reagent_containers/hypospray/autoinjector,
		/obj/item/stack/medical/advanced/ointment = 4,
		/obj/item/storage/pill_bottle/kelotane,
		/obj/item/storage/pill_bottle/paracetamol
		)

/obj/item/storage/firstaid/combat/special
	startswith = list(
		/obj/item/storage/pill_bottle/bicaridine,
		/obj/item/storage/pill_bottle/dermaline,
		/obj/item/storage/pill_bottle/tramadol,
		/obj/item/storage/pill_bottle/dexalin_plus,
		/obj/item/storage/pill_bottle/inaprovaline,
		/obj/item/storage/pill_bottle/dylovene,
		/obj/item/storage/pill_bottle/nanoblood
		)

/obj/item/storage/firstaid/surgery/advanced
	startswith = list(
		/obj/item/bonesetter/bone_mender,
		/obj/item/cautery,
		/obj/item/circular_saw/plasmasaw,
		/obj/item/hemostat/pico,
		/obj/item/retractor,
		/obj/item/scalpel/manager,
		/obj/item/surgicaldrill,
		/obj/item/bonegel,
		/obj/item/FixOVein/clot,
		/obj/item/stack/medical/advanced/bruise_pack,
		)

/*
 * PILL BOTTLES
 * ============
 */

/obj/item/storage/pill_bottle/nanoblood
	name = "pill bottle (Nanoblood)"
	desc = "Contains pills used to treat extreme cases of oxygen deprivation."
	startswith = list(/obj/item/reagent_containers/pill/nanoblood = 14)
	wrapper_color = COLOR_BLUE

/obj/item/storage/pill_bottle/hyronalin
	name = "pill bottle (Hyronalin)"
	desc = "Contains pills used to treat radiation effects."
	startswith = list(/obj/item/reagent_containers/pill/hyronalin = 14)
	wrapper_color = COLOR_YELLOW

