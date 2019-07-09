/datum/gear/suit/resomicloak
	display_name = "(Resomi) standard/job cloaks"
	sort_category = "Xenowear"
	path = /obj/item/clothing/suit/storage/resomicloak
	whitelisted = list(SPECIES_RESOMI)
	flags = GEAR_HAS_SUBTYPE_SELECTION

/datum/gear/uniform/resomi/undercoat
	display_name = "(Resomi) standard/job undercoat"
	path = /obj/item/clothing/under/resomi/undercoat
	flags = GEAR_HAS_SUBTYPE_SELECTION
/*
/datum/gear/suit/resomicloak/New()
	..()
	var/resomicloaks = list()
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_midgrey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_lightgrey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_white
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_red
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_yellow
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_green
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_blue
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_purple
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_pink
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/black_brown
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/orange_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/lightgrey_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/white_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/red_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/orange
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/yellow_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/green_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/blue_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/purple_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/pink_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/brown_grey
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/standard/rainbow
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(resomicloaks)

// Uh, i know what looks crooked, but it works quite interestingly.

/datum/gear/suit/resomicloak/New()
	..()
	var/resomicloaks = list()
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/iaa
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/service
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/qm
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/sec
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/robo
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/sci
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/para
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/viro
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/chemistry
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/medical
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/cmo
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/atmos
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/eningeer
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/ce
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/command
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/mining
	resomicloaks += /obj/item/clothing/suit/storage/resomicloak/jobs/cargo
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(resomicloaks)
*/

/*
/datum/gear/uniform/resomi/undercoat/New()
	..()
	var/undercoats = list()
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_midgrey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_lightgrey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_white
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_red
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_yellow
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_green
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_blue
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_purple
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_pink
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/black_brown
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/orange_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/white_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/lightgrey_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/red_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/orange
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/yellow_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/green_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/blue_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/purple_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/pink_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/brown_grey
	undercoats += /obj/item/clothing/under/resomi/undercoat/standard/rainbow
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(undercoats)

/datum/gear/uniform/resomi/undercoat/New()
	..()
	var/undercoats = list()
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/cargo
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/mining
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/command
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/command_g
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/ce
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/ce_w
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/engineer
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/atmos
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/cmo
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/medical
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/chemistry
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/viro
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/para
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/sci
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/robo
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/sec
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/qm
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/service
	undercoats += /obj/item/clothing/under/resomi/undercoat/jobs/iaa
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(undercoats)
*/
