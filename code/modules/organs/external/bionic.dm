/obj/item/organ/external/chest
	name = "upper body"
	organ_tag = BP_CHEST
	icon_name = "torso"
	max_damage = 100
	min_broken_damage = 35
	w_class = ITEM_SIZE_HUGE //Used for dismembering thresholds, in addition to storage. Humans are w_class 6, so it makes sense that chest is w_class 5.
	body_part = UPPER_TORSO
	vital = 1
	can_heal_overkill = 1
	amputation_point = "spine"
	joint = "neck"
	dislocated = -1
	gendered_icon = 1
	cannot_amputate = 1
	parent_organ = null
	encased = "ribcage"
	artery_name = "aorta"
	cavity_name = "thoracic"

/obj/item/organ/external/chest/robotize()
	..()
	var/obj/item/organ/internal/cell/C = owner.internal_organs_by_name[BP_CELL]
	owner.internal_organs_by_name[BP_CELL] = new /obj/item/organ/internal/cell/bionic(owner,1)
