/obj/item/clothing/mask/gas/creo
	name = "heavy unit mask"
	desc = "BFM \"Cyclops\" - A plasteel military facemask designed with intimidation in mind. Has an in-built voice amplifier and enchanced optics to assist it's wearer in combat situation assessment and control. Due to higher production value issued only to promising combat personnel."
	icon = 'infinity/icons/obj/clothing/obj_mask.dmi'
	icon_override = 'infinity/icons/mob/onmob/onmob_mask.dmi'
	icon_state = "creo"
	item_state = "creo"
	item_flags = ITEM_FLAG_BLOCK_GAS_SMOKE_EFFECT | ITEM_FLAG_AIRTIGHT
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = FACE|EYES
	w_class = ITEM_SIZE_NORMAL
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 0, bomb = 0, bio = 75, rad = 0)

	var/last_time
	var/sound1 = 'infinity/sound/items/creo_1.ogg'
	var/sound2 = 'infinity/sound/items/creo_2.ogg'
	var/sound3 = 'infinity/sound/items/creo_3.ogg'
	var/can_sound = TRUE
	trade_blacklisted = TRUE

/obj/item/clothing/mask/gas/creo/New()
	last_time = world.time

/obj/item/clothing/mask/gas/creo/on_update_icon()
	overlays.Cut()
	var/image/eye = overlay_image(icon, "[icon_state]_eye")
	overlays += eye

/obj/item/clothing/mask/gas/creo/get_mob_overlay(mob/user_mob, slot)
	var/image/res = ..()
	var/image/eye = overlay_image(res.icon, "[icon_state]_eye")
	eye.layer = ABOVE_LIGHTING_LAYER
	eye.plane = EFFECTS_ABOVE_LIGHTING_PLANE
	res.overlays += eye
	return res

/obj/item/clothing/mask/gas/creo/CtrlClick(var/mob/user)
	if (can_sound)
		if (world.time > last_time + 5 SECONDS)
			playsound(get_turf(user), sound1, 30, 1)
			last_time = world.time


/obj/item/clothing/mask/gas/creo/AltClick(var/mob/user)
	if (can_sound)
		if (world.time > last_time + 5 SECONDS)
			playsound(get_turf(user), sound2, 30, 1)
			last_time = world.time

/obj/item/clothing/mask/gas/creo/CtrlShiftClick(var/mob/user)
	if (can_sound)
		if (world.time > last_time + 5 SECONDS)
			playsound(get_turf(user), sound3, 30, 1)
			last_time = world.time

/obj/item/toy/katana/snow_hand
	name = "snow hand"
	desc = "This is a antique weapon. The sword is custom made for a specific owner. Katana has dark-ice color. On the sheath there is an inscription in an interesting font - \"Snowflake\"."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "quiet_katana"
	force = 5
	sharp = 0
	edge = 0
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
	trade_blacklisted = TRUE

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
	trade_blacklisted = TRUE

/*
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
*/

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
	trade_blacklisted = TRUE

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

/obj/item/clothingbag/quiet_set
	name = "item package"
	desc = "A utility bag."
	New()
		//new /obj/item/clothing/under/casual_pants/camo/quiet(src)
		new /obj/item/clothing/mask/surgical/quiet(src)
		new /obj/item/clothing/ears/earmuffs/headphones/mental(src)
		new /obj/item/toy/katana/snow_hand(src)

/obj/item/melee/energy/toothpick
	name = "myknife"
	desc = "You can watch a knife of a very interesting design. It is conveniently located for the human hand. It has a slight vibration when activated. Its blade glows orange. It looks very hot. On the handle, in small print, it is written - my knife."

	hitsound = 'sound/weapons/blade1.ogg'

	icon = 'icons/obj/infinity_items/toothpick.dmi'
	icon_state = "toothpick"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/guns/guns_l.dmi',
		slot_r_hand_str = 'icons/mob/onmob/guns/guns_r.dmi'
	)
	armor_penetration = 5
	active_force = 10
	force = 0
	throwforce = 0
	active_throwforce = 0
	throw_speed = 1
	throw_range = 10
	w_class = ITEM_SIZE_SMALL
	base_parry_chance = 0
	var/tick_cost = 1
	var/obj/item/cell/bcell = /obj/item/cell/device/high
	trade_blacklisted = TRUE

/obj/item/melee/energy/toothpick/New()
	if(ispath(bcell))
		bcell = new bcell(src)
	..()

/obj/item/melee/energy/toothpick/Destroy()
	if (active)
		STOP_PROCESSING(SSobj, src)
	if(bcell)
		qdel(bcell)
		bcell = null
	..()

/obj/item/melee/energy/toothpick/Process()
	if (!active)
		return
	if(bcell)
		if(!bcell.checked_use(tick_cost))
			deactivate()
	else
		deactivate()
	return 1

/obj/item/melee/energy/toothpick/activate(mob/living/user)
	if(active)
		return
	if (!bcell.checked_use(tick_cost))
		return
	active = 1
	force = active_force
	throwforce = active_throwforce
	sharp = 1
	edge = 1
	slot_flags |= SLOT_DENYPOCKET
	playsound(user, 'sound/weapons/saberon.ogg', 50, 1)
	icon_state = "toothpick_on"
	START_PROCESSING(SSobj, src)

/obj/item/melee/energy/toothpick/deactivate(mob/living/user)
	if(!active)
		return
	playsound(user, 'sound/weapons/saberoff.ogg', 50, 1)
	active = 0
	force = initial(force)
	throwforce = initial(throwforce)
	sharp = initial(sharp)
	edge = initial(edge)
	slot_flags = initial(slot_flags)
	icon_state = "toothpick"
	STOP_PROCESSING(SSobj, src)

/obj/item/melee/energy/toothpick/attack_self(mob/living/user as mob)
	if (active)
		deactivate(user)
	else
		activate(user)

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()

	add_fingerprint(user)

/obj/item/melee/energy/toothpick/examine(mob/user)
	if(!..(user, 1))
		return 0
	if (bcell)
		to_chat(user, "<span class='notice'>The cell is [round(bcell.percent())]% charged.</span>")
	return 1

/obj/item/melee/energy/toothpick/get_cell()
	return bcell

/* reverted

/obj/item/naris_box
	name = "E.P.D #NARIS"
	desc = "..."
	icon = 'icons/obj/infinity_items/naris.dmi'
	icon_state = "naris_box"

/obj/item/naris_box/New()
		pixel_x = 0
		pixel_y = 0
		pixel_z = 0

/obj/item/naris_box/attack_self(mob/user)
	if (is_processing || !user)
		return
	is_processing = 1
	user.visible_message("<span class='notice'>[user] began setting Naris.</span>")
	if (do_after(user, 100, src))
		user.unEquip(src)
		new /obj/naris_struct(user.loc)
		qdel(src)
	else
		is_processing = 0

/obj/naris_struct
	name = "E.P.D #NARIS"
	desc = "..."
	icon = 'icons/obj/infinity_items/naris.dmi'
	icon_state = "naris_struct"

	anchored = FALSE
	density = TRUE

	var/list/valid_ckeys = list(
		"redknighthero",
		"nikita588",
		"nicknam",
		"iskorkinmrazb",
		"cre77"
		)

/obj/naris_struct/attack_ghost(mob/user)
	if (!(user.ckey in valid_ckeys))
		return
	var/turf/T = loc
	qdel(src)
	var/mob/living/silicon/robot/custom/naris/N = new /mob/living/silicon/robot/custom/naris(T)
	message_admins("<span class='adminnotice'>[user.ckey] has joined as Naris.</span>")
	log_admin("[user.ckey] has joined as Naris..")
	N.ckey = user.ckey
	qdel(user)

*/
