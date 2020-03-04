/datum/stings
	var/name
	var/desc
	var/icon_state //in 'infinity/icons/obj/action_buttons/changeling.dmi'
	var/chemical_cost = 0
	var/req_dna = 0 //unused
	var/req_absorbs = 0 //unused
	var/req_stat = CONSCIOUS
	var/no_lesser = 1
	var/visible = 0

/datum/stings/proc/can_sting(mob/living/user, mob/living/carbon/human/T)
	var/datum/changeling/C = user.mind.changeling
	var/obj/item/organ/external/target_limb = T.get_organ(user.zone_sel.selecting)

	if(!ishuman(user) && !islesserform(user)) //typecast everything from mob to carbon from this point onwards
		return 0
	if(!C.chosen_sting)
		to_chat(user, SPAN_WARNING("Мы ещё не подготовили жало!"))
		return 0
	if(!iscarbon(T))
		return 0
	if(!isturf(user.loc))
		return 0
	if(!AStar(user.loc, T.loc, /turf/proc/AdjacentTurfs, /turf/proc/Distance, max_nodes = 25, max_node_depth = C.sting_range)) //If we can't find a path, fail
		return 0
	if(no_lesser && !ishuman(user))
		to_chat(user, SPAN_WARNING("Мы не можем использовать это жало в низшей форме!"))
		return 0
	if(C.chem_charges < chemical_cost)
		to_chat(user, SPAN_WARNING("Нам нужно [chemical_cost] единиц химикатов для этого"))
		return 0
	if(C.absorbedcount < req_dna)
		to_chat(user, SPAN_WARNING("Нам нужно [req_dna] образцов совместимых ДНКа."))
		return 0
	if(C.absorbedcount < req_absorbs)
		to_chat(user, SPAN_WARNING("Нам нужно [req_absorbs] образцов совместимых ДНКа, полученных через поглощение."))
		return 0
	if(user.stat > req_stat)
		to_chat(user, SPAN_WARNING("Мы обездвижены."))
		return 0
	if(user.status_flags & FAKEDEATH)
		to_chat(user, SPAN_WARNING("Мы обездвижены."))
		return 0
	if(T.isSynthetic())
		to_chat(user, SPAN_LING("[T] несовместимо с нашей биологией."))
		return
	if(BP_IS_ROBOTIC(target_limb))
		to_chat(user, SPAN_LING("Выбранная часть тела неорганическая."))
		return
	if(T.mind?.changeling)
		to_chat(user, SPAN_LING("Жало будет бесполезно против собрата"))
		return
	. = ..()
	return 1

/datum/stings/proc/try_to_sting(mob/user, mob/T)
	if(!can_sting(user, T))
		return
	var/datum/changeling/C = user.mind.changeling
	if(sting_action(user, T))
//		SSblackbox.record_feedback("nested tally", "changeling_powers", 1, list("[name]"))
		sting_feedback(user, T)
		C.chem_charges -= chemical_cost

/datum/stings/proc/sting_feedback(mob/user, mob/T)
	if(!T)
		return
	if(!visible)
		to_chat(user, SPAN_LING("Мы незаметно жалим [T]."))
	else
		user.visible_message(pick(SPAN_DANGER("[src]'s eyes balloon and burst out in a welter of blood, burrowing into [T]!"),
								SPAN_DANGER("[src]'s arm rapidly shifts into a giant scorpion-stinger and stabs into [T]!"),
								SPAN_DANGER("[src]'s throat lengthens and twists before vomitting a chunky red spew all over [T]!"),
								SPAN_DANGER("[src]'s tongue stretches an impossible length and stabs into [T]!"),
								SPAN_DANGER("[src] sneezes a cloud of shrieking spiders at [T]!"),
								SPAN_DANGER("[src] erupts a grotesque tail and impales [T]!"),
								SPAN_DANGER("[src]'s chin skin bulges and tears, launching a bone-dart at [T]!")))
	to_chat(T, SPAN_NOTICE("You feel a tiny prick."))

/datum/stings/proc/sting_action(mob/user, mob/living/carbon/human/T)
	var/obj/item/organ/external/target_limb = T.get_organ(user.zone_sel.selecting)

	for(var/obj/item/clothing/clothes in list(T.head, T.wear_mask, T.wear_suit, T.w_uniform, T.gloves, T.shoes))
		if(istype(clothes) && (clothes.body_parts_covered & target_limb.body_part) && (clothes.item_flags & ITEM_FLAG_THICKMATERIAL))
			to_chat(user, SPAN_DANGER("Жало не пробило защиту в выбранной части тела!"))
			return //thick clothes will protect from the sting
	. = ..()
	return 1
/*
/datum/stings/proc/set_sting(mob/user)
	to_chat(user, SPAN_LING("We prepare our sting, use alt+click or middle mouse button on target to sting them."))
	var/datum/changeling/C = user.mind.changeling
	C.chosen_sting = new src

	user.ling_sting.name = name
	user.ling_sting.icon_state = icon_state
	user.ling_sting.invisibility = 0
*/
/datum/stings/proc/unset_sting(mob/user)
	to_chat(user, SPAN_LING("Мы убрали жало."))
	var/datum/changeling/C = user.mind.changeling
	C.chosen_sting = null

	user.ling_sting.name = initial(name)
	user.ling_sting.icon_state = null
	user.ling_sting.invisibility = INVISIBILITY_ABSTRACT

/mob/living/carbon/proc/unset_sting(mob/user)
	if(mind)
		var/datum/changeling/C = user.mind.changeling
		if(C?.chosen_sting)
			C.chosen_sting.unset_sting(user)


// BACKUP
/*
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

/mob/proc/changeling_sting(var/required_chems=0, var/verb_path, var/loud, id)
	var/datum/changeling/changeling = changeling_power(required_chems)
	if(!changeling) return
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
		to_chat(src, SPAN_WARNING("[T] is missing that limb."))
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
		src.visible_message(pick(SPAN_DANGER("[src]'s eyes balloon and burst out in a welter of blood, burrowing into [T]!"),
								SPAN_DANGER("[src]'s arm rapidly shifts into a giant scorpion-stinger and stabs into [T]!"),
								SPAN_DANGER("[src]'s throat lengthens and twists before vomitting a chunky red spew all over [T]!"),
								SPAN_DANGER("[src]'s tongue stretches an impossible length and stabs into [T]!"),
								SPAN_DANGER("[src] sneezes a cloud of shrieking spiders at [T]!"),
								SPAN_DANGER("[src] erupts a grotesque tail and impales [T]!"),
								SPAN_DANGER("[src]'s chin skin bulges and tears, launching a bone-dart at [T]!")))

	for(var/obj/item/clothing/clothes in list(T.head, T.wear_mask, T.wear_suit, T.w_uniform, T.gloves, T.shoes))
		if(istype(clothes) && (clothes.body_parts_covered & target_limb.body_part) && (clothes.item_flags & ITEM_FLAG_THICKMATERIAL))
			to_chat(src, SPAN_DANGER("[T]'s armor has protected them!"))
			return //thick clothes will protect from the sting

	if(T.isSynthetic() || BP_IS_ROBOTIC(target_limb)) return
	if(!T.mind || !T.mind.changeling) return T	//T will be affected by the sting
	to_chat(T, SPAN_WARNING("You feel a tiny prick."))
	return

*/