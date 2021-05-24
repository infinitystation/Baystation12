/obj/item/implant/adrenal
	name = "adrenal implant"
	desc = "This implant can inject you with stimulants when you will need it."
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 3, TECH_ESOTERIC = 2)
	implant_color = "r"
	hidden = 1
	var/activation_emote
	var/uses = 3

/obj/item/implant/adrenal/Initialize()
	. = ..()
	create_reagents(30)
	reagents.add_reagent(/datum/reagent/nitritozadole, 30)

/obj/item/implant/adrenal/get_data()
	return {"
	<b>Implant Specifications:</b><BR>
	<b>Name:</b> Adrenal Injector<BR>
	<b>Life:</b> 3 uses<BR>
	<b>Important Notes:</b> <font color='red'>Dangerous, can cause heart traumas</font><BR>
	<HR>
	<b>Implant Details:</b> <BR>
	<b>Function:</b> When triggered transfers 15u of stimulants into user's bloodstream<HR>
	No Implant Specifics"}

/obj/item/implant/adrenal/trigger(emote, mob/living/carbon/source as mob)
	if (emote == activation_emote)
		activate()

/obj/item/implant/adrenal/activate()
	if(uses < 1 || malfunction)	return 0
	if(reagents.total_volume)
		uses--
		reagents.trans_to_mob(imp_in, 10, CHEM_BLOOD)
		to_chat(imp_in, "You feel a tiny prick.")
		imp_in.SetStunned(0)
		imp_in.SetWeakened(0)
		imp_in.SetParalysis(0)

/obj/item/implant/adrenal/implanted(mob/living/carbon/source)
	src.activation_emote = input("Choose activation emote:") in list("blink", "blink_r", "eyebrow", "chuckle", "twitch_v", "frown", "nod", "blush", "giggle", "grin", "groan", "shrug", "smile", "pale", "sniff", "whimper", "wink")
	source.StoreMemory("Adrenal implant can be activated by using the [src.activation_emote] emote, <B>say *[src.activation_emote]</B> to attempt to activate.", /decl/memory_options/system)
	to_chat(source, "The implanted adrenal implant can be activated by using the [src.activation_emote] emote, <B>say *[src.activation_emote]</B> to attempt to activate.")
	return TRUE

/obj/item/implanter/adrenal
	name = "implanter (A)"
	imp = /obj/item/implant/adrenal

/obj/item/implantcase/adrenal
	name = "glass case - 'adrenal'"
	imp = /obj/item/implant/adrenal
