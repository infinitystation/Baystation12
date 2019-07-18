//APCS, HURRAY
//Read the documentation in transport.dm and multitile.dm before trying to decipher this stuff

/obj/vehicle_infinity/multitile/root/transport/apc
	name = "APC"
	desc = "It's APC. Entrance on the right side."

	icon = 'infinity/icons/obj/apcarrier_NS.dmi'
	icon_state = "apc_base"
	pixel_x = -32
	pixel_y = -32

	var/named = FALSE
	var/passengers = 0
	var/passengers_max
	var/mob/gunner
	var/mob/driver
	var/mob/swap_seat
	var/cabin_door_busy = FALSE
	var/tank_crewman_entered = FALSE
	var/turf/interior_area
	var/mob/camera_user

	var/obj/machinery/camera/camera = null	//Yay! Working camera in the apc!
	var/obj/structure/vehicle_interior/side_door/interior_side_door
	var/obj/structure/vehicle_interior/cabin_door/interior_cabin_door
	var/obj/machinery/vehicle_interior/tcomms_receiver/interior_tcomms
	var/obj/machinery/camera/interior_cam
	var/next_sound_play = 0

	luminosity = 2

/obj/effect/multitile_spawner/transport/apc

	width = 3
	height = 3
	spawn_dir = EAST
	var/vehicle_area
	var/number = 0 // Max 10. If 0 he don't load.
	var/network = ""
	var/list/spawn_hardpoints = list()
	var/list/damaged_hps = list()

/obj/effect/multitile_spawner/transport/apc/proc/choose_area()
	switch(number)
		if(1)
			return /area/vehicle_interior/apc_1
		if(2)
			return /area/vehicle_interior/apc_2
		if(3)
			return /area/vehicle_interior/apc_3

/obj/effect/multitile_spawner/transport/apc/New()
	if(number == 0)
		qdel(src)
		return
	var/obj/vehicle_infinity/multitile/root/transport/apc/R = new(src.loc)
	R.dir = WEST

	var/datum/coords/dimensions = new
	dimensions.x_pos = width
	dimensions.y_pos = height
	var/datum/coords/root_pos = new
	root_pos.x_pos = 1
	root_pos.y_pos = 1

	//Entrance relative to the root object. The apc spawns with the root centered on the marker
	var/datum/coords/entr_mark = new
	entr_mark.x_pos = 2
	entr_mark.y_pos = 0

	R.load_hitboxes(dimensions, root_pos)
	R.load_entrance_marker(entr_mark)

	R.camera = new /obj/machinery/camera(R)
	R.camera.network = list(network)
	R.camera.c_tag = "Armored Personnel Carrier #[number]" //ARMORED to be at the start of cams list, numbers in case of events with multiple vehicles
	var/hardpoint_path
	for(var/slot in spawn_hardpoints)
		hardpoint_path = spawn_hardpoints[slot]
		R.add_hardpoint(new hardpoint_path)
	R.damaged_hps = damaged_hps

	R.on_update_icon()

// Loaad passengers room
	R.camera.network.Add("apc_[number]")
	vehicle_area = choose_area()
	R.interior_area = locate(vehicle_area) in world
	var/obj/machinery/camera/cam = locate(/obj/machinery/camera/autoname) in R.interior_area
	if(cam)
		cam.c_tag = R.camera.c_tag + " Interior Camera"
		cam.network.Add(network,"apc_[number]")
	R.multitile_interior_exit = locate(/obj/effect/landmark/multitile_interior_exit) in R.interior_area
	R.multitile_interior_cabin_exit = locate(/obj/effect/landmark/multitile_interior_cabin_exit) in R.interior_area
	R.interior_side_door = locate(/obj/structure/vehicle_interior/side_door) in R.interior_area
	R.interior_side_door.master = R
	R.interior_cabin_door = locate(/obj/structure/vehicle_interior/cabin_door) in R.interior_area
	R.interior_cabin_door.master = R
	R.interior_cam = locate(/obj/machinery/camera/autoname) in R.interior_area
	R.passengers_max = 10

	del(src)

/obj/effect/multitile_spawner/transport/apc/Fixed_with_gun
	spawn_hardpoints = list(HDPT_PRIMARY = /obj/item/hardpoint/apc/primary/cannon_25mm,
							HDPT_WHEELS = /obj/item/hardpoint/apc/wheels/)

/obj/effect/multitile_spawner/transport/apc/Fixed
	spawn_hardpoints = list(HDPT_WHEELS = /obj/item/hardpoint/apc/wheels/)

/obj/effect/multitile_spawner/transport/apc/Decreipt
	damaged_hps =  list("primary",
						"wheels")

/obj/vehicle_infinity/multitile/root/transport/apc/Destroy()

	if(passengers)
		for(var/mob/living/carbon/M in interior_area)
			if(!M.stat)
				M.forceMove(src.loc)
				log_admin("[M]([M.client ? M.client.ckey : "disconnected"]) got gibbed upon deleting [name].")
				message_admins("[M]([M.client ? M.client.ckey : "disconnected"]) got gibbed upon deleting [name].")
				M.gib()
	if(gunner)
		var/mob/living/carbon/M = gunner
		gunner.forceMove(src.loc)
		gunner.unset_interaction()
		gunner = null
		log_admin("[M]([M.client ? M.client.ckey : "disconnected"]) got gibbed upon deleting [name].")
		message_admins("[M]([M.client ? M.client.ckey : "disconnected"]) got gibbed upon deleting [name].")
		M.gib()
	if(driver)
		var/mob/living/carbon/M = driver
		driver.forceMove(src.loc)
		driver.unset_interaction()
		driver = null
		log_admin("[M]([M.client ? M.client.ckey : "disconnected"]) got gibbed upon deleting [name].")
		message_admins("[M]([M.client ? M.client.ckey : "disconnected"]) got gibbed upon deleting [name].")

		M.gib()

	. = ..()

//For the apc, start forcing people out if everything is broken
/obj/vehicle_infinity/multitile/root/transport/apc/handle_all_modules_broken()
	deactivate_all_hardpoints()
	if(gunner)
		to_chat(gunner, "<span class='danger'>You cannot breath in all the smoke inside the cabin so you get out!</span>")
		gunner.forceMove(multitile_interior_cabin_exit.loc)
		gunner.unset_interaction()
		gunner = null
		if(gunner.client)
			gunner.client.mouse_pointer_icon = initial(gunner.client.mouse_pointer_icon)
	if(driver)
		to_chat(driver, "<span class='danger'>You cannot breath in all the smoke inside the cabin so you get out!</span>")
		driver.forceMove(multitile_interior_cabin_exit.loc)
		driver.unset_interaction()
		driver = null
	camera.status = 0
	set_light(2)

/obj/vehicle_infinity/multitile/root/transport/apc/remove_all_players()
	deactivate_all_hardpoints()
	if(!multitile_interior_cabin_exit) //Something broke, uh oh
		if(gunner) gunner.loc = src.loc
		if(driver) driver.loc = src.loc
	else
		if(gunner) gunner.forceMove(multitile_interior_cabin_exit.loc)
		if(driver) driver.forceMove(multitile_interior_cabin_exit.loc)

	if(gunner.client)
		gunner.client.mouse_pointer_icon = initial(gunner.client.mouse_pointer_icon)
	gunner = null
	driver = null

//megaphone proc. same as in tank
/obj/vehicle_infinity/multitile/root/transport/apc/proc/use_megaphone(mob/living/user)
	var/spamcheck = 0
	if (user.client)
		if(user.client.prefs.muted & MUTE_IC)
			to_chat(user, "\red You cannot speak in IC (muted).")
			return
	if(user.silent)
		return

	if(spamcheck)
		to_chat(user, "\red \The megaphone needs to recharge!")
		return

	var/message = copytext(sanitize(input(user, "Shout a message?", "Megaphone", null)  as text),1,MAX_MESSAGE_LEN)
	if(!message)
		return
	message = capitalize(message)
	log_admin("[key_name(user)] used a apc megaphone to say: >[message]<")
	if (usr.stat == 0)
		for(var/mob/living/carbon/human/O in (range(7,src)))
			O.show_message("<B>apc</B> broadcasts, <FONT size=3>\"[message]\"</FONT>",2)
		for(var/mob/observer/O in (range(7,src)))
			O.show_message("<B>apc</B> broadcasts, <FONT size=3>\"[message]\"</FONT>",2)
		spamcheck = 1
		spawn(20)
			spamcheck = 0
		return

/obj/vehicle_infinity/multitile/root/transport/apc/examine(mob/user)
	..()
	if(isobserver(user) && get_dist(src, user) <= 2)
		user.forceMove(multitile_interior_exit.loc)

//little QoL won't be bad, aight?
/obj/vehicle_infinity/multitile/root/transport/apc/verb/megaphone()
	set name = "G Use Megaphone"
	set category = "Vehicle"	//changed verb category to new one, because Object category is bad.
	set src = usr.loc

	use_megaphone(usr)

/obj/vehicle_infinity/multitile/root/transport/apc/verb/use_interior_camera()
	set name = "G Use Interior Camera"
	set category = "Vehicle"	//changed verb category to new one, because Object category is bad.
	set src = usr.loc

	access_camera(usr)

/obj/vehicle_infinity/multitile/root/transport/apc/proc/access_camera(mob/living/M)

	if(camera_user)
		if(camera_user == M)
			return
		else
			to_chat(M, "<span class='warning'>Camera is being used by another cabin crewman!</span>")
			return
	else
		camera_user = M
		M.reset_view(interior_cam)
		to_chat(M, "<span class='notice'>You move closer and take a quick look into interior camera monitor.</span>")
		M.unset_interaction()
		if(gunner)
			deactivate_all_hardpoints()
		sleep(10)
		M.set_interaction(src)
		M.reset_view(null)
		camera_user = null
		to_chat(M, "<span class='notice'>You move away from interior camera monitor.</span>")
		return

//Let's you switch into the other seat, doesn't work if it's occupied or gunner is not an AC
/obj/vehicle_infinity/multitile/root/transport/apc/verb/switch_seats()
	set name = "G Swap Seats"
	set category = "Vehicle"	//changed verb category to new one, because Object category is bad.
	set src = usr.loc

	var/answer = alert(usr, "Are you sure you want to swap seats?", , "Yes", "No") //added confirmation window
	if(answer == "No")
		return

	//Added mechanic for switching seats when both TCs are in the tank, that will take twice more time and will work only if another AC agrees.
	if(usr == gunner)
		if(!usr.mind)
			to_chat(usr, "<span class='warning'>You have no idea how to drive.</span>")
			return
		if(driver)
			answer = alert(driver, "Your gunner offers you to swap seats.", , "Yes", "No")
			if(answer == "No")
				to_chat(usr, "<span class='notice'>Driver has refused to swap seats with you.</span>")
			else
				to_chat(usr, "<span class='notice'>You start getting into the other seat.</span>")
				to_chat(driver, "<span class='notice'>You start getting into the other seat.</span>")
				sleep(60)
				to_chat(usr, "<span class='notice'>You switch seats.</span>")
				to_chat(driver, "<span class='notice'>You switch seats.</span>")
				deactivate_all_hardpoints()

				swap_seat = gunner
				gunner = driver
				if(gunner.client)
					gunner.client.mouse_pointer_icon = file("icons/mecha/mecha_mouse.dmi")
				driver = swap_seat
				if(driver.client)
					driver.client.mouse_pointer_icon = initial(driver.client.mouse_pointer_icon)
				swap_seat = null
				return

		to_chat(usr, "<span class='notice'>You start getting into the other seat.</span>")

		sleep(30)

		if(driver)
			to_chat(usr, "<span class='notice'>Someone beat you to the other seat!</span>")
			return

		to_chat(usr, "<span class='notice'>You switch seats.</span>")

		deactivate_all_hardpoints()

		driver = gunner
		gunner = null

		if(driver.client)
			driver.client.mouse_pointer_icon = initial(driver.client.mouse_pointer_icon)
	else if(usr == driver)
		if(gunner)
			if(!gunner.mind)
				to_chat(usr, "<span class='warning'>Your gunner has no idea how to drive, so you stop swapping seats.</span>")
				return
			answer = alert(gunner, "Your driver offers you to swap seats.", , "Yes", "No")
			if(answer == "No")
				to_chat(usr, "<span class='notice'>Driver has refused to swap seats with you.</span>")
			else
				to_chat(usr, "<span class='notice'>You start getting into the other seat.</span>")
				to_chat(gunner, "<span class='notice'>You start getting into the other seat.</span>")
				sleep(60)
				to_chat(usr, "<span class='notice'>You switch seats.</span>")
				to_chat(gunner, "<span class='notice'>You switch seats.</span>")
				deactivate_all_hardpoints()

				swap_seat = gunner
				gunner = driver
				deactivate_binos(gunner)
				if(gunner.client)
					gunner.client.mouse_pointer_icon = file("icons/mecha/mecha_mouse.dmi")
				driver = swap_seat
				if(driver.client)
					driver.client.mouse_pointer_icon = initial(driver.client.mouse_pointer_icon)
				swap_seat = null
				return
		to_chat(usr, "<span class='notice'>You start getting into the other seat.</span>")

		sleep(30)

		if(gunner)
			to_chat(usr, "<span class='notice'>Someone beat you to the other seat!</span>")
			return

		to_chat(usr, "<span class='notice'>You switch seats.</span>")

		gunner = driver
		driver = null
		deactivate_binos(gunner)
		if(gunner.client)
			gunner.client.mouse_pointer_icon = file("icons/mecha/mecha_mouse.dmi")

//Naming done right
/obj/vehicle_infinity/multitile/root/transport/apc/verb/name_apc()
	set name = "G Name The APC (Single Use)"
	set category = "Vehicle"	//changed verb category to new one, because Object category is bad.
	set src = usr.loc

	if(named)
		to_chat(usr, "<span class='warning'>APC was already named!</span>")
		return
	var/nickname = copytext(sanitize(input(usr, "Name your APC (20 symbols, without \"\", they will be added), russian symbols won't be seen", "Naming", null) as text),1,20)
	if(!nickname)
		to_chat(usr, "<span class='warning'>No text entered!</span>")
		return
	if(!named)
		src.name += " \"[nickname]\""
	else
		to_chat(usr, "<span class='warning'>Other TC was quicker! APC already was named!</span>")
	named = TRUE

/obj/vehicle_infinity/multitile/root/transport/apc/can_use_hp(mob/M)
	return (M == gunner)

/obj/vehicle_infinity/multitile/root/transport/apc/handle_harm_attack(mob/M)
	return

/obj/vehicle_infinity/multitile/root/transport/apc/proc/pulling_out_crew(mob/M)
	var/loc_check = M.loc

	if(!gunner && !driver)
		to_chat(M, "<span class='warning'>There is no one in the cabin.</span>")
		return
	
	to_chat(M, "<span class='notice'>You start pulling [driver ? driver : gunner] out of their seat.</span>")

	if(!do_after(M, 50))
		to_chat(M, "<span class='warning'>You stop pulling [driver ? driver : gunner] out of their seat.</span>")
		return

	if(M.loc != loc_check) return

	if(!gunner && !driver)
		to_chat(M, "<span class='warning'>There is no longer anyone in the cabin.</span>")
		return

	M.visible_message("<span class='warning'>[M] pulls [driver ? driver : gunner] out of their seat in vehicle cabin.</span>",
		"<span class='notice'>You pull [driver ? driver : gunner] out of their seat.</span>")

	var/mob/targ
	if(driver)
		targ = driver
		driver = null
	else
		if(gunner.client)
			gunner.client.mouse_pointer_icon = initial(gunner.client.mouse_pointer_icon)
		targ = gunner
		gunner = null
	to_chat(targ, "<span class='danger'>[M] forcibly drags you out of your seat and dumps you on the ground!</span>")
	targ.forceMove(multitile_interior_cabin_exit.loc)
	targ.unset_interaction()
	targ.Weaken(3, 1)
	log_admin("[M]([M.client ? M.client.ckey : "disconnected"]) dragged [targ]([targ.client ? targ.client.ckey : "disconnected"]) from the [name]'s cabin.")
	message_admins("[M]([M.client ? M.client.ckey : "disconnected"]) dragged [targ]([targ.client ? targ.client.ckey : "disconnected"]) from the [name]'s cabin.")


//12 passengers allowed by default + TC + module role
/obj/vehicle_infinity/multitile/root/transport/apc/handle_interior_entrance(mob/living/carbon/M)
	
	if(interior_side_door.side_door_busy)
		to_chat(M, "<span class='notice'>Someone is in the doorway.</span>")
		return
	var/new_tank_crewman_entered = FALSE
	var/new_passengers = 0
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/weapon/card/id/I = H.wear_id
		if(I && I.rank == "Armor Crewman" && !tank_crewman_entered)
			new_tank_crewman_entered = TRUE
		else
			if(passengers >= passengers_max)
				to_chat(M, "<span class='warning'>[src] is full.</span>")
				return
			else
				new_passengers++
	else
		if(passengers >= passengers_max)
			to_chat(M, "<span class='warning'>[src] is full.</span>")
			return
		else
			new_passengers++
	var/move_pulling = FALSE
	if(M.pulling && get_dist(entrance, M.pulling) <= 1)
		move_pulling = TRUE
		if(isliving(M.pulling))
			//to_chat(M, "<span class='debuginfo'>M.pulling is alive.</span>")
			var/mob/living/B = M.pulling
			if(B.buckled)
				to_chat(M, "<span class='warning'>You can't fit [M.pulling] on the [B.buckled] through a doorway! Try unbuckling [M.pulling] first.</span>")
				return
			if(ishuman(M.pulling))
				//to_chat(M, "<span class='debuginfo'>M.pulling is human</span>")
				var/mob/living/carbon/human/H = M.pulling
				var/obj/item/weapon/card/id/I = H.wear_id
				if(I && I.rank == "Transport Crewman" && !tank_crewman_entered)
					new_tank_crewman_entered = TRUE
					//to_chat(M, "<span class='debuginfo'>pulling armor crewman.</span>")
				else
					if((passengers + new_passengers + 1) > passengers_max)
						if((passengers + new_passengers) == passengers_max)
							to_chat(M, "<span class='warning'>There is a room only for one of you.</span>")
							return
						to_chat(M, "<span class='warning'>[src] is full.</span>")
						return
					else
						new_passengers++
			else
				if((passengers + new_passengers + 1) > passengers_max)
					if((passengers + new_passengers) == passengers_max)
						to_chat(M, "<span class='warning'>There is a room only for one of you.</span>")
						return
					to_chat(M, "<span class='warning'>[src] is full.</span>")
					return
				else
					new_passengers++
		if(isobj(M.pulling))
			if((istype(M.pulling, /obj/structure) && !istype(M.pulling, /obj/structure/closet/body_bag) && !istype(M.pulling, /obj/structure/closet/crate)) || (istype(M.pulling, /obj/machinery)))
				to_chat(M, "<span class='warning'>You can't fit the [M.pulling] through a doorway!</span>")
				return
			var/obj/O = M.pulling
			if(istype(O, /obj/structure/closet/body_bag))
				for(var/mob/living/B in O.contents)
					if(ishuman(B))
						var/mob/living/carbon/human/H = B
						var/obj/item/weapon/card/id/I = H.wear_id
						if(I && I.rank == "Transport Crewman" && !tank_crewman_entered)
							new_tank_crewman_entered = TRUE
						else
							if((passengers + new_passengers + 1) > passengers_max)
								if((passengers + new_passengers) == passengers_max)
									to_chat(M, "<span class='warning'>There is a room only for one of you.</span>")
									return
								to_chat(M, "<span class='warning'>[src] is full.</span>")
								return
							else
								new_passengers++
					else
						if((passengers + new_passengers + 1) > passengers_max)
							if((passengers + new_passengers) == passengers_max)
								to_chat(M, "<span class='warning'>There is a room only for one of you.</span>")
								return
							to_chat(M, "<span class='warning'>[src] is full.</span>")
							return
						else
							new_passengers++
			if(O.buckled_mob)
				to_chat(M, "<span class='warning'>You can't fit [O.buckled_mob] on the [O] through a doorway! Try unbuckling [M.pulling] first.</span>")
				return
	interior_side_door.side_door_busy = TRUE
	visible_message(M, "<span class='notice'>[M] starts climbing into [src].</span>",
		"<span class='notice'>You start climbing into [src].</span>")
	if(!do_after(M, 20))
		to_chat(M, "<span class='notice'>Something interrupted you while getting in.</span>")
		interior_side_door.side_door_busy = FALSE
		return

	if(M.lying || M.buckled || M.anchored)
		interior_side_door.side_door_busy = FALSE
		return

	if(M.loc != entrance.loc)
		to_chat(M, "<span class='notice'>You stop getting in.</span>")
		interior_side_door.side_door_busy = FALSE
		return

	if(move_pulling)
		if(isliving(M.pulling))
			var/mob/living/P = M.pulling
			P.forceMove(multitile_interior_exit.loc) //Cannot use forceMove method on pulls! Move manually
			M.forceMove(multitile_interior_exit.loc)
			M.start_pulling(P)
		else
			var/obj/O = M.pulling
			O.forceMove(multitile_interior_exit.loc)
			M.forceMove(multitile_interior_exit.loc)
			M.start_pulling(O)
	else
		M.forceMove(multitile_interior_exit.loc)
	if(new_tank_crewman_entered)
		tank_crewman_entered = TRUE
	passengers += new_passengers

	visible_message(M, "<span class='notice'>[M] climbs into [src].</span>",
		"<span class='notice'>You climb into [src].</span>")
	interior_side_door.side_door_busy = FALSE

	return

/obj/vehicle_infinity/multitile/root/transport/apc/handle_player_entrance(mob/M)

	var/loc_check = M.loc

	var/slot
	slot = input("Select a seat") in list("Driver", "Gunner")
	if(!M || M.client == null) return

	to_chat(M, "<span class='notice'>You start climbing into cabin.</span>")

	switch(slot)
		if("Driver")

			if(driver != null)
				to_chat(M, "<span class='notice'>That seat is already taken.</span>")
				return

			if(!do_after(M, 30, needhand = FALSE))
				to_chat(M, "<span class='notice'>Something interrupted you while getting in.</span>")
				return

			if(M.loc != loc_check)
				to_chat(M, "<span class='notice'>You stop getting in.</span>")
				return

			if(driver != null)
				to_chat(M, "<span class='notice'>Someone got into that seat before you could.</span>")
				return
			driver = M
			M.forceMove(src)
			to_chat(M, "<span class='notice'>You enter the driver's seat.</span>")

			M.set_interaction(src)
			return

		if("Gunner")

			if(gunner != null)
				to_chat(M, "<span class='notice'>That seat is already taken.</span>")
				return

			if(!do_after(M, 30, needhand = 0))
				to_chat(M, "<span class='notice'>Something interrupted you while getting in.</span>")
				return

			if(M.loc != loc_check)
				to_chat(M, "<span class='notice'>You stop getting in.</span>")
				return

			if(gunner != null)
				to_chat(M, "<span class='notice'>Someone got into that seat before you could.</span>")
				return

			if(!M.client) return //Disconnected while getting in
			gunner = M
			M.forceMove(src)
			deactivate_binos(gunner)

			to_chat(M, "<span class='notice'>You enter the gunner's seat.</span>")
			M.set_interaction(src)
			if(M.client)
				M.client.mouse_pointer_icon = file("icons/mecha/mecha_mouse.dmi")

			return

//Deposits you onto the exit marker
//TODO: Sometimes when the entrance marker is on the wall or somewhere you can't move to, it still deposits you there
//Fix that bug at somepoint ^^
/obj/vehicle_infinity/multitile/root/transport/apc/handle_player_exit(mob/M)

	if(M != gunner && M != driver) return

	if(cabin_door_busy)
		to_chat(M, "<span class='notice'>Someone is already getting out of the vehicle cabin.</span>")
		return

	to_chat(M, "<span class='notice'>You start climbing out of [src] cabin.</span>")

	cabin_door_busy = TRUE
	sleep(30)
	cabin_door_busy = FALSE
	var/turf/T = get_turf(multitile_interior_cabin_exit)

	if(M == gunner)
		deactivate_all_hardpoints()
		if(M.client)
			M.client.mouse_pointer_icon = initial(M.client.mouse_pointer_icon)
		M.forceMove(T)

		gunner = null
	else
		if(M == driver)
			M.forceMove(T)
			driver = null
	M.unset_interaction()
	to_chat(M, "<span class='notice'>You climb out of [src] cabin.</span>")

//No one but the driver can drive
/obj/vehicle_infinity/multitile/root/transport/apc/relaymove(mob/user, direction)
	if(user != driver) return

	. = ..(user, direction)

	if(next_sound_play < world.time)
		playsound(src, 'infinity/sound/ambience/tank_driving.ogg', vol = 20, extrarange = 30)
		next_sound_play = world.time + 21

//No one but the driver can turn
/obj/vehicle_infinity/multitile/root/transport/apc/try_rotate(deg, mob/user, force = 0)

	if(user != driver) return

	. = ..(deg, user, force)


/obj/vehicle_infinity/multitile/root/transport/apc/interior_concussion(strength)
	switch(strength)
		if(1)
			playsound(interior_side_door,'infinity/sound/effects/metal_crash.ogg', vol = 20, extrarange = 10)
			for(var/mob/living/carbon/M in interior_area)
				if(!M.stat)
					shake_camera(M, 10, 1)
					if(!M.buckled && prob(35))
						M.Weaken(1)
						M.apply_damage(rand(0, 1), BRUTE)
			playsound(src,'infinity/sound/effects/metal_crash.ogg', vol = 20, extrarange = 10)
			if(gunner)
				shake_camera(gunner, 10, 1)
			if(driver)
				shake_camera(driver, 10, 1)
		if(2)
			playsound(interior_side_door, pick('sound/effects/Explosion2.ogg', 'sound/effects/Explosion1.ogg'), vol = 20, extrarange = 10)
			playsound(interior_side_door,'infinity/sound/effects/metal_crash.ogg', vol = 20, extrarange = 10)
			for(var/mob/living/carbon/M in interior_area)
				if(!M.stat)
					shake_camera(M, 20, 1)
					if(!M.buckled && prob(65))
						M.Weaken(2)
					M.apply_damage(rand(0, 2), BRUTE)
					M.apply_damage(rand(0, 2), BURN)
			playsound(src,'infinity/sound/effects/metal_crash.ogg', vol = 20, extrarange = 10)
			if(gunner)
				var/mob/living/carbon/human/H = gunner
				shake_camera(gunner, 20, 1)
				H.apply_damage(rand(0, 1), BRUTE)
				H.apply_damage(rand(0, 1), BURN)
			if(driver)
				var/mob/living/carbon/human/H = driver
				shake_camera(H, 20, 1)
				H.apply_damage(rand(0, 1), BRUTE)
				H.apply_damage(rand(0, 1), BURN)
		if(3)
			playsound(interior_side_door, pick('sound/effects/Explosion2.ogg', 'sound/effects/Explosion1.ogg'), vol = 20, extrarange = 10)
			playsound(interior_side_door,'infinity/sound/effects/metal_crash.ogg', vol = 20, extrarange = 10)
			for(var/mob/living/carbon/M in interior_area)
				if(!M.stat)
					shake_camera(M, 30, 1)
					if(!M.buckled && prob(85))
						M.Weaken(3)
					M.apply_damage(rand(2, 4), BRUTE)
					M.apply_damage(rand(2, 4), BURN)
			playsound(src,'infinity/sound/effects/metal_crash.ogg', vol = 20, extrarange = 10)
			if(gunner)
				var/mob/living/carbon/human/H = gunner
				shake_camera(gunner, 30, 1)
				H.apply_damage(rand(1, 3), BRUTE)
				H.apply_damage(rand(1, 3), BURN)
			if(driver)
				var/mob/living/carbon/human/H = driver
				shake_camera(driver, 30, 1)
				H.apply_damage(rand(1, 3), BRUTE)
				H.apply_damage(rand(1, 3), BURN)
		if(4)
			playsound(interior_side_door, pick('sound/effects/Explosion2.ogg', 'sound/effects/Explosion1.ogg'), vol = 20, extrarange = 10)
			playsound(interior_side_door,'infinity/sound/effects/metal_crash.ogg', vol = 20, extrarange = 10)
			for(var/mob/living/carbon/M in interior_area)
				if(!M.stat)
					shake_camera(M, 40, 1)
					if(!M.buckled)
						M.Weaken(4)
					else
						M.Weaken(2)
					M.apply_damage(rand(3, 7), BRUTE)
					M.apply_damage(rand(3, 7), BURN)
			playsound(src,'infinity/sound/effects/metal_crash.ogg', vol = 20, extrarange = 10)
			if(gunner)
				var/mob/living/carbon/human/H = gunner
				shake_camera(gunner, 40, 1)
				H.apply_damage(rand(2, 6), BRUTE)
				H.apply_damage(rand(2, 6), BURN)
			if(driver)
				var/mob/living/carbon/human/H = driver
				shake_camera(driver, 40, 1)
				H.apply_damage(rand(2, 6), BRUTE)
				H.apply_damage(rand(2, 6), BURN)

/obj/vehicle_infinity/multitile/hitbox/transport/apc/get_driver()
	var/obj/vehicle_infinity/multitile/root/transport/apc/T = root
	return T?.driver