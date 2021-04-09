/obj/item/clothing/suit/constrictor_harness
	name = "constrictor harness"
	desc = "The Constrictor Harness will compress your torso upon activation, allowing you to enter narrow spaces. Using the Constrictor Harness prevents you from moving properly."
	icon_state = "kvest"
	body_parts_covered = UPPER_TORSO
	action_button_name = "Toggle constrictor"
	w_class = ITEM_SIZE_SMALL

	var/suit_toggled = 0


/obj/item/clothing/suit/constrictor_harness/proc/disable_suit(mob/living/L)
	if(suit_toggled)
		suit_toggled = 0
		slowdown_general = 0
		L.verbs -= /mob/living/proc/ventcrawl


/obj/item/clothing/suit/constrictor_harness/proc/toggle_suit()
	var/mob/living/carbon/human/H = src.loc

	if (!suit_toggled)
		if(H.wear_suit != src)
			to_chat(H, SPAN_WARNING("You must be wearing \the [src]!"))
			return

		H.visible_message(SPAN_WARNING("[H] started to turn on \the [src]"))

		if(!do_after(H, 30, src))
			return

		suit_toggled = 1
		slowdown_general = 10

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
	if(slot != slot_wear_suit)
		disable_suit(H)


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

		if(suit_toggled)
			if(prob(80))
				H.electrocute_act(rand(30,50), src)
				to_chat(H, SPAN_DANGER("[src] shocked you!"))
			
			disable_suit(H)
