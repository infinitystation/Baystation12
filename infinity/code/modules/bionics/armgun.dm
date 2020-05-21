/obj/item/weapon/gun/energy/gun/small/armgun
	name = "SHW-22 'Stinger' implantable energy gun"
	desc = "A modified LAEP90 'Perun' energy gun, capable of being installed into human's arm."
	icon = 'infinity/icons/obj/surgery.dmi'
	icon_state = "arm_laser"
	anchored = 1
	canremove = 0
	self_recharge = 1
	max_shots = 4
	modifystate = "arm_laser"
	s_gun = "SH22-W"

	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun, modifystate="arm_laser"),
		list(mode_name="shock", projectile_type=/obj/item/projectile/beam/stun/shock, modifystate="arm_laser"),
		list(mode_name="kill", projectile_type=/obj/item/projectile/beam/smalllaser, modifystate="arm_laser"),
		)

	bulk = GUN_BULK_PISTOL
	w_class = ITEM_SIZE_SMALL