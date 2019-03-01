/obj/item/clothing/under/civilian
	name = "white-black suit"
	desc = "A both shirt with a black pants in one. What else need for a gentlemen?"
	icon = 'icons/obj/clothing/infinity/uniform.dmi'
	item_icons = list(slot_w_uniform_str = 'icons/mob/infinity/uniform.dmi')
	icon_state = "white-black"
	item_state = "white-black"

/obj/item/clothing/under/civilian/black
	name = "black-white suit"
	desc = "A dark shirt with a black pants. What else need for a burglar from Orlov's group?"
	icon_state = "black-white"
	item_state = "black-white"

/obj/item/clothing/under/CE_female
	name = "CE female shorts"
	icon = 'icons/obj/clothing/infinity/TG_copy/infinity_work.dmi'
	item_icons = list(slot_w_uniform_str = 'icons/mob/infinity/uniform.dmi')
	icon_state = "ce_female_shorts"
	item_state = "ce_female_shorts"

/obj/item/clothing/under/harness/invisible
	worn_state = null
	icon_override = "invisible"

/obj/item/clothing/under/rank/engineer/senior
	name = "senior engineer's jumpsuit"
	icon = 'icons/obj/clothing/infinity/uniform.dmi'
	item_icons = list(slot_w_uniform_str = 'icons/mob/infinity/uniform.dmi')
	icon_state = "engine_senior"
	item_state = "eng_senior"
	worn_state = "eng_senior"

/obj/item/clothing/under/rank/captain/whitefleet
	name = "white captain's uniform"
	desc = "It's a white uniform with some gold markings denoting the rank of \"Captain\"."
	icon = 'icons/obj/clothing/infinity/uniform.dmi'
	item_icons = list(slot_w_uniform_str = 'icons/mob/infinity/uniform.dmi')
	icon_state = "wfleetcommander"
	item_state = "wfleetcommander"
	worn_state = "wfleetcommander"
	displays_id = 0

/obj/item/clothing/under/rank/captain/bluefleet
	name = "darkblue captain's uniform"
	desc = "It's a darkblue uniform with some gold markings denoting the rank of \"Captain\"."
	icon = 'icons/obj/clothing/infinity/uniform.dmi'
	item_icons = list(slot_w_uniform_str = 'icons/mob/infinity/uniform.dmi')
	icon_state = "fleet_com"
	item_state = "fleet_com"
	worn_state = "fleet_com"
	displays_id = 0

/obj/item/clothing/under/rank/janitor/white
	name = "janitor's utility uniform"
	icon = 'icons/obj/clothing/infinity/uniform.dmi'
	item_icons = list(slot_w_uniform_str = 'icons/mob/infinity/uniform.dmi')
	icon_state = "janitor_uniform"
	item_state = "janitor_uniform"
	worn_state = "janitor_uniform"
	displays_id = 0

/obj/item/clothing/under/manager
	name = "manager's uniform"
	desc = "A generic suit for office's middle managar. Our usual worker (who'll know?)."
	icon = 'icons/obj/clothing/infinity/uniform.dmi'
	item_icons = list(slot_w_uniform_str = 'icons/mob/infinity/uniform.dmi')
	icon_state = "middle_manager"
	item_state = "middle_manager"
	worn_state = "middle_manager"
	displays_id = 0

/obj/item/clothing/under/ert_outfit
	name = "asset protection uniform"
	desc = "A black camouflage uniform for NT Security Force's asset protection."
	icon = 'icons/obj/clothing/infinity/uniform.dmi'
	item_icons = list(slot_w_uniform_str = 'icons/mob/infinity/uniform.dmi')
	icon_state = "ass_protection"
	item_state = "ass_protection"
	worn_state = "ass_protection"
	armor = list(melee = 10, bullet = 10, laser = 10,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/adjutant
	name = "adjutant's uniform"
	desc = "It's made of a special fiber that gives protection against strong language."
	icon = 'icons/obj/clothing/infinity/uniform.dmi'
	item_icons = list(slot_w_uniform_str = 'icons/mob/infinity/uniform.dmi')
	icon_state = "adjutant"
	item_state = "adjutant"
	worn_state = "adjutant"

/obj/item/clothing/under/scp_uniform
	name = "SCP guard uniform"
	desc = "It's dark grey uniform made of a slightly sturdier material than standard jumpsuits, to allow for good protection.\nThis uniform has SCP tags on shoulders, terran organization of NT asset protection."
	icon = 'icons/obj/clothing/infinity/uniform.dmi'
	item_icons = list(slot_w_uniform_str = 'icons/mob/infinity/uniform.dmi')
	icon_state = "scp_uniform"
	item_state = "scp_uniform"
	worn_state = "scp_uniform"
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/gray_camo
	name = "grey camo uniform"
	desc = "It's grey camo unifrom made of a slightly sturdier material than standard jumpsuits, to allow for good protection and military style."
	icon = 'icons/obj/clothing/infinity/uniform.dmi'
	item_icons = list(slot_w_uniform_str = 'icons/mob/infinity/uniform.dmi')
	icon_state = "gray_camo"
	item_state = "gray_camo"
	worn_state = "gray_camo"
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/bluetunic_regular
	name = "blue tunic"
	desc = "A blue tunic. Beautifully archaic."
	icon_state = "bluetunic"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/zpci_uniform
	name = "ZPCI uniform"
	desc = "This is a standard model of the ZPCI uniform."
	icon = 'icons/obj/clothing/infinity/uniform.dmi'
	item_icons = list(slot_w_uniform_str = 'icons/mob/infinity/uniform.dmi')
	icon_state = "zpci_uniform"
	item_state = "zpci_uniform"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0) //it's security uniform's stats
	siemens_coefficient = 0.9
