/obj/item/clothing/suit/storage/det_trench/elsa
	name = "special detective coat"
	desc = "Brown detective coat with emblem."

	icon = 'icons/infinity_custom_sets/obj/elsas_stuff.dmi'
	icon_state = "elsas_trench"
	item_state = "elsas_trench"

	item_icons = list(
		slot_wear_suit_str = 'icons/infinity_custom_sets/mob/elsas_stuff.dmi'
	)

/obj/item/clothing/ring/elsa
	name = "ring"
	desc = "Family ring."

	icon = 'icons/infinity_custom_sets/obj/elsas_stuff.dmi'
	icon_state = "elsas_ring"

/obj/item/weapon/gun/projectile/revolver/mateba/elsa
	name = "Blood Ash"
	desc = "Special edition mateba for detective with the emerald handle."

	icon = 'icons/infinity_custom_sets/obj/elsas_stuff.dmi'
	icon_state = "elsas_gun"

/obj/item/clothing/shoes/elsa
	name = "patent leather shoes"
	desc = "Patent leather shoes?"

	icon = 'icons/infinity_custom_sets/obj/elsas_stuff.dmi'
	icon_state = "elsas_shoes"
	item_state = "elsas_shoes"

	item_icons = list(
		slot_shoes_str = 'icons/infinity_custom_sets/mob/elsas_stuff.dmi'
	)

/obj/item/clothing/gloves/forensic/elsa
	name = "gloves"
	desc = "Specias forensic gloves."

	icon = 'icons/infinity_custom_sets/obj/elsas_stuff.dmi'
	icon_state = "elsas_gloves"
	item_state = "elsas_gloves"

	item_icons = list(
		slot_gloves_str = 'icons/infinity_custom_sets/mob/elsas_stuff.dmi'
	)

/obj/item/clothing/under/tactical/elsa
	name = "detective uniform"
	desc = "Detective uniform with agents emblem"
	
	icon = 'icons/infinity_custom_sets/obj/elsas_stuff.dmi'
	icon_state = "elsas_under"
	item_state = "elsas_under"
	worn_state = null
	item_icons = list(
		slot_w_uniform_str = 'icons/infinity_custom_sets/mob/elsas_stuff.dmi'
	)
	
/obj/item/device/radio/headset/elsa
	name = "agent radio headset"
	desc = "Simple headset"
	icon_state = "sec_headset"
	item_state = "headset"
	ks1type = /obj/item/device/encryptionkey/heads/hos

/obj/item/weapon/card/id/p_ctiminalist
	name = "PC card"
	desc = "Card of private criminalist."
	icon_state = "centcomNew"
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
	id_type = /obj/item/weapon/card/id/p_ctiminalist
	backpack_contents = list (
		/obj/item/weapon/gun/projectile/revolver/mateba/elsa = 1,
		/obj/item/clothing/ring/elsa 					     = 1,
		/obj/item/weapon/storage/briefcase/crimekit 		 = 1,
		/obj/item/clothing/accessory/storage/holster/thigh   = 1,
		/obj/item/device/taperecorder                	 	 = 1,
		/obj/item/device/tape/random	                     = 2,
		/obj/item/ammo_magazine/c50/rubber 					 = 2
	)
	flags = OUTFIT_HAS_BACKPACK

/obj/cryo_spawner/thunderdome/elsa

/obj/cryo_spawner/thunderdome/elsa/attack_ghost(mob/user)
	if (user.ckey && (user.ckey == "auesti" || user.ckey == "skonoplich"))
		..()

/obj/cryo_spawner/thunderdome/elsa/equip_character(mob/living/carbon/human/H, is_admin = 0)
	var/decl/hierarchy/outfit/job/elsa_detective/O = new /decl/hierarchy/outfit/job/elsa_detective
	O.equip(H)
	qdel(O)
	H.skillset.skill_list = list (
			SKILL_BUREAUCRACY  		=	SKILL_EXPERT,
			SKILL_FINANCE 			=	SKILL_BASIC,
			SKILL_EVA        		=	SKILL_NONE,
			SKILL_MECH      		=	SKILL_NONE,
			SKILL_PILOT       		=	SKILL_EXPERT,
			SKILL_HAULING   		=	SKILL_EXPERT,
			SKILL_COMPUTER    		=	SKILL_BASIC,
			SKILL_BOTANY      		=	SKILL_NONE,
			SKILL_COOKING     		=	SKILL_NONE,
			SKILL_COMBAT       		=	SKILL_EXPERT,
			SKILL_WEAPONS     		=	SKILL_EXPERT,
			SKILL_FORENSICS    		=	SKILL_PROF,
			SKILL_CONSTRUCTION 		=	SKILL_NONE,
			SKILL_ELECTRICAL   		=	SKILL_NONE,
			SKILL_ATMOS         	=	SKILL_NONE,
			SKILL_ENGINES     		=	SKILL_NONE,
			SKILL_DEVICES     		=	SKILL_NONE,
			SKILL_SCIENCE      		=	SKILL_NONE,
			SKILL_MEDICAL  			=	SKILL_BASIC,
			SKILL_ANATOMY      		=	SKILL_NONE,
			SKILL_VIROLOGY      	=	SKILL_NONE,
			SKILL_CHEMISTRY			=	SKILL_NONE	
		)


