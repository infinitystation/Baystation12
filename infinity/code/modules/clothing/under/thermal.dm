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
	if(!istype(loc, /mob/living/carbon/human))
		return
	var/mob/living/carbon/human/H = loc
	var/temp_adj = min(abs(H.bodytemperature - thermostat), max_cooling)

	if(temp_adj < 0.5)
		return

	if(thermostat < H.bodytemperature)		// Cooling
		H.bodytemperature -= temp_adj

	else if(thermostat > H.bodytemperature)	// Heating
		H.bodytemperature += temp_adj

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
