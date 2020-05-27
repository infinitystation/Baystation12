/obj/item/organ/internal/tongue
	name = "tongue"
	icon = 'infinity/icons/obj/surgery.dmi'
	icon_state = "tonguenormal"
	gender = PLURAL
	organ_tag = BP_TONGUE
	parent_organ = BP_HEAD
	surface_accessible = TRUE
	relative_size = 5
	var/notongue_speech = "mumbles"

/obj/item/organ/internal/tongue/robotic
	name = "voice synthiser"
	icon_state = "tonguerobot"
	notongue_speech = null

/obj/item/organ/internal/tongue/xeno
	name = "strange tongue"
	icon_state = "tonguexeno"
	notongue_speech = "quietly buzzes"

/obj/item/organ/internal/tongue/crystal
	name = "crystalline sound synthiser"
	icon_state = "electrotongue"
	notongue_speech = "quietly jingles"