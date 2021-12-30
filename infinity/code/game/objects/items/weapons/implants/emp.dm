/obj/item/implant/emp
	name = "emp implant"
	desc = "This implant can start an EMP, which is useful to fry some electrocics."
	origin_tech = list(TECH_MATERIAL = 2, TECH_MAGNET = 3, TECH_ESOTERIC = 3)
	implant_color = "r"
	hidden = 1
	var/activation_emote
	var/uses = 2

/obj/item/implant/emp/get_data()
	return {"
	<b>Implant Specifications:</b><BR>
	<b>Name:</b> EPMPulse Starter<BR>
	<b>Life:</b> 1 - 3 uses<BR>
	<b>Important Notes:</b> <font color='red'>Can cause EM pulses, capable of destroying electronics</font><BR>
	<HR>
	<b>Implant Details:</b> <BR>
	<b>Function:</b> When triggered starts an EMP<BR>
	<b>Integrity:</b> The battery is extremely weak and commonly after injection its
	life can drive down to only 1 use. Implant is EMP-proof.<HR>
	No Implant Specifics"}

/obj/item/implant/emp/emp_act(severity)
	if(prob(10))
		disable(100, 1000)

/obj/item/implant/emp/trigger(emote, mob/living/carbon/source as mob)
	if (emote == activation_emote)
		activate()

/obj/item/implant/emp/activate()
	if(uses < 1 || malfunction)	return 0
	if(empulse(imp_in, 3, 6))
		uses--

/obj/item/implant/emp/implanted(mob/living/carbon/source)
	src.activation_emote = input("Choose activation emote:") in list("blink", "blink_r", "eyebrow", "chuckle", "twitch_v", "frown", "nod", "blush", "giggle", "grin", "groan", "shrug", "smile", "pale", "sniff", "whimper", "wink")
	source.StoreMemory("EMP implant can be activated by using the [src.activation_emote] emote, <B>say *[src.activation_emote]</B> to attempt to activate.", /decl/memory_options/system)
	to_chat(source, "The implanted EMP implant can be activated by using the [src.activation_emote] emote, <B>say *[src.activation_emote]</B> to attempt to activate.")
	return TRUE

/obj/item/implanter/emp
	name = "implanter (E)"
	imp = /obj/item/implant/emp

/obj/item/implantcase/emp
	name = "glass case - 'emp'"
	imp = /obj/item/implant/emp
