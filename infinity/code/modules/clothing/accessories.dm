//Sprites from tgstation, specially for Parasoul's custom-item
/obj/item/clothing/accessory/necklace/talisman
	name = "bone talisman"
	desc = "A hunter's talisman, some say the old gods smile on those who wear it."
	icon = CUSTOM_ITEM_OBJ
	accessory_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB, slot_wear_suit_str = CUSTOM_ITEM_MOB)
	icon_state = "talisman-4"

	///////////
	//COLLARS//
	///////////

/obj/item/clothing/accessory/necklace/collar
	name = "Silver tag collar"
	desc = "A collar for your little pets... or the big ones."
	icon = 'icons/obj/clothing/infinity/ties.dmi'
	icon_state = "collar_bksilv"
	accessory_icons = list(slot_w_uniform_str = 'icons/mob/infinity/sprite_accessories.dmi', slot_wear_suit_str = 'icons/mob/infinity/sprite_accessories.dmi', slot_wear_mask_str  = 'icons/mob/infinity/sprite_accessories.dmi')
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/onmob/Unathi/misc.dmi',
		SPECIES_RESOMI = 'icons/mob/onmob/Resomi/misc.dmi'
		)

/obj/item/clothing/accessory/necklace/collar/gold
	name = "Golden tag collar"
	desc = "A collar for your little pets... or the big ones."
	icon_state = "collar_bkgold"

/obj/item/clothing/accessory/necklace/collar/bell
	name = "Bell collar"
	desc = "A collar with a tiny bell hanging from it, purrfect furr kitties."
	icon_state = "collar_bkbell"

/obj/item/clothing/accessory/necklace/collar/spike
	name = "Spiked collar"
	desc = "A collar with spikes that look as sharp as your teeth."
	icon_state = "collar_bkspike"

/obj/item/clothing/accessory/necklace/collar/pink
	name = "Pink collar"
	desc = "This collar will make your pets look FA-BU-LOUS."
	icon_state = "collar_pisilv"

/obj/item/clothing/accessory/necklace/collar/holo
	name = "Holo-collar"
	desc = "An expensive holo-collar for the modern day pet."
	icon_state = "collar_bkholo"

/obj/item/clothing/accessory/necklace/collar/holo/attack_self(mob/user as mob)
	user << "<span class='notice'>[name]'s interface is projected onto your hand.</span>"

	var/str = copytext(reject_bad_text(input(user,"Tag text?","Set tag","")),1,MAX_NAME_LEN)

	if(!str || !length(str))
		user << "<span class='notice'>[name]'s tag set to be blank.</span>"
		name = initial(name)
		desc = initial(desc)
	else
		user << "<span class='notice'>You set the [name]'s tag to '[str]'.</span>"
		name = initial(name) + " ([str])"
		desc = initial(desc) + " The tag says \"[str]\"."

/obj/item/clothing/accessory/necklace/collar/shock
	name = "Shock collar"
	desc = "A collar used to ease hungry predators."
	icon_state = "collar_bkshk0"
	item_state = "collar_bkshk"
	var/on = FALSE // 0 for off, 1 for on, starts off to encourage people to set non-default frequencies and codes.
	var/frequency = 1449
	var/code = 2
	var/datum/radio_frequency/radio_connection

/obj/item/clothing/accessory/necklace/collar/shock/New()
	..()
	radio_connection = radio_controller.add_object(src, frequency, RADIO_CHAT) // Makes it so you don't need to change the frequency off of default for it to work.

/obj/item/clothing/accessory/necklace/collar/shock/Destroy() //Clean up your toys when you're done.
	radio_controller.remove_object(src, frequency)
	radio_connection = null //Don't delete this, this is a shared object.
	return ..()

/obj/item/clothing/accessory/necklace/collar/shock/proc/set_frequency(new_frequency)
	radio_controller.remove_object(src, frequency)
	frequency = new_frequency
	radio_connection = radio_controller.add_object(src, frequency, RADIO_CHAT)

/obj/item/clothing/accessory/necklace/collar/shock/Topic(href, href_list)
	if(usr.stat || usr.restrained())
		return
	if(((istype(usr, /mob/living/carbon/human) && ((!( SSticker ) || (SSticker && SSticker.mode != "monkey")) && usr.contents.Find(src))) || (usr.contents.Find(master) || (in_range(src, usr) && istype(loc, /turf)))))
		usr.set_machine(src)
		if(href_list["freq"])
			var/new_frequency = sanitize_frequency(frequency + text2num(href_list["freq"]))
			set_frequency(new_frequency)
		else
			if(href_list["code"])
				code += text2num(href_list["code"])
				code = round(code)
				code = min(100, code)
				code = max(1, code)
			else
				if(href_list["power"])
					on = !( on )
					icon_state = "collar_bkshk[on]" // And apparently this works, too?!
		if(!( master ))
			if(istype(loc, /mob))
				attack_self(loc)
			else
				for(var/mob/M in viewers(1, src))
					if(M.client)
						attack_self(M)
		else
			if(istype(master.loc, /mob))
				attack_self(master.loc)
			else
				for(var/mob/M in viewers(1, master))
					if(M.client)
						attack_self(M)
	else
		usr << browse(null, "window=radio")
		return
	return

/obj/item/clothing/accessory/necklace/collar/shock/receive_signal(datum/signal/signal)
	if(!signal || signal.encryption != code)
		return

	if(on)
		var/mob/M = null
		if(ismob(loc))
			M = loc
		if(ismob(loc.loc))
			M = loc.loc // This is about as terse as I can make my solution to the whole 'collar won't work when attached as accessory' thing.
		M << "<span class='danger'>You feel a sharp shock!</span>"
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(3, 1, M)
		s.start()
		M.Weaken(5)
	return

/obj/item/clothing/accessory/necklace/collar/shock/attack_self(mob/user as mob, flag1)
	if(!istype(user, /mob/living/carbon/human))
		return
	user.set_machine(src)
	var/dat = {"<TT>
			<A href='?src=\ref[src];power=1'>Turn [on ? "Off" : "On"]</A><BR>
			<B>Frequency/Code</B> for collar:<BR>
			Frequency:
			<A href='byond://?src=\ref[src];freq=-10'>-</A>
			<A href='byond://?src=\ref[src];freq=-2'>-</A> [format_frequency(frequency)]
			<A href='byond://?src=\ref[src];freq=2'>+</A>
			<A href='byond://?src=\ref[src];freq=10'>+</A><BR>

			Code:
			<A href='byond://?src=\ref[src];code=-5'>-</A>
			<A href='byond://?src=\ref[src];code=-1'>-</A> [code]
			<A href='byond://?src=\ref[src];code=1'>+</A>
			<A href='byond://?src=\ref[src];code=5'>+</A><BR>
			</TT>"}
	user << browse(dat, "window=radio")
	onclose(user, "radio")
	return

//Resomi scarf
/obj/item/clothing/accessory/scarf/resomi
	name = "small mantle"
	desc = "A stylish scarf. The perfect winter accessory for those with a keen fashion sense, and those who just can't handle a cold breeze on their necks."
	icon = 'icons/obj/clothing/infinity/ties.dmi'
	icon_state = "small_mantle"
	species_restricted = list(SPECIES_RESOMI)

//Pins

/obj/item/clothing/accessory/inf_pin
	name = "NT pin"
	desc = "A red Nanotrasen pin."
	icon = 'icons/obj/clothing/infinity/ties.dmi'
	icon_state = "nt_r"
	accessory_icons = list(slot_w_uniform_str = 'icons/mob/infinity/ties.dmi', slot_wear_suit_str = 'icons/mob/infinity/ties.dmi')
	high_visibility = 1

/obj/item/clothing/accessory/inf_pin/ntblue
	name = "NT pin"
	desc = "A blue Nanotrasen pin."
	icon_state = "nt_b"

/obj/item/clothing/accessory/inf_pin/tccpin
	name = "TCC pin"
	desc = "A small TCC flag."
	icon_state = "tcc"

/obj/item/clothing/accessory/inf_pin/scgpin
	name = "CSG pin"
	desc = "A small CSG flag."
	icon_state = "csg"

/obj/item/clothing/accessory/badge/dog_tags // non-solgov variant
	name = "dog tags"
	desc = "Plain identification tags made from a durable metal. They are stamped with a variety of informational details."
	gender = PLURAL
	icon_state = "tags"
	icon = 'maps/torch/icons/obj/obj_accessories_solgov.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi', slot_wear_suit_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi')
	badge_string = null
	slot_flags = SLOT_MASK | SLOT_TIE

/obj/item/clothing/accessory/badge/dog_tags/Initialize()
	. = ..()
	var/mob/living/carbon/human/H
	H = get_holder_of_type(src, /mob/living/carbon/human)
	if(H)
		set_name(H.real_name)
		set_desc(H)

/obj/item/clothing/accessory/badge/dog_tags/attack_self(mob/living/carbon/human/user as mob)
	.=..()
	if(!badge_string)
		var/confirm = alert("Set badges's faction as your own faction?", "Badge Choice", "Yes", "No")
		if(confirm == "No")
			var/choice = input(usr,"Choose your badge's faction","Badge Choice","") as text|null
			if(!choice)
				return
			badge_string = choice
		if(confirm == "Yes")
			var/decl/cultural_info/faction = user.get_cultural_value(TAG_FACTION)
			badge_string = faction.name
		to_chat(user, "<span class='notice'>[src]'s faction now is '[badge_string]'.</span>")

/obj/item/clothing/accessory/badge/dog_tags/set_desc(var/mob/living/carbon/human/H)
	if(!istype(H))
		return
	var/decl/cultural_info/culture = H.get_cultural_value(TAG_RELIGION)
	var/religion = culture ? culture.name : "Unset"
	desc = "[initial(desc)]\nName: [H.real_name] ([H.get_species()])\nReligion: [religion]\nBlood type: [H.b_type]"

/obj/item/clothing/accessory/storage/bandolier/armory/Initialize()
	. = ..()

	for(var/i = 0, i < slots, i++)
		new /obj/item/ammo_casing/shotgun/pellet(hold)

/obj/item/clothing/accessory/scarf/red
	name = "red striped scarf"
	icon = 'icons/obj/clothing/infinity/TG_copy/neck.dmi'
	icon_state = "stripedredscarf"
	accessory_icons = list(slot_w_uniform_str = 'icons/mob/infinity/sprite_accessories.dmi', slot_wear_suit_str = 'icons/mob/infinity/sprite_accessories.dmi', slot_wear_mask_str  = 'icons/mob/infinity/sprite_accessories.dmi')

/obj/item/clothing/accessory/inf_pin/ccapin
	name = "CCA patch"
	desc = "A small patch, decorated with a CCA symbol pattern embroidered with titanium threads. It looks minimalistic, beautiful and strict. "
	icon = 'icons/obj/clothing/infinity/ties.dmi'
	icon_state = "ccapatch"

/obj/item/clothing/accessory/badge/tajamc // non-solgov variant
	name = "DSS-D7"
	desc = "Technological amulet made of titanium, which has a strange glowing crystal inside. On the sides of the amulet engraved information about the owner. Looks extremely durable."
	gender = PLURAL
	icon = 'icons/obj/clothing/infinity/ties.dmi'
	icon_state = "cls"
	badge_string = null
	slot_flags = SLOT_MASK | SLOT_TIE
	var/open = 0
	var/flashlight_max_bright = 0.2 //brightness of light when on, must be no greater than 1.
	var/flashlight_inner_range = 0.1 //inner range of light when on, can be negative
	var/flashlight_outer_range = 1.5 //outer range of light when on, can be negative

/obj/item/clothing/accessory/badge/tajamc/verb/verb_opam()
	set src in usr
	set category = "Object"
	set name = "Use yor paws on amulet"
	(open == 1 )?( open = 0) : (open = 1)
	update_icon()

/obj/item/clothing/accessory/badge/tajamc/on_update_icon()
	if(open)
		icon_state = "opn"
		set_light(flashlight_max_bright, flashlight_inner_range, flashlight_outer_range, 2, light_color)
	else
		icon_state = "cls"
		set_light(0)

/obj/item/clothing/accessory/badge/tajamc/Initialize()
	. = ..()
	var/mob/living/carbon/human/H
	H = get_holder_of_type(src, /mob/living/carbon/human)
	if(H)
		set_name(H.real_name)
		set_desc(H)

/obj/item/clothing/accessory/badge/tajamc/attack_self(mob/living/carbon/human/user as mob)
	.=..()
	if(!badge_string)
		var/confirm = alert("Input your clan name:", "Badge Choice", "Ok")
		if(confirm == "Ok")
			var/choice = input(usr,"Choose your badge's clan","Badge Choice","") as text|null
			badge_string = choice
		to_chat(user, "<span class='notice'>[src]'s clan now is '[badge_string]'.</span>")

/obj/item/clothing/accessory/badge/tajamc/set_desc(var/mob/living/carbon/human/H)
	if(!istype(H))
		return
	desc = "[initial(desc)]\nName: [H.real_name]\nSex: [H.get_sex()]\nAge: [H.age]\nHomeworld: [H.get_cultural_value(TAG_HOMEWORLD)]\nSpecies: [H.get_species()]\nBlood type: [H.b_type]\nDNA: [H.dna.unique_enzymes]\nFingerprints: [H.get_full_print()]"
/*
 * ARMOR ACCESSORIES
 * =================
 */

/obj/item/clothing/accessory/armguards/tactical
	desc = "A pair of black arm pads reinforced with additional ablative coating. Attaches to a plate carrier."
	armor = list(melee = 50, bullet = 50, laser = 60, energy = 35, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/accessory/legguards/tactical
	desc = "A pair of armored leg pads reinforced with additional ablative coating. Attaches to a plate carrier."
	armor = list(melee = 50, bullet = 50, laser = 60, energy = 35, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/accessory/armor/helmcover/scp_cover
	name = "SCP cover"
	desc = "A fabric cover for armored helmets. This one has SCP's colors."
	icon_override = 'icons/mob/infinity/ties.dmi'
	icon = 'icons/obj/clothing/infinity/ties.dmi'
	icon_state = "scp_cover"
	accessory_icons = list(slot_tie_str = 'icons/mob/infinity/ties.dmi', slot_head_str = 'icons/mob/infinity/ties.dmi')

/obj/item/clothing/accessory/armor/tag/scp
	name = "SCP tag"
	desc = "An armor tag with the words SECURITY CORPORATE PERSONAL printed in red lettering on it."
	icon_override = 'icons/mob/infinity/ties.dmi'
	icon = 'icons/obj/clothing/infinity/ties.dmi'
	icon_state = "scp_tag"
	accessory_icons = list(slot_tie_str = 'icons/mob/infinity/ties.dmi', slot_wear_suit_str = 'icons/mob/infinity/ties.dmi')

/obj/item/clothing/accessory/armor/tag/zpci
	name = "\improper ZPCI tag"
	desc = "An armor tag with the words ZONE PROTECTION CONTROL INCORPORATED printed in cyan lettering on it."
	icon_state = "pcrctag"
