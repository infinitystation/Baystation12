/datum/reagent/toxin/zombie
	name = "Romerol"
	description = "A filthy, oily substance which slowly churns of its own accord."
	taste_description = "decaying blood"
	color = "#00803a"
	taste_mult = 5
	strength = 0.1
	metabolism = REM * 0.5
	overdose = 45
	hidden_from_codex = TRUE
	heating_products = null
	heating_point = null
	var/amount_to_zombify = 5
	var/progress_zombify = 360

/datum/reagent/toxin/zombie/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	affect_blood(M, alien, removed * 0.5)

/datum/reagent/toxin/zombie/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	. = ..()
	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M

		var/true_dose = H.chem_doses[type] + volume

		if(H.get_organ(BP_ZOMB))
			return
		else if (true_dose >= amount_to_zombify)
			if(locate(/obj/item/organ/internal/romerol) in H)
				return
			var/obj/item/organ/internal/romerol/ooze = new(H.get_organ(BP_HEAD))
			ooze.replaced(H, progress_zombify)
		else if (prob(10))
			to_chat(H, "<span class='warning'>You feel terribly ill!</span>")
