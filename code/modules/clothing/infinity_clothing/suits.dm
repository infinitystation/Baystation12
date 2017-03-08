/* NOW TO MAKE FUCKING CLOTHING
	THE BLANK:
/obj/item/clothing/<A TYPE, WHERE GOES A PARENT THINGS LIKE VAR STATE OR SOME MAGIC SHIT, PUT HERE A CATEGORY ITEM AND A NAME>
		name = "<SOMETHING WHAT YOU WANT TYPE HERE>"
		desc = "<THE DESCRIPTION OF SOMETHING SHITTY THING, MAYBE HOW MANY LAYERS OF IRONY THIS HAVE???>"
		icon = '<THERE GOES TYPE TO ITEM SPRITE, LIKE <icons/obj/clothing/.../... .dm>'
		icon_override = '<THERE GOES TYPE TO MOB ICON SPRITE, AND REMEMBER, THIS IS A MOB SPRITE TYPE, NOT ITEM WHAT LAYING ON... THAT FLOOR!!'
		icon_state = "<YOU KNOW, WE USE ICONS ON ICONS FILE, IT'S LIKE SHELL OF SHIT... I MEAN BOOK, YE. SO, IF YOU HAVE MUCH ICONS ON ONE DMI FILE, JUST PAST HERE A ICON_STATE STATE, LIKE "labcoat_new">"
	BETTER TO LOOK AT STOCK BAYSTATION FILES TO KNOW HOW ITS WORK, SEE YA. */


/obj/item/clothing/suit/sc_labcoat
	name = "robotic bathrobe"
	desc = "A suit that protects against minor chemical spills."
	icon = 'icons/obj/clothing/infinity/suits.dmi'
	item_state = null
	icon_override = 'icons/mob/infinity/suits.dmi'
	icon_state = "sc_labcoat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	allowed = list(/obj/item/device/analyzer,/obj/item/stack/medical,/obj/item/weapon/dnainjector,/obj/item/weapon/reagent_containers/dropper,/obj/item/weapon/reagent_containers/syringe,/obj/item/weapon/reagent_containers/hypospray,/obj/item/device/healthanalyzer,/obj/item/device/flashlight/pen,/obj/item/weapon/reagent_containers/glass/bottle,/obj/item/weapon/reagent_containers/glass/beaker,/obj/item/weapon/reagent_containers/pill,/obj/item/weapon/storage/pill_bottle,/obj/item/weapon/paper)
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 50, rad = 0)