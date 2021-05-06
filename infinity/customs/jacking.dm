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
	trade_blacklisted = TRUE

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
	trade_blacklisted = TRUE

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
	trade_blacklisted = TRUE

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
	trade_blacklisted = TRUE

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
	trade_blacklisted = TRUE

/obj/item/clothing/glasses/sunglasses/sechud/custom_ballistic
	name = "ballistic glasses"
	desc = "These ballistic glasses protect against small shells and splinters"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "ballistic_glasses"
	item_state = "ballistic_glasses"
	item_icons = list(slot_glasses_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/armor/helmcover/custom_army
	name = "military cover"
//	desc = "A fabric cover for armored helmets. This one has SCP's colors." idk what he wants to be here
	icon_override = 'infinity/icons/mob/onmob/onmob_accessories.dmi'
	icon = 'infinity/icons/obj/clothing/obj_accessories.dmi'
	icon_state = "army_cover"
	accessory_icons = list(slot_tie_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', slot_head_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi')
	trade_blacklisted = TRUE

/obj/item/clothing/suit/armor/pcarrier/custom_army
	name = "soldier plate carrier system"
	desc = "SPCS (Soldier Plate Carrier System) - Designed for the SCG army, this medium bulletproof vest provides protection at least as good as an improved external tactical vest. Has the ability to replace the protective plate, as well as the addition of knee pads. On the chest and elbow pieces you can see the SCGA patch, You can see a dent on the bulletproof vest."
	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi')
	icon_state = "army_armor"
	sprite_sheets = list()
//	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/storage/pouches)
	trade_blacklisted = TRUE

//a gun

/obj/item/gun/projectile/automatic/nt41/jacking
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
	trade_blacklisted = TRUE

/obj/item/gun/projectile/automatic/nt41/jacking/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "xr36"
		wielded_item_state = "xr36-wielded"
	else
		icon_state = "xr36-empty"
		wielded_item_state = "xr36-wielded-empty"

/obj/item/custkit/custom_army
	name = "NT41 customization kit"
	input = /obj/item/gun/projectile/automatic/nt41/armory
	output = /obj/item/gun/projectile/automatic/nt41/jacking

/obj/item/clothingbag/custom_army/Initialize()
	. = ..()
	new /obj/item/clothing/under/custom_army_uniform(src)
	new /obj/item/clothing/glasses/sunglasses/sechud/custom_ballistic(src)
	new /obj/item/clothing/accessory/armor/helmcover/custom_army(src)
	new /obj/item/clothing/suit/armor/pcarrier/custom_army(src)
	new /obj/item/custkit/custom_army(src)

/* ZPCI KNIGHT KIT
 * ================
 */

/obj/item/clothing/head/helmet/custom_zpci_knight
	name = "\improper ST-16/2"
	desc = "The helmet, which is part of the ST-16/1 armor, has a durable glass to protect against splinters."
	icon = 'infinity/icons/obj/clothing/obj_head.dmi'
	item_icons = list(slot_head_str = 'infinity/icons/mob/onmob/onmob_head.dmi')
	icon_state = "zpci_knight_h"
	trade_blacklisted = TRUE

/obj/item/clothing/suit/armor/pcarrier/custom_zpci_knight
	name = "\improper ST-16/1"
	desc = "It is a mobile combat armor of the 16th generation of ZPCI knights, it is made of light and durable alloys, but does not have high protection in exchange for mobility."
	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi')
	icon_state = "zpci_knight_s"
	sprite_sheets = list()
//	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium, /obj/item/clothing/accessory/storage/pouches)
	trade_blacklisted = TRUE

/obj/item/gun/energy/laser/secure/jacking
	name = "\improper RG-104"
	desc = "RG-104 is one of the favorite weapons in its generation, a modified and improved weapon battery eliminates the facts of a quick discharge of a weapon, and a laser sight will point directly at the target and it remains to make a shot..."
	icon_state = "custom_lasgun"
	item_state = "custom_lasgun"
	icon = 'infinity/icons/obj/guns/custom_lasgun.dmi'
	wielded_item_state = "custom_lasgun-wielded"
	item_icons = list(
		slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
		slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi',
		)
	trade_blacklisted = TRUE

/obj/item/custkit/custom_zpci_knight
	name = "laser carabine customization kit"
	input = /obj/item/gun/energy/laser/secure
	output = /obj/item/gun/energy/laser/secure/jacking

/obj/item/clothingbag/custom_zpci_knight/Initialize()
	. = ..()
	new /obj/item/clothing/head/helmet/custom_zpci_knight(src)
	new /obj/item/clothing/suit/armor/pcarrier/custom_zpci_knight(src)
	new /obj/item/custkit/custom_zpci_knight(src)

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
	trade_blacklisted = TRUE

/obj/item/clothing/head/bio_hood/virology/jacking
	name = "biohazard hood"
	desc = "A well-prepared kit for epidemiological analysis, planning anti-epidemic measures, epidemiological surveys of foci of infectious diseases."
	item_state = "biohazard_hood"
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB,
		)
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/badge/holo/jacking
	name = "representation card"
	icon = CUSTOM_ITEM_OBJ
	icon_state = "IHO_badge"
	badge_string = "Medical"
	badge_access = access_medical
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/badge/holo/jacking/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/card/id) || istype(O, /obj/item/modular_computer))
		var/obj/item/card/id/id_card = O.GetIdCard()
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

/obj/item/storage/backpack/dufflebag/biohazard
	name = "biohazard dufflebag"
	desc = "A well-prepared kit for epidemiological analysis, planning anti-epidemic measures, epidemiological surveys of foci of infectious diseases."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "biohazard_duffle"
	item_state = "biohazard_duffle"
	item_icons = list(
		slot_l_hand_str = CUSTOM_ITEM_MOB,
		slot_r_hand_str = CUSTOM_ITEM_MOB,
		)
	trade_blacklisted = TRUE

/obj/item/storage/backpack/dufflebag/biohazard/jacking
	startswith = list(
	/obj/item/clothingbag/biohazard
	)

/obj/item/clothingbag/biohazard/Initialize()
	new /obj/item/clothing/suit/bio_suit/virology/jacking(src)
	new /obj/item/clothing/head/bio_hood/virology/jacking(src)
	new /obj/item/clothing/accessory/badge/holo/jacking(src)
*/

/* SAARE CUSTOM KIT
 * ===============
 */

/obj/item/clothing/under/custom_saare_uniform
	name = "tactical SAARE uniform"
	desc = "An old SAARE tactical uniform, how old is it at all?"
	icon = 'infinity/icons/obj/clothing/obj_under.dmi'
	item_icons = list(slot_w_uniform_str = 'infinity/icons/mob/onmob/onmob_under.dmi')
	icon_state = "saare_tactical"
	item_state = "saare_tactical"
	rolled_sleeves = -1
	trade_blacklisted = TRUE

/obj/item/clothing/glasses/sunglasses/sechud/custom_ballistic/orange
	desc = "A ballistic glasses with medium shatter protection."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "ballistic_glasses_orange"
	item_state = "ballistic_glasses_orange"
	item_icons = list(slot_glasses_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/armor/helmcover/custom_saare
	name = "spec ops cover"
	desc = "A coloring of spec ops, as well as the set includes the NVD and the camera."
	icon_override = 'infinity/icons/mob/onmob/onmob_accessories.dmi'
	icon = 'infinity/icons/obj/clothing/obj_accessories.dmi'
	icon_state = "spec_ops_cover"
	accessory_icons = list(slot_tie_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi', slot_head_str = 'infinity/icons/mob/onmob/onmob_accessories.dmi')
	trade_blacklisted = TRUE

/obj/item/clothing/suit/armor/pcarrier/custom_saare
	name = "\improper DSH-116"
	desc = "An old plate carrier of the special operations forces of the GCC. Apparently worn, how they still wear..."
	icon = 'infinity/icons/obj/clothing/obj_suit.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/mob/onmob/onmob_suit.dmi')
	icon_state = "gcc_spec_opc_carrier"
	sprite_sheets = list()
	trade_blacklisted = TRUE

/obj/item/clothingbag/custom_saare/Initialize()
	. = ..()
	new /obj/item/clothing/under/custom_saare_uniform(src)
	new /obj/item/clothing/glasses/sunglasses/sechud/custom_ballistic/orange(src)
	new /obj/item/clothing/accessory/armor/helmcover/custom_saare(src)
	new /obj/item/clothing/suit/armor/pcarrier/custom_saare(src)
