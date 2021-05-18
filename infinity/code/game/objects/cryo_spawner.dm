// From Old-World-Blues, refactored
/obj/structure/cryo_spawner
	name = "cryogenic sleeper"
	desc = "A man-sized pod for entering suspended animation."
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "body_scanner_1"
	density = TRUE
	anchored = TRUE

	var/use_left = 1
	var/permissions
	var/list/species_restricted
	var/random_name = FALSE

	var/decl/hierarchy/outfit/default_outfit
	var/decl/hierarchy/outfit/special_outfit

/obj/structure/cryo_spawner/attack_ghost(mob/user)
	if(GAME_STATE < RUNLEVEL_GAME)
		return

	if(use_left == 0)
		to_chat(user, "<span class='notice'>Sorry, exceeded usage limit.</span>")
		return

	var/client/C = user.client

	if(permissions)
		if(!check_rights(permissions, TRUE, C))
			return

	if(species_restricted)
		if(!(C.prefs.species in species_restricted))
			to_chat(user, "<span class='warning'>Sorry, your current species is not allowed to spawn.</span>")
			return

	if(alert("Would you like to use cryogenic sleeper?",,"Yes","No") == "No")
		return

	spawn_procedure(C)

/obj/structure/cryo_spawner/proc/spawn_procedure(client/C)
	if(!C) return

	var/mob/living/carbon/human/new_character

	if(C.prefs.species)
		new_character = new(loc, C.prefs.species)

	if(!new_character)
		new_character = new(loc)

	new_character.lastarea = get_area(src)

	C.prefs.copy_to(new_character)

	new_character.dna.ready_dna(new_character)
	new_character.dna.b_type = C.prefs.b_type

	// Do the initial caching of the player's body icons.
	new_character.force_update_limbs()
	new_character.update_eyes()
	new_character.regenerate_icons()

	new_character.key = C.key

	if(random_name)
		new_character.name = random_name(gender)
	else
		new_character.name = C.prefs.real_name

	if(use_left)
		use_left--

	update_icon()

	if(default_outfit)
		var/decl/hierarchy/outfit/outfit = default_outfit
		if(check_rights(R_ADMIN, 0, C) && special_outfit)
			if(alert("You are an administrator, and this cryogenic sleeper have alternative admin-only outfit. Would you like to choose it?",,"Yes","No") == "Yes")
				outfit = special_outfit
		if(outfit)
			outfit.equip(new_character)

	log_game("[key_name(new_character)] have been spawned with [name]", src, 0)

	post_spawn_procedure(new_character)

/obj/structure/cryo_spawner/proc/post_spawn_procedure(var/mob/living/carbon/human/H)
	return

/obj/structure/cryo_spawner/on_update_icon()
	icon_state = "body_scanner_0"
	spawn(10)
		icon_state = initial(icon_state)


/decl/hierarchy/outfit/civilian
	name = "Civilian"
	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes

/obj/structure/cryo_spawner/civilian
	name = "civilian cryogenic sleeper"


/obj/structure/cryo_spawner/central_command/Initialize()
	. = ..()
	if(default_outfit?.name)
		SetName("cryogenic sleeper ([default_outfit.name])")

/obj/structure/cryo_spawner/central_command
	name = "central command cryogenic sleeper"
	permissions = R_SPAWN
	species_restricted = list(SPECIES_HUMAN)

	default_outfit = /decl/hierarchy/outfit/nanotrasen

/obj/structure/cryo_spawner/central_command/representative
	default_outfit = /decl/hierarchy/outfit/nanotrasen/representative

/obj/structure/cryo_spawner/central_command/officer
	default_outfit = /decl/hierarchy/outfit/nanotrasen/officer

/obj/structure/cryo_spawner/central_command/captain
	default_outfit = /decl/hierarchy/outfit/nanotrasen/captain

/obj/structure/cryo_spawner/central_command/commander
	default_outfit = /decl/hierarchy/outfit/nanotrasen/commander


/decl/hierarchy/outfit/tournament_battle_gear
	hierarchy_type = /decl/hierarchy/outfit/tournament_battle_gear

	head = /obj/item/clothing/head/helmet
	suit = /obj/item/clothing/suit/armor/vest
	uniform = /obj/item/clothing/under/color/black
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/thick/combat
	shoes = /obj/item/clothing/shoes/jackboots
	back = /obj/item/gun/projectile/automatic/assault_rifle
	r_pocket = /obj/item/ammo_magazine/rifle

/decl/hierarchy/outfit/tournament_battle_gear/red
	name = "Tournament battle gear - Red"
	uniform = /obj/item/clothing/under/color/red

/decl/hierarchy/outfit/tournament_battle_gear/green
	name = "Tournament battle gear - Green"
	uniform = /obj/item/clothing/under/color/green

/decl/hierarchy/outfit/tournament_battle_gear/blue
	name = "Tournament battle gear - Blue"
	uniform = /obj/item/clothing/under/color/blue

/obj/structure/cryo_spawner/tournament
	name = "tournament cryogenic sleeper"
	use_left = -1
	species_restricted = list(SPECIES_HUMAN)
	random_name = TRUE

	default_outfit = /decl/hierarchy/outfit/tournament_battle_gear

/obj/structure/cryo_spawner/tournament/red
	name = "tournament cryogenic sleeper (Red)"
	default_outfit = /decl/hierarchy/outfit/tournament_battle_gear/red

/obj/structure/cryo_spawner/tournament/green
	name = "tournament cryogenic sleeper (Green)"
	default_outfit = /decl/hierarchy/outfit/tournament_battle_gear/green

/obj/structure/cryo_spawner/tournament/blue
	name = "tournament cryogenic sleeper (Blue)"
	default_outfit = /decl/hierarchy/outfit/tournament_battle_gear/blue
