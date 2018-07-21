/datum/reagent/experimental //Father of all strange reagents
	name = "A001"
	taste_description = "slime"
	taste_mult = 2
	description = "An experimental reagent. Causes heavy mutations. Don't smoke."
	reagent_state = SOLID
	color = "#a8a8a8"

/datum/reagent/experimental/affect_touch(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(33))
		affect_blood(M, alien, removed)

/datum/reagent/experimental/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(prob(67))
		affect_blood(M, alien, removed)

/datum/reagent/experimental/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)

	if(M.isSynthetic())
		return

	var/mob/living/carbon/human/H = M
	if(istype(H) && (H.species.species_flags & SPECIES_FLAG_NO_SCAN))
		return

	if(M.dna)
		if(prob(removed * 0.1)) // Approx. one mutation per 10 injected/20 ingested/30 touching units
			randmuti(M)
			if(prob(98))
				randmutb(M)
			else
				randmutg(M)
			domutcheck(M, null)
			M.UpdateAppearance()
	M.apply_effect(10 * removed, IRRADIATE, blocked = 0)

/obj/item/weapon/reagent_containers/glass/beaker/vial/exp
	New()
		..()
		reagents.add_reagent(/datum/reagent/experimental, 30)
		update_icon()

/obj/item/weapon/reagent_containers/glass/beaker/vial/away
	New()
		..()
		reagents.add_reagent(/datum/reagent/experimental, 5)
		update_icon()

/datum/reagent/rsh2
	name = "A002"
	taste_description = "ash"
	taste_mult = 2
	description = "You don't know what's it... Where's your test subject?"
	reagent_state = SOLID
	color = "#a8a8a8"

/datum/reagent/rsh2/New()
	..()
	name = "ER-[rand(9999)]"

/datum/reagent/rsh2/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		M.gib()

/datum/reagent/rsh3
	name = "A003"
	taste_description = "flour"
	taste_mult = 2
	description = "You don't know what's it... Where's your test subject?"
	reagent_state = SOLID
	color = "#a8a8a8"

/datum/reagent/rsh3/New()
	..()
	name = "ER-[rand(9999)]"

/datum/reagent/rsh3/affect_blood(var/mob/living/carbon/human/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		for(var/obj/item/organ/external/E in M.bad_external_organs)
			if(E.status & ORGAN_BROKEN && E.damage < E.min_broken_damage)
				E.mend_fracture()
				to_chat(M, "<span class='alium'>You feel something mend itself inside your [E.name].</span>")
			return 1


/datum/reagent/rsh4
	name = "A004"
	taste_description = "milk"
	taste_mult = 2
	description = "You don't know what's it... Where's your test subject?"
	reagent_state = SOLID
	color = "#a8a8a8"

/datum/reagent/rsh4/New()
	..()
	name = "ER-[rand(9999)]"

/datum/reagent/rsh4/affect_blood(var/mob/living/carbon/human/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		if(M.gender != MALE)
			to_chat(M, "<span class='notice'>Я чувствую себ&#255;... Странно. М&#255;гкое, при&#255;тное тепло распростран&#255;етс&#255; по всему моему телу, особенно по груди, почему-то заставл&#255;&#255; её становитьс&#255;... Легче? Мен&#255; немного пугает ощущение того, как тепло распростран&#255;етс&#255; по моему паху...</span>")
			M.gender = MALE
		else
			to_chat(M, "<span class='notice'>Я чувствую себ&#255;... Странно. М&#255;гкое, при&#255;тное тепло распростран&#255;етс&#255; по всему моему телу, особенно по груди, почему-то заставл&#255;&#255; её т&#255;жалеть... Мен&#255; немного пугает ощущение того, как тепло распростран&#255;етс&#255; по моему паху...</span>")
			M.gender = FEMALE
	M.update_icon()
	remove_self(volume)
	return