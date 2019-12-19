/obj/item/clothing/under/civilian
	name = "white-black suit"
	desc = "A both shirt with a black pants in one. What else need for a gentlemen?"
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "white-black"
	item_state = "white-black"

/obj/item/clothing/under/civilian/black
	name = "black-white suit"
	desc = "A dark shirt with a black pants. What else need for a burglar from Orlov's group?"
	icon_state = "black-white"
	item_state = "black-white"

/obj/item/clothing/under/CE_female
	name = "CE female shorts"
	icon = 'infinity/icons/obj/clothing/TG_copy/infinity_work.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "ce_female_shorts"
	item_state = "ce_female_shorts"

/obj/item/clothing/under/harness/invisible
	worn_state = null
	icon_override = "invisible"

/obj/item/clothing/under/rank/engineer/senior
	name = "senior engineer's jumpsuit"
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "engine_senior"
	item_state = "eng_senior"
	worn_state = "eng_senior"

/obj/item/clothing/under/rank/captain/whitefleet
	name = "white captain's uniform"
	desc = "It's a white uniform with some gold markings denoting the rank of \"Captain\"."
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "wfleetcommander"
	item_state = "wfleetcommander"
	worn_state = "wfleetcommander"
	displays_id = 0

/obj/item/clothing/under/rank/captain/bluefleet
	name = "darkblue captain's uniform"
	desc = "It's a darkblue uniform with some gold markings denoting the rank of \"Captain\"."
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "fleet_com"
	item_state = "fleet_com"
	worn_state = "fleet_com"
	displays_id = 0

/obj/item/clothing/under/rank/janitor/white
	name = "janitor's utility uniform"
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "janitor_uniform"
	item_state = "janitor_uniform"
	worn_state = "janitor_uniform"
	displays_id = 0

/obj/item/clothing/under/manager
	name = "manager's uniform"
	desc = "A generic suit for office's middle managar. Our usual worker (who'll know?)."
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "middle_manager"
	item_state = "middle_manager"
	worn_state = "middle_manager"
	displays_id = 0

/obj/item/clothing/under/ert_outfit
	name = "asset protection uniform"
	desc = "A black camouflage uniform for NT Security Force's asset protection."
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "ass_protection"
	item_state = "ass_protection"
	worn_state = "ass_protection"
	armor = list(melee = 10, bullet = 10, laser = 10,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/adjutant
	name = "adjutant's uniform"
	desc = "It's made of a special fiber that gives protection against strong language."
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "adjutant"
	item_state = "adjutant"
	worn_state = "adjutant"

/obj/item/clothing/under/scp_uniform
	name = "SCP guard uniform"
	desc = "It's dark grey uniform made of a slightly sturdier material than standard jumpsuits, to allow for good protection.\nThis uniform has SCP tags on shoulders, terran organization of NT asset protection."
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "scp_uniform"
	item_state = "scp_uniform"
	worn_state = "scp_uniform"
	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/gray_camo
	name = "camo uniform"
	desc = "It's camo unifrom made of a slightly sturdier material than standard jumpsuits, to allow for good protection and military style."
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "gray_camo"
	item_state = "gray_camo"
	worn_state = "gray_camo"
//	armor = list(melee = 10, bullet = 5, laser = 5,energy = 0, bomb = 0, bio = 0, rad = 0)
//	siemens_coefficient = 0.9

/obj/item/clothing/under/bluetunic_regular
	name = "blue tunic"
	desc = "A blue tunic. Beautifully archaic."
	icon_state = "bluetunic"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/zpci_uniform
	name = "ZPCI uniform"
	desc = "This is a standard model of the ZPCI uniform."
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "zpci_uniform"
	item_state = "zpci_uniform"
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0) //it's security uniform's stats
	siemens_coefficient = 0.9

/obj/item/clothing/under/thermal
	name = "thermal suit"
	desc = "Gray thermal suit. Nothing interesting."
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "gray_camo"
	item_state = "gray_camo"
	item_flags = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	min_cold_protection_temperature = T0C - 75
	max_heat_protection_temperature = T0C + 50
	var/max_cooling = 1.2					// in degrees per second - probably don't need to mess with heat capacity here
	var/thermostat = T0C + 10

/obj/item/clothing/under/thermal/tajara
	name = "winter-camo thermal suit"
	desc = "Winter camouflage suit, with thermal lining inside."
	icon_state = "thermotaj_1"
	item_state = "thermotaj_1"
	species_restricted = list(SPECIES_TAJARA)

/obj/item/clothing/under/thermal/tajara/tactic
	name = "tacticool thermal suit"
	desc = "A thermal suit that looks pretty tacticool!"
	icon_state = "thermotaj_2"
	item_state = "thermotaj_2"

/obj/item/clothing/under/thermal/tajara/gray
	name = "grey thermal suit"
	desc = "Gray work suit, with thermal lining inside."
	icon_state = "thermotaj_3"
	item_state = "thermotaj_3"

/obj/item/clothing/under/thermal/tajara/black
	name = "black thermal suit"
	desc = "A strict-looking thermal suit, with nothing extra on it."
	icon_state = "thermotaj_4"
	item_state = "thermotaj_4"

/obj/item/clothing/under/thermal/Process()
	var/mob/living/carbon/human/H = loc
	var/temp_adj = min(H.bodytemperature - thermostat, max_cooling)

	if (temp_adj < 0.5)    //only cools, doesn't heat, also we don't need extreme precision esli     if (temp_adj > 0.5) to greet
		return

	H.bodytemperature -= temp_adj

/obj/item/clothing/under/thermal/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/clothing/under/thermal/Destroy()
	. = ..()
	STOP_PROCESSING(SSobj, src)

/obj/item/clothing/under/thermal/proc/is_in_slot()
	var/mob/living/carbon/human/H = loc
	if(!istype(H))
		return 0
	if(!is_in_slot())
		return
	return (H.w_uniform == src)

/obj/item/clothing/under/thermal/heat
	name = "fitting thermal suit"
	desc = "Stylish fitting skrellian thermal suit. This one is black."
	icon_state = "thermoskr_1"
	item_state = "thermoskr_1"
	min_cold_protection_temperature = T0C - 25
	max_heat_protection_temperature = T0C + 100
	max_cooling = 1					// in degrees per second - probably don't need to mess with heat capacity here
	thermostat = T0C + 45

/obj/item/clothing/under/thermal/heat/white
	desc = "Stylish fitting skrellian thermal suit. This one is white."
	icon_state = "thermoskr_2"
	item_state = "thermoskr_2"

/obj/item/clothing/under/thermal/heat/Process()
	var/mob/living/carbon/human/H = loc
	var/temp_adj = min(H.bodytemperature - thermostat, max_cooling)

	if (temp_adj > 0.5)    //only cools, doesn't heat, also we don't need extreme precision esli     if (temp_adj > 0.5) to greet
		return

	H.bodytemperature -= temp_adj

/obj/item/clothing/under/thermal/heat/unati
	name = "black thermal suit"
	desc = "Unati thermal suit. This one is black."
	icon_state = "thermouna_1"
	item_state = "thermouna_1"
	species_restricted = list(SPECIES_UNATHI)
	sprite_sheets = list(
		SPECIES_UNATHI = 'infinity/icons/mob/onmob/onmob_under.dmi',
		)

/obj/item/clothing/under/thermal/heat/unati/white
	name = "white thermal suit"
	desc = "Unati thermal suit. This one is white."
	icon_state = "thermouna_2"
	item_state = "thermouna_2"

/obj/item/clothing/under/thermal/resomi
	name = "small thermal suit"
	desc = "Looks like very small suit. For children or resomi? This thermal suit is black."
	icon_state = "thermores_1"
	item_state = "thermores_1"
	thermostat = T0C
	species_restricted = list(SPECIES_RESOMI)
	sprite_sheets = list(
		SPECIES_RESOMI = 'infinity/icons/mob/onmob/onmob_under.dmi',
		)

/obj/item/clothing/under/thermal/resomi/white
	desc = "Looks like very small suit. For children or resomi? This thermal suit is white. "
	icon_state = "thermores_2"
	item_state = "thermores_2"

/obj/item/clothing/under/rank/security/saarecombat
	name = "\improper SAARE combat uniform"
	desc = "Tight-fitting dark uniform with a bright-green SAARE patch on the shoulder. The perfect outfit in which to kick doors out and teeth in."
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "saarecombat"
	item_state = "saarecombat"
	worn_state = "saarecombat"
