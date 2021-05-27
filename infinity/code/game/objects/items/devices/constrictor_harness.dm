/obj/item/clothing/suit/constrictor_harness
	name = "constrictor harness"
	desc = "The Constrictor Harness will compress your torso upon activation, allowing you to enter narrow spaces. Using the Constrictor Harness prevents you from moving properly."
	icon_state = "kvest"
	action_button_name = "Toggle constrictor"
	body_parts_covered = UPPER_TORSO
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_ENGINEERING = 2, TECH_ESOTERIC = 2)

	var/toggled = FALSE  // is suit toggled on
	var/broken = FALSE   // is suit broken


/obj/item/clothing/suit/constrictor_harness/examine(var/mob/user, var/distance)
	. = ..()
	if(distance <= 1 && broken)
		to_chat(user, SPAN_WARNING("It's broken."))


/obj/item/clothing/suit/constrictor_harness/proc/disable_suit(mob/living/L)
	if(toggled)
		toggled = FALSE
		slowdown_general = 0
		canremove = 1
		L.verbs -= /mob/living/proc/ventcrawl


/obj/item/clothing/suit/constrictor_harness/proc/toggle_suit()
	var/mob/living/carbon/human/H = src.loc

	if(broken)
		to_chat(H, SPAN_DANGER("Oh no, [src] is broken!"))
		return

	if(!toggled)
		if(H.wear_suit != src)
			to_chat(H, SPAN_WARNING("You must be wearing \the [src]!"))
			return

		H.visible_message(SPAN_WARNING("[H] started to turn on \the [src]"))

		if(!do_after(H, 30, src))
			return

		toggled = TRUE
		slowdown_general = 9
		canremove = 0
		H.verbs += /mob/living/proc/ventcrawl
		to_chat(H, SPAN_WARNING("You feel your body stiffen. It's getting harder to move around."))

	else
		H.visible_message(SPAN_WARNING("[H] started to turn off \the [src]"))
		if(!do_after(H, 30, src))
			return
		disable_suit(H)
		to_chat(H, SPAN_NOTICE("Nothing squeezes your chest. What a relief."))


/obj/item/clothing/suit/constrictor_harness/ui_action_click()
	toggle_suit()


/obj/item/clothing/suit/constrictor_harness/equipped(mob/living/carbon/human/H, slot)
	if(istype(H) && (H.wear_suit == src))
		H.visible_message(SPAN_NOTICE("[H] starts putting on \the [src]..."), SPAN_NOTICE("You start putting on \the [src]..."))
		if(!do_after(H, 20, src))
			if(H && H.wear_suit == src)
				if(!H.unEquip(src))
					return
			return


/obj/item/clothing/suit/constrictor_harness/dropped(mob/living/carbon/human/H)
	disable_suit(H)


/obj/item/clothing/suit/constrictor_harness/emp_act(severity)
	var/mob/living/carbon/human/H = src.loc
	if(H.wear_suit != src)
		return
	else
		H.losebreath = 20
		to_chat(H, SPAN_DANGER("[src] is squeezing your body too hard! It becomes impossible to breathe!"))

		if(prob(40))
			H.electrocute_act(rand(15,25), src)
			to_chat(H, SPAN_DANGER("[src] shocked you!"))

		if(toggled)
			if(prob(80))
				H.electrocute_act(rand(30,50), src)
				to_chat(H, SPAN_DANGER("[src] shocked you!"))
			
			disable_suit(H)


// Surgery. To remove the active suit from an unconscious person.
/decl/surgery_step/constrictor_harness
	name = "Remove constrictor_harness"
	allowed_tools = list(
		/obj/item/wrench = 75,
		/obj/item/screwdriver = 75,
		/obj/item/psychic_power/psiblade/master/grand/paramount = 100,
		/obj/item/psychic_power/psiblade = 100,
		/obj/item/weldingtool = 100,
		/obj/item/circular_saw = 100,
	)
	can_infect = 0
	blood_level = 0
	min_duration = 120
	max_duration = 180
	surgery_candidate_flags = 0


/decl/surgery_step/constrictor_harness/assess_bodypart(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	return TRUE


/decl/surgery_step/constrictor_harness/get_skill_reqs(mob/living/user, mob/living/carbon/human/target, obj/item/tool)
	if(isWrench(tool) || isScrewdriver(tool))
		return list(list(SKILL_ELECTRICAL = SKILL_ADEPT, SKILL_DEVICES = SKILL_ADEPT))
	else
		return list(list())


/decl/surgery_step/constrictor_harness/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if(!istype(target))
		return FALSE
	if(isWelder(tool))
		var/obj/item/weldingtool/welder = tool
		if(!welder.isOn() || !welder.remove_fuel(1,user))
			return FALSE
	return (target_zone == BP_CHEST) && istype(target.wear_suit, /obj/item/clothing/suit/constrictor_harness) && !(target.wear_suit.canremove)


/decl/surgery_step/constrictor_harness/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if(isWrench(tool) || isScrewdriver(tool))
		user.visible_message(SPAN_NOTICE("[user] is trying to deactivate [target]'s [target.wear_suit] with \the [tool]."))
	else
		user.visible_message(SPAN_WARNING("[user] is tryiong to cut off [target]'s [target.wear_suit] with \the [tool]!"))
	..()


/decl/surgery_step/constrictor_harness/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/clothing/suit/constrictor_harness/constrictor = target.wear_suit
	constrictor.canremove = 1
	constrictor.disable_suit(target)
	if(isWrench(tool) || isScrewdriver(tool))
		user.visible_message(SPAN_NOTICE("[user] carefully loosened the braces of  [target]'s [target.wear_suit] with \the [tool]. Now \the [target.wear_suit] can be removed."))
	else
		constrictor.broken = TRUE
		user.visible_message(SPAN_DANGER("[user] cut off the important details of \the [target.wear_suit] with \the [tool], turning it into useless junk. Now \the [target.wear_suit] can ne removed."))


/decl/surgery_step/constrictor_harness/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message(SPAN_WARNING("[user] failed to deactivate [target]'s [target.wear_suit] with \the [tool]!"))
