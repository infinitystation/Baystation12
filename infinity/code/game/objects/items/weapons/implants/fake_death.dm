/obj/item/implant/fake_death
	name = "fake death implant"
	desc = "This implant injects zombie powder."
	origin_tech = list(TECH_MATERIAL = 2, TECH_BIO = 2)
	implant_color = "r"
	hidden = 1
	var/activation_emote
	var/uses = 1

/obj/item/implant/fake_death/Initialize()
	. = ..()
	create_reagents(5)
	reagents.add_reagent(/datum/reagent/toxin/zombiepowder, 5)

/obj/item/implant/fake_death/get_data()
	return {"
	<b>Implant Specifications:</b><BR>
	<b>Name:</b> Zombie powder Injector<BR>
	<b>Life:</b> 1 uses<BR>
	<b>Important Notes:</b> <font color='red'>Dangerous</font><BR>
	<HR>
	<b>Implant Details:</b> <BR>
	<b>Function:</b> When triggered transfers 5u of zombie powder into user's bloodstream<HR>
	No Implant Specifics"}

/obj/item/implant/fake_death/implanted(mob/living/carbon/source)
	src.activation_emote = input("Choose activation emote:") in list(
		"blink", "blink_r", "eyebrow",
		"chuckle", "twitch_v", "frown",
		"nod", "blush", "giggle",
		"grin", "groan", "shrug",
		"smile", "pale", "sniff",
		"whimper", "wink"
	)
	source.StoreMemory("Fake Death implant can be activated by using the [src.activation_emote] emote, <B>say *[src.activation_emote]</B> to attempt to activate.", /decl/memory_options/system)
	to_chat(source, "The implanted Fake Death implant can be activated by using the [src.activation_emote] emote, <B>say *[src.activation_emote]</B> to attempt to activate.")
	return TRUE

/obj/item/implant/fake_death/activate()
	if (uses < 1 || malfunction)
		return FALSE
	var/mob/living/carbon/R = imp_in
	reagents.trans_to_mob(R, 5, CHEM_BLOOD)
	to_chat(R, SPAN_NOTICE("You hear a faint *beep*."))
	uses--

/obj/item/implant/fake_death/trigger(emote, mob/living/carbon/source as mob)
	if (emote == activation_emote)
		activate()

/obj/item/implant/fake_death/emp_act(severity)
	if(prob(50))
		disable(100, 1000)

/obj/item/implanter/fake_death
	name = "implanter (FD)"
	imp = /obj/item/implant/fake_death

/obj/item/implantcase/fake_death
	name = "glass case - 'Fake Death'"
	imp = /obj/item/implant/fake_death
