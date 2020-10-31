/datum/uplink_item/item/tools/superplastique
	name = "X-4"
	desc = "Upgraded version of C-4 explosives. Can destroy even a reinforced wall."
	item_cost = 8
	path = /obj/item/weapon/plastique/super

/datum/uplink_item/item/tools/pcombo
	name = "Bag of C-4"
	desc = "Bag, full of C-4 explosives. Contains 6 powerful bombs. 6 TC discount."
	item_cost = 30
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/plastique

/datum/uplink_item/item/tools/spcombo
	name = "Bag of X-4"
	desc = "Bag, containing 3 military X-4 explosives. Be careful with it. 4 TC discount."
	item_cost = 20
	path = /obj/item/weapon/storage/backpack/dufflebag/syndie_kit/plastique/super

/datum/uplink_item/item/tools/poisons
	name = "Poisons kit"
	desc = "A box, containing 7 vials of random and very deadly poisons."
	item_cost = 48
	path = /obj/item/weapon/storage/box/syndie_kit/poisons

/datum/uplink_item/item/tools/eshield
	name = "Energy Shield"
	desc = "An energy shield, capable of reflecting energy projectiles and deflecting other attacks.."
	item_cost = 52
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/weapon/shield/energy

/datum/uplink_item/item/tools/holobomb
	name = "Box of holobombs"
	item_cost = 32
	path = /obj/item/weapon/storage/box/holobombs
	desc = "Contains 5 holobomb and instruction. \
			A bomb that changes appearance, and can destroy some hands."

/datum/uplink_item/item/tools/door_charge
	name = "Door Charge"
	desc = "Special explosive, which can be planted on doors and will explode when somebody will open this door."
	item_cost = 14
	path = /obj/item/weapon/door_charge

/datum/uplink_item/item/tools/encryptionkey_full
	name = "Special Encryption Key"
	desc = "This headset encryption key will allow you listen and speak on any channel! Use a screwdriver on your headset to exchange keys."
	item_cost = 24
	path = /obj/item/device/encryptionkey/syndie_full

/datum/uplink_item/item/tools/chameleonbox
	name = "Chameleon Box"
	item_cost = 32
	path = /obj/item/weapon/storage/box/syndie_kit/chambox
	desc = "A small box with holoprojector, designed to carry your goods stealthy."

/datum/uplink_item/item/tools/jaunter
	name = "Bluespace Jaunter"
	item_cost = 42
	path = /obj/item/weapon/storage/box/syndie_kit/jaunter
	desc = "Special device and beacon, useful to escape from thet red shirts. Don't forget to link jaunter to the beacon!"

/datum/uplink_item/item/tools/stimpack
	name = "Stimpack"
	desc = "Autoinjector, containing 5u of experimental stimulants, that will increase your speed temporarly."
	item_cost = 18
	antag_costs = list(MODE_MERCENARY = 12)
	path = /obj/item/weapon/reagent_containers/hypospray/autoinjector/stimpack

/datum/uplink_item/item/tools/radlaser
	name = "Radioactive Microlaser"
	item_cost = 18
	path = /obj/item/device/scanner/health/syndie
	desc = "A tiny microlaser, hidden in health analyzer, that can irradiate your targets."
