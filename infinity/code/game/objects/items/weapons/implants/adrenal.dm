/datum/reagent/stimulants
	name = "Experimental Stimulants"
	description = "Experimental Stimulants are very dangerous mix, which can increase your speed."
	taste_description = "metal"
	reagent_state = LIQUID
	color = "#ff2681"
	metabolism = REM * 0.20
	overdose = REAGENTS_OVERDOSE / 3
	value = 4.5

/datum/reagent/stimulants/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return

	if(prob(2))
		to_chat(M, SPAN_DANGER("My heart gonna break out from the chest!"))
		M.stun_effect_act(0, 15, BP_CHEST, "heart damage") //a small pain without damage
		if(prob(5))
			for(var/obj/item/organ/internal/heart/H in M.internal_organs)
				H.damage += 1

	if(prob(5))
		M.emote(pick("twitch", "blink_r", "shiver"))
	M.add_chemical_effect(CE_SPEEDBOOST, 1.5)
	M.add_chemical_effect(CE_PULSE, 3)



obj/item/weapon/implant/adrenal
	name = "adrenal implant"
	desc = "This implant can inject you with stimulants when you will need it."
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 3, TECH_ESOTERIC = 2)
	implant_color = "r"
	hidden = 1
	var/activation_emote
	var/uses = 3

obj/item/weapon/implant/adrenal/Initialize()
	. = ..()
	create_reagents(30)
	reagents.add_reagent(/datum/reagent/stimulants, 30)

/obj/item/weapon/implant/adrenal/get_data()
	return {"
	<b>Implant Specifications:</b><BR>
	<b>Name:</b> Adrenal Injector<BR>
	<b>Life:</b> 3 uses<BR>
	<b>Important Notes:</b> <font color='red'>Dangerous, can cause heart traumas</font><BR>
	<HR>
	<b>Implant Details:</b> <BR>
	<b>Function:</b> When triggered transfers 15u of stimulants into user's bloodstream<HR>
	No Implant Specifics"}

/obj/item/weapon/implant/adrenal/trigger(emote, mob/living/carbon/source as mob)
	if (emote == activation_emote)
		activate()

/obj/item/weapon/implant/adrenal/activate()
	if(uses < 1 || malfunction)	return 0
	if(reagents.total_volume)
		uses--
		reagents.trans_to_mob(imp_in, 10, CHEM_BLOOD)
		to_chat(imp_in, "You feel a tiny prick.")
		imp_in.SetStunned(0)
		imp_in.SetWeakened(0)
		imp_in.SetParalysis(0)

/obj/item/weapon/implant/adrenal/implanted(mob/living/carbon/source)
	src.activation_emote = input("Choose activation emote:") in list("blink", "blink_r", "eyebrow", "chuckle", "twitch_v", "frown", "nod", "blush", "giggle", "grin", "groan", "shrug", "smile", "pale", "sniff", "whimper", "wink")
	source.StoreMemory("Adrenal implant can be activated by using the [src.activation_emote] emote, <B>say *[src.activation_emote]</B> to attempt to activate.", /decl/memory_options/system)
	to_chat(source, "The implanted adrenal implant can be activated by using the [src.activation_emote] emote, <B>say *[src.activation_emote]</B> to attempt to activate.")
	return TRUE

/obj/item/weapon/implanter/adrenal
	name = "implanter (A)"
	imp = /obj/item/weapon/implant/adrenal

/obj/item/weapon/implantcase/adrenal
	name = "glass case - 'adrenal'"
	imp = /obj/item/weapon/implant/adrenal