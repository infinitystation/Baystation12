//Better version of subdermal reinforcers

/obj/item/organ/internal/augment/armor/reinf
	name = "subdermal armor"
	icon_state = "implant-reinforcers"
	desc = "A very strong reinforcements, purposed to block incoming attacks."
	brute_mult = 0.6
	burn_mult = 0.8

//Cool organs

/obj/item/organ/internal/nanites
	name = "nanite hub"
	desc = "A complex device, capable of working with simple repairing nanites."
	icon = 'infinity/icons/obj/surgery.dmi'
	icon_state = "implant-nanites"
	parent_organ = BP_CHEST
	organ_tag = BP_IMPLANT_NANITES

	var/charge = 300
	var/upcharging = 0

/obj/item/organ/internal/nanites/Process()
	if(owner && istype(owner))
		if(!canFindLace())
			return

		if(upcharging)
			if(charge >= initial(charge))
				upcharging = 0
				to_chat(owner, SPAN_NOTICE("Unit recharged. Nanite field activated successfuly. Systems online."))
			else
				charge += 1
				return

		if(charge <= 0)
			to_chat(owner, SPAN_DANGER("Warning: Critical damage treshold passed. Shut down unit to avoid further damage"))
			upcharging = 1
			return

		for(var/obj/item/organ/internal/I in owner.organs)
			if(BP_IS_ROBOTIC(I))
				I.heal_damage(0.75)
				charge -= 1
		for(var/obj/item/organ/external/E in owner.organs)
			if(BP_IS_ROBOTIC(E))
				E.heal_damage(0.5)
				charge -= 1

/obj/item/organ/internal/filter
	name = "artifitial blood filter"
	desc = "An liver-like, which can filter blood from dangerous toxins."
	icon = 'infinity/icons/obj/surgery.dmi'
	icon_state = "implant-filter"
	parent_organ = BP_CHEST
	organ_tag = BP_IMPLANT_FILTER

/obj/item/organ/internal/filter/Process()
	if(owner && istype(owner))
		if(!canFindLace())
			return
		var/efficiency = 1
		if(owner.chem_effects[CE_ALCOHOL])
			efficiency = efficiency * 1.25

		if(owner.chem_effects[CE_TOXIN])
			efficiency = efficiency * 0.5

		if(owner.chem_effects[CE_ALCOHOL_TOXIC])
			efficiency = efficiency * 0.5

		owner.adjustToxLoss(efficiency)

/obj/item/organ/internal/electro
	name = "internal grounding cell"
	desc = "Complex device, which will ground most of electrical shocks."
	icon = 'infinity/icons/obj/surgery.dmi'
	icon_state = "implant-electro"
	parent_organ = BP_CHEST
	organ_tag = BP_IMPLANT_ELECTRO

	var/charge = 4

/obj/item/organ/internal/electro/Process()
	if(owner && istype(owner))
		if(!canFindLace())
			return

		if(charge < 4)
			charge += 0.05

/obj/item/organ/internal/electro/proc/calculate_ecute(var/shock_damage)
	if(owner && istype(owner))
		if(!canFindLace())
			return

			if(charge >= 1)
				charge = 1
				return shock_damage * 0.25 * (1 / charge)
	return shock_damage