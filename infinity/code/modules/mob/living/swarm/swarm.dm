/mob/living/swarm
	name = "Swarmling"
	real_name = "Swarmling"
	voice_name = "Swarmling"
	icon = 'infinity/icons/swarm/mob.dmi'
	icon_state = "have_not"
	throw_range = 1
	throw_speed = 3

	//���������� ����������, ��������� �� �����, ����� � ����������� �������
	var/charge //����� ������������
	var/flow_charge //�������
	var/max_charge //������������ �����
	var/battary_overdrive //������� �� �����

	//���������� ��������� �� �������
	var/core_slot //����� ��� ����
	var/uni_slot //����� ��� ������ ������������
	var/attack_slot //����� ��� ���������� ������������
	var/def_slot //����� ��� ��������� ������������
	var/sup_slot //����� ��� ���������(�������������/�������)
	var/spec_slot //����������� �� ������������
	var/burn_resist //������ �� ��������� �����
	var/brute_resist //������ �� ����������� �����
	var/toxin_resist = 0 //��� ���������, �� � ���?