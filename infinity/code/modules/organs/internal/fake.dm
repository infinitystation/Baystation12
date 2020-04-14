/obj/item/organ/internal/fake_brain
	name = "strange brain"
	desc = "A piece of meat found in a person's head. It's dry and light - \
	as if it was full of air without access to brainfluid."
	organ_tag = BP_FAKE
	parent_organ = BP_HEAD
	icon_state = "brain2"
	force = 1
	w_class = ITEM_SIZE_SMALL
	throwforce = 1
	throw_speed = 3
	throw_range = 5
	origin_tech = list(TECH_BIO = 1)
	attack_verb = list("attacked", "slapped", "whacked")
	relative_size = 85
	damage_reduction = 0
	can_be_printed = FALSE
