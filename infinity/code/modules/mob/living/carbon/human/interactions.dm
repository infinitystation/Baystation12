/**********************************
*******Interactions code by HONKERTRON feat TestUnit********
***********************************/

/mob/living/carbon/human/MouseDrop(mob/M as mob)
	..()
	if(src == usr)
		interact(M)

/mob/proc/make_interaction()
	return

//Distant interactions
/mob/living/carbon/human/verb/interact(mob/M as mob)
	set name = "Interact"
	set category = "IC"

	if (istype(M, /mob/living/carbon/human) && usr != M && src != M)
		partner = M
		make_interaction(machine)


/mob/living/carbon/human/proc/is_nude()
	return (!wear_suit && !w_uniform) ? 1 : 0 //TODO: Nudity check for underwear

/mob/living/carbon/human/make_interaction()
	set_machine(src)

	var/mob/living/carbon/human/H = usr
	var/mob/living/carbon/human/P = H.partner
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


	var/dat = "<B><HR><FONT size=3>INTERACTIONS - [H.partner]</FONT></B><BR><HR>"
	var/ya = "&#1103;"

	dat +=  {"Х <A href='?src=\ref[src];interaction=bow'>ќтвесить поклон.</A><BR>"}
	if (hashands)
		dat +=  {"<font size=3><B>–уки:</B></font><BR>"}
		dat +=  {"Х <A href='?src=\ref[src];interaction=bow_affably'>ѕриветливо кивнуть.</A><BR>"}
		if (Adjacent(P))
			dat +=  {"Х <A href='?src=\ref[src];interaction=handshake'>ѕожать руку.</A><BR>"}
			dat +=  {"Х <A href='?src=\ref[src];interaction=hug'>ќбнимашки!</A><BR>"}
			dat +=  {"Х <A href='?src=\ref[src];interaction=cheer'>ѕохлопать по плечу</A><BR>"}
			dat +=  {"Х <A href='?src=\ref[src];interaction=five'>ƒать п[ya]ть.</A><BR>"}
			if (hashands_p)
				dat +=  {"Х <A href='?src=\ref[src];interaction=give'>ѕередать предмет.</A><BR>"}
			dat +=  {"Х <A href='?src=\ref[src];interaction=slap'><font color=red>ƒать пощечину!</font></A><BR>"}
			if ((P.species.name == SPECIES_TAJARA)  || (P.species.name == SPECIES_VOX)|| (P.species.name == SPECIES_RESOMI) || (P.species.name == SPECIES_YEOSA) || (P.species.name == SPECIES_EROSAN) || (P.species.name == SPECIES_UNATHI))
				dat +=  {"Х <A href='?src=\ref[src];interaction=pull'><font color=red>ƒЄрнуть за хвост!</font></A><BR>"}
				if(P.can_inject(H))
					dat +=  {"Х <A href='?src=\ref[src];interaction=pet'>ѕогладить.</A><BR>"}
					dat +=  {"Х <A href='?src=\ref[src];interaction=scratch'>ѕочесать.</A><BR>"}
			dat +=  {"Х <A href='?src=\ref[src];interaction=knock'><font color=red>ƒать подзатыльник.</font></A><BR>"}
		dat +=  {"Х <A href='?src=\ref[src];interaction=fuckyou'><font color=red>ѕоказать средний палец.</font></A><BR>"}
		dat +=  {"Х <A href='?src=\ref[src];interaction=threaten'><font color=red>ѕогрозить кулаком.</font></A><BR>"}

	if (mouthfree && H.species.name != "Diona")
		dat += {"<font size=3><B>Ћицо:</B></font><BR>"}
		dat += {"Х <A href='?src=\ref[src];interaction=kiss'>ѕоцеловать.</A><BR>"}
		if (Adjacent(P))
			if (mouthfree_p)
				dat += {"Х <A href='?src=\ref[src];interaction=lick'>Ћизнуть в щеку.</A><BR>"}
			dat +=  {"Х <A href='?src=\ref[src];interaction=spit'><font color=red>ѕлюнуть.</font></A><BR>"}
		dat +=  {"Х <A href='?src=\ref[src];interaction=tongue'><font color=red>ѕоказать [ya]зык.</font></A><BR>"}

	var/datum/browser/popup = new(usr, "interactions", "Interactions", 340, 480)
	popup.set_content(dat)
	popup.open()


/mob/living/carbon/human
	var/mob/living/carbon/human/partner