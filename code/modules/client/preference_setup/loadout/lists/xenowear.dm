// Alien clothing.

// Unathi clothing
/datum/gear/suit/unathi/
	sort_category = "Xenowear"
	category = /datum/gear/suit/unathi/
	whitelisted = list(SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_EROSAN)

/datum/gear/suit/unathi/mantle
	display_name = "(Unathi) hide mantle"
	path = /obj/item/clothing/suit/unathi/mantle

/datum/gear/suit/unathi/robe
	display_name = "(Unathi) roughspun robe"
	path = /obj/item/clothing/suit/unathi/robe

/datum/gear/suit/unathi/knifeharness
	display_name = "(Unathi) decorated knife harness"
	path = /obj/item/clothing/accessory/storage/knifeharness
	cost = 3

/datum/gear/suit/unathi/savage_hunter
	display_name = "(Unathi) savage hunter male hides"
	path = /obj/item/clothing/under/savage_hunter
	slot = slot_w_uniform

/datum/gear/suit/unathi/savage_hunter/female
	display_name = "(Unathi) savage hunter female hides"
	path = /obj/item/clothing/under/savage_hunter/female
	slot = slot_w_uniform

//Skrell Chains
/datum/gear/ears/skrell/
	sort_category = "Xenowear"
	category = /datum/gear/ears/skrell/
	whitelisted = list(SPECIES_SKRELL)

/datum/gear/ears/skrell/chains
	display_name = "(Skrell) headtail chain selection"
	path = /obj/item/clothing/ears/skrell/chain
	flags = GEAR_HAS_SUBTYPE_SELECTION

/datum/gear/ears/skrell/colored/chain
	display_name = "(Skrell) colored headtail chain, colour select"
	path = /obj/item/clothing/ears/skrell/colored/chain
	flags = GEAR_HAS_COLOR_SELECTION

//Skrell Bands
/datum/gear/ears/skrell/bands
	display_name = "(Skrell) headtail band selection"
	path = /obj/item/clothing/ears/skrell/band
	flags = GEAR_HAS_SUBTYPE_SELECTION

/datum/gear/ears/skrell/colored/band
	display_name = "(Skrell) headtail bands, colour select"
	path = /obj/item/clothing/ears/skrell/colored/band
	flags = GEAR_HAS_COLOR_SELECTION

//Skrell Cloth
/datum/gear/ears/skrell/cloth/male
	display_name = "(Skrell) male headtail cloth"
	path = /obj/item/clothing/ears/skrell/cloth_male
	flags = GEAR_HAS_COLOR_SELECTION


/datum/gear/ears/skrell/cloth/female
	display_name = "(Skrell) female headtail cloth"
	path = /obj/item/clothing/ears/skrell/cloth_female
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/skrell_helmet
	display_name = "Skrellian helmet"
	path = /obj/item/clothing/head/helmet/skrell
	whitelisted = list(SPECIES_SKRELL)
	sort_category = "Xenowear"
	allowed_roles = list(/datum/job/hos, /datum/job/warden, /datum/job/officer, /datum/job/detective)

/datum/gear/accessory/skrell_badge
	display_name = "skrellian SDTF badge"
	path = /obj/item/clothing/accessory/badge/tags/skrell
	whitelisted = list(SPECIES_SKRELL)
	sort_category = "Xenowear"

// IPC clothing
/datum/gear/mask/ipc_monitor
	display_name = "(IPC) display monitor"
	path = /obj/item/clothing/mask/monitor
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_IPC)

/datum/gear/suit/lab_xyn_machine
	display_name = "(IPC) Xynergy labcoat"
	path = /obj/item/clothing/suit/storage/toggle/labcoat/xyn_machine
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_IPC)

// Misc clothing
/datum/gear/uniform/harness
	display_name = "gear harness (Full Body Prosthetic, Diona, Giant Armoured Serpentid, IPC)"
	path = /obj/item/clothing/under/harness
	sort_category = "Xenowear"

/datum/gear/shoes/toeless
	display_name = "toeless jackboots"
	path = /obj/item/clothing/shoes/jackboots/unathi
	sort_category = "Xenowear"

/datum/gear/shoes/wrk_toeless
	display_name = "toeless workboots"
	path = /obj/item/clothing/shoes/workboots/toeless
	sort_category = "Xenowear"

// Taj clothing
/datum/gear/eyes/medical/tajblind
	display_name = "(Tajara) veil, medical"
	path = /obj/item/clothing/glasses/hud/health/tajblind
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	cost = 1

/datum/gear/eyes/meson/tajblind
	display_name = "(Tajara) veil, industrial"
	path = /obj/item/clothing/glasses/meson/prescription/tajblind
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	cost = 1

/datum/gear/eyes/security/tajblind
	display_name = "(Tajara) veil, sleek"
	path = /obj/item/clothing/glasses/sunglasses/sechud/tajblind
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	cost = 1

/datum/gear/eyes/visors
	display_name = "(Tajara) visor selection"
	path = /obj/item/clothing/glasses/tajvisor
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA)
	cost = 1

/datum/gear/eyes/visors/New()
	..()
	var/visors = list()
	visors["visor type-A (Tajara)"] = /obj/item/clothing/glasses/tajvisor/a
	visors["visor type-B (Tajara)"] = /obj/item/clothing/glasses/tajvisor/b
	visors["visor type-C (Tajara)"] = /obj/item/clothing/glasses/tajvisor/c
	visors["visor type-D (Tajara)"] = /obj/item/clothing/glasses/tajvisor/d
	visors["visor type-E (Tajara)"] = /obj/item/clothing/glasses/tajvisor/e
	visors["visor type-F (Tajara)"] = /obj/item/clothing/glasses/tajvisor/f
	visors["visor type-G (Tajara)"] = /obj/item/clothing/glasses/tajvisor/g
	gear_tweaks += new/datum/gear_tweak/path(visors)

/datum/gear/eyes/medical/tajvisor
	display_name = "(Tajara) visor, medical"
	path = /obj/item/clothing/glasses/hud/health/tajvisor
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	cost = 1

/datum/gear/eyes/security/tajvisor
	display_name = "(Tajara) visor, security"
	path = /obj/item/clothing/glasses/sunglasses/sechud/tajvisor
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	cost = 1

/datum/gear/eyes/meson/tajvisor
	display_name = "(Tajara) visor, industrial"
	path = /obj/item/clothing/glasses/meson/prescription/tajvisor
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"
	cost = 1

/datum/gear/shoes/caligae
	display_name = "(Tajara) caligae"
	path = /obj/item/clothing/shoes/sandal/tajaran/caligae
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/shoes/caligae/New()
	..()
	var/caligae = list()
	caligae["no sock"] = /obj/item/clothing/shoes/sandal/tajaran/caligae
	caligae["black sock"] = /obj/item/clothing/shoes/sandal/tajaran/caligae/black
	caligae["grey sock"] = /obj/item/clothing/shoes/sandal/tajaran/caligae/grey
	caligae["white sock"] = /obj/item/clothing/shoes/sandal/tajaran/caligae/white
	gear_tweaks += new/datum/gear_tweak/path(caligae)

/datum/gear/head/zhan_scarf
	display_name = "(Tajara) Zhan headscarf"
	path = /obj/item/clothing/head/tajaran/scarf
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/accessory/capes
	display_name = "(Tajara) shoulder capes"
	path = /obj/item/clothing/accessory/shouldercape
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/accessory/capes/New()
	..()
	var/capes = list()
	capes["simple cape"] = /obj/item/clothing/accessory/shouldercape/grunt
	capes["decorated cape"] = /obj/item/clothing/accessory/shouldercape/officer
	capes["government cape"] = /obj/item/clothing/accessory/shouldercape/command
	gear_tweaks += new/datum/gear_tweak/path(capes)

// Pre-modified gloves

/datum/gear/gloves/colored/modified
	display_name = "modified gloves, colored"
	path = /obj/item/clothing/gloves/color/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_EROSAN)

/datum/gear/gloves/latex/modified
	display_name = "modified gloves, latex"
	path = /obj/item/clothing/gloves/latex/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_EROSAN)

/datum/gear/gloves/nitrile/modified
	display_name = "modified gloves, nitrile"
	path = /obj/item/clothing/gloves/latex/nitrile/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_EROSAN)

/datum/gear/gloves/rainbow/modified
	display_name = "modified gloves, rainbow"
	path = /obj/item/clothing/gloves/rainbow/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_EROSAN)

/datum/gear/gloves/evening/modified
	display_name = "modified gloves, evening"
	path = /obj/item/clothing/gloves/color/evening/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_EROSAN)

/datum/gear/gloves/botany/modified
	display_name = "modified gloves, botany"
	path = /obj/item/clothing/gloves/thick/botany/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_EROSAN)

/datum/gear/gloves/work/modified
	display_name = "modified gloves, work"
	path = /obj/item/clothing/gloves/thick/modified
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_TAJARA, SPECIES_UNATHI, SPECIES_YEOSA, SPECIES_EROSAN)

// Vox clothing
/datum/gear/mask/gas/vox
	display_name = "(Vox) breathing mask"
	path = /obj/item/clothing/mask/gas/vox
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_VOX)
	cost = 2

/datum/gear/gloves/vox
	display_name = "(Vox) insulated gauntlets"
	path = /obj/item/clothing/gloves/vox
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_VOX)
	cost = 4

/datum/gear/uniform/vox_cloth
	display_name = "(Vox) clothing"
	path = /obj/item/clothing/under/vox/vox_casual
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_VOX)

/datum/gear/uniform/vox_robe
	display_name = "(Vox) vox robe"
	path = /obj/item/clothing/under/vox/vox_robes
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_VOX)

	//////////
	//RESOMI//
	//////////

/datum/gear/uniform/resomi
	display_name = "(Resomi) smock, grey"
	path = /obj/item/clothing/under/resomi
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_RESOMI)

/datum/gear/uniform/resomi/white
	display_name = "(Resomi) smock, colored"
	path = /obj/item/clothing/under/resomi/white
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/uniform/resomi/dress
	display_name = "(Resomi) dresses selection"
	path = /obj/item/clothing/under/resomi/dress
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/resomi/utility
	display_name = "(Resomi) uniform selection"
	path = /obj/item/clothing/under/resomi/utility
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/resomi/sport
	display_name = "(Resomi) uniform, Sport"
	path = /obj/item/clothing/under/resomi/sport

/datum/gear/uniform/resomi/rainbow
	display_name = "(Resomi) smock, rainbow"
	path = /obj/item/clothing/under/resomi/rainbow

/datum/gear/uniform/resomi/eng
	display_name = "(Resomi) smock, Engineering"
	path = /obj/item/clothing/under/resomi/yellow

/datum/gear/uniform/resomi/roboitcs
	display_name = "(Resomi) smock, Robotics"
	path = /obj/item/clothing/under/resomi/robotics

/datum/gear/uniform/resomi/sec
	display_name = "(Resomi) smock, Security"
	path = /obj/item/clothing/under/resomi/red

/datum/gear/uniform/resomi/med
	display_name = "(Resomi) uniform, Medical"
	path = /obj/item/clothing/under/resomi/medical

/datum/gear/uniform/resomi/science
	display_name = "(Resomi) uniform, Science"
	path = /obj/item/clothing/under/resomi/science

/datum/gear/uniform/resomi/dark_worksmock
	display_name = "(Resomi) work uniform, dark"
	path = /obj/item/clothing/under/resomi/work_black
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/uniform/resomi/light_worksmock
	display_name = "(Resomi) work uniform, light"
	path = /obj/item/clothing/under/resomi/work_white
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/eyes/resomi
	display_name = "(Resomi) sun lenses"
	path = /obj/item/clothing/glasses/sunglasses/lenses
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_RESOMI)

/datum/gear/eyes/resomi/lenses_sec
	display_name = "(Resomi) sun sechud lenses"
	path = /obj/item/clothing/glasses/sunglasses/sechud/lenses

/datum/gear/eyes/resomi/lenses_med
	display_name = "(Resomi) sun medhud lenses"
	path = /obj/item/clothing/glasses/hud/health/lenses

/datum/gear/accessory/resomi_mantle
	display_name = "(Resomi) small mantle"
	path = /obj/item/clothing/accessory/scarf/resomi
	flags = GEAR_HAS_COLOR_SELECTION
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_RESOMI)

/datum/gear/suit/resomi
	display_name = "(Resomi) small cloak"
	path = /obj/item/clothing/suit/storage/toggle/Resomicoat
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_RESOMI)

/datum/gear/suit/resomi_labcoat
	display_name = "(Resomi) small labcoat"
	path = /obj/item/clothing/suit/storage/toggle/Resomilabcoat
	flags = GEAR_HAS_COLOR_SELECTION
	sort_category = "Xenowear"
	whitelisted = list(SPECIES_RESOMI)

// Adherent

/datum/gear/storage/adherent_harness
	display_name = "(Adherent) tools harness"
	path = /obj/item/weapon/storage/belt/utility/vigil
	sort_category = "Xenowear"
	slot = slot_belt
	cost = 4
	whitelisted = list(SPECIES_ADHERENT)
