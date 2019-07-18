//everything vehicle interior related will go here, even if object is not exactly inside of vehicle itself

//////////////////////////////////////////////////////////////////////
/obj/structure/vehicle_interior
	unacidable = 1
	anchored = TRUE

/obj/structure/vehicle_interior/side_door
	name = "Side Door"
	desc = "It opens and closes."
	icon = 'infinity/icons/obj/doors/vehicle/dropship2_pilot.dmi'
	icon_state = "door_closed"
	density = TRUE
	opacity = 1
	dir = 8
	var/obj/vehicle_infinity/multitile/root/transport/apc/master
	var/side_door_busy = FALSE
	var/locked = FALSE

/obj/structure/vehicle_interior/side_door/examine(mob/user)
	..()
	if(isobserver(user) && get_dist(src, user) <= 2)
		user.forceMove(master.entrance.loc)

/obj/structure/vehicle_interior/side_door/proc/activate(mob/user)

	if(user.loc != master.multitile_interior_exit.loc)
		return

	if(master.tile_blocked_check(get_turf(master.entrance)))
		to_chat(user, "<span class='warning'>Something blocks the door and you can't get out!</span>")
		return

	if(world.time < master.next_move)
		to_chat(user, "<span class='warning'>[master] hasn't fully stopped yet!</span>")
		return

	if(side_door_busy)
		to_chat(user, "<span class='warning'>Someone is in the doorway.</span>")
		return

	var/remove_tank_crewman_entered = FALSE
	var/passengers_left = 0
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/obj/item/weapon/card/id/I = H.wear_id
		if(I && I.rank == "Transport Crewman" && master.tank_crewman_entered)
			remove_tank_crewman_entered = TRUE
		else
			passengers_left++
	else
		passengers_left++

	var/move_pulling = FALSE
	if(user.pulling && get_dist(src, user.pulling) <= 2)
		move_pulling = TRUE
		if(isliving(user.pulling))
			//to_chat(user, "<span class='debuginfo'>user.pulling is alive.</span>")
			var/mob/living/B = user.pulling
			if(B.buckled)
				to_chat(user, "<span class='warning'>You can't fit [user.pulling] on the [B.buckled] through a doorway! Try unbuckling [user.pulling] first.</span>")
				return
			if(ishuman(user.pulling))
				//to_chat(user, "<span class='debuginfo'>user.pulling is human</span>")
				var/mob/living/carbon/human/H = user.pulling
				var/obj/item/weapon/card/id/I = H.wear_id
				if(I && I.rank == "Transport Crewman" && master.tank_crewman_entered)
					remove_tank_crewman_entered = TRUE
				else
					passengers_left++
			else
				passengers_left++
		if(isobj(user.pulling))
			if((istype(user.pulling, /obj/structure) && !istype(user.pulling, /obj/structure/closet/body_bag) && !istype(user.pulling, /obj/structure/closet/crate)) || (istype(user.pulling, /obj/machinery)))
				to_chat(user, "<span class='warning'>You can't fit the [user.pulling] through a doorway!</span>")
				return
			//to_chat(user, "<span class='debuginfo'>user.pulling is object.</span>")
			var/obj/O = user.pulling
			if(istype(O, /obj/structure/closet/body_bag))
				//to_chat(user, "<span class='debuginfo'>pulling bodybag.</span>")
				for(var/mob/living/B in O.contents)
					if(ishuman(B))
						var/mob/living/carbon/human/H = B
						var/obj/item/weapon/card/id/I = H.wear_id
						if(I && I.rank == "Transport Crewman" && master.tank_crewman_entered)
							remove_tank_crewman_entered = TRUE
						else
							passengers_left++
					else
						passengers_left++
			if(O.buckled_mob)
				to_chat(user, "<span class='warning'>You can't fit [O.buckled_mob] on the [O] through a doorway! Try unbuckling [user.pulling] first.</span>")
				return

	side_door_busy = TRUE
	visible_message(user, "<span class='notice'>[user] starts climbing out of [src].</span>",
		"<span class='notice'>You start climbing out of [src].</span>")
	if(!do_after(user, 15))
		to_chat(user, "<span class='notice'>Something interrupted you while getting out.</span>")
		side_door_busy = FALSE
		return

	if(world.time < master.next_move)
		to_chat(user, "<span class='warning'>[master] hasn't fully stopped yet!</span>")
		side_door_busy = FALSE
		return

	if(master.tile_blocked_check(get_turf(master.entrance)))
		to_chat(user, "<span class='warning'>Something blocks the door and you can't get out!</span>")
		side_door_busy = FALSE
		return

	if(user.lying || user.buckled || user.anchored)
		side_door_busy = FALSE
		return

	if(user.loc != master.multitile_interior_exit.loc)
		to_chat(user, "<span class='notice'>You stop getting in.</span>")
		side_door_busy = FALSE
		return

	if(move_pulling)
		if(isliving(user.pulling))
			var/mob/living/P = user.pulling
			P.forceMove(master.entrance.loc) //Cannot use forceMove method on pulls! Move manually
			user.forceMove(master.entrance.loc)
			user.start_pulling(P)
		else
			var/obj/O = user.pulling
			O.forceMove(master.entrance.loc)
			user.forceMove(master.entrance.loc)
			user.start_pulling(O)
	else
		user.forceMove(master.entrance.loc)

	if(remove_tank_crewman_entered)
		master.tank_crewman_entered = FALSE
	master.passengers -= passengers_left

	side_door_busy = FALSE
	return

/obj/structure/vehicle_interior/side_door/attack_hand(mob/user)
	activate(user)
	return

/obj/structure/vehicle_interior/side_door/attackby(obj/item/O, mob/user)
	if(istype(O, /obj/item/weapon/grenade))
		var/obj/item/weapon/grenade/G = O
		user.visible_message("<span class='warning'>[user] takes position to throw [G] outside.</span>",
		"<span class='warning'>You take position to throw [G] outside.</span>")
		if(do_after(user, 10))
			user.visible_message("<span class='warning'>[user] throws [G] outside!</span>",
			"<span class='warning'>You throw [G] outside!</span>")
			user.drop_item()
			G.forceMove(master.entrance.loc)
			var/dir = turn(master.dir, -90)
			var/turf/T = get_step(master.entrance.loc, dir)
			G.throw_at(T, 3, 1, master, 0)
			G.det_time = 20
			if(!G.active)
				G.activate(user)
		return
	if(istype(O, /obj/item/device/flashlight))
		var/obj/item/device/flashlight/flare/F = O
		user.visible_message("<span class='warning'>[user] takes position to throw [F] outside.</span>",
		"<span class='warning'>You take position to throw [F] outside.</span>")
		if(do_after(user, 10))
			user.visible_message("<span class='warning'>[user] throws [F] outside!</span>",
			"<span class='warning'>You throw [F] outside!</span>")
			F.attack_self(user)
			user.drop_item()
			F.forceMove(master.entrance.loc)
			var/dir = turn(master.dir, -90)
			var/turf/T = get_step(master.entrance.loc, dir)
			F.throw_at(T, 3, 1, master, 0)
		return
	activate(user)
	return

/obj/structure/vehicle_interior/side_door/verb/use_side_door()
	set name = "Use Side Door"
	set category = "Vehicle"
	set src in range(1)
	if(usr.loc != master.multitile_interior_exit.loc)
		return
	if(isobserver(usr))
		to_chat(usr, "<span class='warning'>This is not for you, just click on the [src].</span>")
		return
	activate(usr)

/obj/structure/vehicle_interior/cabin_door
	name = "Cabin Door"
	desc = "It opens and closes."
	icon = 'infinity/icons/obj/doors/vehicle/dropship2_side.dmi'
	icon_state = "door_closed"
	density = TRUE
	opacity = 1
	var/obj/vehicle_infinity/multitile/root/transport/apc/master

//Two seats, gunner and driver
//Only driver requires skills
/obj/structure/vehicle_interior/cabin_door/proc/activate(mob/user)

	if(user.a_intent == "hurt")
		master.pulling_out_crew(user)
		return

	master.handle_player_entrance(user)

/obj/structure/vehicle_interior/cabin_door/attack_hand(mob/user)
	activate(user)
	return