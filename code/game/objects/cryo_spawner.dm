// From Old-World-Blues
/obj/cryo_spawner
	name = "cryogenic spawner"
	desc = "A man-sized pod for entering suspended animation."
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "body_scanner_1"
	density = 1
	anchored = 1
	var/use_left = 1
	var/random_name = FALSE
	var/list/rights_required
	var/list/species_can_only_use

	/* todo
	var/uniform
	var/shoes
	var/gloves
	var/suit
	var/r_store
	var/l_store
	var/back
	var/ear
	*/

/obj/cryo_spawner/attack_ghost(mob/user)
	var/client/C = user.client

	if(GAME_STATE != RUNLEVEL_GAME)
		return

	if(rights_required)
		if(!check_rights(rights_required, TRUE, C))
			return

	if(use_left == 0)
		to_chat(user, "<span class='notice'>Sorry, exceeded usage limit.</span>")
		return

	if(species_can_only_use)
		if(!(C.prefs.species in species_can_only_use))
			to_chat(user, "<span class='warning'>Sorry, your current species is restructing to spawn.</span>")
			return

	if(alert("Would you like to spawn?",,"Yes","No") == "No") return

	spawn_procedure(C)

/obj/cryo_spawner/proc/spawn_procedure(client/C)
	if(!C) return

	var/is_admin
	if(check_rights(R_ADMIN, 0, C))
		is_admin = 1

	var/mob/living/carbon/human/new_character

	if(C.prefs.species)
		new_character = new(loc, C.prefs.species)

	if(!new_character)
		new_character = new(loc)

	new_character.lastarea = get_area(loc)

	C.prefs.copy_to(new_character)

	new_character.dna.ready_dna(new_character)
	new_character.dna.b_type = C.prefs.b_type

	// Do the initial caching of the player's body icons.
	new_character.force_update_limbs()
	new_character.update_eyes()
	new_character.regenerate_icons()

	new_character.key = C.key

	if(random_name)
//		C.prefs.real_name = getrandom_name(gender)
		new_character.name = random_name(gender)
	else
		new_character.name = C.prefs.real_name

	if(use_left >= 0)
		use_left--

	update_icon()

	log_game("[key_name(new_character)] have been spawned with [name]", src, 0)
	equip_character(new_character, is_admin)

/obj/cryo_spawner/proc/equip_character(mob/living/carbon/human/H, is_admin = 0)
	return

/obj/cryo_spawner/on_update_icon()
	icon_state = "body_scanner_0"
	sleep(10)
	icon_state = initial(icon_state)

/obj/cryo_spawner/civilian
	name = "civilian cryogenic spawner"

/obj/cryo_spawner/civilian/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/color/black(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes(H), slot_shoes)

/obj/cryo_spawner/central_command
	name = "central command cryogenic spawner"
	rights_required = list(R_SPAWN)
	species_can_only_use = list(SPECIES_HUMAN)

/obj/cryo_spawner/central_command/equip_character(mob/living/carbon/human/H, is_admin)
	if(is_admin)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/centcom_captain(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/white(H), slot_gloves)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/beret/centcom/captain(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(H), slot_l_store)
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/energy(H), slot_belt)

		var/obj/item/weapon/card/id/centcom/W = new(H)
		W.name = "[H.real_name]'s ID Card"
		W.access = get_all_accesses()
		W.access += get_all_centcom_access()
		W.assignment = "NanoTrasen Navy Captain"
		W.registered_name = H.real_name
		H.equip_to_slot_or_del(W, slot_wear_id)
	else
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/centcom_officer(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/white(H), slot_gloves)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/beret/centcom/officer(H), slot_head)

		H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(H), slot_l_store)
		H.equip_to_slot_or_del(new /obj/item/weapon/gun/energy(H), slot_belt)

		var/obj/item/weapon/card/id/centcom/W = new(H)
		W.name = "[H.real_name]'s ID Card"
		W.access = get_all_accesses()
		W.access += get_all_centcom_access()
		W.assignment = "NanoTrasen Navy Officer"
		W.registered_name = H.real_name
		H.equip_to_slot_or_del(W, slot_wear_id)

/obj/cryo_spawner/thunderdome
	use_left = -1
	species_can_only_use = list(SPECIES_HUMAN)
	random_name = TRUE

/obj/cryo_spawner/thunderdome/red_team
	name = "thunderdome spawner (RED)"

/obj/cryo_spawner/thunderdome/red_team/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/color/red(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/combat(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/c556(H), slot_r_store)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/sts35(H), slot_back)

	var/obj/item/weapon/card/id/centcom/W = new(H)
	W.name = "[H.real_name]'s ID Card"
	W.assignment = "Thunderdome Participant (Red Team)"
	W.registered_name = H.real_name
	H.equip_to_slot_or_del(W, slot_wear_id)


/obj/cryo_spawner/thunderdome/blue_team
	name = "thunderdome spawner (BLUE)"

/obj/cryo_spawner/thunderdome/blue_team/equip_character(mob/living/carbon/human/H, is_admin)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/color/blue(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/combat(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/ammo_magazine/c556(H), slot_r_store)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/sts35(H), slot_back)

	var/obj/item/weapon/card/id/centcom/W = new(H)
	W.name = "[H.real_name]'s ID Card"
	W.assignment = "Thunderdome Participant (Blue Team)"
	W.registered_name = H.real_name
	H.equip_to_slot_or_del(W, slot_wear_id)
