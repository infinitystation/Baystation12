/obj/item/modular_computer/holo
	name = "holotablet"
	desc = "Cheap holoemitter-fitted device designed for writing reports and notes."

	icon            = 'infinity/icons/obj/holo_computer.dmi'
	icon_state      = "base"
	interact_sounds = list('infinity/sound/items/ui_holo.ogg')

	hardware_flag   = PROGRAM_PDA
	modifiable      = FALSE

	w_class    = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT
	matter     = list(MATERIAL_ALUMINIUM = 250, MATERIAL_PLASTIC = 250, MATERIAL_GLASS = 500)

	var/preset_text   = "" //If set, will have a file containing this text
	var/display_color = "#0a50ff"

//Software-Hardware stuff

/obj/item/modular_computer/holo/Initialize()
	. = ..()
	if(preset_text)
		var/datum/computer_file/data/text/preset = new()
		preset.filename    = "temp[rand(1,100)]"
		preset.stored_data = preset_text
		hard_drive.store_file(preset)
		var/datum/computer_file/program/wordprocessor/word = hard_drive.find_file_by_name("wordprocessor")
		if(!word) return
		word.open_file   = preset.filename
		word.loaded_data = preset.stored_data

/obj/item/modular_computer/holo/install_default_programs()
	hard_drive.store_file(new/datum/computer_file/program/wordprocessor())
	var/datum/extension/interactive/ntos/os = get_extension(src, /datum/extension/interactive/ntos)
	if(os) os.set_autorun("wordprocessor")

/obj/item/modular_computer/holo/install_default_hardware()
	battery_module          = new /obj/item/weapon/stock_parts/computer/battery_module/nano(src)
	processor_unit          = new /obj/item/weapon/stock_parts/computer/processor_unit/small(src)
	hard_drive              = new /obj/item/weapon/stock_parts/computer/hard_drive/micro/holo(src)
	hard_drive.max_capacity = 20
	battery_module.charge_to_full()

/obj/item/weapon/stock_parts/computer/hard_drive/micro/holo/install_default_programs()
	store_file(new/datum/computer_file/program/filemanager())

//Power usage

/obj/item/modular_computer/holo/Process()
	. = ..()
	handle_power()

/obj/item/modular_computer/holo/calculate_power_usage()
	return enabled ? 200 : 0

//Visual

/obj/item/modular_computer/holo/on_update_icon()
	overlays.Cut()
	var/datum/extension/interactive/ntos/os = get_extension(src, /datum/extension/interactive/ntos)
	if(os?.on)
		set_light(1, 0.6, 2, 2, display_color)

		var/image/A = image(icon,"[icon_state]-on")
		A.color     = display_color
		overlays   += A

		var/icon/I = icon(icon,"[icon_state]-screen")
		I.ColorTone(display_color)
		I.ChangeOpacity(0.5)
		I.AddAlphaMask(new/icon('icons/effects/effects.dmi', "scanline-1"))
		overlays += I
		return

	set_light(0)

//Loadout + Autolathe design

/datum/gear/utility/holo
	display_name = "holotablet"
	path         = /obj/item/modular_computer/holo
	cost         = 1 //No GEAR_HAS_TYPE_SELECTION cuz most probably there will be subtypes for map (see below for example)

/datum/gear/utility/holo/New()
	..()
	var/choice = list(/obj/item/modular_computer/holo,
					  /obj/item/modular_computer/holo/round,
					  /obj/item/modular_computer/holo/curved,
					  /obj/item/modular_computer/holo/wide,
					  /obj/item/modular_computer/holo/side)
	gear_tweaks += new/datum/gear_tweak/path/specified_types_list(choice)

/datum/fabricator_recipe/holotablet
	path = /obj/item/modular_computer/holo

/datum/fabricator_recipe/holotablet/round
	path = /obj/item/modular_computer/holo/round

/datum/fabricator_recipe/holotablet/curved
	path = /obj/item/modular_computer/holo/curved

/datum/fabricator_recipe/holotablet/wide
	path = /obj/item/modular_computer/holo/wide

/datum/fabricator_recipe/holotablet/side
	path = /obj/item/modular_computer/holo/side

/obj/machinery/vending/games/Initialize()
	products[/obj/item/modular_computer/holo/side] = 5
	prices[/obj/item/modular_computer/holo/side]   = 10
	. = ..()

//^^^ TODO: add a tablet containing IRL games rules (mafia, truth or dare) :D

/obj/item/modular_computer/holo/round
	name       = "round holotablet"
	icon_state = "round"
	display_color = "#00ff00"

/obj/item/modular_computer/holo/curved
	name       = "curved holotablet"
	icon_state = "curved"
	display_color = "#db2cb5"

/obj/item/modular_computer/holo/wide
	name       = "wide holotablet"
	icon_state = "wide"
	display_color = "#f5b216"

/obj/item/modular_computer/holo/wide/eng
	preset_text = {"Запомните, давление выше 170 атмосфер - вредно для труб."}

/obj/item/modular_computer/holo/side
	name       = "side holotablet"
	icon_state = "side"
	display_color = "#26fce7"