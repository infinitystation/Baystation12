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
	desc = "����������� ��������� �������� ����������� ������ ���������� ����� ��������: �����������, ���������.. �������, ��� ����� ���� �������� ���������� ����������, ����� ������ ���, ��� �� ������ ��� ��������� ���������� '��������� ���������'. ��� ������� ��, ��� ��� �������� ��� ������, ��� ������������ ����������� � ���������� ��� ������ ����������."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "technomancer_suit"
	item_state = "technomancer_suit"
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

	helmet = /obj/item/clothing/head/helmet/space/void/sivuha

/obj/item/clothing/under/rank/engineer/sivuha
	name = "Technomancer's jumpsuit"
	desc = "���� ����������- ����� ���������, ������� ���� ���-�� ����������� � ������� ���������� ����-������. �� ��������, ����������� �������������� ���� ���� ����������� �������������� ��� ������ ������ � �������������� �����������."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "technomancer_uniform"
	item_state = "technomancer_uniform"
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	worn_state = null
	body_parts_covered = LOWER_TORSO|LEGS
	trade_blacklisted = TRUE

/obj/item/weapon/clothingbag/technomancer
	name = "outfit delivery package"
	desc = "A utility bag stamped with a Technomancer logo."

/obj/item/weapon/clothingbag/technomancer/New()
	..()
	new /obj/item/clothing/suit/space/void/sivuha(src)
