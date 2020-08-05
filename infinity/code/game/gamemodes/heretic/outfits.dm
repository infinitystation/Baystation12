/decl/hierarchy/outfit/cultghost
	name = "Dark Spirit Outfit"
	shoes = /obj/item/clothing/shoes/cult/ghost
	uniform = /obj/item/clothing/under/color/black/ghost
	suit = /obj/item/clothing/suit/storage/hooded/cultrobes/ghost
	r_hand = /obj/item/weapon/melee/cultblade/ghost

/datum/species/human/cult
	name = "Cult"
	spawn_flags = SPECIES_IS_RESTRICTED
	brute_mod = 2
	burn_mod = 2
	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_NO_FBP_CONSTRUCTION
	force_cultural_info = list(
		TAG_CULTURE =   CULTURE_CULTIST,
		TAG_HOMEWORLD = HOME_SYSTEM_STATELESS,
		TAG_FACTION =   FACTION_OTHER
	)

/datum/species/human/cult/handle_death(var/mob/living/carbon/human/H)
	if(H)
		H.dust()

/datum/species/human/cult/handle_post_spawn(var/mob/living/carbon/human/H)
	H.s_tone = 35
	H.r_eyes = 230
	H.b_eyes = 7
	H.g_eyes = 7
	H.alpha = 150
	H.update_eyes()
