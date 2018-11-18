/obj/item/clothing/head/helmet/daft_punk //By KaReTa
	name = "Daft Punk helm"
	desc = "This fancy helm gives you the ability to see through clothes! Well, at least that's what rumors say.."
	icon = 'icons/obj/clothing/infinity/hats.dmi'
	item_icons = list(slot_head_str = 'icons/mob/infinity/hats.dmi')
	icon_state = "daft_helmet"

/obj/item/clothing/head/soft/darkred
	name = "darkred cap"
	desc = "It's a peaked hat in a tasteless darkred color."
	icon = 'icons/obj/clothing/infinity/hats.dmi'
	item_icons = list(slot_head_str = 'icons/mob/infinity/hats.dmi')
	icon_state = "darkred_cap"

/obj/item/clothing/head/kitty/tailless
	name = "tailless kitty ears"
	desc = "The fur feels.....a little bit realistic."
	item_icons = list(slot_head_str = 'icons/mob/infinity/hats.dmi')
	item_state = "kitty_tailless"

/obj/item/clothing/head/kitty/fake
	name = "fake kitty ears"
	desc = "The fur feels.....a bit too realistic."
	item_icons = list(slot_head_str = 'icons/mob/infinity/hats.dmi')
	item_state = "kitty_tailless"
	body_parts_covered = 0

	update_icon(var/mob/living/carbon/human/user)
		if(!istype(user)) return
		var/icon/ears = new/icon("icon" = 'icons/mob/infinity/hats.dmi', "icon_state" = "kitty")
		ears.Blend(rgb(user.r_hair, user.g_hair, user.b_hair), ICON_ADD)

		var/icon/earbit = new/icon("icon" = 'icons/mob/onmob/head.dmi', "icon_state" = "kittyinner")
		ears.Blend(earbit, ICON_OVERLAY)

/obj/item/clothing/head/helmet/pcrc/cover
	starting_accessories = list(/obj/item/clothing/accessory/armor/helmcover/pcrc)

/obj/item/clothing/head/helmet/saare/cover
	starting_accessories = list(/obj/item/clothing/accessory/armor/helmcover/saare)

/obj/item/clothing/head/helmet/marine
	name = "\improper combat helmet"
	desc = "A helmet with 'MARINE CORPS' printed on the back in red lettering."
	icon_state = "helmet_nt"

/obj/item/clothing/head/soft/scp_cap
	name = "SCP guard cap"
	desc = "A simple security dark grey cap.\nThis one has SCP tag, terran organization of NT asset protection"
	icon = 'icons/obj/clothing/infinity/hats.dmi'
	item_icons = list(slot_head_str = 'icons/mob/infinity/hats.dmi')
	icon_state = "scp_cap"
