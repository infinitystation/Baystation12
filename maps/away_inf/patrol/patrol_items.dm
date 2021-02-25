/obj/item/weapon/card/id/awaypatrol
	desc = "An identification card issued to SolGov crewmembers aboard the Sol Patrol Ships."
	color = "#ccecff"
	detail_color = "#e00000"
	access = list(access_away_patrol)

/* RADIO
 * =====
 */

/obj/item/device/radio/headset/rescue
	name = "rescue team radio headset"
	desc = "The headset of the rescue team member."
	icon_state = "com_headset"
	item_state = "headset"
	ks2type = /obj/item/device/encryptionkey/rescue

/obj/item/device/encryptionkey/rescue //for events
	name = "\improper rescue radio encryption key"
	icon_state = "cargo_cypherkey"
	channels = list("Response Team" = 1)

/* CLOTHING
 * ========
 */

/obj/item/clothing/under/solgov/utility/fleet/command/pilot/away_solpatrol
	starting_accessories = list(/obj/item/clothing/accessory/solgov/specialty/pilot, /obj/item/clothing/accessory/solgov/rank/fleet/officer/o2, /obj/item/clothing/accessory/solgov/fleet_patch/third)

/obj/item/clothing/under/solgov/utility/fleet/command/pilot2/away_solpatrol
	starting_accessories = list(/obj/item/clothing/accessory/solgov/specialty/pilot, /obj/item/clothing/accessory/solgov/rank/fleet/officer, /obj/item/clothing/accessory/solgov/fleet_patch/third)

/obj/item/clothing/under/solgov/utility/fleet/engineering/away_solpatrol
	starting_accessories = list(/obj/item/clothing/accessory/solgov/department/engineering/fleet, /obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e4, /obj/item/clothing/accessory/solgov/fleet_patch/third)

/obj/item/clothing/under/solgov/utility/fleet/medical/away_solpatrol
	starting_accessories = list(/obj/item/clothing/accessory/solgov/department/medical/fleet, /obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e5, /obj/item/clothing/accessory/solgov/fleet_patch/third)

/obj/item/clothing/under/solgov/utility/fleet/away_solpatrol
	starting_accessories = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e4, /obj/item/clothing/accessory/solgov/fleet_patch/third)

/obj/item/weapon/storage/belt/holster/security/away_patrol/New()
	..()
	new /obj/item/weapon/gun/projectile/pistol/military(src)
	new /obj/item/ammo_magazine/pistol/double(src)
	new /obj/item/ammo_magazine/pistol/double(src)

/obj/structure/closet/walllocker/emerglocker/suit
	spawnitems = list(/obj/item/weapon/tank/emergency/oxygen,/obj/item/clothing/mask/breath,/obj/item/clothing/suit/space/emergency,/obj/item/clothing/head/helmet/space/emergency)
	amount = 1 // spawns each items X times.

/obj/item/weapon/paper/salt
	name = "QM's note"
	info = "Короче уебки, ваши рационы ушли на оплату лечения моей ноги. В замен я насыпал вам немного соли чтобы было с чем жрать ну вы сами поняли что."

