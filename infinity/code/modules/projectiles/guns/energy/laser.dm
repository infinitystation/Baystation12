/obj/item/weapon/gun/energy/laser/alien
	name = "alien rifle"
	desc = "An alien weapon never before seen by the likes of your species."
	icon = 'icons/obj/infinity_guns.dmi'
	icon_state = "alienrifle"
	item_state = "alienrifle"
	wielded_item_state = "alienrifle-wielded"
	item_icons = list(
		slot_r_hand_str = 'icons/mob/infinity/misc.dmi',
		slot_l_hand_str = 'icons/mob/infinity/misctwo.dmi',
		)
	self_recharge = 1
	charge_cost = 40
	one_hand_penalty = 4
	max_shots = 4
	fire_delay = 16 // heavy rifle
	accuracy = 1
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 6, TECH_MAGNET = 5, TECH_POWER = 7)
	matter = list(DEFAULT_WALL_MATERIAL = 2800)
	projectile_type = /obj/item/projectile/beam/heavylaser/bogani

	firemodes = list(
		list(mode_name="semiauto",       projectile_type = /obj/item/projectile/beam/heavylaser/bogani, burst=1,    fire_delay=16,    move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=null),
		list(mode_name="shock",          projectile_type = /obj/item/projectile/beam/stun/heavy,        burst=1,    fire_delay=12,    move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=null),
		)