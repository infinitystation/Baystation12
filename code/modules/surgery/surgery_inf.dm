/decl/surgery_step/implant_removal_ghetto
	name = "Remove foreign body from wound"
	allowed_tools = list(
		/obj/item/hemostat = 100,
		/obj/item/wirecutters = 75,
		/obj/item/material/knife = 50,
		/obj/item/material/kitchen/utensil/fork = 20
	)
	can_infect = 1
	blood_level = 1
	min_duration = 160
	max_duration = 200
	shock_level = 40
	surgery_candidate_flags = SURGERY_NO_CRYSTAL | SURGERY_NO_STUMP
	strict_access_requirement = FALSE

/decl/surgery_step/implant_removal_ghetto/get_skill_reqs(mob/living/user, mob/living/carbon/human/target, obj/item/tool, target_zone)
	return list(SKILL_MEDICAL = SKILL_ADEPT)

/decl/surgery_step/implant_removal_ghetto/assess_bodypart(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = ..()
	if(affected)
		if(!affected.wounds)
			return FALSE
	for(var/datum/wound/wound in affected.wounds)
		if(LAZYLEN(wound.embedded_objects))
			return affected
	return FALSE

/decl/surgery_step/implant_removal_ghetto/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("[user] starts poking around inside [target]'s [affected.name] with \the [tool].", \
	"You start poking around inside [target]'s [affected.name] with \the [tool]." )
	target.custom_pain("The pain in your [affected.name] is living hell!",1,affecting = affected)
	..()

/decl/surgery_step/implant_removal_ghetto/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/chest/affected = target.get_organ(target_zone)

	var/find_prob = 60
	var/list/loot = list()

	for(var/datum/wound/wound in affected.wounds)
		if(LAZYLEN(wound.embedded_objects))
			loot |= wound.embedded_objects

	if (loot.len)

		var/obj/item/obj = pick(loot)

		if (prob(find_prob))
			user.visible_message("<span class='notice'>[user] takes something out of incision on [target]'s [affected.name] with \the [tool].</span>", \
			"<span class='notice'>You take \the [obj] out of incision on \the [target]'s [affected.name] with \the [tool].</span>" )
			target.remove_implant(obj, TRUE, affected)

			affected.createwound(CUT, affected.min_broken_damage/2, 1)

			BITSET(target.hud_updateflag, IMPLOYAL_HUD)

			playsound(target.loc, 'sound/effects/squelch1.ogg', 15, 1)
		else
			user.visible_message("<span class='notice'>[user] removes \the [tool] from [target]'s [affected.name].</span>", \
			"<span class='notice'>There's something inside [target]'s [affected.name], but you just missed it this time.</span>" )
	else
		user.visible_message("<span class='notice'>[user] could not find anything inside [target]'s [affected.name], and pulls \the [tool] out.</span>", \
		"<span class='notice'>You could not find anything inside [target]'s [affected.name].</span>" )

/decl/surgery_step/implant_removal_ghetto/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/chest/affected = target.get_organ(target_zone)
	user.visible_message("<span class='warning'>[user]'s hand slips, scraping around inside [target]'s [affected.name] with \the [tool]!</span>", \
	"<span class='warning'>Your hand slips, scraping around inside [target]'s [affected.name] with \the [tool]!</span>")
	affected.take_external_damage(20, 0, (DAM_SHARP|DAM_EDGE), used_weapon = tool)
	if(prob(50))
		affected.sever_artery()
