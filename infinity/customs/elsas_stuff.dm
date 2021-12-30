/obj/item/clothing/suit/storage/det_trench/elsa
	name = "special detective coat"
	desc = "Brown detective coat with emblem."

	icon = 'infinity/icons/customs/elsas/obj/elsas_stuff.dmi'
	icon_state = "elsas_trench"
	item_state = "elsas_trench"

	item_icons = list(
		slot_wear_suit_str = 'infinity/icons/customs/elsas/mob/elsas_stuff.dmi'
	)

/obj/item/clothing/ring/elsa
	name = "ring"
	desc = "Family ring."

	icon = 'infinity/icons/customs/elsas/obj/elsas_stuff.dmi'
	icon_state = "elsas_ring"

/obj/item/gun/projectile/revolver/mateba/elsa
	name = "Blood Ash"
	desc = "Special edition mateba for detective with the emerald handle."

	icon = 'infinity/icons/customs/elsas/obj/elsas_stuff.dmi'
	icon_state = "elsas_gun"

/obj/item/clothing/shoes/elsa
	name = "patent leather shoes"
	desc = "Patent leather shoes?"

	icon = 'infinity/icons/customs/elsas/obj/elsas_stuff.dmi'
	icon_state = "elsas_shoes"
	item_state = "elsas_shoes"

	item_icons = list(
		slot_shoes_str = 'infinity/icons/customs/elsas/mob/elsas_stuff.dmi'
	)

/obj/item/clothing/gloves/forensic/elsa
	name = "gloves"
	desc = "Specias forensic gloves."

	icon = 'infinity/icons/customs/elsas/obj/elsas_stuff.dmi'
	icon_state = "elsas_gloves"
	item_state = "elsas_gloves"

	item_icons = list(
		slot_gloves_str = 'infinity/icons/customs/elsas/mob/elsas_stuff.dmi'
	)

/obj/item/clothing/under/tactical/elsa
	name = "detective uniform"
	desc = "Detective uniform with agents emblem"

	icon = 'infinity/icons/customs/elsas/obj/elsas_stuff.dmi'
	icon_state = "elsas_under"
	item_state = "elsas_under"
	worn_state = null
	item_icons = list(
		slot_w_uniform_str = 'infinity/icons/customs/elsas/mob/elsas_stuff.dmi'
	)

/obj/item/device/radio/headset/elsa
	name = "agent radio headset"
	desc = "Simple headset"
	icon_state = "sec_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/heads/hos

/obj/item/card/id/p_ctiminalist
	name = "PC card"
	desc = "Card of private criminalist."
	color = COLOR_GRAY40
	detail_color = COLOR_COMMAND_BLUE
	extra_details = list("goldstripe")
	//job_access_type = /datum/job/captain
	access = list(access_sec_doors, access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, 73, access_bridge, 101)

/decl/hierarchy/outfit/job/elsa_detective
	name = "Private criminalist"
	hierarchy_type = /decl/hierarchy/outfit/job

	uniform = /obj/item/clothing/under/tactical/elsa
	l_ear = /obj/item/device/radio/headset/elsa
	shoes = /obj/item/clothing/shoes/elsa
	gloves = /obj/item/clothing/gloves/forensic/elsa
	suit = /obj/item/clothing/suit/storage/det_trench/elsa
	id_types = list(/obj/item/card/id/p_ctiminalist)
	backpack_contents = list (
		/obj/item/gun/projectile/revolver/mateba/elsa = 1,
		/obj/item/clothing/ring/elsa 						 = 1,
		/obj/item/storage/briefcase/crimekit 		 = 1,
		/obj/item/clothing/accessory/storage/holster/thigh   = 1,
		/obj/item/device/taperecorder					 	 = 1,
		/obj/item/device/tape/random						 = 2,
		/obj/item/ammo_magazine/c50/rubber 					 = 2
	)
	flags = OUTFIT_HAS_BACKPACK

/obj/structure/cryo_spawner/thunderdome/elsa
	default_outfit = /decl/hierarchy/outfit/job/elsa_detective

/obj/structure/cryo_spawner/thunderdome/elsa/attack_ghost(mob/user)
	if(user.ckey == "auesti" || user.ckey == "skonoplich")
		..()

/obj/structure/cryo_spawner/thunderdome/elsa/post_spawn_procedure(mob/living/carbon/human/H)
	if(..())
		H.skillset.skill_list = list (
				SKILL_BUREAUCRACY  		=	SKILL_EXPERT,
				SKILL_FINANCE 			=	SKILL_BASIC,
				SKILL_EVA				=	SKILL_NONE,
				SKILL_MECH	  		=	SKILL_NONE,
				SKILL_PILOT	   		=	SKILL_EXPERT,
				SKILL_HAULING   		=	SKILL_EXPERT,
				SKILL_COMPUTER			=	SKILL_BASIC,
				SKILL_BOTANY	  		=	SKILL_NONE,
				SKILL_COOKING	 		=	SKILL_NONE,
				SKILL_COMBAT	   		=	SKILL_EXPERT,
				SKILL_WEAPONS	 		=	SKILL_EXPERT,
				SKILL_FORENSICS			=	SKILL_PROF,
				SKILL_CONSTRUCTION 		=	SKILL_NONE,
				SKILL_ELECTRICAL   		=	SKILL_NONE,
				SKILL_ATMOS		 	=	SKILL_NONE,
				SKILL_ENGINES	 		=	SKILL_NONE,
				SKILL_DEVICES	 		=	SKILL_NONE,
				SKILL_SCIENCE	  		=	SKILL_NONE,
				SKILL_MEDICAL  			=	SKILL_BASIC,
				SKILL_ANATOMY	  		=	SKILL_NONE,
				SKILL_VIROLOGY	  	=	SKILL_NONE,
				SKILL_CHEMISTRY			=	SKILL_NONE
			)
