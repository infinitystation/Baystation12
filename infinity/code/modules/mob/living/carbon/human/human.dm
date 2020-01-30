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
		var/hashands = (temp?.is_usable())
		if (!hashands)
			temp = H.organs_by_name["l_hand"]
			hashands = (temp?.is_usable())
		temp = P.organs_by_name["r_hand"]
		var/hashands_p = (temp?.is_usable())
		if (!hashands_p)
			temp = P.organs_by_name["l_hand"]
			hashands = (temp?.is_usable())
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
			if(((!istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands && H.Adjacent(P))
				H.visible_message("<B>[H]</B> [pick("������", "�����������")] <B>[P]</B>.")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> [pick("������", "�����������")] <B>[P]</B>.")

		else if (href_list["interaction"] == "scratch")
			if(((!istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands && H.Adjacent(P))
				if(H.zone_sel.selecting == BP_HEAD && !((P.species.name == SPECIES_YEOSA) || (P.species.name == SPECIES_EROSAN) || (P.species.name == SPECIES_UNATHI)))
					H.visible_message("<B>[H]</B> [pick("����� �� ����", "����� ������")] <B>[P]</B>.")
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<B>[H]</B> [pick("����� �� ����", "����� ������")] <B>[P]</B>.")
				else
					H.visible_message("<B>[H]</B> [pick("�����")] <B>[P]</B>.")
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<B>[H]</B> [pick("�����")] <B>[P]</B>.")

		else if (href_list["interaction"] == "give")
			if(H.Adjacent(P))
				if (((!istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands)
					H.give(P)

		else if (href_list["interaction"] == "kiss")
			if( ((H.Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)))
				H.visible_message("<B>[H]</B> ������ <B>[P]</B>.")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> ������ <B>[P]</B>.")
			else if (mouthfree)
				H.visible_message("<B>[H]</B> �������� <B>[P]</B> ��������� �������.")

		else if (href_list["interaction"] == "lick")
			if( ((H.Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && mouthfree && mouthfree_p)
				if (prob(90))
					H.visible_message("<B>[H]</B> [H.gender == FEMALE ? "�������" : "������"] <B>[P]</B> � ����.")
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<B>[H]</B> [H.gender == FEMALE ? "�������" : "������"] <B>[P]</B> � ����.")
				else
					H.visible_message("<B>[H]</B> ����� ��������� [H.gender == FEMALE ? "�������" : "������"] <B>[P]</B>.")
					if (istype(P.loc, /obj/structure/closet))
						P.visible_message("<B>[H]</B> ����� ��������� [H.gender == FEMALE ? "�������" : "������"] <B>[P]</B>.")

		else if (href_list["interaction"] == "hug")
			if(((H.Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands)
				H.visible_message("<B>[H]</B> �������� <B>[P]</B>.")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> �������� <B>[P]</B>.")
				playsound(loc, 'infinity/sound/interactions/hug.ogg', 50, 1, -1)

		else if (href_list["interaction"] == "cheer")
			if(((H.Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands)
				H.visible_message("<B>[H]</B> ����������� <B>[P]</B> �� �����.")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> ����������� <B>[P]</B> �� �����.")

		else if (href_list["interaction"] == "five")
			if(((H.Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands)
				H.visible_message("<B>[H]</B> ��� <B>[P]</B> �[ya]��.")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> ��� <B>[P]</B> �[ya]��.")
				playsound(loc, 'infinity/sound/interactions/slap.ogg', 50, 1, -1)

		else if (href_list["interaction"] == "handshake")
			if(((H.Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands && hashands_p)
				H.visible_message("<B>[H]</B> ��� ���� <B>[P]</B>.")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> ��� ���� <B>[P]</B>.")

		else if (href_list["interaction"] == "bow_affably")
			H.visible_message("<B>[H]</B> ���������� ������[H.gender == FEMALE ? "�" : ""] � ������� <B>[P]</B>.")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<B>[H]</B> ���������� ������[H.gender == FEMALE ? "�" : ""] � ������� <B>[P]</B>.")

		else if (href_list["interaction"] == "wave")
			if (!(H.Adjacent(P)) && hashands)
				H.visible_message("<B>[H]</B> ���������� ����� <B>[P]</B>.")
			else
				H.visible_message("<B>[H]</B> ���������� ������[H.gender == FEMALE ? "�" : ""] � ������� <B>[P]</B>.")


		else if (href_list["interaction"] == "slap")
			if(((H.Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands)
				switch(H.zone_sel.selecting)
					if(BP_HEAD)
						H.visible_message("<span class='danger'>[H] ���� [P] ��������!</span>")
						if (istype(P.loc, /obj/structure/closet))
							P.visible_message("<span class='danger'>[H] ���� [P] ��������!</span>")
						playsound(loc, 'infinity/sound/interactions/slap.ogg', 50, 1, -1)
						var/obj/item/organ/external/head/O = P.get_organ(BP_HEAD)
						if(O.pain <= 2)
							O.add_pain(10)
						H.do_attack_animation(P)

					if(BP_MOUTH)
						H.visible_message("<span class='danger'>[H] ���� [P] �� ����!</span>")
						if (istype(P.loc, /obj/structure/closet))
							P.visible_message("<span class='danger'>[H] ���� [P] �� ����!</span>")
						playsound(loc, 'infinity/sound/interactions/slap.ogg', 50, 1, -1)
						H.do_attack_animation(P)

		else if (href_list["interaction"] == "slapass")
			if(((H.Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands)
				H.visible_message("<span class='danger'>[H] ������ [P] �� �������!</span>")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<span class='danger'>[H] ������ [P] �� �������!</span>")
				playsound(loc, 'infinity/sound/interactions/slap.ogg', 50, 1, -1)
				var/obj/item/organ/external/groin/G = P.get_organ(BP_GROIN)
				if(G.pain <= 2)
					G.add_pain(5)
				H.do_attack_animation(P)

		else if (href_list["interaction"] == "fuckyou")
			if(hashands)
				H.visible_message("<span class='danger'>[H] ���������� [P] ������� �����!</span>")
				if (istype(P.loc, /obj/structure/closet) && P.loc == H.loc)
					P.visible_message("<span class='danger'>[H] ���������� [P] ������� �����!</span>")

		else if (href_list["interaction"] == "knock")
			if(((H.Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands)
				H.visible_message("<span class='danger'>[H] ���� [P] ������������!</span>")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<span class='danger'>[H] ���� [P] ������������!</span>")
				playsound(loc, 'sound/weapons/throwtap.ogg', 50, 1, -1)
				var/obj/item/organ/external/head/O = P.get_organ(BP_HEAD)
				if(O.pain <= 2)
					O.add_pain(5)
				H.do_attack_animation(P)

		else if (href_list["interaction"] == "spit")
			if(((H.Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && mouthfree)
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
			if(((H.Adjacent(P) && !istype(P.loc, /obj/structure/closet)) || (H.loc == P.loc)) && hashands && !H.restrained())
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
/mob/living/carbon/human/Stat()
	..()
	var/obj/item/organ/internal/xeno/plasmavessel/P = internal_organs_by_name[BP_PLASMA]
	if(P)
		stat(null, "Phoron Stored: [P.stored_plasma]/[P.max_plasma]")
