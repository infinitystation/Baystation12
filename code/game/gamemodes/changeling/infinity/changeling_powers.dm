var/global/list/possible_changeling_IDs = list("Alpha","Beta","Gamma","Delta","Epsilon","Zeta","Eta","Theta","Iota","Kappa","Lambda","Mu","Nu","Xi","Omicron","Pi","Rho","Sigma","Tau","Upsilon","Phi","Chi","Psi","Omega")

/datum/changeling //stores changeling powers, changeling recharge thingie, changeling absorbed DNA and changeling ID (for changeling hivemind)
	var/list/datum/absorbed_dna/absorbed_dna = list()
	var/list/absorbed_languages = list()
	var/absorbedcount = 0
	var/chem_charges = 20
	var/chem_recharge_rate = 0.5
	var/chem_storage = 50
	var/sting_range = 1
	var/changelingID = "Changeling"
	var/geneticdamage = 0
	var/isabsorbing = 0
	var/geneticpoints = 10
	var/purchasedpowers = list()
	var/mimicing = ""

/datum/changeling/New(var/gender=FEMALE)
	..()
	var/honorific = (gender == FEMALE) ? "Ms." : "Mr."
	if(possible_changeling_IDs.len)
		changelingID = pick(possible_changeling_IDs)
		possible_changeling_IDs -= changelingID
		changelingID = "[honorific] [changelingID]"
	else
		changelingID = "[honorific] [rand(1,999)]"

/datum/changeling/proc/regenerate()
	chem_charges = min(max(0, chem_charges+chem_recharge_rate), chem_storage)
	geneticdamage = max(0, geneticdamage-1)

/datum/changeling/proc/GetDNA(var/dna_owner)
	for(var/datum/absorbed_dna/DNA in absorbed_dna)
		if(dna_owner == DNA.name)
			return DNA

/mob/proc/absorbDNA(var/datum/absorbed_dna/newDNA)
	var/datum/changeling/changeling = null
	if(src.mind && src.mind.changeling)
		changeling = src.mind.changeling
	if(!changeling)
		return

	for(var/language in newDNA.languages)
		changeling.absorbed_languages |= language

	changeling_update_languages(changeling.absorbed_languages)

	if(!changeling.GetDNA(newDNA.name)) // Don't duplicate - I wonder if it's possible for it to still be a different DNA? DNA code could use a rewrite
		changeling.absorbed_dna += newDNA

//Restores our verbs. It will only restore verbs allowed during lesser (monkey) form if we are not human
/mob/proc/make_changeling()

	if(!mind)				return
	if(!mind.changeling)	mind.changeling = new /datum/changeling(gender)

	verbs += /datum/changeling/proc/EvolutionMenu
	add_language("Changeling")

	if(iscarbon(src))
		var/mob/living/carbon/C = src
		var/obj/item/organ/internal/brain/brain = C.internal_organs_by_name[BP_BRAIN]
		if(brain)
			brain.fake_brain = 1

	var/lesser_form = !ishuman(src)

	if(!powerinstances.len)
		for(var/P in powers)
			powerinstances += new P()

	// Code to auto-purchase free powers.
	for(var/datum/power/changeling/P in powerinstances)
		if(!P.genomecost) // Is it free?
			if(!(P in mind.changeling.purchasedpowers)) // Do we not have it already?
				mind.changeling.purchasePower(mind, P.name, 0)// Purchase it. Don't remake our verbs, we're doing it after this.

	for(var/datum/power/changeling/P in mind.changeling.purchasedpowers)
		if(P.isVerb)
			if(lesser_form && !P.allowduringlesserform)	continue
			if(!(P in src.verbs))
				src.verbs += P.verbpath

	for(var/language in languages)
		mind.changeling.absorbed_languages |= language

	var/mob/living/carbon/human/H = src
	if(istype(H))
		var/datum/absorbed_dna/newDNA = new(H.real_name, H.dna, H.species.name, H.languages, H.flavor_texts)
		absorbDNA(newDNA)

	return 1

//removes our changeling verbs
/mob/proc/remove_changeling_powers()
	if(!mind || !mind.changeling)	return

	if(iscarbon(src))
		var/mob/living/carbon/C = src
		var/obj/item/organ/internal/brain/brain = C.internal_organs_by_name[BP_BRAIN]
		if(brain)
			brain.fake_brain = 0

	for(var/datum/power/changeling/P in mind.changeling.purchasedpowers)
		if(P.isVerb)
			verbs -= P.verbpath


//Helper proc. Does all the checks and stuff for us to avoid copypasta
/mob/proc/changeling_power(var/required_chems=0, var/required_dna=0, var/max_genetic_damage=100, var/max_stat=0)

	if(!src.mind)		return
	if(!iscarbon(src))	return

	var/datum/changeling/changeling = src.mind.changeling
	if(!changeling)
		to_world_log("[src] has the changeling_transform() verb but is not a changeling.")
		return

	if(src.stat > max_stat)
		to_chat(src, SPAN_LING("We are incapacitated."))
		return

	if(changeling.absorbed_dna.len < required_dna)
		to_chat(src, SPAN_LING("We require at least [required_dna] samples of compatible DNA."))
		return

	if(changeling.chem_charges < required_chems)
		to_chat(src, SPAN_LING("We require at least [required_chems] units of chemicals to do that!"))
		return

	if(changeling.geneticdamage > max_genetic_damage)
		to_chat(src, SPAN_LING("Our genomes are still reassembling. We need time to recover first."))
		return

	return changeling


//Used to dump the languages from the changeling datum into the actual mob.
/mob/proc/changeling_update_languages(var/updated_languages)

	languages = list()
	for(var/language in updated_languages)
		languages += language

	//This isn't strictly necessary but just to be safe...
	add_language("Changeling")

	return

//Absorbs the victim's DNA making them uncloneable. Requires a strong grip on the victim.
//Doesn't cost anything as it's the most basic ability.
/mob/proc/changeling_absorb_dna()
	set category = "Changeling"
	set name = "Absorb DNA"

	var/datum/changeling/changeling = changeling_power(0,0,100)
	if(!changeling)	return

	var/obj/item/grab/G = src.get_active_hand()
	if(!istype(G))
		to_chat(src, SPAN_LING("We must be grabbing a creature in our active hand to absorb them."))
		return

	var/mob/living/carbon/human/T = G.affecting
	if(!istype(T))
		to_chat(src, SPAN_LING("[T] is not compatible with our biology."))
		return

	if(T.isSynthetic())
		to_chat(src, SPAN_LING("We cannot extract DNA from a synthetic life form!"))
		return

	if(T.species.species_flags & SPECIES_FLAG_NO_SCAN)
		to_chat(src, SPAN_LING("We do not know how to parse this creature's DNA!"))
		return

	if(islesserform(T))
		to_chat(src, SPAN_LING("This creature DNA is not compatible with our form!"))
		return

	if(MUTATION_HUSK in T.mutations)
		to_chat(src, SPAN_LING("This creature's DNA is ruined beyond useability!"))
		return

	if(!G.can_absorb())
		to_chat(src, SPAN_LING("We must have a tighter grip to absorb this creature."))
		return

	if(changeling.isabsorbing)
		to_chat(src, SPAN_LING("We are already absorbing!"))
		return

	var/obj/item/organ/external/affecting = T.get_organ(src.zone_sel.selecting)
	if(!affecting)
		to_chat(src, "<span class='warning'>They are missing that body part!</span>")

	changeling.isabsorbing = 1
	for(var/stage = 1, stage<=3, stage++)
		switch(stage)
			if(1)
				src.visible_message(SPAN_WARNING("[src]'s skin begins to shift and squirm!"), SPAN_LING("This creature is compatible. We must hold still... Our skin begins to shift and squirm for a proboscis."))
				T.stuttering += 40 // horror effect
				if(!do_mob(src, T, 80))
					to_chat(src, SPAN_LING("Our absorption has been interrupted!"))
					changeling.isabsorbing = 0
					return
			if(2)
				src.visible_message(SPAN_WARNING("[src] extends a proboscis!"), SPAN_LING("We extend a proboscis, let's find a good point for extraction..."))
				playsound(get_turf(src), 'sound/effects/lingextends.ogg', 50, 1)
				if(!do_mob(src, T, 80))
					to_chat(src, SPAN_LING("Our absorption has been interrupted!"))
					changeling.isabsorbing = 0
					return
			if(3)
				src.visible_message(SPAN_DANGER("[src] stabs \the [T] with the proboscis!"), SPAN_NOTICE("We stab \the [T] with the proboscis."))
				to_chat(T, SPAN_DANGER("You feel a sharp stabbing pain in your [affecting.name]!"))
				playsound(get_turf(src), 'sound/effects/lingstabs.ogg', 50, 1)
				affecting.take_external_damage(30, 0, DAM_SHARP, "large organic needle")
				T.stun_effect_act(0, 60, affecting, "large organic needle")
				spawn(25)
					playsound(get_turf(src), 'sound/effects/lingabsorbs.ogg', 40, 1)
					to_chat(src, SPAN_LING("We start to absorb the sweetness DNA from [T]..."))
					T.visible_message(SPAN_NOTICE("\the [T] quickly turns pale..."), SPAN_NOTICE("\the [src] sucks the life from me..."))
					T.eye_blurry += 20
				while(T.vessel.total_volume >= 50) //will su... absorb 93% of victim's fluids
					if(!do_mob(src, T, 37))
						to_chat(src, SPAN_LING("Our absorption of [T] has been interrupted!"))
						changeling.isabsorbing = 0
						return
					T.vessel.remove_any(rand(40, 60))
					T.stun_effect_act(0, 15, affecting, "large organic needle")
					to_chat(src, SPAN_LING("[T] still has [round(T.vessel.total_volume)] fluids."))
					if(prob(20))
						to_chat(T, pick(SPAN_NOTICE("Someone must help me... Please..."), SPAN_NOTICE("It's so merciless..."), SPAN_NOTICE("I already just wanna die!...")))
						to_chat(src, pick(SPAN_LING("We would do this all day..."), SPAN_LING("[T]'s DNA tastes sweat..."), SPAN_LING("We feel ourselve much more better...")))
						playsound(get_turf(src), 'sound/effects/lingabsorbs.ogg', 25, 1)
						src.visible_message(SPAN_WARNING("\the [src]'s proboscis loudly sucks something from \the [T]'s [affecting.name]!"))
				changeling.isabsorbing = 0

		feedback_add_details("changeling_powers","A[stage]")
	src.visible_message("<span class='warning'>[src] removes it's proboscis from \the [T]!</span>", SPAN_LING("We have absorbed the all fluids from [T]!"))
	to_chat(T, "<span class='warning'>You have been absorbed by the changeling!</span>")
	playsound(get_turf(src), 'sound/effects/lingabsorbs.ogg', 70, 1)

	changeling.chem_charges += 10
	changeling.geneticpoints += 5

	//Steal all of their languages!
	for(var/language in T.languages)
		if(!(language in changeling.absorbed_languages))
			changeling.absorbed_languages += language

	changeling_update_languages(changeling.absorbed_languages)

	var/datum/absorbed_dna/newDNA = new(T.real_name, T.dna, T.species.name, T.languages, T.flavor_texts)
	absorbDNA(newDNA)
	if(mind && T.mind)
		mind.store_memory("[T.real_name]'s memories:")
		mind.store_memory(T.mind.memory)
		mind.store_memory("<hr>")

	if(T.mind && T.mind.changeling)
		if(T.mind.changeling.absorbed_dna)
			for(var/datum/absorbed_dna/dna_data in T.mind.changeling.absorbed_dna)	//steal all their loot
				if(changeling.GetDNA(dna_data.name))
					continue
				absorbDNA(dna_data)
				changeling.absorbedcount++
			T.mind.changeling.absorbed_dna.len = 1

		if(T.mind.changeling.purchasedpowers)
			for(var/datum/power/changeling/Tp in T.mind.changeling.purchasedpowers)
				if(Tp in changeling.purchasedpowers)
					continue
				else
					changeling.purchasedpowers += Tp

					if(!Tp.isVerb)
						call(Tp.verbpath)()
					else
						src.make_changeling()

		changeling.chem_charges += T.mind.changeling.chem_charges
		changeling.geneticpoints += T.mind.changeling.geneticpoints
		T.mind.changeling.chem_charges = 0
		T.mind.changeling.geneticpoints = 0
		T.mind.changeling.absorbedcount = 0

	changeling.absorbedcount++
	changeling.isabsorbing = 0

	var/obj/item/organ/internal/heart/heart = T.internal_organs_by_name[BP_HEART]
	for(heart in T.organs)
		heart.pulse = 0
	T.Drain()
	T.death(0)
	return 1


//Change our DNA to that of somebody we've absorbed.
/mob/proc/changeling_transform()
	set category = "Changeling"
	set name = "Transform (5)"

	var/datum/changeling/changeling = changeling_power(5,1,0)
	if(!changeling)	return

	var/list/names = list()
	for(var/datum/absorbed_dna/DNA in changeling.absorbed_dna)
		names += "[DNA.name]"

	var/S = input("Select the target DNA: ", "Target DNA", null) as null|anything in names
	if(!S)	return

	var/datum/absorbed_dna/chosen_dna = changeling.GetDNA(S)
	if(!chosen_dna)
		return

	changeling.chem_charges -= 5
	changeling.geneticdamage = 30

	var/S_name = chosen_dna.speciesName
	var/datum/species/S_dat = all_species[S_name]
	var/changeTime = 2 SECONDS
	if(mob_size != S_dat.mob_size)
		src.visible_message("<span class='warning'>[src]'s body begins to twist, their mass changing rapidly!</span>")
		changeTime = 8 SECONDS
	else
		src.visible_message("<span class='warning'>[src]'s body begins to twist, changing rapidly!</span>")

	if(!do_after(src, changeTime))
		to_chat(src, SPAN_LING("We fail to change shape."))
		return
	handle_changeling_transform(chosen_dna)

	src.verbs -= /mob/proc/changeling_transform
	spawn(10)
		src.verbs += /mob/proc/changeling_transform

	changeling_update_languages(changeling.absorbed_languages)

	feedback_add_details("changeling_powers","TR")
	return 1

/mob/proc/handle_changeling_transform(var/datum/absorbed_dna/chosen_dna)
	src.visible_message("<span class='warning'>[src] transforms!</span>")

	src.dna = chosen_dna.dna
	src.real_name = chosen_dna.name
	src.flavor_text = ""

	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		var/newSpecies = chosen_dna.speciesName
		H.set_species(newSpecies,1)
		H.b_type = chosen_dna.dna.b_type
		H.sync_organ_dna()
		H.flavor_texts = chosen_dna.flavour_texts ? chosen_dna.flavour_texts.Copy() : null

	domutcheck(src, null)
	src.UpdateAppearance()


//Transform into a monkey.
/mob/proc/changeling_lesser_form()
	set category = "Changeling"
	set name = "Lesser Form (1)"

	var/datum/changeling/changeling = changeling_power(1,0,0)
	if(!changeling)	return

	if(src.has_brain_worms())
		to_chat(src, SPAN_LING("We cannot perform this ability at the present time!"))
		return

	var/mob/living/carbon/human/H = src

	if(!istype(H) || !H.species.primitive_form)
		to_chat(src, SPAN_LING("We cannot perform this ability in this form!"))
		return

	changeling.chem_charges--
	H.visible_message("<span class='warning'>[H] transforms!</span>")
	changeling.geneticdamage = 30
	to_chat(H, SPAN_LING("Our genes cry out!"))
	H = H.monkeyize()
	feedback_add_details("changeling_powers","LF")
	return 1

//Transform into a human
/mob/proc/changeling_lesser_transform()
	set category = "Changeling"
	set name = "Transform (1)"

	var/datum/changeling/changeling = changeling_power(1,1,0)
	if(!changeling)	return

	if(HAS_TRANSFORMATION_MOVEMENT_HANDLER(src))
		return

	var/list/names = list()
	for(var/datum/dna/DNA in changeling.absorbed_dna)
		names += "[DNA.real_name]"

	var/S = input("Select the target DNA: ", "Target DNA", null) as null|anything in names
	if(!S)	return

	var/datum/dna/chosen_dna = changeling.GetDNA(S)
	if(!chosen_dna)
		return

	var/mob/living/carbon/human/C = src

	changeling.chem_charges--
	C.remove_changeling_powers()
	C.visible_message("<span class='warning'>[C] transforms!</span>")
	C.dna = chosen_dna.Clone()

	var/list/implants = list()
	for (var/obj/item/weapon/implant/I in C) //Still preserving implants
		implants += I

	ADD_TRANSFORMATION_MOVEMENT_HANDLER(C)
	C.icon = null
	C.overlays.Cut()
	C.set_invisibility(101)
	var/atom/movable/overlay/animation = new /atom/movable/overlay( C.loc )
	animation.icon_state = "blank"
	animation.icon = 'icons/mob/mob.dmi'
	animation.master = src
	flick("monkey2h", animation)
	sleep(48)
	qdel(animation)

	for(var/obj/item/W in src)
		C.drop_from_inventory(W)

	var/mob/living/carbon/human/O = new /mob/living/carbon/human( src )
	if (C.dna.GetUIState(DNA_UI_GENDER))
		O.gender = FEMALE
	else
		O.gender = MALE
	O.dna = C.dna.Clone()
	C.dna = null
	O.real_name = chosen_dna.real_name

	for(var/obj/T in C)
		qdel(T)

	O.dropInto(C.loc)

	O.UpdateAppearance()
	domutcheck(O, null)
	O.setToxLoss(C.getToxLoss())
	O.adjustBruteLoss(C.getBruteLoss())
	O.setOxyLoss(C.getOxyLoss())
	O.adjustFireLoss(C.getFireLoss())
	O.set_stat(C.stat)
	for (var/obj/item/weapon/implant/I in implants)
		I.forceMove(O)
		I.implanted = O

	C.mind.transfer_to(O)
	O.make_changeling()
	O.changeling_update_languages(changeling.absorbed_languages)

	feedback_add_details("changeling_powers","LFT")
	qdel(C)
	return 1


//Fake our own death and fully heal. You will appear to be dead but regenerate fully after a short delay.
/mob/proc/changeling_fakedeath()
	set category = "Changeling"
	set name = "Regenerative Stasis (20)"

	var/datum/changeling/changeling = changeling_power(20,1,100,DEAD)
	if(!changeling)	return

	var/mob/living/carbon/C = src
	if(!C.stat && alert("Are we sure we wish to fake our death?",,"Yes","No") == "No")//Confirmation for living changelings if they want to fake their death
		return
	to_chat(C, SPAN_LING("We will attempt to regenerate our form."))
	C.status_flags |= FAKEDEATH		//play dead
	C.UpdateLyingBuckledAndVerbStatus()
	C.remove_changeling_powers()

	C.emote("gasp")

	spawn(rand(800,2000))
		if(changeling_power(20,1,100,DEAD))
			// charge the changeling chemical cost for stasis
			changeling.chem_charges -= 20

			to_chat(C, SPAN_LING("<font size='5'>We are ready to rise.  Use the <b>Revive</b> verb when you are ready.</font>"))
			C.verbs += /mob/proc/changeling_revive

	feedback_add_details("changeling_powers","FD")
	return 1

/mob/proc/changeling_revive()
	set category = "Changeling"
	set name = "Revive"

	var/mob/living/carbon/C = src
	// restore us to health
	C.revive()
	// remove our fake death flag
	C.status_flags &= ~(FAKEDEATH)
	// let us move again
	C.UpdateLyingBuckledAndVerbStatus()
	// re-add out changeling powers
	C.make_changeling()
	// sending display messages
	to_chat(C, SPAN_LING("We have regenerated."))
	C.verbs -= /mob/proc/changeling_revive


//Boosts the range of your next sting attack by 1
/mob/proc/changeling_boost_range()
	set category = "Changeling"
	set name = "Ranged Sting (10)"
	set desc="Your next sting ability can be used against targets 2 squares away."

	var/datum/changeling/changeling = changeling_power(10,0,100)
	if(!changeling)	return 0
	changeling.chem_charges -= 10
	to_chat(src, SPAN_LING("Our throat adjusts to launch the sting."))
	changeling.sting_range = 2
	src.verbs -= /mob/proc/changeling_boost_range
	spawn(5)	src.verbs += /mob/proc/changeling_boost_range
	feedback_add_details("changeling_powers","RS")
	return 1


//Recover from stuns.
/mob/proc/changeling_unstun()
	set category = "Changeling"
	set name = "Epinephrine Sacs (45)"
	set desc = "Removes all stuns"

	var/datum/changeling/changeling = changeling_power(45,0,100,UNCONSCIOUS)
	if(!changeling)	return 0
	changeling.chem_charges -= 45

	var/mob/living/carbon/human/C = src
	C.set_stat(CONSCIOUS)
	C.SetParalysis(0)
	C.SetStunned(0)
	C.SetWeakened(0)
	C.lying = 0
	C.UpdateLyingBuckledAndVerbStatus()

	src.verbs -= /mob/proc/changeling_unstun
	spawn(5)	src.verbs += /mob/proc/changeling_unstun
	feedback_add_details("changeling_powers","UNS")
	return 1


//Speeds up chemical regeneration
/mob/proc/changeling_fastchemical()
	src.mind.changeling.chem_recharge_rate *= 2
	return 1

//Increases macimum chemical storage
/mob/proc/changeling_engorgedglands()
	src.mind.changeling.chem_storage += 25
	return 1


//Prevents AIs tracking you but makes you easily detectable to the human-eye.
/mob/proc/changeling_digitalcamo()
	set category = "Changeling"
	set name = "Toggle Digital Camoflague"
	set desc = "The AI can no longer track us, but we will look different if examined.  Has a constant cost while active."

	var/datum/changeling/changeling = changeling_power()
	if(!changeling)	return 0

	var/mob/living/carbon/human/C = src
	if(C.digitalcamo)	to_chat(C, SPAN_LING("We return to normal."))
	else				to_chat(C, SPAN_LING("We distort our form to prevent AI-tracking."))
	C.digitalcamo = !C.digitalcamo

	spawn(0)
		while(C && C.digitalcamo && C.mind && C.mind.changeling)
			C.mind.changeling.chem_charges = max(C.mind.changeling.chem_charges - 1, 0)
			sleep(40)

	src.verbs -= /mob/proc/changeling_digitalcamo
	spawn(5)	src.verbs += /mob/proc/changeling_digitalcamo
	feedback_add_details("changeling_powers","CAM")
	return 1

//Thermal vision. Any flash will be the pain in changeling's ass.
/mob/proc/changeling_thermvision()
	set category = "Changeling"
	set name = "Toggle Thermal vision"
	set desc = "Stealthly switches our vision on thermal plane... We'll see the pray throught walls."

	var/datum/changeling/changeling = changeling_power()
	if(!changeling)	return 0

	var/mob/living/carbon/human/C = src
	var/obj/item/organ/internal/eyes/eyes = C.internal_organs_by_name[BP_EYES]
	if(!C.stop_sight_update)
		C.stop_sight_update = 1
		eyes.innate_flash_protection = FLASH_PROTECTION_VULNERABLE
		C.set_sight(sight|SEE_MOBS)
		C.set_see_in_dark(8)
		C.change_light_colour(DARKTINT_GOOD)
	else
		eyes.innate_flash_protection = 0
		C.stop_sight_update = 0

	if(!C.stop_sight_update)
		to_chat(C, SPAN_LING("We return to normal."))
	else
		to_chat(C, SPAN_LING("Our eyes were... Modificated."))

	spawn(0)
		while(C && C.stop_sight_update && C.mind && C.mind.changeling)
			C.mind.changeling.chem_charges = max(C.mind.changeling.chem_charges - 0.8, 0)
			sleep(40)

	src.verbs -= /mob/proc/changeling_thermvision
	spawn(5)	src.verbs += /mob/proc/changeling_thermvision
	feedback_add_details("changeling_powers","THERM")
	return 1

//Starts healing you every second for 10 seconds. Can be used whilst unconscious.
/mob/proc/changeling_rapidregen()
	set category = "Changeling"
	set name = "Rapid Regeneration (30)"
	set desc = "Begins rapidly regenerating.  Does not effect stuns or chemicals."

	var/datum/changeling/changeling = changeling_power(30,0,100,UNCONSCIOUS)
	if(!changeling)	return 0
	src.mind.changeling.chem_charges -= 30

	var/mob/living/carbon/human/C = src
	spawn(0)
		for(var/i = 0, i<10,i++)
			if(C)
				C.adjustBruteLoss(-10)
				C.adjustToxLoss(-10)
				C.adjustOxyLoss(-10)
				C.adjustFireLoss(-10)
				sleep(10)

	src.verbs -= /mob/proc/changeling_rapidregen
	spawn(5)	src.verbs += /mob/proc/changeling_rapidregen
	feedback_add_details("changeling_powers","RR")
	return 1

// HIVE MIND UPLOAD/DOWNLOAD DNA

var/list/datum/absorbed_dna/hivemind_bank = list()

/mob/proc/changeling_hiveupload()
	set category = "Changeling"
	set name = "Hive Channel (10)"
	set desc = "Allows you to channel DNA in the airwaves to allow other changelings to absorb it."

	var/datum/changeling/changeling = changeling_power(10,1)
	if(!changeling)	return

	var/list/names = list()
	for(var/datum/absorbed_dna/DNA in changeling.absorbed_dna)
		var/valid = 1
		for(var/datum/absorbed_dna/DNB in hivemind_bank)
			if(DNA.name == DNB.name)
				valid = 0
				break
		if(valid)
			names += DNA.name

	if(names.len <= 0)
		to_chat(src, SPAN_LING("The airwaves already have all of our DNA."))
		return

	var/S = input("Select a DNA to channel: ", "Channel DNA", null) as null|anything in names
	if(!S)	return

	var/datum/absorbed_dna/chosen_dna = changeling.GetDNA(S)
	if(!chosen_dna)
		return

	var/datum/species/spec = all_species[chosen_dna.speciesName]

	if(spec && spec.species_flags & SPECIES_FLAG_NEED_DIRECT_ABSORB)
		to_chat(src, SPAN_LING("That species must be absorbed directly."))
		return

	changeling.chem_charges -= 10
	hivemind_bank += chosen_dna
	to_chat(src, SPAN_LING("We channel the DNA of [S] to the air."))
	feedback_add_details("changeling_powers","HU")
	return 1

/mob/proc/changeling_hivedownload()
	set category = "Changeling"
	set name = "Hive Absorb (20)"
	set desc = "Allows you to absorb DNA that is being channeled in the airwaves."

	var/datum/changeling/changeling = changeling_power(20,1)
	if(!changeling)	return

	var/list/names = list()
	for(var/datum/absorbed_dna/DNA in hivemind_bank)
		if(!(changeling.GetDNA(DNA.name)))
			names[DNA.name] = DNA

	if(names.len <= 0)
		to_chat(src, SPAN_LING("There's no new DNA to absorb from the air."))
		return

	var/S = input("Select a DNA absorb from the air: ", "Absorb DNA", null) as null|anything in names
	if(!S)	return
	var/datum/dna/chosen_dna = names[S]
	if(!chosen_dna)
		return

	changeling.chem_charges -= 20
	absorbDNA(chosen_dna)
	to_chat(src, SPAN_LING("We absorb the DNA of [S] from the air."))
	feedback_add_details("changeling_powers","HD")
	return 1

// Fake Voice

/mob/proc/changeling_mimicvoice()
	set category = "Changeling"
	set name = "Mimic Voice"
	set desc = "Shape our vocal glands to form a voice of someone we choose. We cannot regenerate chemicals when mimicing."


	var/datum/changeling/changeling = changeling_power()
	if(!changeling)	return

	if(changeling.mimicing)
		changeling.mimicing = ""
		to_chat(src, SPAN_LING("We return our vocal glands to their original location."))
		return

	var/mimic_voice = sanitize(input(usr, "Enter a name to mimic.", "Mimic Voice", null), MAX_NAME_LEN)
	if(!mimic_voice)
		return

	changeling.mimicing = mimic_voice

	to_chat(src, SPAN_LING("We shape our glands to take the voice of <b>[mimic_voice]</b>, this will stop us from regenerating chemicals while active."))
	to_chat(src, "<span class='notice'>Use this power again to return to our original voice and reproduce chemicals again.</span>")

	feedback_add_details("changeling_powers","MV")

	spawn(0)
		while(src && src.mind && src.mind.changeling && src.mind.changeling.mimicing)
			src.mind.changeling.chem_charges = max(src.mind.changeling.chem_charges - 1, 0)
			sleep(40)
		if(src && src.mind && src.mind.changeling)
			src.mind.changeling.mimicing = ""
	//////////
	//STINGS//	//They get a pretty header because there's just so fucking many of them ;_;
	//////////

/mob/proc/sting_can_reach(mob/M as mob, sting_range = 1)
	if(M.loc == src.loc)
		return 1 //target and source are in the same thing
	if(!isturf(src.loc) || !isturf(M.loc))
		to_chat(src, SPAN_LING("We cannot reach \the [M] with a sting!"))
		return 0 //One is inside, the other is outside something.
	// Maximum queued turfs set to 25; I don't *think* anything raises sting_range above 2, but if it does the 25 may need raising
	if(!AStar(src.loc, M.loc, /turf/proc/AdjacentTurfs, /turf/proc/Distance, max_nodes=25, max_node_depth=sting_range)) //If we can't find a path, fail
		to_chat(src, SPAN_LING("We cannot find a path to sting \the [M] by!"))
		return 0
	return 1

//Handles the general sting code to reduce on copypasta (seeming as somebody decided to make SO MANY dumb abilities)
/mob/proc/changeling_sting(var/required_chems=0, var/verb_path, var/loud)
	var/datum/changeling/changeling = changeling_power(required_chems)
	if(!changeling)								return

	var/list/victims = list()
	for(var/mob/living/carbon/C in oview(changeling.sting_range))
		victims += C
	var/mob/living/carbon/human/T = input(src, "Who will we sting?") as null|anything in victims

	if(!T) return
	if(!(T in view(changeling.sting_range))) return
	if(!sting_can_reach(T, changeling.sting_range)) return
	if(!changeling_power(required_chems)) return
	var/obj/item/organ/external/target_limb = T.get_organ(src.zone_sel.selecting)
	if (!target_limb)
		to_chat(src, "<span class='warning'>[T] is missing that limb.</span>")
		return
	if(T.isSynthetic())
		to_chat(src, SPAN_LING("[T] is not compatible with our biology."))
		return
	changeling.chem_charges -= required_chems
	changeling.sting_range = 1
	src.verbs -= verb_path
	spawn(10)	src.verbs += verb_path

	if(!loud)
		to_chat(src, SPAN_LING("We stealthily sting [T]."))
	else
		src.visible_message(pick("<span class='danger'>[src]'s eyes balloon and burst out in a welter of blood, burrowing into [T]!</span>",
								"<span class='danger'>[src]'s arm rapidly shifts into a giant scorpion-stinger and stabs into [T]!</span>",
								"<span class='danger'>[src]'s throat lengthens and twists before vomitting a chunky red spew all over [T]!</span>",
								"<span class='danger'>[src]'s tongue stretches an impossible length and stabs into [T]!</span>",
								"<span class='danger'>[src] sneezes a cloud of shrieking spiders at [T]!</span>",
								"<span class='danger'>[src] erupts a grotesque tail and impales [T]!</span>",
								"<span class='danger'>[src]'s chin skin bulges and tears, launching a bone-dart at [T]!</span>"))

	for(var/obj/item/clothing/clothes in list(T.head, T.wear_mask, T.wear_suit, T.w_uniform, T.gloves, T.shoes))
		if(istype(clothes) && (clothes.body_parts_covered & target_limb.body_part) && (clothes.item_flags & ITEM_FLAG_THICKMATERIAL))
			to_chat(src, "<span class='warning'>[T]'s armor has protected them!</span>")
			return //thick clothes will protect from the sting

	if(T.isSynthetic() || BP_IS_ROBOTIC(target_limb)) return
	if(!T.mind || !T.mind.changeling) return T	//T will be affected by the sting
	to_chat(T, "<span class='warning'>You feel a tiny prick.</span>")
	return


/mob/proc/changeling_lsdsting()
	set category = "Changeling"
	set name = "Hallucination Sting (15)"
	set desc = "Causes terror in the target."

	var/mob/living/carbon/human/T = changeling_sting(15,/mob/proc/changeling_lsdsting)
	if(!T)	return 0
	spawn(rand(300,600))
		if(T)	T.hallucination(400, 80)
	feedback_add_details("changeling_powers","HS")
	return 1

/mob/proc/changeling_silence_sting()
	set category = "Changeling"
	set name = "Silence sting (10)"
	set desc="Sting target"

	var/mob/living/carbon/human/T = changeling_sting(10,/mob/proc/changeling_silence_sting)
	if(!T)	return 0
	T.silent += 30
	feedback_add_details("changeling_powers","SS")
	return 1

/mob/proc/changeling_blind_sting()
	set category = "Changeling"
	set name = "Blind sting (20)"
	set desc="Sting target"

	var/mob/living/carbon/human/T = changeling_sting(20,/mob/proc/changeling_blind_sting, loud = 1)
	if(!T)	return 0
	to_chat(T, "<span class='danger'>Your eyes burn horrificly!</span>")
	T.disabilities |= NEARSIGHTED
	spawn(300)	T.disabilities &= ~NEARSIGHTED
	T.eye_blind = 10
	T.eye_blurry = 20
	feedback_add_details("changeling_powers","BS")
	return 1

/mob/proc/changeling_deaf_sting()
	set category = "Changeling"
	set name = "Deaf sting (5)"
	set desc="Sting target"

	var/mob/living/carbon/human/T = changeling_sting(5,/mob/proc/changeling_deaf_sting, loud = 1)
	if(!T)	return 0
	to_chat(T, "<span class='danger'>Your ears pop and begin ringing loudly!</span>")
	T.sdisabilities |= DEAF
	spawn(300)	T.sdisabilities &= ~DEAF
	feedback_add_details("changeling_powers","DS")
	return 1

/mob/proc/changeling_pain_sting()
	set category = "Changeling"
	set name = "Pain sting (30)"
	set desc="Sting target"

	var/mob/living/carbon/human/T = changeling_sting(30,/mob/proc/changeling_pain_sting, loud = 1)
	if(!T)	return 0
	var/target_limb
	T.stun_effect_act(0, 150, target_limb, "large organic needle") //in stinged organ
	T.stun_effect_act(0, 150, null, "large organic needle") //in random organ
	to_chat(T, "<span class='danger'>Your muscles begin to painfully tighten!</span>")
	T.scream()
//	T.Weaken(20)
	feedback_add_details("changeling_powers","PS")
	return 1

/mob/proc/changeling_transformation_sting()
	set category = "Changeling"
	set name = "Transformation sting (40)"
	set desc="Sting target"

	var/datum/changeling/changeling = changeling_power(40)
	if(!changeling)	return 0

	var/list/names = list()
	for(var/datum/absorbed_dna/DNA in changeling.absorbed_dna)
		names += "[DNA.name]"

	var/S = input("Select the target DNA: ", "Target DNA", null) as null|anything in names
	if(!S)	return

	var/datum/absorbed_dna/chosen_dna = changeling.GetDNA(S)
	if(!chosen_dna)
		return

	var/mob/living/carbon/human/T = changeling_sting(40,/mob/proc/changeling_transformation_sting)
	if(!T)	return 0
	if((MUTATION_HUSK in T.mutations) || (!ishuman(T) && !issmall(T)))
		to_chat(src, SPAN_LING("Our sting appears ineffective against its DNA."))
		return 0

	if(islesserform(T))
		to_chat(src, SPAN_LING("Our sting appears ineffective against this creature."))
		return 0

	if(T.stat != DEAD)
		to_chat(src, SPAN_LING("Our sting can only be used against dead targets."))
		return 0

	T.handle_changeling_transform(chosen_dna)

	feedback_add_details("changeling_powers","TS")
	return 1

/mob/proc/changeling_unfat_sting()
	set category = "Changeling"
	set name = "Unfat sting (5)"
	set desc = "Sting target"

	var/mob/living/carbon/human/T = changeling_sting(5,/mob/proc/changeling_unfat_sting)
	if(!T)	return 0
	to_chat(T, "<span class='danger'>You feel a small prick as stomach churns violently and you become to feel skinnier.</span>")
	T.nutrition -= 100
	feedback_add_details("changeling_powers","US")
	return 1

/mob/proc/changeling_DEATHsting()
	set category = "Changeling"
	set name = "Death Sting (40)"
	set desc = "Causes spasms onto death."

	var/mob/living/carbon/human/T = changeling_sting(40,/mob/proc/changeling_DEATHsting, loud = 1)
	if(!T)	return 0
	to_chat(T, "<span class='danger'>You feel a small prick and your chest becomes tight!</span>")
//	T.silent = 10
//	T.Paralyse(10)
//	T.make_jittery(40)
//	if(T.reagents)	T.reagents.add_reagent("cyanide", 5) // too op
//	if(T.reagents)	T.reagents.add_reagent(/datum/reagent/lexorin, 40) // too useless
	var/target_limb
	T.stun_effect_act(0, 65, target_limb, "large organic needle") // a small present
	if(T.reagents)	T.reagents.add_reagent(/datum/reagent/toxin/batrachotoxin, 10) // fine(?)
	feedback_add_details("changeling_powers","DTHS")
	return 1

/mob/proc/changeling_extract_dna_sting()
	set category = "Changeling"
	set name = "Extract DNA Sting (40)"
	set desc="Sting a target to extract their DNA."

	var/datum/changeling/changeling = null
	if(src.mind && src.mind.changeling)
		changeling = src.mind.changeling
	if(!changeling)
		return 0

	var/mob/living/carbon/human/T = changeling_sting(40, /mob/proc/changeling_extract_dna_sting)
	if(!T)	return 0
	if((MUTATION_HUSK in T.mutations) || (T.species.species_flags & SPECIES_FLAG_NO_SCAN))
		to_chat(src, SPAN_LING("We cannot extract DNA from this creature!"))
		return 0

	if(T.species.species_flags & SPECIES_FLAG_NEED_DIRECT_ABSORB)
		to_chat(src, SPAN_LING("That species must be absorbed directly."))
		return


	var/datum/absorbed_dna/newDNA = new(T.real_name, T.dna, T.species.name, T.languages, T.flavor_texts)
	absorbDNA(newDNA)

	feedback_add_details("changeling_powers","ED")
	return 1

/mob/proc/armblades()
	set category = "Changeling"
	set name = "Form Blades (10)"
	set desc="Rupture the flesh and mend the bone of your hand into a deadly blade."

	var/datum/changeling/changeling = changeling_power(10,0,0)
	if(!changeling)	return 0
	src.mind.changeling.chem_charges -= 10

	var/mob/living/M = src

	if(M.l_hand && M.r_hand)
		to_chat(M, SPAN_LING("Our hands are full."))
		return

	var/obj/item/weapon/melee/arm_blade/blade = M
	for(blade in M.contents)
		M.drop_from_inventory(blade)
		return

	M.visible_message("<span class='danger'>[M]\'s arm begins to twist and rip!</span>",
							"<span class='danger'>Our arm twists and mutates, transforming it into a deadly blade.</span>",
							"<span class='danger'>You hear organic matter ripping and tearing!</span>")
	playsound(get_turf(src), 'sound/effects/lingextends.ogg', 50, 1)
	sleep(6)
	blade = new(M)
	blade.creator = M
	M.put_in_hands(blade)
	playsound(loc, 'sound/weapons/bloodyslice.ogg', 30, 1)

/mob/proc/changeling_shield()
	set category = "Changeling"
	set name = "Form Shield (10)"
	set desc="Bend the flesh and bone of your hand into a grotesque shield."

	var/datum/changeling/changeling = changeling_power(10,0,0)
	if(!changeling)	return 0
	src.mind.changeling.chem_charges -= 10

	var/mob/living/M = src

	var/obj/item/weapon/shield/riot/changeling/shield = M
	for(shield in M.contents)
		shield.dropped(M)
		return

	if(M.l_hand && M.r_hand)
		to_chat(M, SPAN_LING("Our hands are full."))
		return

	M.visible_message("<span class='danger'>[M]\'s arm begins to twist and rip!</span>",
							SPAN_LING("Our arm twists and mutates, transforming it into a deadly blade."),
							"<span class='danger'>You hear organic matter ripping and tearing!</span>")
	playsound(get_turf(src), 'sound/effects/lingextends.ogg', 50, 1)
	sleep(6)
	shield = new(M)
	shield.creator = M
	M.put_in_hands(shield)
	playsound(loc, 'sound/effects/blobattack.ogg', 30, 1)

/mob/proc/horror_form()
	set category = "Changeling"
	set name = "Horror Form (50)"
	set desc = "Tear apart your human disguise, revealing your true form."

	var/datum/changeling/changeling = changeling_power(50,0,0)
	if(!changeling)	return 0
	src.mind.changeling.chem_charges -= 50

	var/mob/living/M = src

	M.visible_message("<span class='danger'>[M] writhes and contorts, their body expanding to inhuman proportions!</span>", \
						SPAN_LING("We begin our transformation to our true form!"))
	if(!do_after(src,60))
		M.visible_message("<span class='danger'>[M]'s transformation abruptly reverts itself!</span>", \
							SPAN_LING("Our transformation has been interrupted!"))
		return 0

	M.visible_message("<span class='danger'>[M] grows into an abomination and lets out an awful scream!</span>")
	playsound(loc, 'sound/effects/greaterling.ogg', 100, 1)

	var/mob/living/simple_animal/hostile/true_changeling/ling = new (get_turf(M))

	if(istype(M,/mob/living/carbon/human))
		for(var/obj/item/I in M.contents)
			if(isorgan(I))
				continue
			M.drop_from_inventory(I)

	if(M.mind)
		M.mind.transfer_to(ling)
	else
		ling.key = M.key
	var/atom/movable/overlay/effect = new /atom/movable/overlay(get_turf(M))
	effect.density = 0
	effect.anchored = 1
	effect.icon = 'icons/effects/effects.dmi'
	effect.layer = 3
	flick("summoning",effect)
	QDEL_IN(effect, 10)
	M.forceMove(ling) //move inside the new dude to hide him.
	M.status_flags |= GODMODE //dont want him to die or breathe or do ANYTHING
	addtimer(CALLBACK(src, .proc/revert_horror_form,ling), 10 MINUTES)

/mob/proc/revert_horror_form(var/mob/living/ling)
	if(QDELETED(ling))
		return
	src.status_flags &= ~GODMODE //no more godmode.
	if(ling.mind)
		ling.mind.transfer_to(src)
	else
		src.key = ling.key
	playsound(get_turf(src),'sound/effects/blobattack.ogg',50,1)
	src.forceMove(get_turf(ling))
	qdel(ling)

/mob/proc/changeling_dissonant_shriek()
	set category = "Changeling"
	set name = "Dissonant Shriek (35)"
	set desc = "Shift your vocal cords to release a high-frequency sound that overloads nearby electronics."

	var/datum/changeling/changeling = changeling_power(35, 0)
	if(!changeling) return 0
	changeling.chem_charges -= 35

	if(ishuman(usr))
		var/mob/living/carbon/human/H = usr
		if(!H.is_ventcrawling)
			for(var/obj/machinery/light/L in range(5, usr))
				L.flicker()
				if(prob(30))
					L.on = 1
					L.broken()
			empulse(get_turf(usr), 2, 4, 1)
		else
			to_chat(src, SPAN_LING("We cannot do this in vents..."))
	return 1

//dna related datum

/datum/absorbed_dna
	var/name
	var/datum/dna/dna
	var/speciesName
	var/list/languages
	var/list/flavour_texts

/datum/absorbed_dna/New(var/newName, var/newDNA, var/newSpecies, var/newLanguages, var/list/newFlavour)
	..()
	name = newName
	dna = newDNA
	speciesName = newSpecies
	languages = newLanguages
	flavour_texts = newFlavour ? newFlavour.Copy() : null
