/obj/item/device/kit
	icon_state = "modkit"
	icon = 'icons/obj/device.dmi'
	var/new_name = "exosuit"    //What is the variant called?
	var/new_desc = "An exosuit." //How is the new exosuit described?
	var/new_icon = "ripley"  //What base icon will the new exosuit use?
	var/new_icon_file
	var/uses = 1        // Uses before the kit deletes itself.

/obj/item/device/kit/examine(mob/user)
	. = ..()
	to_chat(user, "It has [uses] use\s left.")

/obj/item/device/kit/inherit_custom_item_data(var/datum/custom_item/citem)
	new_name = citem.item_name
	new_desc = citem.item_desc
	new_icon = citem.item_icon_state
	new_icon_file = CUSTOM_ITEM_OBJ
	. = src

/obj/item/device/kit/proc/use(var/amt, var/mob/user)
	uses -= amt
	playsound(get_turf(user), 'sound/items/Screwdriver.ogg', 50, 1)
	if(uses<1)
		qdel(src)

// Root hardsuit kit defines.
// Icons for modified hardsuits need to be in the proper .dmis because suit cyclers may cock them up.
/obj/item/device/kit/suit
	name = "voidsuit modification kit"
	desc = "A kit for modifying a voidsuit."
	uses = 2
	var/new_light_overlay
	var/new_mob_icon_file

/obj/item/device/kit/suit/inherit_custom_item_data(var/datum/custom_item/citem)
	. = ..()
	if(citem.additional_data["light_overlay"])
		new_light_overlay = citem.additional_data["light_overlay"]
	new_mob_icon_file = CUSTOM_ITEM_MOB

/obj/item/clothing/head/helmet/space/void/attackby(var/obj/item/O, var/mob/user)
	if(istype(O,/obj/item/device/kit/suit))
		var/obj/item/device/kit/suit/kit = O
		SetName("[kit.new_name] suit helmet")
		desc = kit.new_desc
		icon_state = "[kit.new_icon]_helmet"
		item_state = "[kit.new_icon]_helmet"
		if(kit.new_icon_file)
			icon = kit.new_icon_file
		if(kit.new_mob_icon_file)
			icon_override = kit.new_mob_icon_file
		if(kit.new_light_overlay)
			light_overlay = kit.new_light_overlay
		to_chat(user, "You set about modifying the helmet into [src].")
		var/mob/living/carbon/human/H = user
		if(istype(H))
			species_restricted = list(H.species.get_bodytype(H))
		kit.use(1,user)
		return 1
	return ..()

/obj/item/clothing/suit/space/void/attackby(var/obj/item/O, var/mob/user)
	if(istype(O,/obj/item/device/kit/suit))
		var/obj/item/device/kit/suit/kit = O
		SetName("[kit.new_name] voidsuit")
		desc = kit.new_desc
		icon_state = "[kit.new_icon]_suit"
		item_state = "[kit.new_icon]_suit"
		if(kit.new_icon_file)
			icon = kit.new_icon_file
		if(kit.new_mob_icon_file)
			icon_override = kit.new_mob_icon_file
		to_chat(user, "You set about modifying the suit into [src].")
		var/mob/living/carbon/human/H = user
		if(istype(H))
			species_restricted = list(H.species.get_bodytype(H))
		kit.use(1,user)
		return 1
	return ..()

// Mechs are handled in their attackby (mech_interaction.dm).
/obj/item/device/kit/paint
	name = "exosuit customisation kit"
	desc = "A kit containing all the needed tools and parts to repaint a exosuit."
	var/removable = null

/obj/item/device/kit/paint/examine(mob/user)
	. = ..()
	to_chat(user, "This kit will add a '[new_name]' decal to a exosuit'.")

// exosuit kits.
/obj/item/device/kit/paint/use(amt, mob/user)
	playsound(get_turf(user), 'sound/items/Screwdriver.ogg', 50, 1)
	
/obj/item/device/kit/paint/flames_red
	name = "\"Firestarter\" exosuit customisation kit"
	new_icon = "flames_red"

/obj/item/device/kit/paint/flames_blue
	name = "\"Burning Chrome\" exosuit customisation kit"
	new_icon = "flames_blue"


/*
//[inf]
	//Ripley
/obj/item/device/kit/paint/ripley
	name = "\"Classic\" APLU customisation kit"
	new_name = "APLU \"Classic\""
	new_desc = "A very retro APLU unit; didn't they retire these back in 2287?"
	new_icon = "ripley-old"
	allowed_types = list("ripley")

/obj/item/device/kit/paint/ripley/death
	name = "\"Reaper\" APLU customisation kit"
	new_name = "APLU \"Reaper\""
	new_desc = "A terrifying, grim power loader. Why do those clamps have spikes?"
	new_icon = "deathripley"
	allowed_types = list("ripley","firefighter")

	// Durand kits.
/obj/item/device/kit/paint/durand
	name = "\"Classic\" Durand customisation kit"
	new_name = "Durand \"Classic\""
	new_desc = "An older model of Durand combat exosuit. This model was retired for rotating a pilot's torso 180 degrees."
	new_icon = "old_durand"
	allowed_types = list("durand")

/obj/item/device/kit/paint/durand/seraph
	name = "\"Cherubim\" Durand customisation kit"
	new_name = "Durand \"Cherubim\""
	new_desc = "A Durand combat exosuit modelled after ancient Earth entertainment. Your heart goes doki-doki just looking at it."
	new_icon = "old_durand"

/obj/item/device/kit/paint/durand/phazon
	name = "\"Sypher\" Durand customisation kit"
	new_name = "Durand \"Sypher\""
	new_desc = "A Durand combat exosuit with some very stylish neons and decals. Seems to blur slightly at the edges; probably an optical illusion."
	new_icon = "phazon"

// Gygax kits.
/obj/item/device/kit/paint/gygax
	name = "\"Jester\" Gygax customisation kit"
	new_name = "Gygax \"Jester\""
	new_desc = "A Gygax exosuit modelled after the infamous combat-troubadors of Earth's distant past. Terrifying to behold."
	new_icon = "honker"
	allowed_types = list("gygax")

/obj/item/device/kit/paint/gygax/darkgygax
	name = "\"Silhouette\" Gygax customisation kit"
	new_name = "Gygax \"Silhouette\""
	new_desc = "An ominous Gygax exosuit modelled after the fictional corporate 'death squads' that were popular in pulp action-thrillers back in 2280s."
	new_icon = "darkgygax"

/obj/item/device/kit/paint/gygax/recitence
	name = "\"Gaoler\" Gygax customisation kit"
	new_name = "Durand \"Gaoler\""
	new_desc = "A bulky silver Gygax exosuit. The extra armour appears to be painted on, but it's very shiny."
	new_icon = "recitence"

//[/inf]
*/
/obj/item/device/kit/paint/camouflage
	name = "\"Guerilla\" exosuit customisation kit"
	desc = "The exact same pattern the 76th Armored Gauntlet used in the Gaia war, now available for general use."
	new_icon = "cammo1"

/obj/item/device/kit/paint/camouflage/forest
	name = "\"Alpine\" exosuit customisation kit"
	new_icon = "cammo2"
	desc = "A muted pattern for alpine environments. Don't miss the forest for the trees!"
