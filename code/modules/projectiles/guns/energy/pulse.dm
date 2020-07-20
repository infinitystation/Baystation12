/obj/item/weapon/gun/energy/pulse_rifle
	name = "pulse rifle"
	desc = "A weapon that uses advanced pulse-based beam generation technology to emit powerful laser blasts. Because of its complexity and cost, it is rarely seen in use except by specialists."
	icon = 'icons/obj/guns/pulse_rifle.dmi'
	icon_state = "pulse"
	item_state = "pulse"
	slot_flags = SLOT_BACK
	force = 10
	projectile_type = /obj/item/projectile/beam/pulse/heavy
	max_shots = 18
	multi_aim = 1
//	burst_delay = 3
//	burst = 3
	move_delay = 2
	wielded_item_state = "gun_wielded"
	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=0,    move_delay=null, one_hand_penalty=6, burst_accuracy=null, dispersion=null),
//		list(mode_name="3-pulse bursts", burst=3,    fire_delay=null, move_delay=4,    one_hand_penalty=12, burst_accuracy=list(0,-1.5,-3), dispersion=list(0.0, 1, 2)),
		)

	accuracy = -1
	bulk = GUN_BULK_RIFLE
	w_class = ITEM_SIZE_HUGE
	one_hand_penalty= 6

/obj/item/weapon/gun/energy/pulse_rifle/carbine
	name = "pulse carbine"
	desc = "A weapon that uses advanced pulse-based beam generation technology to emit powerful laser blasts. Less bulky than the full-sized rifle."
	icon = 'icons/obj/guns/pulse_carbine.dmi'
	icon_state = "pulse_carbine"
	slot_flags = SLOT_BACK|SLOT_BELT
	force = 8
	projectile_type = /obj/item/projectile/beam/pulse/mid
	max_shots = 25
//	burst = 1
//	burst_delay = 2
	move_delay = 2
	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=0,    move_delay=null, one_hand_penalty=3, burst_accuracy=null, dispersion=null),
//		list(mode_name="3-pulse bursts", burst=3,    fire_delay=null, move_delay=3,    one_hand_penalty=9, burst_accuracy=list(0,-1,-1.5), dispersion=list(0.0, 0.5, 1.0)),
		)

	bulk = GUN_BULK_SMG //inf. Not carabine, because top tier gun is already RIFLE .-.
	w_class = ITEM_SIZE_LARGE
	one_hand_penalty= 3

/obj/item/weapon/gun/energy/pulse_rifle/pistol
	name = "pulse pistol"
	desc = "A weapon that uses advanced pulse-based beam generation technology to emit powerful laser blasts. Even smaller than the carbine."
	icon = 'icons/obj/guns/pulse_pistol.dmi'
	icon_state = "pulse_pistol"
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	force = 6
	projectile_type = /obj/item/projectile/beam/pulse
//	burst = 1
	max_shots = 21
//	burst_delay = 1
//	move_delay = 1
	wielded_item_state = null

	bulk = GUN_BULK_PISTOL //inf
	w_class = ITEM_SIZE_NORMAL
	one_hand_penalty = 1 //a

/obj/item/weapon/gun/energy/pulse_rifle/mounted
	self_recharge = 1
	use_external_power = 1
	has_safety = FALSE

/obj/item/weapon/gun/energy/pulse_rifle/destroyer
	name = "pulse destroyer"
	desc = "A heavy-duty, pulse-based energy weapon. Because of its complexity and cost, it is rarely seen in use except by specialists."
	cell_type = /obj/item/weapon/cell/super
	fire_delay = 25
	projectile_type=/obj/item/projectile/beam/pulse/destroy
	charge_cost= 40

/obj/item/weapon/gun/energy/pulse_rifle/destroyer/attack_self(mob/living/user as mob)
	to_chat(user, "<span class='warning'>[src.name] has three settings, and they are all DESTROY.</span>")

/obj/item/weapon/gun/energy/pulse_rifle/skrell
	name = "skrellian carbine"
	icon = 'icons/obj/guns/skrell_carbine.dmi'
	icon_state = "skrell_carbine"
	item_state = "skrell_carbine"
	slot_flags = SLOT_BACK|SLOT_BELT
	desc = "The Vuu'Xqu*ix T-3, known as 'VT-3' by SolGov. Rarely seen out in the wild by anyone outside of a Skrellian SDTF."
	cell_type = /obj/item/weapon/cell
	self_recharge = 1
	move_delay = 2
	projectile_type=/obj/item/projectile/beam/pulse/skrell/single
	charge_cost=120
	one_hand_penalty = 3
	burst=1
	burst_delay=null
	wielded_item_state = "skrell_carbine-wielded"
	accuracy = 1
	
	firemodes = list(
		list(mode_name="single", projectile_type=/obj/item/projectile/beam/pulse/skrell/single, charge_cost=120, burst=1, burst_delay=null),
		list(mode_name="heavy", projectile_type=/obj/item/projectile/beam/pulse/skrell/heavy, charge_cost=55, burst=2, burst_delay=3),
		list(mode_name="light", projectile_type=/obj/item/projectile/beam/pulse/skrell, charge_cost=40, burst=3, burst_delay=2)
		)
