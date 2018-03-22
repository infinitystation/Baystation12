//Daft-Punk helm
/obj/item/clothing/head/helmet/daft_punk //By KaReTa
	name = "Daft Punk helm"
	desc = "This fancy helm gives you the ability to see through clothes! Well, at least that's what rumors say.."
	icon = 'icons/obj/clothing/infinity/hats.dmi'
	item_icons = list(slot_head_str = 'icons/mob/infinity/hats.dmi')
	icon_state = "daft_helmet"

/obj/item/clothing/head/kitty/tailless
	name = "tailless kitty ears"
	desc = "The fur feels.....a little bit realistic."
	item_icons = list(slot_head_str = 'icons/mob/infinity/hats.dmi')
	item_state = "kitty_tailless"

	update_icon(var/mob/living/carbon/human/user)
		if(!istype(user)) return
		var/icon/ears = new/icon("icon" = 'icons/mob/infinity/hats.dmi', "icon_state" = "kitty")
		ears.Blend(rgb(user.r_hair, user.g_hair, user.b_hair), ICON_ADD)

		var/icon/earbit = new/icon("icon" = 'icons/mob/onmob/head.dmi', "icon_state" = "kittyinner")
		ears.Blend(earbit, ICON_OVERLAY)
