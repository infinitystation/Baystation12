/obj/item/weapon/reagent_containers/syringe/soporific
	name = "Syringe (Soporific)"
	desc = "Contains Soporific."

/obj/item/weapon/reagent_containers/syringe/soporific/New()
	..()
	reagents.add_reagent(/datum/reagent/soporific, 10)
	mode = SYRINGE_INJECT
	update_icon()

/obj/item/weapon/syringe_cartridge/sleepy
	name = "syringe gun cartridge"
	desc = "A syringe gun cartridge, filled with soporifics."

/obj/item/weapon/syringe_cartridge/sleepy/Initialize()
	. = ..()
	syringe = new /obj/item/weapon/reagent_containers/syringe/soporific
	update_icon()

/obj/item/weapon/storage/box/soporifics
	name = "box of soporific darts"
	desc = "Contains soporific darts."
	icon_state = "syringe"

	startswith = list(/obj/item/weapon/syringe_cartridge/sleepy = 15)

/obj/item/weapon/gun/launcher/syringe/sniper
	name = "sniper syringe gun"
	desc = "A modified syringe gun with a scope. Looks like a sniper rifle."
	icon = 'infinity/icons/obj/guns/syringegun.dmi'
	icon_state = "snipersyringegun"
	item_state = "syringegun"
	force = 9
	scope_zoom = 2
	matter = list(MATERIAL_STEEL = 2000)
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	slot_flags = SLOT_BACK

	fire_sound = 'sound/weapons/empty.ogg'
	fire_sound_text = "a metallic thunk"
	screen_shake = 0
	release_force = 10
	throw_distance = 10

	is_serial = 1
	s_gun = "SSG-11"

	max_darts = 3

	bulk = GUN_BULK_SNIPER_RIFLE //inf
	w_class = ITEM_SIZE_HUGE


/obj/item/weapon/gun/energy/impulsegun
	name = "IG-96 sonic blast generator"
	desc = "The NanoTrasen IG-96 generator is a weapon that creates ultrasonic impulses, stunning your enemies. Deals no damage, but is very useful as non-lethal weapon."
	icon = 'icons/obj/guns/plasma_stun.dmi'
	icon_state = "plasma_stun"
	item_state = "plasma_stun"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2, TECH_POWER = 3)
	fire_delay = 20
	max_shots = 4
	projectile_type = /obj/item/projectile/energy/plasmastun/sonic/weaked
	combustion = 0

	bulk = GUN_BULK_RIFLE