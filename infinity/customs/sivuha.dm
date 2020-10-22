//	Technomancers
/obj/item/clothing/head/helmet/space/void/sivuha
	name = "Technomancer's voidsuit's helmet"
//	desc = "Helmet."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "technomancer_helmet"
	item_state = "technomancer_helmet"
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/suit/space/void/sivuha
	name = "Technomancer's voidsuit"
	desc = "Максимально эпотажный скафандр техномантов всегда выделяется своим дизайном: массивность, грозность.. Кажется, как будто этот скафандр разработан специально, чтобы пугать тех, кто по мнению его носителей оскверняет 'Священные механизмы'. Как говорят те, кто уже пытались это носить, без специального комбинезона и подготовок это носить невозможно."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "technomancer_suit"
	item_state = "technomancer_suit"
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

	helmet = /obj/item/clothing/head/helmet/space/void/sivuha

/obj/item/clothing/under/rank/engineer/sivuha
	name = "Technomancer's jumpsuit"
	desc = "Этот комбинезон - мечта инженеров, которые хоть как-то ознакомлены с культом поклонения Богу-Машине. По легендам, комбинезоны последователей этой веры максимально оптимизированы для работы вместе с техномантскими скафандрами."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "technomancer_uniform"
	item_state = "technomancer_uniform"
	worn_state = null
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE
