
//Flags of rituals

#define NEEDS_KNIFE 1
#define NEEDS_BOOK  2
#define NEEDS_ARMOR 4
#define NEEDS_FLOOR 8

#define RITUAL_BLOODY      16
#define RITUAL_VERY_BLOODY 32

/datum/ritual
	var/name = "Buggy Ritual"
	var/desc = "Summons an admin to ask you how you reached this shit. Report this!"

	var/rune_type
	var/requirments = list()
	var/ritual_flags = NEEDS_KNIFE

	var/required_cultists = 1
	var/ritual_radius = 1 //Basically 3x3 with radius 1

/datum/ritual/proc/speak_incantation(var/mob/living/user, var/incantation)
	var/datum/language/L = all_languages[LANGUAGE_CULT]
	if(incantation && (L in user.languages))
		user.say(incantation, L)

/datum/ritual/proc/check_cultists(var/obj/effect/ritual_rune, var/mob/user)
	var/cultists = 0
	for(var/mob/cultist in orange(ritual_rune, ritual_radius))
		if(iscultist(cultist))
			cultists += 1

	if(cultists < required_cultists)
		return 0

	return cultists

/datum/ritual/proc/mass_incantation(var/obj/effect/ritual_rune, var/incantation)
	for(var/mob/cultist in orange(ritual_rune, ritual_radius))
		if(iscultist(cultist))
			speak_incantation(cultist, incantation)

/datum/ritual/proc/cast(var/obj/effect/ritual_rune, var/mob/user)
	var/has_knife = 0
	var/has_tome = 0
	var/has_robes = 0
	var/cult_ground = 0

	if(istype(user.get_active_hand(), /obj/item/weapon/material/knife) || istype(user.get_inactive_hand(), /obj/item/weapon/material/knife))
		has_knife = 1

	if(istype(user.get_active_hand(), /obj/item/weapon/book/tome) || istype(user.get_inactive_hand(), /obj/item/weapon/book/tome))
		has_tome = 1

	if(istype(user.get_equipped_item(slot_head), /obj/item/clothing/head/culthood) && istype(user.get_equipped_item(slot_wear_suit), /obj/item/clothing/suit/cultrobes) && istype(user.get_equipped_item(slot_shoes), /obj/item/clothing/shoes/cult))
		has_robes = 1

	if(!istype(ritual_rune, rune_type))
		return 0

	var/turf/T = get_turf(ritual_rune)
	if(T.holy)
		to_chat(src, SPAN_WARNING("This place is blessed, you may not perform rituals on it - defile it first."))
		return
	if(!istype(T, /turf/simulated))
		to_chat(src, SPAN_WARNING("You need more space to perform a ritual here."))
		return
	if(T.icon_state == "cult" || T.icon_state == "cult-narsie")
		cult_ground = 1

	if(ritual_flags & NEEDS_KNIFE && !has_knife)
		to_chat(user, SPAN_WARNING("You can't perform this ritual without a knife!"))
		return

	if(ritual_flags & NEEDS_BOOK && !has_tome)
		to_chat(user, SPAN_WARNING("The ritual is too complex to perform it without a tome!"))
		return

	if(ritual_flags & NEEDS_ARMOR && !has_robes)
		to_chat(user, SPAN_WARNING("You can't manage to perform this ritual without a propper set of clothing!"))
		return

	if(ritual_flags & NEEDS_FLOOR && !cult_ground)
		to_chat(user, SPAN_WARNING("Your connection to this world is too strong on this floor!"))
		return

	for(var/obj in requirments)
		if(!locate(obj) in get_turf(ritual_rune))
			to_chat(user, SPAN_WARNING("You need [obj] on the rune to perform this ritual!"))
			return

	for(var/obj in requirments)
		var/req_item = locate(obj) in get_turf(ritual_rune)
		qdel(req_item)

	if(ritual_flags & RITUAL_BLOODY)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.drip(5, get_turf(ritual_rune))

	if(ritual_flags & RITUAL_VERY_BLOODY)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			for(var/i = 1 to 3)
				H.drip(5, get_turf(ritual_rune))
