/obj/item/clothing/accessory/inf_pin/ccapin
	name = "CCA patch"
	desc = "A small patch, decorated with a CCA symbol pattern embroidered with titanium threads. It looks minimalistic, beautiful and strict. "
	icon = 'infinity/icons/obj/clothing/ties.dmi'
	icon_state = "ccapatch"

/obj/item/clothing/accessory/badge/tajamc // non-solgov variant
	name = "DSS-D7"
	desc = "Technological amulet made of titanium, which has a strange glowing crystal inside. On the sides of the amulet engraved information about the owner. Looks extremely durable."
	gender = PLURAL
	icon = 'infinity/icons/obj/clothing/ties.dmi'
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

/obj/item/clothing/accessory/badge/tajamc/New()
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

/obj/item/weapon/clothingbag/forrya_tajar/Initialize()
	new /obj/item/clothing/accessory/inf_pin/ccapin(src)
	new /obj/item/clothing/accessory/badge/tajamc(src)