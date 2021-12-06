/obj/machinery/suit_cycler/exploration/sierra
	name = "Exploration suit cycler"
	model_text = "Exploration"
	req_access = list(access_explorer)
	available_modifications = list(/decl/item_modifier/space_suit/explorer)

/obj/machinery/suit_cycler/exploration/sierra/attackby(obj/item/I, mob/user)
	var/is_exp_helm = istype(I, /obj/item/clothing/head/helmet/space/void/exploration/sierra)
	var/is_exp_suit = istype(I, /obj/item/clothing/suit/space/void/exploration/sierra)
	if (!is_exp_suit && !is_exp_helm)
		return
	..()

/obj/machinery/suit_cycler/exploration/sierra/apply_paintjob()
	if(!target_species || !target_modification)
		return

	if (helmet)
		helmet.refit_for_species(target_species)
	if (suit)
		suit.refit_for_species(target_species)
