/obj/item/clothing/suit/armor/pcarrier/custom_pcrc
	name = "civil protection platecarrier"
	desc = "���������� ���������� ����������� �������, ����������� PCRC."
	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi')
	icon_state = "scp_carrier"
	sprite_sheets = list()

/obj/item/clothing/under/custom_pcrc
	name = "civil protection uniform"
	desc = "�������� ���������� ����������� �������, ����������� PCRC."
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "fleet"
	worn_state = "fleet"
	rolled_sleeves = -1

/obj/item/clothing/glasses/hud/health/custom_pcrc
	name = "CP medical HUD"
	desc = "����������� ������ ����������� ����������� �������."
	icon = 'infinity/icons/obj/clothing/obj_eyes.dmi'
	item_icons = list(slot_glasses_str = 'infinity/icons/mob/onmob/onmob_eyes.dmi')
	icon_state = "hybrids_mat"
	item_state = "hybrids_mat"

/obj/item/weapon/clothingbag/custom_pcrc/Initialize()
	new /obj/item/clothing/suit/armor/pcarrier/custom_pcrc(src)
	new /obj/item/clothing/under/custom_pcrc(src)
	new /obj/item/clothing/glasses/hud/health/custom_pcrc(src)
