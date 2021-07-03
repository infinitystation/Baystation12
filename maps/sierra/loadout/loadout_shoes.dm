// Shoelocker
/datum/gear/shoes/duty
	display_name = "duty boots"
	path = /obj/item/clothing/shoes/dutyboots

/datum/gear/shoes/whitedress
	display_name = "dress shoes, white"
	path = /obj/item/clothing/shoes/dress/white

/datum/gear/shoes/whitedress/color
	display_name = "dress shoes, color select"
	path = /obj/item/clothing/shoes/dress/white
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/shoes/dress
	display_name = "dress shoes"
	path = /obj/item/clothing/shoes/dress

/datum/gear/shoes/lowworkboots
	display_name = "low workboots"
	path = /obj/item/clothing/shoes/workboots/alt

/datum/gear/shoes/cowboy_selection
	display_name = "cowboy boots selection"
	path = /obj/item/clothing/shoes/cowboy

/datum/gear/shoes/cowboy_selection/New()
	..()
	var/cowboy_selection_type = list()
	cowboy_selection_type["cowboy boots"] = /obj/item/clothing/shoes/cowboy
	cowboy_selection_type["classic cowboy boots"] = /obj/item/clothing/shoes/cowboy/classic
	cowboy_selection_type["snakeskin cowboy boots"] = /obj/item/clothing/shoes/cowboy/snakeskin
	gear_tweaks += new/datum/gear_tweak/path(cowboy_selection_type)
