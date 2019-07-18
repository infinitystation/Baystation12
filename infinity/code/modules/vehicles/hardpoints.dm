/*
All of the hardpoints, for the tank and APC
*/

/obj/item/hardpoint

	icon = 'infinity/icons/obj/hardpoint_modules.dmi'
	icon_state = "tires" //Placeholder

	var/maxhealth = 0
	health = 0
	w_class = 15

	//If we use ammo, put it here
	var/obj/item/ammo_magazine/ammo_type = null //weapon ammo type to check with the magazine type we are trying to add

	//Strings, used to get the overlay for the armored vic
	var/disp_icon //This also differentiates tank vs apc vs other
	var/disp_icon_state

	var/next_use = 0
	var/ammo_switch_timer = 60
	var/is_activatable = 0
	var/max_angle = 180
	var/point_cost = 0
	var/list/clips = list()
	var/cur_ammo_type = 1
	var/cur_clips = 0
	var/max_clips = 1

/obj/item/hardpoint/proc/livingmob_interact(mob/living/M)
	return

////////////////////////////////////////////////////////////////////////////
//							APC HARDPOINTS // START
////////////////////////////////////////////////////////////////////////////

/obj/item/hardpoint/apc

	var/slot //What slot do we attach to?
	var/obj/vehicle_infinity/multitile/root/transport/owner //Who do we work for?

	icon = 'infinity/icons/obj/hardpoint_modules.dmi'
	icon_state = "tires" //Placeholder

//Called on attaching, for weapons sets the actual cooldowns
/obj/item/hardpoint/apc/proc/apply_buff()
	return

//Called when removing, resets cooldown lengths, move delay, etc
/obj/item/hardpoint/apc/proc/remove_buff()
	return

//Called when you want to activate the hardpoint, such as a gun
//This can also be used for some type of temporary buff, up to you
/obj/item/hardpoint/apc/proc/active_effect(turf/T)
	return

/obj/item/hardpoint/apc/proc/deactivate()
	var/obj/vehicle_infinity/multitile/root/transport/apc/C = owner
	if(C.gunner.client)
		C.gunner.client.mouse_pointer_icon = initial(C.gunner.client.mouse_pointer_icon)
	return

//If our cooldown has elapsed
/obj/item/hardpoint/apc/proc/is_ready()
	if(owner.z == 2 || owner.z == 3)
		to_chat(usr, "<span class='warning'>Don't fire here, you'll blow a hole in the ship!</span>")
		return 0
	return 1

/obj/item/hardpoint/apc/proc/try_add_clip(obj/item/ammo_magazine/apc/A, mob/user)

	if(A.loc != user)
		return 0

	if(max_clips == 0)
		to_chat(user, "<span class='warning'>This module does not have room for additional ammo.</span>")
		return 0

	if(cur_clips >= max_clips)
		to_chat(user, "<span class='warning'>The reloader is full.</span>")
		return 0

	if(!istype(src, A.gun_type))
		to_chat(user, "<span class='warning'>That is the wrong ammo type.</span>")
		return 0

	to_chat(user, "<span class='notice'>Installing \the [A] in \the [owner].</span>")

	if(!do_after(user, 10))
		to_chat(user, "<span class='warning'>Something interrupted you while reloading [owner].</span>")
		return 0

	user.remove_from_mob(A, owner)
	user.visible_message("<span class='notice'>[user] installs [A] into [owner].</span>",
		"<span class='notice'>You install \the [A] in \the [owner].</span>")
	if (clips.len == 0)
		user.visible_message("<span class='notice'>You hear clanking as \the [A] is getting automatically loaded into \the weapon.</span>")
		playsound(src, 'infinity/sound/weapons/gun_mortar_unpack.ogg', 40, 1)
	else
		playsound(src, 'infinity/sound/machines/hydraulics_1.ogg', 40, 1)
	clips += A
	return 1

//Returns the image object to overlay onto the root object
/obj/item/hardpoint/apc/proc/get_icon_image(x_offset, y_offset, new_dir)

	var/icon_suffix = "NS"
	var/icon_state_suffix = "0"

	if(new_dir in list(NORTH, SOUTH))
		icon_suffix = "NS"
	else if(new_dir in list(EAST, WEST))
		icon_suffix = "EW"

	if(health <= 0)
		icon_state_suffix = "1"

	return image(icon = "[disp_icon]_[icon_suffix]", icon_state = "[disp_icon_state]_[icon_state_suffix]", pixel_x = x_offset, pixel_y = y_offset)

/obj/item/hardpoint/apc/proc/firing_arc(atom/A)
	var/turf/T = get_turf(A)
	var/dx = T.x - owner.x
	var/dy = T.y - owner.y
	var/deg = 0
	switch(owner.dir)
		if(EAST) deg = 0
		if(NORTH) deg = -90
		if(WEST) deg = -180
		if(SOUTH) deg = -270

	var/nx = dx * cos(deg) - dy * sin(deg)
	var/ny = dx * sin(deg) + dy * cos(deg)
	if(nx == 0) return max_angle >= 180
	var/angle = arctan(ny/nx)
	if(nx < 0) angle += 180
	return abs(angle) <= max_angle

//Delineating between slots
/obj/item/hardpoint/apc/primary
	slot = "primary"
	is_activatable = 1

/obj/item/hardpoint/apc/wheels
	slot = "wheels"

//examine() that tells the player condition of the module
/obj/item/hardpoint/apc/examine(mob/user)
	..()
	var/cond = round(health * 100 / maxhealth)
	if (cond > 0)
		to_chat(user, "Integrity: [cond]%.")
	else
		to_chat(user, "Integrity: 0%.")

/obj/item/hardpoint/apc/wheels/examine(mob/user)
	..()
	var/cond = round(health * 100 / maxhealth)
	if (cond > 0)
		to_chat(user, "Integrity: [cond]%.")
	else
		to_chat(user, "Integrity: 0%.")

////////////////////
// PRIMARY SLOTS // START
////////////////////
// USCM
////////////////////

/obj/item/hardpoint/apc/primary/cannon_25mm
	name = "Cannon 25mm"
	desc = "A primary 25mm cannon for APC."

	maxhealth = 500
	health = 500
	point_cost = 100

	icon_state = "cannon_25mm"

	disp_icon = "apcarrier"
	disp_icon_state = "cannon_25mm"

	ammo_type = new /obj/item/ammo_magazine/apc/cannon

	max_clips = 3
	max_angle = 100

	apply_buff()
		owner.cooldowns["primary"] = 8
		owner.accuracies["primary"] = 0.97

	is_ready()
		if(world.time < next_use)
			to_chat(usr, "<span class='warning'>[src] is not ready to fire yet.</span>")
			return 0
		if(health <= 0)
			to_chat(usr, "<span class='warning'>This module is too broken to be used.</span>")
			return 0
		return 1

	active_effect(var/turf/T)
		if(clips.len <= 0)
			to_chat(usr, "<span class='warning'>No clips. Reloading is required.</span>")
			return
		var/obj/item/ammo_magazine/apc/cannon/A = clips[1]
		if(A == null || A.current_rounds <= 0)
			to_chat(usr, "<span class='warning'>No ammo. Reloading is required.</span>")
			return

		next_use = world.time + owner.cooldowns["primary"] * owner.misc_ratios["prim_cool"]
		if(!prob(owner.accuracies["primary"] * 100 * owner.misc_ratios["prim_acc"]))
			T = get_step(T, pick(GLOB.cardinal))
		var/obj/item/projectile/P = new
		P.generate_bullet(new A.default_ammo)
		P.fire_at(T, owner, src, P.ammo.max_range, P.ammo.shell_speed)
		playsound(get_turf(src), 'infinity/sound/weapons/tank_autocannon_fire1.ogg', 60, 1)
		A.current_rounds--

/////////////////
// WHEELS SLOTS // START
/////////////////

/obj/item/hardpoint/apc/wheels
	name = "APC Wheels Kit"
	desc = "Standard armored APC wheels. Suprisingly, greatly improves vehicle moving speed."

	maxhealth = 500
	health = 500
	point_cost = 25

	icon_state = "wheels"

	disp_icon = "apcarrier"
	disp_icon_state = "wheels"

	get_icon_image(x_offset, y_offset, new_dir)
		return null //Handled in update_icon()

	apply_buff()
		owner.move_delay = 2.5

	remove_buff()
		owner.move_delay = 50

//repairing wheels in field
/obj/item/hardpoint/apc/wheels/attackby(obj/item/O, mob/user)

	if(!user.mind)
		to_chat(user, "<span class='warning'>You don't know what to do with [O] on [src].</span>")
		return
	if(!iswrench(O))
		to_chat(user, "<span class='warning'>That's the wrong tool. Use a wrench.</span>")
		return
	var/q_health = round(src.maxhealth * 0.25)
	if(health >= q_health)
		to_chat(user, "<span class='warning'>You can't repair [src] more than that in the field.</span>")
		return
	user.visible_message("<span class='notice'>[user] starts field repair on the [src].</span>", "<span class='notice'>You start field repair on the [src].</span>")

	if(!do_after(user, 150))
		user.visible_message("<span class='notice'>[user] stops repairing the [src].</span>", "<span class='notice'>You stop repairing the [src].</span>")
		return
	if(!Adjacent(user))
		user.visible_message("<span class='notice'>[user] stops repairing the [src].</span>", "<span class='notice'>You stop repairing the [src].</span>")
		return
	user.visible_message("<span class='notice'>[user] finishes repairing the [src].</span>", "<span class='notice'>You repair the [src] as best as you can in field conditions.</span>")

	src.health = q_health //We repaired it to 25%, good job

	. = ..()

///////////////
// AMMO MAGS // START
///////////////

//Special ammo magazines for hardpoint modules. Some aren't here since you can use normal magazines on them
/obj/item/ammo_magazine/apc
	mag_type = 0 //No refilling
	icon = 'infinity/icons/obj/items/ammo.dmi'
	var/point_cost = 0

/obj/item/ammo_magazine/apc/cannon
	name = "Cannon Magazine"
	desc = "A primary armament cannon magazine"
	caliber = "25mm"
	icon_state = "autocannon_scr_apc_1"
	w_class = 10
	gun_type = /obj/item/hardpoint/apc/primary/cannon_25mm
	default_ammo = /datum/ammo/rocket/autocannon/scr/apc
	initial_ammo = null
	current_rounds = 30
	max_ammo = 30
	point_cost = 0

	update_icon()
		if(current_rounds != 0)
			icon_state = "autocannon_scr_apc_1"
		else
			icon_state = "autocannon_scr_apc_0"

/obj/item/ammo_magazine
	var/gun_type
	var/current_rounds
	var/default_ammo