/* First aid storage
 * Contains:
 *		First Aid Kits
 * 		Pill Bottles
 *		Private First Aid Kits
 */

/*
 * First Aid Kits
 */
/obj/item/weapon/storage/firstaid
	name = "first-aid kit"
	desc = "It's an emergency medical kit for those serious boo-boos."
	icon_state = "firstaid"
	throw_speed = 2
	throw_range = 8
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = DEFAULT_BOX_STORAGE

/obj/item/weapon/storage/firstaid/empty
	icon_state = "firstaid"
	name = "First-Aid (empty)"

/obj/item/weapon/storage/firstaid/fire
	name = "fire first-aid kit"
	desc = "It's an emergency medical kit for when the toxins lab <i>-spontaneously-</i> burns down."
	icon_state = "ointment"
	item_state = "firstaid-ointment"

	startswith = list(
		/obj/item/device/healthanalyzer,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector,
		/obj/item/stack/medical/ointment,
		/obj/item/weapon/storage/pill_bottle/kelotane,
		/obj/item/weapon/storage/pill_bottle/paracetamol
		)

/obj/item/weapon/storage/firstaid/fire/special
	startswith = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector,
		/obj/item/stack/medical/advanced/ointment = 4,
		/obj/item/weapon/storage/pill_bottle/kelotane,
		/obj/item/weapon/storage/pill_bottle/paracetamol
		)


/obj/item/weapon/storage/firstaid/fire/New()
	..()
	icon_state = pick("ointment","firefirstaid")

/obj/item/weapon/storage/firstaid/regular
	icon_state = "firstaid"

	startswith = list(
		/obj/item/stack/medical/bruise_pack = 2,
		/obj/item/stack/medical/ointment = 1,
		/obj/item/device/healthanalyzer,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector,
		/obj/item/weapon/storage/pill_bottle/antidexafen,
		/obj/item/weapon/storage/pill_bottle/paracetamol
		)

/obj/item/weapon/storage/firstaid/toxin
	name = "toxin first-aid kit"
	desc = "Used to treat when you have a high amount of toxins in your body."
	icon_state = "antitoxin"
	item_state = "firstaid-toxin"

	startswith = list(
		/obj/item/weapon/reagent_containers/syringe/antitoxin = 3,
		/obj/item/weapon/storage/pill_bottle/antitox,
		/obj/item/device/healthanalyzer,
		)

/obj/item/weapon/storage/firstaid/toxin/New()
	..()
	icon_state = pick("antitoxin","antitoxfirstaid","antitoxfirstaid2","antitoxfirstaid3")

/obj/item/weapon/storage/firstaid/o2
	name = "oxygen first-aid kit"
	desc = "A box full of oxygen goodies."
	icon_state = "o2"
	item_state = "firstaid-o2"

	startswith = list(
		/obj/item/weapon/storage/pill_bottle/dexalin,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector,
		/obj/item/weapon/reagent_containers/syringe/inaprovaline,
		/obj/item/device/healthanalyzer,
		)

/obj/item/weapon/storage/firstaid/adv
	name = "advanced first-aid kit"
	desc = "Contains advanced medical treatments."
	icon_state = "advfirstaid"
	item_state = "firstaid-advanced"

	startswith = list(
		/obj/item/weapon/reagent_containers/hypospray/autoinjector,
		/obj/item/stack/medical/advanced/bruise_pack = 3,
		/obj/item/stack/medical/advanced/ointment = 2,
		/obj/item/stack/medical/splint
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

/obj/item/weapon/storage/firstaid/combat
	name = "combat medical kit"
	desc = "Contains advanced medical treatments."
	icon_state = "bezerk"
	item_state = "firstaid-advanced"

	startswith = list(
		/obj/item/weapon/storage/pill_bottle/bicaridine,
		/obj/item/weapon/storage/pill_bottle/dermaline,
		/obj/item/weapon/storage/pill_bottle/dexalin_plus,
		/obj/item/weapon/storage/pill_bottle/dylovene,
		/obj/item/weapon/storage/pill_bottle/tramadol,
		/obj/item/weapon/storage/pill_bottle/spaceacillin,
		/obj/item/stack/medical/splint,
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

/obj/item/weapon/storage/firstaid/surgery
	name = "surgery kit"
	desc = "Contains tools for surgery. Has precise foam fitting for safe transport and automatically sterilizes the content between uses."
	icon_state = "surgerykit"
	item_state = "firstaid-surgery"
	storage_slots = 14
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = null

	can_hold = list(
		/obj/item/weapon/bonesetter,
		/obj/item/weapon/cautery,
		/obj/item/weapon/circular_saw,
		/obj/item/weapon/hemostat,
		/obj/item/weapon/retractor,
		/obj/item/weapon/scalpel,
		/obj/item/weapon/surgicaldrill,
		/obj/item/weapon/bonegel,
		/obj/item/weapon/FixOVein,
		/obj/item/stack/medical/advanced/bruise_pack,
		/obj/item/stack/nanopaste
		)

	startswith = list(
		/obj/item/weapon/bonesetter,
		/obj/item/weapon/cautery,
		/obj/item/weapon/circular_saw,
		/obj/item/weapon/hemostat,
		/obj/item/weapon/retractor,
		/obj/item/weapon/scalpel,
		/obj/item/weapon/surgicaldrill,
		/obj/item/weapon/bonegel,
		/obj/item/weapon/FixOVein,
		/obj/item/stack/medical/advanced/bruise_pack,
		)

/*
 * Pill Bottles
 */
/obj/item/weapon/storage/pill_bottle
	name = "pill bottle"
	desc = "It's an airtight container for storing medication."
	icon_state = "pill_canister"
	icon = 'icons/obj/chemical_new.dmi'
	item_state = "contsolid"
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_TINY
	max_storage_space = 21
	can_hold = list(/obj/item/weapon/reagent_containers/pill,/obj/item/weapon/dice,/obj/item/weapon/paper)
	allow_quick_gather = 1
	use_to_pickup = 1
	use_sound = null

/obj/item/weapon/storage/pill_bottle/antitox
	name = "bottle of Dylovene pills"
	icon_state = "pill_canister_gre"
	desc = "Contains pills used to counter toxins."

	startswith = list(/obj/item/weapon/reagent_containers/pill/antitox = 21)

/obj/item/weapon/storage/pill_bottle/bicaridine
	name = "bottle of Bicaridine pills"
	icon_state = "pill_canister_red"
	desc = "Contains pills used to stabilize the severely injured."

	startswith = list(/obj/item/weapon/reagent_containers/pill/bicaridine = 21)

/obj/item/weapon/storage/pill_bottle/dexalin_plus
	name = "bottle of Dexalin Plus pills"
	icon_state = "pill_canister_blu"
	desc = "Contains pills used to treat extreme cases of oxygen deprivation."

	startswith = list(/obj/item/weapon/reagent_containers/pill/dexalin_plus = 14)

/obj/item/weapon/storage/pill_bottle/dexalin
	name = "bottle of Dexalin pills"
	icon_state = "pill_canister_blu"
	desc = "Contains pills used to treat oxygen deprivation."

	startswith = list(/obj/item/weapon/reagent_containers/pill/dexalin = 21)

/obj/item/weapon/storage/pill_bottle/dermaline
	name = "bottle of Dermaline pills"
	icon_state = "pill_canister_yel"
	desc = "Contains pills used to treat burn wounds."

	startswith = list(/obj/item/weapon/reagent_containers/pill/dermaline = 14)

/obj/item/weapon/storage/pill_bottle/hyronalin
	name = "bottle of Hyronalin pills"
	desc = "Contains pills used to treat radiation effects."

	startswith = list(/obj/item/weapon/reagent_containers/pill/hyronalin = 14)

/obj/item/weapon/storage/pill_bottle/dylovene
	name = "bottle of Dylovene pills"
	icon_state = "pill_canister_gre"
	desc = "Contains pills used to treat toxic substances in the blood."

	startswith = list(/obj/item/weapon/reagent_containers/pill/dylovene = 21)

/obj/item/weapon/storage/pill_bottle/inaprovaline
	name = "bottle of Inaprovaline pills"
	icon_state = "pill_canister_whi"
	desc = "Contains pills used to stabilize patients."

	startswith = list(/obj/item/weapon/reagent_containers/pill/inaprovaline = 21)

/obj/item/weapon/storage/pill_bottle/nanoblood
	name = "bottle of Nanoblood pills"
	desc = "Contains pills used to return patient's blood level in near-normal condition. Cause overdose with small liver damage due toxins - don't distibute for untrained personal. Don't use it if patient have infected wounds."

	startswith = list(/obj/item/weapon/reagent_containers/pill/nanoblood = 14)

/obj/item/weapon/storage/pill_bottle/kelotane
	name = "bottle of kelotane pills"
	icon_state = "pill_canister_yel"
	desc = "Contains pills used to treat burns."

	startswith = list(/obj/item/weapon/reagent_containers/pill/kelotane = 21)

/obj/item/weapon/storage/pill_bottle/spaceacillin
	name = "bottle of Spaceacillin pills"
	icon_state = "pill_canister_gre"
	desc = "A theta-lactam antibiotic. Effective against many diseases likely to be encountered in space."

	startswith = list(/obj/item/weapon/reagent_containers/pill/spaceacillin = 14)

/obj/item/weapon/storage/pill_bottle/tramadol
	name = "bottle of Tramadol pills"
	icon_state = "pill_canister_pin"
	desc = "Contains pills used to relieve pain."

	startswith = list(/obj/item/weapon/reagent_containers/pill/tramadol = 14)

//Baycode specific Psychiatry pills.
/obj/item/weapon/storage/pill_bottle/citalopram
	name = "bottle of Citalopram pills"
	desc = "Mild antidepressant. For use in individuals suffering from depression or anxiety. 15u dose per pill."

	startswith = list(/obj/item/weapon/reagent_containers/pill/citalopram = 21)

/obj/item/weapon/storage/pill_bottle/methylphenidate
	name = "bottle of Methylphenidate pills"
	desc = "Mental stimulant. For use in individuals suffering from ADHD, or general concentration issues. 15u dose per pill."

	startswith = list(/obj/item/weapon/reagent_containers/pill/methylphenidate = 21)

/obj/item/weapon/storage/pill_bottle/paroxetine
	name = "bottle of Paroxetine pills"
	desc = "High-strength antidepressant. Only for use in severe depression. 10u dose per pill. <span class='warning'>WARNING: side-effects may include hallucinations.</span>"

	startswith = list(/obj/item/weapon/reagent_containers/pill/paroxetine = 14)

/obj/item/weapon/storage/pill_bottle/antidexafen
	name = "bottle of cold medicine pills"
	desc = "All-in-one cold medicine. 15u dose per pill. Safe for babies like you!"

	startswith = list(/obj/item/weapon/reagent_containers/pill/antidexafen = 21)

/obj/item/weapon/storage/pill_bottle/paracetamol
	name = "bottle of paracetamol"
	icon_state = "pill_canister_pin"
	desc = "Mild painkiller, also known as Tylenol. Won't fix the cause of your headache (unlike cyanide), but might make it bearable."

	startswith = list(/obj/item/weapon/reagent_containers/pill/paracetamol = 21)

//Personal firstaid kit

/obj/item/weapon/storage/firstaid/individual
	name = "master kit"
	icon = 'icons/obj/infinity_object.dmi'
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
