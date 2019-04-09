/mob/living/carbon/human/Topic(href, href_list)
	///////Interactions!!///////
	if(href_list["interaction"])
		if (usr.stat == DEAD || usr.stat == UNCONSCIOUS || usr.restrained())
			return

		//CONDITIONS
		var/mob/living/carbon/human/H = usr
		var/mob/living/carbon/human/P = H.partner
		if (!(P in view(H.loc)))
			return
		var/obj/item/organ/external/temp = H.organs_by_name["r_hand"]
		var/hashands = (temp && temp.is_usable())
		if (!hashands)
			temp = H.organs_by_name["l_hand"]
			hashands = (temp && temp.is_usable())
		temp = P.organs_by_name["r_hand"]
		var/hashands_p = (temp && temp.is_usable())
		if (!hashands_p)
			temp = P.organs_by_name["l_hand"]
			hashands = (temp && temp.is_usable())
		var/mouthfree = !((H.head && (H.check_mouth_coverage())) || (H.wear_mask && (H.check_mouth_coverage())))
		var/mouthfree_p = !((P.head && (P.check_mouth_coverage())) || (P.wear_mask && (P.check_mouth_coverage())))
		var/ya = "&#255;"

		if(world.time <= H.last_attack + 1 SECONDS)
			return
		else
			H.last_attack = world.time

		if (href_list["interaction"] == "bow")
			H.visible_message("<B>[H]</B> ����[ya]���[ya] <B>[P]</B>.")
			if (istype(P.loc, /obj/structure/closet) && P.loc == H.loc)
				P.visible_message("<B>[H]</B> ����[ya]���[ya] <B>[P]</B>.")

		else if (href_list["interaction"] == "pet")
			if(((!istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands && Adjacent(P))
				H.visible_message("<B>[H]</B> [pick("������", "�����������")] <B>[P]</B>.")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> [pick("������", "�����������")] <B>[P]</B>.")

		else if (href_list["interaction"] == "scratch")
			if(((!istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands && Adjacent(P))
				if(H.zone_sel.selecting == BP_HEAD && !((P.species.name == SPECIES_YEOSA) || (P.species.name == SPECIES_EROSAN) || (P.species.name == SPECIES_UNATHI)))
					H.visible_message("<B>[H]</B> [pick("����� �� ����", "����� ������")] <B>[P]</B>.")
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<B>[H]</B> [pick("����� �� ����", "����� ������")] <B>[P]</B>.")
				else
					H.visible_message("<B>[H]</B> [pick("�����")] <B>[P]</B>.")
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<B>[H]</B> [pick("�����")] <B>[P]</B>.")

		else if (href_list["interaction"] == "give")
			if(Adjacent(P))
				if (((!istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands)
					H.give(P)

		else if (href_list["interaction"] == "kiss")
			if( ((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)))
				H.visible_message("<B>[H]</B> ������ <B>[P]</B>.")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> ������ <B>[P]</B>.")
			else if (mouthfree)
				H.visible_message("<B>[H]</B> �������� <B>[P]</B> ��������� �������.")

		else if (href_list["interaction"] == "lick")
			if( ((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && mouthfree && mouthfree_p)
				if (prob(90))
					H.visible_message("<B>[H]</B> [H.gender == FEMALE ? "�������" : "������"] <B>[P]</B> � ����.")
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<B>[H]</B> [H.gender == FEMALE ? "�������" : "������"] <B>[P]</B> � ����.")
				else
					H.visible_message("<B>[H]</B> ����� ��������� [H.gender == FEMALE ? "�������" : "������"] <B>[P]</B>.")
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<B>[H]</B> ����� ��������� [H.gender == FEMALE ? "�������" : "������"] <B>[P]</B>.")

		else if (href_list["interaction"] == "hug")
			if(((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands)
				H.visible_message("<B>[H]</B> �������� <B>[P]</B>.")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> �������� <B>[P]</B>.")
				playsound(loc, 'infinity/sound/interactions/hug.ogg', 50, 1, -1)

		else if (href_list["interaction"] == "cheer")
			if(((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands)
				H.visible_message("<B>[H]</B> ����������� <B>[P]</B> �� �����.")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> ����������� <B>[P]</B> �� �����.")

		else if (href_list["interaction"] == "five")
			if(((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands)
				H.visible_message("<B>[H]</B> ��� <B>[P]</B> �[ya]��.")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> ��� <B>[P]</B> �[ya]��.")
				playsound(loc, 'infinity/sound/interactions/slap.ogg', 50, 1, -1)

		else if (href_list["interaction"] == "handshake")
			if(((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands && hashands_p)
				H.visible_message("<B>[H]</B> ��� ���� <B>[P]</B>.")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> ��� ���� <B>[P]</B>.")

		else if (href_list["interaction"] == "bow_affably")
			H.visible_message("<B>[H]</B> ���������� [H.gender == FEMALE ? "�������" : "������"] � ������� <B>[P]</B>.")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<B>[H]</B> ���������� [H.gender == FEMALE ? "�������" : "������"] � ������� <B>[P]</B>.")

		else if (href_list["interaction"] == "wave")
			if (!(Adjacent(P)) && hashands)
				H.visible_message("<B>[H]</B> ���������� ����� <B>[P]</B>.")
			else
				H.visible_message("<B>[H]</B> ���������� [H.gender == FEMALE ? "�������" : "������"] � ������� <B>[P]</B>.")


		else if (href_list["interaction"] == "slap")
			if(((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands)
				H.visible_message("<span class='danger'>[H] ���� [P] ��������!</span>")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<span class='danger'>[H] ���� [P] ��������!</span>")
				playsound(loc, 'infinity/sound/interactions/slap.ogg', 50, 1, -1)
				var/obj/item/organ/external/head/O = P.get_organ(BP_HEAD)
				if(O.pain <= 2)
					O.add_pain(10)
				H.do_attack_animation(P)

		else if (href_list["interaction"] == "fuckyou")
			if(hashands)
				H.visible_message("<span class='danger'>[H] ���������� [P] ������� �����!</span>")
				if (istype(P.loc, /obj/structure/closet) && P.loc == H.loc)
					P.visible_message("<span class='danger'>[H] ���������� [P] ������� �����!</span>")

		else if (href_list["interaction"] == "knock")
			if(((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands)
				H.visible_message("<span class='danger'>[H] ���� [P] ������������!</span>")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<span class='danger'>[H] ���� [P] ������������!</span>")
				playsound(loc, 'sound/weapons/throwtap.ogg', 50, 1, -1)
				var/obj/item/organ/external/head/O = P.get_organ(BP_HEAD)
				if(O.pain <= 2)
					O.add_pain(5)
				H.do_attack_animation(P)

		else if (href_list["interaction"] == "spit")
			if(((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && mouthfree)
				H.visible_message("<span class='danger'>[H] ����� � [P]!</span>")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<span class='danger'>[H] ����� � [P]!</span>")

		else if (href_list["interaction"] == "threaten")
			if(hashands)
				H.visible_message("<span class='danger'>[H] ������ [P] �������!</span>")
				if (istype(P.loc, /obj/structure/closet) && H.loc == P.loc)
					P.visible_message("<span class='danger'>[H] ������ [P] �������!</span>")

		else if (href_list["interaction"] == "tongue")
			if(mouthfree)
				H.visible_message("<span class='danger'>[H] ���������� [P] [ya]���!</span>")
				if (istype(P.loc, /obj/structure/closet) && H.loc == P.loc)
					P.visible_message("<span class='danger'>[H] ���������� [P] [ya]���!</span>")

		else if (href_list["interaction"] == "pull")
			if(((Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands && !H.restrained())
				if (prob(30))
					H.visible_message("<span class='danger'>[H] ������ [P] �� �����!</span>")
					var/obj/item/organ/external/groin/O = P.get_organ(BP_GROIN)
					if(O.pain <= 3)
						O.add_pain(4)
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<span class='danger'>[H] ������ [P] �� �����!</span>")
				else
					H.visible_message("<B>[H]</B> �������[ya] ������� <B>[P]</B> �� �����!")
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<B>[H]</B> �������[ya] ������� <B>[P]</B> �� �����!")
	..()
	return