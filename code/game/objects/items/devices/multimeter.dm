//Multimeter by Bear1ake, ported from Infinity-tgstation
/obj/item/device/multitool/multimeter
	name = "multimeter"
	desc = "�����������&#255; ��&#255; ��������&#255; ����������&#255; �������������� �����������&#255; � ��������� ��������. ������������&#255; ���������."
	icon = 'icons/obj/items_inf.dmi'
	icon_state = "multimeter"
	origin_tech = list(TECH_MAGNET = 4, TECH_ENGINEERING = 4)
	slot_flags = SLOT_BELT
	var/mode = METER_MESURING // Mode

/obj/item/device/multitool/multimeter/attack_self(mob/user)
	switch(mode)
		if(METER_MESURING)
			mode = METER_CHECKING
		if(METER_CHECKING)
			mode = METER_MESURING
	to_chat(user, "����� ����� ��: [mode].")
