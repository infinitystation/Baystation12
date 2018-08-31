/obj/item/clothing/accessory/badge/tags // non-solgov variant
	name = "dog tags"
	desc = "Plain identification tags made from a durable metal. They are stamped with a variety of informational details."
	gender = PLURAL
	icon = 'maps/torch/icons/obj/solgov-accessory.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/torch/icons/mob/solgov-accessory.dmi', slot_wear_suit_str = 'maps/torch/icons/mob/solgov-accessory.dmi')
	icon_state = "tags"
	badge_string = null
	slot_flags = SLOT_MASK | SLOT_TIE

/obj/item/clothing/accessory/badge/tags/attack_self(mob/living/carbon/human/user as mob)
	.=..()
	if(!badge_string)
		var/confirm = alert("Set badges's faction as your own faction?", "Badge Choice", "Yes", "No")
		if(confirm == "No")
			var/choice = input(usr,"Choose your badge's faction","Badge Choice","") as text|null
			if(!choice)
				return
			badge_string = choice
		if(confirm == "Yes")
			return
//			badge_string = user.personal_faction
//		to_chat(user, "<span class='notice'>[src]'s faction now is '[badge_string]'.</span>")

/obj/item/clothing/accessory/storage/bandolier/armory/Initialize()
	. = ..()

	for(var/i = 0, i < slots, i++)
		new /obj/item/ammo_casing/shotgun/pellet(hold)