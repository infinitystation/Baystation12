/obj/item/organ/internal/ears
	name = "ears"
	icon = 'infinity/icons/obj/surgery.dmi'
	icon_state = "ears"
	gender = PLURAL
	organ_tag = BP_EARS
	parent_organ = BP_HEAD
	surface_accessible = TRUE
	relative_size = 3

	var/damage_mod = 1

/obj/item/organ/internal/ears/Process()
	if(owner && istype(owner))
		damage = min(owner.ear_damage / 10 * 3 * damage_mod, max_damage)

/mob/living/carbon/human/is_deaf()
	var/obj/item/organ/internal/ears/ears = locate() in internal_organs
	if(species.has_organ[BP_EARS] && (!ears))
		return 1
	if(ears && ears.is_broken())
		return 1
	return ((sdisabilities & DEAFENED) || ear_deaf || incapacitated(INCAPACITATION_KNOCKOUT))