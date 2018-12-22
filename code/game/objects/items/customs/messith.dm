/obj/item/weapon/gun/energy/gun/small/secure/messith
	name = "pistol 'messith'"
	desc = "�������� '������' &#255;��&#255;���&#255; ������������������� ������� ������������ '������������', ����������������� ��� ������-������. ������ �������� ������&#255; ���� ������ ����� '�������', ��� ��������� ������ ������&#255; �� �����&#255; '�������', ��� � ��� �������. ��� ������&#255; ����������� � ������� �� ������������ ����������� '������' - ��������� ����� � ����������&#255; ����&#255;���, ������&#255;���&#255; �����&#255;�� ������ ������ ����������&#255; � ����������, �� ����� - ����������� � ������� �������� ������ ��� �������� � ��������� ������. �� ������, ���&#255; �� �����, ���������� ������� �����&#255; ��������� ������� 'Var Dar Fusozai'"
	icon_state = "messithstun"
	modifystate = "messithstun"
	icon = 'icons/obj/infinity_items/messith.dmi'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/guns/guns_l.dmi',
		slot_r_hand_str = 'icons/mob/onmob/guns/guns_r.dmi',
		)
	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun, modifystate="messithstun"),
		list(mode_name="shock", projectile_type=/obj/item/projectile/beam/stun/shock, modifystate="messithshock"),
		list(mode_name="kill", projectile_type=/obj/item/projectile/beam/smalllaser, modifystate="messithkill"),
		)

/obj/item/weapon/gun/energy/gun/small/secure/messith/New()
	..()
	Scale(0.8, 0.8)
	Translate(-8, 0)

/obj/item/custkit/messith
	name = "Messith customization kit"
	input = /obj/item/weapon/gun/energy/gun/small/secure
	output = /obj/item/weapon/gun/energy/gun/small/secure/messith
