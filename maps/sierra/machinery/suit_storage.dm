/obj/machinery/suit_storage_unit/sierra
	name = "Sierra's Storage Unit"
	var/isStripped = FALSE
	var/stripes_color

/obj/machinery/suit_storage_unit/sierra/on_update_icon()
	. = ..()
	if (isStripped)
		var/image/stripes_overlay = image(icon, "color_overlay_stripes")
		stripes_overlay.color = stripes_color
		overlays += stripes_overlay


/obj/machinery/suit_storage_unit/sierra/explorer
	name = "GI-EXPL Voidsuit Storage Unit"

	helmet = /obj/item/clothing/head/helmet/space/void/exploration/sierra
	suit = /obj/item/clothing/suit/space/void/exploration/sierra
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/oxygen
	mask = /obj/item/clothing/mask/gas/half

	req_access = list(access_explorer)
	islocked = TRUE
	isStripped = TRUE
	mycolour = COLOR_DARK_GRAY
	stripes_color = COLOR_VIOLET


/obj/machinery/suit_storage_unit/sierra/explorer/pilot
	name = "GI-EXPL-P Voidsuit Storage Unit"
	helmet = /obj/item/clothing/head/helmet/space/void/exploration/sierra/pilot
	suit = /obj/item/clothing/suit/space/void/exploration/sierra/pilot
	req_access = list(access_explorer, access_expedition_shuttle_helm)


/obj/machinery/suit_storage_unit/sierra/explorer/med
	name = "GI-EXPL-M Voidsuit Storage Unit"
	helmet = /obj/item/clothing/head/helmet/space/void/exploration/sierra/med
	suit = /obj/item/clothing/suit/space/void/exploration/sierra/med
	req_access = list(access_field_med)
	stripes_color = COLOR_LIGHT_CYAN


/obj/machinery/suit_storage_unit/sierra/explorer/eng
	name = "GI-EXPL-E Voidsuit Storage Unit"
	helmet = /obj/item/clothing/head/helmet/space/void/exploration/sierra/eng
	suit = /obj/item/clothing/suit/space/void/exploration/sierra/eng
	req_access = list(access_field_eng)
	stripes_color = COLOR_SUN
