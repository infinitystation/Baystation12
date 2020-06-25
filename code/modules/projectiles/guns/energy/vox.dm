/datum/extension/voxform
	base_type = /datum/extension/voxform

/datum/extension/voxform/proc/check_held_user(var/mob/living/carbon/human/user, var/atom/movable/thing)
	if(!istype(user))
		return FALSE
	if(user.species.get_bodytype(user) != SPECIES_VOX && user.species.get_bodytype(user) != SPECIES_VOX_ARMALIS && user.unEquip(thing))
		to_chat(user, SPAN_WARNING("\The [thing] hisses and wriggles out of your grasp!"))
		playsound(user, 'sound/voice/BugHiss.ogg', 50, 1)
		return FALSE
	return TRUE

/obj/item/weapon/gun/special_check(var/mob/living/carbon/human/user)
	. = ..()
	if(!QDELETED(src) && src.loc == user && has_extension(src, /datum/extension/voxform))
		var/datum/extension/voxform/voxform = get_extension(src, /datum/extension/voxform)
		. = voxform.check_held_user(user, src)

/*
 * Vox Darkmatter Cannon
 */
/obj/item/weapon/gun/energy/darkmatter
	name = "flux cannon"
	desc = "A vicious beam weapon that crushes targets with dark-matter gravity pulses. Parts of it twitch and writhe, as if alive."
	icon = 'icons/obj/guns/darkcannon.dmi'
	icon_state = "darkcannon"
	item_state = "darkcannon"
	projectile_type = /obj/item/projectile/beam/stun/darkmatter
	self_recharge = 1
/*[ORIG]
	firemodes = list(
		list(mode_name="stunning", burst=1, fire_delay=null, move_delay=null, burst_accuracy=list(30), dispersion=null, projectile_type=/obj/item/projectile/beam/stun/darkmatter, charge_cost = 50),
		list(mode_name="focused", burst=1, fire_delay=null, move_delay=null, burst_accuracy=list(30), dispersion=null, projectile_type=/obj/item/projectile/beam/darkmatter, charge_cost = 75),
		list(mode_name="scatter burst", burst=8, fire_delay=null, move_delay=4, burst_accuracy=list(0, 0, 0, 0, 0, 0, 0, 0), dispersion=list(0, 1, 2, 2, 3, 3, 3, 3, 3), projectile_type=/obj/item/projectile/energy/darkmatter, charge_cost = 10),
		)
[/ORIG]*/
//[INF]
	screen_shake = 0.2
	charge_cost = 30
	max_shots = 10 //	charge = charge_cost*max_shots = 300
	recharge_time = 3
	fire_delay = 6.5
	burst_delay = 2.5
	move_delay = 0
	firemodes = list(
		list(mode_name="stunning",	burst=1, burst_accuracy=list(0),			dispersion=null,			projectile_type=/obj/item/projectile/beam/stun/darkmatter,	charge_cost = 40),
		list(mode_name="single",	burst=1, burst_accuracy=list(0),			dispersion=null,			projectile_type=/obj/item/projectile/energy/darkmatter,		charge_cost = 10),
		list(mode_name="burst",		burst=3, burst_accuracy=list(0, -1, -2),	dispersion=list(0, 0.5, 1),	projectile_type=/obj/item/projectile/energy/darkmatter,		charge_cost = 10),
		)
//[/INF]
	bulk = GUN_BULK_RIFLE
	one_hand_penalty = 5 //INF, WAS 3
	w_class = ITEM_SIZE_LARGE

/obj/item/weapon/gun/energy/darkmatter/Initialize()
	. = ..()
	set_extension(src, /datum/extension/voxform)

/*
 * Vox Sonic Cannon
 */
/obj/item/weapon/gun/energy/sonic
	name = "soundcannon"
	desc = "A vicious sonic weapon of alien manufacture. Parts of it quiver gelatinously, as though the insectile-looking thing is alive."
	icon = 'icons/obj/guns/noise.dmi'
	icon_state = "noise"
	item_state = "noise"
	self_recharge = 1
	recharge_time = 10
	fire_delay = 15
	projectile_type=/obj/item/projectile/energy/plasmastun/sonic/weak
	firemodes = list(
		list(mode_name="normal", projectile_type=/obj/item/projectile/energy/plasmastun/sonic/weak, charge_cost = 50),
		list(mode_name="overcharge", projectile_type=/obj/item/projectile/energy/plasmastun/sonic/strong, charge_cost = 200),
		)

	bulk = GUN_BULK_RIFLE
	w_class = ITEM_SIZE_LARGE
	one_hand_penalty = 1

/obj/item/weapon/gun/energy/sonic/Initialize()
	. = ..()
	set_extension(src, /datum/extension/voxform)
