/datum/map/bearcat
	allowed_jobs = list(/datum/job/captain, /datum/job/chief_engineer, /datum/job/hop, /datum/job/officer, /datum/job/bartender, /datum/job/doctor, /datum/job/engineer, /datum/job/qm, /datum/job/roboticist, /datum/job/assistant, /datum/job/cyborg)

/datum/job/captain
	supervisors = "the Merchant Code and your conscience"
	outfit_type = /decl/hierarchy/outfit/job/bearcat/captain
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

/datum/job/captain/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(H.client)
		H.client.verbs += /client/proc/rename_ship
		H.client.verbs += /client/proc/rename_company

/client/proc/rename_ship()
	set name = "Rename Ship"
	set category = "Captain's Powers"

	var/ship = sanitize(input(src, "What is your ship called? Don't add the vessel prefix, the FTV one will be attached automatically.", "Ship name", GLOB.using_map.station_short), MAX_NAME_LEN)
	if(!ship)
		return
	GLOB.using_map.station_short = ship
	GLOB.using_map.station_name = "FTV [ship]"
	var/obj/effect/overmap/ship/bearcat/B = locate() in world
	if(B)
		B.name = GLOB.using_map.station_name
	command_announcement.Announce("Attention all hands on [GLOB.using_map.station_name]! Thank you for your attention.", "Ship re-christened")
	verbs -= /client/proc/rename_ship

/client/proc/rename_company()
	set name = "Rename Company"
	set category = "Captain's Powers"
	var/company = sanitize(input(src, "What should your enterprise be called?", "Company name", GLOB.using_map.company_name), MAX_NAME_LEN)
	if(!company)
		return
	var/company_s = sanitize(input(src, "What's the short name for it?", "Company name", GLOB.using_map.company_short), MAX_NAME_LEN)
	if(company != GLOB.using_map.company_name)
		if (company)
			GLOB.using_map.company_name = company
		if(company_s)
			GLOB.using_map.company_short = company_s
		command_announcement.Announce("Congratulations to all employes of [capitalize(GLOB.using_map.company_name)] on the new name. The rebranding have changed the [GLOB.using_map.company_short] market value by [0.01*rand(-10,10)]%.", "Company name change approved")
	verbs -= /client/proc/rename_company

/datum/job/captain/get_access()
	return get_all_station_access()

/datum/job/chief_engineer
	title = "Chief Engineer"
	supervisors = "the Captain"
	department_flag = ENG
	outfit_type = /decl/hierarchy/outfit/job/bearcat/chief_engineer
	min_skill = list(   SKILL_BUREAUCRACY  = SKILL_BASIC,
	                    SKILL_COMPUTER     = SKILL_ADEPT,
	                    SKILL_EVA          = SKILL_ADEPT,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_ADEPT,
	                    SKILL_ATMOS        = SKILL_ADEPT,
	                    SKILL_ENGINES      = SKILL_EXPERT)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 30

/datum/job/doctor
	title = "Doctor"
	supervisors = "the Captain and your idea of Hippocratic Oath"
	outfit_type = /decl/hierarchy/outfit/job/bearcat/doc
	alt_titles = list(
		"Surgeon")
	total_positions = 2
	spawn_positions = 2
	hud_icon = "hudmedicaldoctor"
	min_skill = list(   SKILL_EVA     = SKILL_BASIC,
	                    SKILL_MEDICAL = SKILL_BASIC,
	                    SKILL_ANATOMY = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX,
	                    SKILL_VIROLOGY    = SKILL_MAX)
	skill_points = 32
	access = list(access_medical_equip, access_kitchen)

/datum/job/hop
	title = "First Mate"
	supervisors = "the Captain and the Merchant Code"
	outfit_type = /decl/hierarchy/outfit/job/bearcat/mate
	hud_icon = "hudheadofpersonnel"
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

	skill_points = 30
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_fist_mate)
/datum/job/bartender
	title = "Bartender"
	supervisors = "the Captain"
	outfit_type = /decl/hierarchy/outfit/job/bearcat/bartender
	total_positions = 1
	spawn_positions = 1
	min_skill = list(   SKILL_COOKING   = SKILL_BASIC,
	                    SKILL_BOTANY    = SKILL_BASIC,
	                    SKILL_CHEMISTRY = SKILL_BASIC)

/datum/job/assistant
	title = "Deck Hand"
	supervisors = "Quartermaster, the Captain and the First Mate"
	outfit_type = /decl/hierarchy/outfit/job/bearcat/hand
	alt_titles = list(
		"Steward" = /decl/hierarchy/outfit/job/bearcat/hand/cook,
		"Cargo Hand",
		"Digger" = /decl/hierarchy/outfit/job/bearcat/hand/digger,
		)
	hud_icon = "hudcargotechnician"

/datum/job/engineer
	title = "Junior Engineer"
	supervisors = "Chief Engineer"
	total_positions = 2
	spawn_positions = 2
	hud_icon = "hudengineer"
	alt_titles = null
	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_BASIC,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_BASIC,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_BASIC)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 20

/datum/job/roboticist
	title = "Roboticist"
	supervisors = "your mad brain and the Captain."
	outfit_type = /decl/hierarchy/outfit/job/bearcat/roboticist
	total_positions = 1
	spawn_positions = 1
	alt_titles = null
	min_skill = list(   SKILL_COMPUTER		= SKILL_ADEPT,
	                    SKILL_MECH          = SKILL_ADEPT,
	                    SKILL_DEVICES		= SKILL_ADEPT)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_DEVICES      = SKILL_MAX,
	                    SKILL_ANATOMY      = SKILL_MAX,
	                    SKILL_MEDICAL      = SKILL_MAX)
	skill_points = 18

/datum/job/qm
	title = "Quartermaster"
	supervisors = "your greed, the Captain and the First Mate."
	outfit_type = /decl/hierarchy/outfit/job/bearcat/qm
	total_positions = 1
	spawn_positions = 1
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_ADEPT,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)
	skill_points = 18


/datum/job/officer
	title = "Security"
	supervisors = "the Captain and his laws."
	outfit_type = /decl/hierarchy/outfit/job/bearcat/security
	total_positions = 1
	spawn_positions = 2
	alt_titles = list(
		"Sheriff")
	hud_icon = "hudsecurityofficer"
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_BASIC,
	                    SKILL_FORENSICS   = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)
	skill_points = 18

/datum/job/cyborg
	supervisors = "your laws and the Captain"
	outfit_type = /decl/hierarchy/outfit/job/bearcat/hand/engine
	total_positions = 1
	spawn_positions = 1


// OUTFITS
#define BEARCAT_OUTFIT_JOB_NAME(job_name) ("Bearcat - Job - " + job_name)

/decl/hierarchy/outfit/job/bearcat/
	hierarchy_type = /decl/hierarchy/outfit/job/bearcat
	pda_type = null
	pda_slot = slot_l_store
	l_pocket = /obj/item/weapon/storage/wallet/poly
	l_ear = null
	r_ear = null

/decl/hierarchy/outfit/job/bearcat/captain
	name = BEARCAT_OUTFIT_JOB_NAME("Captain")
	uniform = /obj/item/clothing/under/casual_pants/classicjeans
	shoes = /obj/item/clothing/shoes/black
	pda_type = /obj/item/modular_computer/pda/captain
	r_pocket = /obj/item/device/radio
	id_type = /obj/item/weapon/card/id/gold


/decl/hierarchy/outfit/job/bearcat/captain/post_equip(var/mob/living/carbon/human/H)
	..()
	var/obj/item/clothing/uniform = H.w_uniform
	if(uniform)
		var/obj/item/clothing/accessory/toggleable/hawaii/random/eyegore = new()
		if(uniform.can_attach_accessory(eyegore))
			uniform.attach_accessory(null, eyegore)
		else
			qdel(eyegore)

/decl/hierarchy/outfit/job/bearcat/chief_engineer
	name = BEARCAT_OUTFIT_JOB_NAME("Chief Engineer")
	uniform = /obj/item/clothing/under/rank/chief_engineer
	glasses = /obj/item/clothing/glasses/welding/superior
	suit = /obj/item/clothing/suit/storage/hazardvest
	gloves = /obj/item/clothing/gloves/thick
	shoes = /obj/item/clothing/shoes/workboots
	pda_type = /obj/item/modular_computer/pda/heads/ce
	l_hand = /obj/item/device/radio
	r_hand = /obj/item/weapon/gun/projectile/sec/lethal
	belt = /obj/item/weapon/storage/belt/utility/full
	id_type = /obj/item/weapon/card/id/engineering/head
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/bearcat/doc
	name = BEARCAT_OUTFIT_JOB_NAME("Doctor")
	uniform = /obj/item/clothing/under/det/black
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	glasses = /obj/item/clothing/glasses/hud/health
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/weapon/card/id/medical

/decl/hierarchy/outfit/job/bearcat/mate
	name = BEARCAT_OUTFIT_JOB_NAME("First Mate")
	uniform = /obj/item/clothing/under/suit_jacket/checkered
	shoes = /obj/item/clothing/shoes/laceup
	id_type = /obj/item/weapon/card/id/silver
	glasses = /obj/item/clothing/glasses/sunglasses/big
	r_hand = /obj/item/weapon/gun/projectile/sec/lethal
	l_hand = /obj/item/weapon/clipboard

/decl/hierarchy/outfit/job/bearcat/roboticist
	name = BEARCAT_OUTFIT_JOB_NAME("Roboticist")
	uniform = /obj/item/clothing/under/rank/roboticist
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	shoes = /obj/item/clothing/shoes/black
	glasses = /obj/item/clothing/glasses/welding
	belt = /obj/item/weapon/storage/belt/utility

/decl/hierarchy/outfit/job/bearcat/roboticist/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == "female")
		if(prob(50))
			uniform = /obj/item/clothing/under/rank/roboticist/skirt
	else return

/decl/hierarchy/outfit/job/bearcat/qm
	name = BEARCAT_OUTFIT_JOB_NAME("Quartermaster")
	uniform = /obj/item/clothing/under/rank/cargo
	shoes = /obj/item/clothing/shoes/brown
	glasses = /obj/item/clothing/glasses/sunglasses
	l_hand = /obj/item/weapon/clipboard
	r_hand = /obj/item/weapon/gun/projectile/sec/lethal
	id_type = /obj/item/weapon/card/id/cargo/head

/decl/hierarchy/outfit/job/bearcat/security
	name = BEARCAT_OUTFIT_JOB_NAME("Security")
	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/sunglasses/big
	belt = /obj/item/weapon/melee/baton/loaded
	head = /obj/item/clothing/head/warden
	id_type = /obj/item/weapon/card/id/security
	r_hand = /obj/item/device/radio
	l_hand = /obj/item/weapon/gun/projectile/sec/lethal
	suit = /obj/item/clothing/suit/armor/pcarrier/medium
	gloves = /obj/item/clothing/gloves/thick

/obj/structure/closet/secure_closet/security/bearcat
	name = "security guard's locker"
	req_access = list(access_brig)
	icon_state = "sec1"
	icon_closed = "sec"
	icon_locked = "sec1"
	icon_opened = "secopen"
	icon_broken = "secbroken"
	icon_off = "secoff"

/obj/structure/closet/secure_closet/security/bearcat/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/weapon/storage/backpack/security, /obj/item/weapon/storage/backpack/satchel/sec)),
		new/datum/atom_creator/simple(/obj/item/weapon/storage/backpack/dufflebag/sec, 50),
		/obj/item/clothing/mask/gas/half,
		/obj/item/weapon/handcuffs,
		/obj/item/weapon/storage/belt/holster/security,
		/obj/item/device/flash,
		/obj/item/device/radio/off,
		/obj/item/taperoll/police,
		/obj/item/device/hailer,
		/obj/item/weapon/gun/energy/stunrevolver,
		/obj/item/device/holowarrant,
	)

/decl/hierarchy/outfit/job/bearcat/bartender
	name = BEARCAT_OUTFIT_JOB_NAME("Bartender")
	uniform = /obj/item/clothing/under/rank/bartender
	shoes = /obj/item/clothing/shoes/black
	id_type = /obj/item/weapon/card/id/civilian/bartender
	r_pocket = /obj/item/device/radio

/decl/hierarchy/outfit/job/bearcat/hand
	name = BEARCAT_OUTFIT_JOB_NAME("Deck Hand")

/decl/hierarchy/outfit/job/bearcat/hand/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(list(/obj/item/clothing/under/overalls,/obj/item/clothing/under/focal,/obj/item/clothing/under/hazard,/obj/item/clothing/under/rank/cargotech,/obj/item/clothing/under/color/black,/obj/item/clothing/under/color/grey,/obj/item/clothing/under/casual_pants/track, ))

/decl/hierarchy/outfit/job/bearcat/hand/cook
	name = BEARCAT_OUTFIT_JOB_NAME("Steward")
	head = /obj/item/clothing/head/chefhat
	suit = /obj/item/clothing/suit/chef/classic

/decl/hierarchy/outfit/job/bearcat/hand/digger
	name = BEARCAT_OUTFIT_JOB_NAME("Digger")
	uniform = /obj/item/clothing/under/rank/miner
	r_pocket = /obj/item/device/flashlight/lantern
	belt = /obj/item/weapon/pickaxe

/decl/hierarchy/outfit/job/bearcat/hand/engine
	name = BEARCAT_OUTFIT_JOB_NAME("Junior Engineer")
	head = /obj/item/clothing/head/hardhat
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/bearcat/hand/engine/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(50))
		suit = /obj/item/clothing/suit/storage/hazardvest