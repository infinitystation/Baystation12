/obj/item/melee/claws
	name = "zombie claws"
	desc = "Retractable claws hidden in your fingers. You can use them to infect other people."
	icon = 'icons/mob/screen1.dmi'
	icon_state = "grabbed+1"
	hitsound = 'infinity/sound/weapons/bloodyslice.ogg'
	w_class = 4
	force = 8
	base_parry_chance = 0
	canremove = 0
	sharp = 0
	edge = 0
	anchored = TRUE
	throwforce = 0
	throw_range = 0
	throw_speed = 0
	attack_verb = list("attacked", "slashed", "ripped", "diced")
	var/mob/living/creator

/obj/item/melee/claws/Initialize()
	. = ..()
	create_reagents(2)

/obj/item/melee/claws/dropped(var/mob/living/user)
	visible_message(SPAN_DANGER("[user] retracts their claws with strange sound"),
	SPAN_WARNING("You hear strange noises of organic matter ripping and tearing!"))
	playsound(loc, 'sound/effects/blobattack.ogg', 5, 1)
	QDEL_IN(src, 1)

/obj/item/melee/claws/attack(atom/target, mob/user, proximity)
	. = ..()
	if(target.reagents)
		if(istype(target, /mob/living/carbon/human))
			var/mob/living/carbon/human/T = target
			var/obj/item/organ/external/affecting = T.get_organ(user.zone_sel.selecting)
			if(!affecting)
				return

			for(var/obj/item/clothing/clothes in list(T.head, T.wear_mask, T.wear_suit, T.w_uniform, T.gloves, T.shoes))
				if(istype(clothes) && (clothes.body_parts_covered & affecting.body_part) && (clothes.item_flags & ITEM_FLAG_THICKMATERIAL))
					return

			var/amount = rand(0.5, 2.0)
			reagents.add_reagent(/datum/reagent/toxin/zombie, amount)
			reagents.trans_to_mob(target, amount, CHEM_BLOOD)

/mob/living/proc/zombie_claws()
	set category = "Abilities"
	set name = "Release Claws"
	set desc="Release your deadly claws, capable of infecting other people."

	var/mob/living/M = src

	if(incapacitated())
		return

	var/obj/item/melee/claws/claw = M
	var/retracted = 0
	for(claw in M.contents)
		M.drop_from_inventory(claw)
		retracted = 1
	if(retracted)
		playsound(loc, 'infinity/sound/weapons/bloodyslice.ogg', 2, 1)
		return

	if(M.l_hand || M.r_hand)
		to_chat(M, SPAN_LING("Your hands are full."))
		return

	M.visible_message(SPAN_DANGER("[M]\'s fingers begins to twist, releasing strange claws!"),
							SPAN_DANGER("You release your claws."),
							SPAN_DANGER("You hear strange noises of organic matter ripping and tearing!"))
	playsound(get_turf(src), 'infinity/sound/effects/lingextends.ogg', 5, 1)
	spawn(1 SECOND)
		if(M.l_hand || M.r_hand)
			to_chat(M, SPAN_LING("Your hands are full."))
			return
		claw = new(M)
		claw.creator = M
		M.put_in_hands(claw)
		claw = new(M)
		claw.creator = M
		M.put_in_hands(claw)
		playsound(loc, 'infinity/sound/weapons/bloodyslice.ogg', 3, 1)
