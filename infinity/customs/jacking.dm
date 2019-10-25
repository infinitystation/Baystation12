//military gas mask xM15

/obj/item/clothing/mask/gas/custom
	name = "military gas mask"
	desc = "An improved military gas mask M15, most often used by PMCs. It has built-in night vision device and improved breathing system."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "gas_mask"
	item_state = "gas_mask_face"
	item_icons = list(
		slot_l_hand_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_MOB,
		slot_wear_mask_str = CUSTOM_ITEM_MOB
	)
	item_state_slots = list(
		slot_l_hand_str = "gas_mask_lh",
		slot_r_hand_str = "gas_mask_rh"
	)

//ZPCI armor vest

/obj/item/clothing/suit/storage/vest/pcrc/custom
	name = "medium armor X4/2"
	desc = " You can notice built-in pouches on the body armor belt. At the other side, you can see the inscription of Zone Protection Control Inc in red letters."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "medarm"
	armor = list(melee = 40, bullet = 40, laser = 40, energy = 25, bomb = 30, bio = 0, rad = 0) //meduim plate carrier
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB
	)

//ZPCI helmet

/obj/item/clothing/head/helmet/x_four
	name = "\improper X-4 helmet"
	desc = "The glass of the helmet is made of armored glass, from the side you can see the laser designator. ZPCI inscription on back of helmet."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "iconscphelmet"
	//item_state = "scphelmetonmob"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB,
		slot_l_hand_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_MOB
	)
	item_state_slots = list(
		slot_head_str = "scphelmetonmob",
		slot_l_hand_str = "scphelmrlefthand",
		slot_r_hand_str = "scphelmrighthand"
	)

//visor

/obj/item/clothing/glasses/sunglasses/sechud/toggle/stv
	name = "tactical visor"
	desc = "The special tactical visor, pink one."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "stv"
	item_state = "stv"
	off_state = "stv_off"
	item_icons = list(slot_glasses_str = CUSTOM_ITEM_MOB)
	electric = TRUE
	action_button_name = "Toggle Visor"

/* SCG SOLDIER KIT
 * ===============
 */

/obj/item/clothing/under/custom_army_uniform
	name = "soldier's combat uniform"
	desc = "The uniform is made in a standard forest military style. "
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	icon_state = "army_uniform"
	item_state = "army_uniform"
	rolled_sleeves = -1

/obj/item/clothing/glasses/sunglasses/sechud/custom_ballistic
	name = "ballistic glasses"
	desc = "These ballistic glasses protect against small shells and splinters"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "ballistic_glasses"
	item_state = "ballistic_glasses"
	item_icons = list(slot_glasses_str = CUSTOM_ITEM_MOB)

/obj/item/clothing/accessory/armor/helmcover/custom_army
	name = "military cover"
//	desc = "A fabric cover for armored helmets. This one has SCP's colors." idk what he wants to be here
	icon_override = 'infinity/icons/mob/onmob/onmob_accessories.dmi'
	icon = 'infinity/icons/obj/clothing/obj_accessories.dmi'
	icon_state = "army_cover"
	accessory_icons = list(slot_tie_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', slot_head_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi')

/obj/item/clothing/suit/armor/pcarrier/custom_army
	name = "soldier plate carrier system"
	desc = "SPCS (Soldier Plate Carrier System) - Designed for the SCG army, this medium bulletproof vest provides protection at least as good as an improved external tactical vest. Has the ability to replace the protective plate, as well as the addition of knee pads. On the chest and elbow pieces you can see the SCGA patch, You can see a dent on the bulletproof vest."
	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi')
	icon_state = "army_armor"
	sprite_sheets = list()
//	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/storage/pouches)

//a gun

/obj/item/weapon/gun/projectile/automatic/nt41/jacking
	name = "xr36"
	desc = "XR36 - export version of the XR36K, characterized by installing a “high” picatinny rail instead of a carrying handle on top of the receiver. The guide is equipped with a 3x4 double sight, and then a thin longitudinal groove is used. In addition, on the XR36 modification, a “cheek” is installed on the standard frame stock."
	icon_state = "xr36"
	item_state = "xr36"
	icon = 'infinity/icons/obj/guns/xr36.dmi'
	wielded_item_state = "xr36-wielded"
	item_icons = list(
		slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
		slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi',
		)

/obj/item/weapon/gun/projectile/automatic/nt41/jacking/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "xr36"
		wielded_item_state = "xr36-wielded"
	else
		icon_state = "xr36-empty"
		wielded_item_state = "xr36-wielded-empty"

/obj/item/custkit/custom_army
	name = "NT41 customization kit"
	input = /obj/item/weapon/gun/projectile/automatic/nt41/armory
	output = /obj/item/weapon/gun/projectile/automatic/nt41/jacking

/obj/item/weapon/clothingbag/custom_army/Initialize()
	new /obj/item/clothing/under/custom_army_uniform(src)
	new /obj/item/clothing/glasses/sunglasses/sechud/custom_ballistic(src)
	new /obj/item/clothing/accessory/armor/helmcover/custom_army(src)
	new /obj/item/clothing/suit/armor/pcarrier/custom_army(src)
	new /obj/item/custkit/custom_army(src)

//biohazard kit (was replaced by SCG soldier's kit)
/*
/obj/item/clothing/suit/bio_suit/virology/jacking
	name = "biohazard suit"
	desc = "A well-prepared kit for epidemiological analysis, planning anti-epidemic measures, epidemiological surveys of foci of infectious diseases."
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB,
		)
	item_state_slots = list(
		slot_wear_suit_str = "bhs",
	)

/obj/item/clothing/head/bio_hood/virology/jacking
	name = "biohazard hood"
	desc = "A well-prepared kit for epidemiological analysis, planning anti-epidemic measures, epidemiological surveys of foci of infectious diseases."
	item_state = "biohazard_hood"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB,
		)

/obj/item/clothing/accessory/badge/holo/jacking
	name = "representation card"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "IHO_badge"
	badge_string = "Medical"
	badge_access = access_medical

/obj/item/clothing/accessory/badge/holo/jacking/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/weapon/card/id) || istype(O, /obj/item/modular_computer))
		var/obj/item/weapon/card/id/id_card = O.GetIdCard()
		if(!id_card)
			return
		if((badge_access in id_card.access) || emagged)
			to_chat(user, "You imprint your ID details onto the badge.")
			set_name("Doctor-Epidemiologist [id_card.registered_name]")
			set_desc("Doctor-Epidemiologist [user] Interstellar Health Organization")
		else
			to_chat(user, "[src] rejects your ID, and flashes 'Insufficient access!'")
		return
	..()

/obj/item/weapon/storage/backpack/dufflebag/biohazard
	name = "biohazard dufflebag"
	desc = "A well-prepared kit for epidemiological analysis, planning anti-epidemic measures, epidemiological surveys of foci of infectious diseases."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "biohazard_duffle"
	item_state = "biohazard_duffle"
	item_icons = list(
		slot_l_hand_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_MOB,
		)

/obj/item/weapon/storage/backpack/dufflebag/biohazard/jacking
	startswith = list(
	/obj/item/weapon/clothingbag/biohazard
	)

/obj/item/weapon/clothingbag/biohazard/Initialize()
	new /obj/item/clothing/suit/bio_suit/virology/jacking(src)
	new /obj/item/clothing/head/bio_hood/virology/jacking(src)
	new /obj/item/clothing/accessory/badge/holo/jacking(src)
*/