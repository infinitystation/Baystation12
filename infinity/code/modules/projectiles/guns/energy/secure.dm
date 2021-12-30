/obj/item/gun/energy/laser/secure/mounted
	name = "robot laser carbine"
	desc = "A robot-mounted equivalnet of the G40E carbine, which is always registered to its owner."
	self_recharge = 1
	use_external_power = 1
	one_hand_penalty = 0

/obj/item/gun/energy/laser/secure/mounted/New()
	var/mob/borg = get_holder_of_type(src, /mob/living/silicon/robot)
	if(!borg)
		CRASH("Invalid spawn location.")
	registered_owner = borg.name
//	GLOB.registered_cyborg_weapons += src
	..()

/obj/item/gun/energy/confuseray/secure
	icon = 'infinity/icons/obj/guns/confusegun_secure.dmi'
	//Actualy copies of smallgun but with other icon_states name
	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/items/lefthand_guns_secure.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/items/righthand_guns_secure.dmi',
		)
	icon_state = "confusesecure"
	item_state = null
	item_state = null
	max_shots = 5
	projectile_type = /obj/item/projectile/beam/confuseray/weak

	req_access = list(list(access_brig, access_bridge))
	authorized_modes = list(AUTHORIZED)		// Authorized after registration, but can be disabled remotely
	firemodes = list(list(mode_name = "any"))

	is_serial = 1
	s_type = "DS4-C"
	bulk = 0 //	"Even kid can shoot from it."
