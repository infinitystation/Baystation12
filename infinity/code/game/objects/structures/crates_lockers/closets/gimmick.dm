/obj/structure/closet/gimmick/ert
	name = "emergency response team closet"
	desc = "It's a storage unit for Tacticool gear."
	closet_appearance = /decl/closet_appearance/tactical

/obj/structure/closet/gimmick/ert/WillContain()
	return list(
		/obj/item/material/coin/silver =2,
		/obj/item/clothing/mask/balaclava = 2,
		/obj/item/clothing/head/beret/centcom/officer = 2,
		/obj/item/clothing/under/ert = 2,
		/obj/item/clothing/under/syndicate/combat = 2)

/obj/structure/closet/gimmick/marine
	name = "strike team closet"
	desc = "It's a storage unit for Tacticool gear."
	closet_appearance = /decl/closet_appearance/tactical

/obj/structure/closet/gimmick/ert/WillContain()
	return list(
		/obj/item/material/coin/silver =2,
		/obj/item/clothing/mask/balaclava = 2,
		/obj/item/clothing/head/beret/centcom/officer = 2,
		/obj/item/clothing/under/ert = 2,
		/obj/item/clothing/under/syndicate/combat = 2)
