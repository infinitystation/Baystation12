/obj/item/organ/internal/reviver
	name = "automatic recovery implant"
	desc = "A device, which installs in your chest and activates when you are put into a critical state."
	icon = 'infinity/icons/obj/surgery.dmi'
	icon_state = "chest_reviver"
	parent_organ = BP_CHEST
	organ_tag = BP_IMPLANT_REVIVER

	var/revive_cost = 0
	var/reviving = FALSE
	var/cooldown = 0

/obj/item/organ/internal/reviver/Process()
	if(owner && istype(owner))
		if(!canFindLace())
			return

		if(reviving)
			if(owner.stat == UNCONSCIOUS)
				heal()
			else
				cooldown = revive_cost + world.time
				reviving = FALSE
				to_chat(owner, SPAN_NOTICE("Your reviver implant shuts down and starts recharging."))
			return

		if(cooldown > world.time)
			return
		if(owner.stat != UNCONSCIOUS)
			return

		revive_cost = 0
		reviving = TRUE
		to_chat(owner, SPAN_NOTICE("You feel a faint buzzing as your reviver implant starts patching your wounds..."))

/obj/item/organ/internal/reviver/proc/heal()
	if(owner.getOxyLoss())
		owner.adjustOxyLoss(-5)
		revive_cost += 5
	if(owner.getBruteLoss())
		owner.adjustBruteLoss(-2)
		revive_cost += 40
	if(owner.getFireLoss())
		owner.adjustFireLoss(-2)
		revive_cost += 40
	if(owner.getToxLoss())
		owner.adjustToxLoss(-1)
		revive_cost += 40

/obj/item/organ/internal/reviver/emp_act(severity)
	. = ..()

	if(reviving)
		revive_cost += 200
	else
		cooldown += 200

	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		if(H.stat != DEAD && prob(50 / severity) && H.get_organ(BP_HEART))
			H.get_organ(BP_HEART).pulse = PULSE_THREADY
			status |= ORGAN_BRITTLE
			owner.visible_message(SPAN_WARNING("[owner] reels in pain!"), FONT_HUGE(SPAN_DANGER("You feel unbearable pain in your chest as your [src] malfunctions!")))