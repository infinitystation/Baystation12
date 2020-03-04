/obj/screen/movable/ability_master/changeling/sting
	name = "Tiny Prick"
	desc = "Stabby stabby."
	var/sting_icon = null

/obj/screen/movable/ability_master/changeling/sting/Click()
	var/mob/user = usr
	if(!user || !user.mind)
		return
	var/datum/changeling/changeling = user.mind.changeling
	if(!changeling)
		return
	if(!changeling.chosen_sting)
		set_sting(user)
	else
		unset_sting(user)
	return

/obj/screen/movable/ability_master/changeling/sting/proc/set_sting(mob/user)
	to_chat(user, "<span class='notice'>We prepare our sting, use alt+click or middle mouse button on target to sting them.</span>")
	var/datum/changeling/changeling = user.mind.changeling
	changeling.chosen_sting = src

	user.ling_sting.icon_state = sting_icon
	user.ling_sting.invisibility = 0

/obj/screen/movable/ability_master/changeling/sting/proc/unset_sting(mob/user)
	to_chat(user, "<span class='warning'>We retract our sting, we can't sting anyone for now.</span>")
	var/datum/changeling/changeling = user.mind.changeling
	changeling.chosen_sting = null

	user.ling_sting.icon_state = null
	user.ling_sting.invisibility = INVISIBILITY_ABSTRACT


/obj/screen/movable/ability_master/changeling/sting/can_sting(mob/user, mob/target)
	if(!..())
		return
	var/datum/changeling/changeling = user.mind.changeling
	if(!changeling.chosen_sting)
		to_chat(user, "We haven't prepared our sting yet!")
	if(!iscarbon(target))
		return
	if(!isturf(user.loc))
		return
	if(!AStar(user, target.loc, /turf/proc/Distance, changeling.sting_range, simulated_only = 0))
		return
	return 1

/obj/screen/movable/ability_master/changeling/sting/sting_feedback(mob/user, mob/target)
	if(!target)
		return
	to_chat(user, "<span class='notice'>We stealthily sting [target.name].</span>")
	if(target.mind && user.mind.changeling)
		to_chat(target, "<span class='warning'>You feel a tiny prick.</span>")
	return 1

/*
/obj/screen/movable/ability_master/changeling/sting/transformation
	name = "Transformation Sting"
	desc = "We silently sting a human, injecting a retrovirus that forces them to transform."
	helptext = "The victim will transform much like a changeling would. Does not provide a warning to others. Mutations will not be transferred, and monkeys will become human."
	sting_icon = "sting_transform"
	chemical_cost = 50
	dna_cost = 3
	var/datum/changelingprofile/selected_dna = null

/obj/screen/movable/ability_master/changeling/sting/transformation/Click()
	var/mob/user = usr
	var/datum/changeling/changeling = user.mind.changeling
	if(changeling.chosen_sting)
		unset_sting(user)
		return
	selected_dna = changeling.select_dna("Select the target DNA: ", "Target DNA")
	if(!selected_dna)
		return
	if(NOTRANSSTING in selected_dna.dna.species.species_traits)
		to_chat(user, "<span class = 'notice'>That DNA is not compatible with changeling retrovirus!</span>")
		return
	..()

/obj/screen/movable/ability_master/changeling/sting/transformation/can_sting(mob/user, mob/living/carbon/target)
	if(!..())
		return
	if((MUTATION_HUSK in target.mutations)) || !iscarbon(target))
		to_chat(user, "<span class='warning'>Our sting appears ineffective against its DNA.</span>")
		return 0
	return 1

/obj/screen/movable/ability_master/changeling/sting/transformation/sting_action(mob/user, mob/target)
	add_logs(user, target, "stung", "transformation sting", " new identity is [selected_dna.dna.real_name]")
	var/datum/dna/NewDNA = selected_dna.dna
	if(islesserform(target))
		to_chat(user, "<span class='notice'>Our genes cry out as we sting [target.name]!</span>")

	var/mob/living/carbon/C = target
	. = TRUE
	if(istype(C))
		C.real_name = NewDNA.real_name
		NewDNA.transfer_identity(C)
		if(islesserform(C))
			C.humanize(TR_KEEPITEMS | TR_KEEPIMPLANTS | TR_KEEPORGANS | TR_KEEPDAMAGE | TR_KEEPVIRUS | TR_DEFAULTMSG)
		C.updateappearance(mutcolor_update=1)


/obj/screen/movable/ability_master/changeling/sting/false_armblade
	name = "False Armblade Sting"
	desc = "We silently sting a human, injecting a retrovirus that mutates their arm to temporarily appear as an armblade."
	helptext = "The victim will form an armblade much like a changeling would, except the armblade is dull and useless."
	sting_icon = "sting_armblade"
	chemical_cost = 20
	dna_cost = 1

/obj/item/melee/arm_blade/false
	desc = "A grotesque mass of flesh that used to be your arm. Although it looks dangerous at first, you can tell it's actually quite dull and useless."
	force = 5 //Basically as strong as a punch
	fake = TRUE

/obj/screen/movable/ability_master/changeling/sting/false_armblade/can_sting(mob/user, mob/target)
	if(!..())
		return
	if(isliving(target))
		var/mob/living/L = target
		if((MUTATION_HUSK in L.mutations) || !L.has_dna())
			to_chat(user, "<span class='warning'>Our sting appears ineffective against its DNA.</span>")
			return 0
	return 1

/obj/screen/movable/ability_master/changeling/sting/false_armblade/sting_action(mob/user, mob/target)
	add_logs(user, target, "stung", object="false armblade sting")

	var/obj/item/held = target.get_active_held_item()
	if(held && !target.dropItemToGround(held))
		to_chat(user, "<span class='warning'>[held] is stuck to [target.p_their()] hand, you cannot grow a false armblade over it!</span>")
		return

	if(islesserform(target))
		to_chat(user, "<span class='notice'>Our genes cry out as we sting [target.name]!</span>")

	var/obj/item/melee/arm_blade/false/blade = new(target,1)
	target.put_in_hands(blade)
	target.visible_message("<span class='warning'>A grotesque blade forms around [target.name]\'s arm!</span>", "<span class='userdanger'>Your arm twists and mutates, transforming into a horrific monstrosity!</span>", "<span class='italics'>You hear organic matter ripping and tearing!</span>")
	playsound(target, 'sound/effects/blobattack.ogg', 30, 1)

	addtimer(CALLBACK(src, .proc/remove_fake, target, blade), 600)
	return TRUE

/obj/screen/movable/ability_master/changeling/sting/false_armblade/proc/remove_fake(mob/target, obj/item/melee/arm_blade/false/blade)
	playsound(target, 'sound/effects/blobattack.ogg', 30, 1)
	target.visible_message("<span class='warning'>With a sickening crunch, \
	[target] reforms [target.p_their()] [blade.name] into an arm!</span>",
	"<span class='warning'>[blade] reforms back to normal.</span>",
	"<span class='italics>You hear organic matter ripping and tearing!</span>")

	qdel(blade)
	target.update_inv_hands()

/obj/screen/movable/ability_master/changeling/sting/extract_dna
	name = "Extract DNA Sting"
	desc = "We stealthily sting a target and extract their DNA."
	helptext = "Will give you the DNA of your target, allowing you to transform into them."
	sting_icon = "sting_extract"
	chemical_cost = 25
	dna_cost = 0

/obj/screen/movable/ability_master/changeling/sting/extract_dna/can_sting(mob/user, mob/target)
	if(..())
		var/datum/changeling/changeling = user.mind.changeling
		return changeling.can_absorb_dna(target)

/obj/screen/movable/ability_master/changeling/sting/extract_dna/sting_action(mob/user, mob/living/carbon/human/target)
	add_logs(user, target, "stung", "extraction sting")
	var/datum/changeling/changeling = user.mind.changeling
	if(!target.DNA in changeling.absorbed_dna)
		changeling.add_new_profile(target)
	return TRUE

/mob/proc/changeling_salo
	name = "Mute Sting"
	desc = "We silently sting a human, completely silencing them for a short time."
	helptext = "Does not provide a warning to the victim that they have been stung, until they try to speak and cannot."
	sting_icon = "sting_mute"
	chemical_cost = 20
	dna_cost = 2

/mob/proc/changeling_salo/sting_action(mob/user, mob/living/carbon/target)
//	add_logs(user, target, "stung", "mute sting")
	target.silent += 30
	return TRUE

/obj/screen/movable/ability_master/changeling/sting/blind
	name = "Blind Sting"
	desc = "Temporarily blinds the target."
	helptext = "This sting completely blinds a target for a short time."
	sting_icon = "sting_blind"
	chemical_cost = 25
	dna_cost = 1

/obj/screen/movable/ability_master/changeling/sting/blind/sting_action(mob/user, mob/living/carbon/target)
	add_logs(user, target, "stung", "blind sting")
	to_chat(target, "<span class='danger'>Your eyes burn horrifically!</span>")
	target.become_nearsighted(EYE_DAMAGE)
	target.blind_eyes(20)
	target.blur_eyes(40)
	return TRUE

/obj/screen/movable/ability_master/changeling/sting/LSD
	name = "Hallucination Sting"
	desc = "Causes terror in the target."
	helptext = "We evolve the ability to sting a target with a powerful hallucinogenic chemical. The target does not notice they have been stung, and the effect begins after a few seconds."
	sting_icon = "sting_lsd"
	chemical_cost = 10
	dna_cost = 1

/obj/screen/movable/ability_master/changeling/sting/LSD/sting_action(mob/user, mob/living/carbon/target)
	add_logs(user, target, "stung", "LSD sting")
	addtimer(CALLBACK(src, .proc/hallucination_time, target), rand(100,200))
	return TRUE

/obj/screen/movable/ability_master/changeling/sting/LSD/proc/hallucination_time(mob/living/carbon/target)
	if(target)
		target.hallucination = max(90, target.hallucination)

/obj/screen/movable/ability_master/changeling/sting/cryo
	name = "Cryogenic Sting"
	desc = "We silently sting a human with a cocktail of chemicals that freeze them."
	helptext = "Does not provide a warning to the victim, though they will likely realize they are suddenly freezing."
	sting_icon = "sting_cryo"
	chemical_cost = 15
	dna_cost = 2

/obj/screen/movable/ability_master/changeling/sting/cryo/sting_action(mob/user, mob/target)
	add_logs(user, target, "stung", "cryo sting")
	if(target.reagents)
		target.reagents.add_reagent("frostoil", 30)
	return TRUE
*/