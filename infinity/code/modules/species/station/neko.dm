/datum/species/human/neko
name = "Felinid"
name_plural = "Felinids"
description = "With cloning on the forefront of human scientific advancement, cheap mass production \
of bodies is a very real and rather ethically grey industry. Vat-grown humans tend to be paler than \
baseline, with no appendix and fewer inherited genetic disabilities, but a weakened metabolism."

description = "The rampant genetic modification advancements made closer to the current century have \
introduced a new generation of serviles for the rich class. With vatgrowns being the predominant caste, \
others like Felinids have soon followed. Sculpted to whims of Lunar aristocrats, they are a subrace \
of cat-like people with an ingrained drive to serve. Severe DNA alterations have allowed bribed lawyers \
to legally determine them as inhuman and subsentient, robbing them of human rights much to the dismay \
of species activists. The felinids are none the wiser, with only rejects and fugitives seen walking \
among the free society."

preview_icon= 'icons/mob/human_races/species/human/subspecies/neko_preview.dmi'
tail = "tajtail"
tail_animation = 'icons/mob/species/tajaran/tail.dmi'

spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED


slowdown = -0.3
brute_mod = 1.1
burn_mod = 1.1
flash_mod = 1.3
darksight_range = 7
darksight_tint = DARKTINT_GOOD \\discount tajaran

unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/kick,
		/datum/unarmed_attack/punch,
		/datum/unarmed_attack/bite/sharp
	)
