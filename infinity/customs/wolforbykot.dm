/obj/item/clothing/suit/armor/pcarrier/tactical/wolforbykot
	name = "old army overcoat"
	desc = "An old Gaian Conflict-era GCC shocktroop coat. \
			Worn, but well-maintained, with armor plates woven in at vital points. \
			Straps with bright-red identification marks sit at the shoulders, \
			and a two-headed eagle spreads its gilded wings across the wearer's back."
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/tactical)
	valid_accessory_slots = list(
		ACCESSORY_SLOT_INSIGNIA,
		ACCESSORY_SLOT_ARMOR_C,
		ACCESSORY_SLOT_ARMOR_A,
		ACCESSORY_SLOT_ARMOR_L,
		ACCESSORY_SLOT_ARMOR_S,
		ACCESSORY_SLOT_ARMOR_M,
		ACCESSORY_SLOT_OVER
	)

	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB,
					  slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
					  slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT)
	icon_state = "kegancoat"
	item_state = "kegancoat"
	body_parts_covered = UPPER_TORSO | LOWER_TORSO | LEGS | ARMS
	trade_blacklisted = TRUE

/obj/item/clothing/head/helmet/tactical/wolforbykot
	name = "GSFH-2"
	desc = "Closed helmet harking back to times of bloody war, a fearful visage of foreign special forces. \
			Contains an IFF-enabled HUD, but an obvious shot mark on the right side of the plating has long \
			since disabled any electronics beyond hope of repair. Its built-in air filtration system persists yet."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_head_str = CUSTOM_ITEM_MOB,
					slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
					slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT)
	item_state_slots = list(slot_l_hand_str = "keganhelmet",
							slot_r_hand_str = "keganhelmet",)
	icon_state = "keganhelmet"
	item_state = "keganhelmet"
	flags_inv = HIDEFACE | HIDEEYES | HIDEEARS | BLOCKHAIR
	body_parts_covered = HEAD | FACE | EYES
	item_flags = ITEM_FLAG_AIRTIGHT
	trade_blacklisted = TRUE

/obj/item/storage/backpack/wolforbykot
	name = "CAB"
	desc = "A waist-slung Gaian shocktroop bag. Compact and roomy."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_back_str = CUSTOM_ITEM_MOB,
					slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
					slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT)
	item_state_slots = list(slot_l_hand_str = "keganbackpack",
							slot_r_hand_str = "keganbackpack",)
	icon_state = "keganbackpack"
	item_state = "keganbackpack"
	// This is INF rucksack storage. I add this bcs I heard that everyone can take it from loadout
	// If you think that I'm faggot - check infinity\code\game\objects\items\weapons\storage\backpack.dm
	max_storage_space = DEFAULT_BACKPACK_STORAGE + 8
	trade_blacklisted = TRUE

/obj/item/clothing/gloves/thick/duty/wolforbykot
	name = "fingerless gloves"
	desc = "A pair of sturdy fingerless gloves. The hard knuckles bear many a stain."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_gloves_str = CUSTOM_ITEM_MOB)
	icon_state = "kegangloves"
	item_state = "kegangloves"
	trade_blacklisted = TRUE

/obj/item/clothing/under/solgov/utility/wolf
	name = "OP combat uniform"
	desc = "An elastic, tight-fitting suit with yellow highlights. The fused synthleather fabrics offer comfort and prevent noisy friction. The small inscription on the collar reads OUTER PARADISE."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
	)
	icon_state = "keganu"
	item_state = "keganu"
	worn_state = "keganu"
	item_state_slots = list(
		slot_w_uniform_str = "keganu",
		slot_l_hand_str = "keganul",
		slot_r_hand_str = "keganur"
	)
	trade_blacklisted = TRUE

/obj/item/clothing/shoes/jackboots/wolf
	name = "OP boots"
	desc = "Snug, dark-toned boots with yellow highlights. Exceptionally muffle their wearer's footsteps."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_shoes_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
	)
	icon_state = "keganj"
	item_state = "keganj"
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/storage/black_vest/wolf
	name = "slings"
	desc = "Rugged and sturdy slings with pouches."
	icon = CUSTOM_ITEM_OBJ
	accessory_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_tie_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB
	)
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	icon_state = "keganp"
	item_state = "keganp"
	on_rolled = list("rolled" = "keganp", "down" = "keganp")
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/cloak/wolf
	name = "OP poncho"
	desc = "A cloak-poncho hybrid woven out of advanced materials. The PMC Outer Paradise's winged skull symbol is emblazoned on its shoulder."
	icon = CUSTOM_ITEM_OBJ
	accessory_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_tie_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB
	)
	item_icons = list(slot_wear_suit_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
	)
	icon_state = "kegans"
	item_state = "kegans"
	item_state_slots = list(
		slot_tie_str = "kegans",
		slot_wear_suit_str = "keganss",
		slot_l_hand_str = "kegansl",
		slot_r_hand_str = "kegansr"
	)

	trade_blacklisted = TRUE


/obj/item/clothingbag/wolforbykot
	name = "clothing bag"
	desc = "Roar's property"
	trade_blacklisted = TRUE

/obj/item/clothingbag/wolforbykot/New()
	..()
	new /obj/item/clothing/head/helmet/tactical/wolforbykot(src)
	new /obj/item/clothing/suit/armor/pcarrier/tactical/wolforbykot(src)
	new /obj/item/clothing/gloves/thick/duty/wolforbykot(src)
	new /obj/item/storage/backpack/wolforbykot(src)
	new /obj/item/clothing/under/solgov/utility/wolf(src)
	new /obj/item/clothing/shoes/jackboots/wolf(src)
	new /obj/item/clothing/accessory/storage/black_vest/wolf(src)
	new /obj/item/clothing/accessory/cloak/wolf(src)
	new /obj/item/clothing/mask/gas/rex(src)


// Chainsword 40k
/obj/item/chainsword
	name = "CS-9 \"Martha\""
	desc = "The experimental chainsword CS-9 Gaian Conflict-era GCC shocktroop. Reds with a black color give a special entourage. Most such swords use razor-sharp monomolecular teeth. When working, the chain sword emits an angry buzz that grows into a shrill scream when the chain begins to bite into something."

	icon = CUSTOM_ITEM_OBJ
	icon_state = "chainsword_off"
	item_icons = list(
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
	)

	force = 5
	sharp = 1
	edge = 1
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	base_parry_chance = 40  // Like machete

	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT

	attack_verb = list("ripped", "slashed", "torn")

	hitsound = 'infinity/sound/customs/wolforbykot/chainsword_attack.ogg'

	var/force_off = 5
	var/force_on = 18
	var/status = 0
	var/icon_state_off = "chainsword_off"
	var/icon_state_on = "chainsword_on"
	var/fuel = 50
	trade_blacklisted = TRUE

/obj/item/chainsword/proc/set_status(new_status, mob/user)
	if (!new_status)
		status = new_status
		force = force_off
		update_icon()
		return
	if (fuel)
		status = new_status
		playsound(get_turf(user), 'infinity/sound/customs/wolforbykot/chainsword_on.ogg', 50, 1)
		force = force_on
		update_icon()
		return
	to_chat(user, SPAN_WARNING("You need more fuel for this."))

/obj/item/chainsword/on_update_icon()
	if (status)
		icon_state = icon_state_on
	else
		icon_state = icon_state_off

/obj/item/chainsword/attack_self(mob/user as mob)
	set_status(!status, user)

/obj/item/chainsword/afterattack(obj/O as obj, mob/user as mob)
	if (!istype(O, /obj/structure/reagent_dispensers/fueltank) || (get_dist(src,O) > 1) || status)
		return
	fuel += O.reagents.remove_any(50 - fuel)
	to_chat(user, SPAN_NOTICE("You refuel [name]"))
	playsound(src.loc, 'sound/effects/refill.ogg', 50, 1, -6)

/obj/item/chainsword/attack(mob/M, mob/user)
	if (status)
		fuel -= 1
		if (fuel <= 0)
			fuel = 0
			set_status(!status, user)
			to_chat(user, SPAN_WARNING("Out of fuel!"))
	..()

/obj/item/custkit/chainsword
	name = "CS-9 \"Martha\" customization kit"
	input = /obj/item/material/hatchet/machete
	output = /obj/item/chainsword

//CURTKA

/obj/item/clothing/suit/storage/toggle/wolfkurtka
	name = "OP bomber"
	desc = "A green bomber jacket with multiple patches and insignias, the skull on the back most fiercely spreading wings over OUTER PARADISE. Never be game over."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_INHANDS_RIGHT,
		slot_l_hand_str = CUSTOM_ITEM_INHANDS_LEFT
	)
	icon_state = "bomber"
	icon_open = "bomber_open"
	icon_closed = "bomber"
	trade_blacklisted = TRUE
