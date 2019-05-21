/obj/item/weapon/material/sword/katana/snow_hand
	name = "snow hand"
	desc = "This is a unique weapon. The sword is custom made for a specific owner. Katana has dark-ice color. On the sheath there is an inscription in an interesting font - \"Snowflake\"."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "quiet_katana"
	force = 20
	item_icons = list(
		slot_belt_str = CUSTOM_ITEM_MOB,
		slot_back_str = CUSTOM_ITEM_MOB,
		slot_l_hand_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_MOB
	)
	item_state_slots = list(
		slot_belt_str = "quietkatana_belt_full",
		slot_back_str = "quietkatana_back_full",
		slot_l_hand_str = "quietkatana_l",
		slot_r_hand_str = "quietkatana_r"
	)

//TODO@INF._ELAR_: Sheath for custom katana QUIET
/*/obj/item/clothing/accessory/storage/holster/sheath/snow_hand
	name = "snow hand's sheath"
	desc = "Just Sheath for katana \"Snow Hand\""
	icon = CUSTOM_ITEM_OBJ
	icon_state = "quiet_katanasheath_full"
	item_icons = list(
		slot_belt_str = CUSTOM_ITEM_MOB,
		slot_back_str = CUSTOM_ITEM_MOB,
		slot_l_hand_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_MOB
	)
	item_state_slots = list(
		slot_belt_str = "quietkatana_sheath_full",
		slot_back_str = "quietkatana_back_full",
		slot_l_hand_str = "quietkatana_sheath_full_hand_l",
		slot_r_hand_str = "quietkatana_sheath_full_hand_r"
	)*/

/obj/item/clothing/ears/earmuffs/headphones/mental
	name = "white headphones"
	desc = "Seemingly simple bright white headphones."

	state_on = "quiet_mentalphones_on"
	state_off = "quiet_mentalphones_off"

	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_l_ear_str = CUSTOM_ITEM_MOB,
		slot_r_ear_str = CUSTOM_ITEM_MOB
	)

/obj/item/clothing/ears/earmuffs/headphones/mental/verb/remotesay()
	set name = "Project mind"
	set category = "Superpower"
	set src in usr

	/*if(slot == slot_r_ear_str || slot == slot_l_ear_str)
		to_chat(usr, "You must wear it on ears.")
		return*/

	if(!istype(usr, /mob/living)) return
	if(usr.incapacitated()) return

	var/list/creatures = list()
	for(var/mob/living/carbon/h in view(7))
		creatures += h
	var/mob/target = input("Who do you want to project your mind to ?") as null|anything in creatures
	if (isnull(target))
		return

	var/say = sanitize(input("What do you wish to say"))
	if(mRemotetalk in target.mutations)
		target.show_message("<span class='notice'>You hear [usr.real_name]'s voice: [say]</span>")
	else
		target.show_message("<span class='notice'>You hear a voice that seems to echo around the room: [say]</span>")
	usr.show_message("<span class='notice'>You project your mind into [target.real_name]: [say]</span>")
	log_say("[key_name(usr)] sent a telepathic message using [src.name] to [key_name(target)]: [say]")
	for(var/mob/observer/ghost/G in world)
		G.show_message("<i>Telepathic message using [src.name] from <b>[src]</b> to <b>[target]</b>: [say]</i>")

/obj/item/clothing/mask/surgical/quiet
	desc = "Sterile mask. It has shades of winter camouflage."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "quiet_sterile"
	item_icons = list(
		slot_mask_str = CUSTOM_ITEM_MOB
		)
	item_state_slots = list(
		slot_mask_str = "quiet_sterile"
		)
	down_icon_state = "quiet_sterile_down"
/*
/obj/item/clothing/under/casual_pants/camo/quiet
	/*name = "white camo pants"
	desc = "Loose winter camouflage pants. Designed for training, walking and other things."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "quiet_shtani"
	item_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB
		)
	item_state_slots = list(
		slot_w_uniform_str = "quiet_shtani"
		)*/
	name = "white camo pants"
	desc = "Loose winter camouflage pants. Designed for training, walking and other things."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "quiet_shtani"
	item_state = "quiet_shtani"
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	worn_state = null
	body_parts_covered = LOWER_TORSO|LEGS
*/

/obj/item/weapon/clothingbag/quiet_set
	name = "item package"
	desc = "A utility bag."
	New()
		//new /obj/item/clothing/under/casual_pants/camo/quiet(src)
		new /obj/item/clothing/mask/surgical/quiet(src)
		new /obj/item/clothing/ears/earmuffs/headphones/mental(src)
		new /obj/item/weapon/material/sword/katana/snow_hand(src)