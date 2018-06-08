////////////////////////
// For sergals and stuff
////////////////////////
// Note: Creating a sub-datum to group all vore stuff together
// would require us to exclude that datum from the global list.

/datum/sprite_accessory/hair

	//var/icon_add = 'icons/mob/human_face.dmi' //Already defined in sprite_accessories.dm line 49.
	var/color_blend_mode = ICON_MULTIPLY
	species_allowed = list(, , SPECIES_UNATHI) //This lets all races use the default hairstyles.

	awoohair
		name = "Shoulder-length Messy"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "momijihair"

	citheronia
		name = "Citheronia Hair (Kira72)"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "citheronia_hair"
		ckeys_allowed = list("Kira72")
		do_colouration = 0

	taramaw
		name = "Hairmaw (Liquidfirefly)"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "maw_hair"
		ckeys_allowed = list("liquidfirefly")
		do_colouration = 0

	citheronia_colorable
		name = "Citheronia Hair"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "citheronia_hair_c"
		do_colouration = 1

	sergal_plain
		name = "Sergal Plain"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "serg_plain"
		species_allowed = list()

	sergal_medicore
		name = "Sergal Medicore"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "serg_medicore"
		species_allowed = list()

	sergal_tapered
		name = "Sergal Tapered"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "serg_tapered"
		species_allowed = list()

	sergal_fairytail
		name = "Sergal Fairytail"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "serg_fairytail"
		species_allowed = list()

	braid
		name = "Floorlength Braid"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "hair_braid"

	twindrills
		name = "Twin Drills"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "hair_twincurl"

	ponytail6_fixed //Eggnerd's done with waiting for upstream fixes lmao.
		name = "Ponytail 6 but fixed"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "hair_ponytail6"
		species_allowed = list(SPECIES_UNATHI)

	una_hood
		name = "Cobra Hood"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "soghun_hood"

	una_spines_long
		name = "Long Unathi Spines"
		icon_state = "soghun_longspines"
		species_allowed = list(SPECIES_UNATHI)

	una_spines_short
		name = "Short Unathi Spines"
		icon_state = "soghun_shortspines"
		species_allowed = list(SPECIES_UNATHI)


	una_frills_long
		name = "Long Unathi Frills"
		icon_state = "soghun_longfrills"
		species_allowed = list(SPECIES_UNATHI)

	una_frills_short
		name = "Short Unathi Frills"
		icon_state = "soghun_shortfrills"
		species_allowed = list(SPECIES_UNATHI)

	una_horns
		name = "Unathi Horns"
		icon_state = "soghun_horns"
		species_allowed = list(SPECIES_UNATHI)

	una_bighorns
		name = "Unathi Big Horns"
		icon_state = "unathi_bighorn"
		species_allowed = list(SPECIES_UNATHI)

	una_smallhorns
		name = "Unathi Small Horns"
		icon_state = "unathi_smallhorn"
		species_allowed = list(SPECIES_UNATHI)

	una_ramhorns
		name = "Unathi Ram Horns"
		icon_state = "unathi_ramhorn"
		species_allowed = list(SPECIES_UNATHI)

	una_sidefrills
		name = "Unathi Side Frills"
		icon_state = "unathi_sidefrills"
		species_allowed = list(SPECIES_UNATHI)

	una_doublehorns
		name = "Double Unathi Horns"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_add = 'icons/mob/human_face_vr_add.dmi'
		icon_state = "soghun_dubhorns"
		species_allowed = list(SPECIES_UNATHI)

//Skrell 'hairstyles' - these were requested for a chimera and screw it, if one wants to eat seafood, go nuts
	skr_tentacle_veryshort
		name = "Skrell Very Short Tentacles"
		icon_state = "skrell_hair_veryshort"
		species_allowed = list(, , )
		gender = MALE

	skr_tentacle_short
		name = "Skrell Short Tentacles"
		icon_state = "skrell_hair_short"
		species_allowed = list(, , )

	skr_tentacle_average
		name = "Skrell Average Tentacles"
		icon_state = "skrell_hair_average"
		species_allowed = list(, , )

	skr_tentacle_verylong
		name = "Skrell Long Tentacles"
		icon_state = "skrell_hair_verylong"
		species_allowed = list(, , )
		gender = FEMALE