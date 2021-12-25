/obj/structure/monolith/cult

/obj/machinery/door/morgue/temple


/**
 * Cult's anomaly cintainer subtype
 * Nothing changed, except icon and description
 */

/obj/structure/anomaly_container/cult
	name = "strange container"
	desc = "This container is made of an unusual metal-like material. There are strange symbols on it."
	icon = 'maps/away_inf/temple/icons/obj/structure/anomaly_container.dmi'


/obj/structure/anomaly_container/cult/contain(obj/machinery/artifact)
	if(contained)
		return
	contained = artifact
	artifact.forceMove(src)
	underlays += image(artifact)
	desc = "This container is made of an unusual metal-like material. There are strange symbols on it. \
			\The [contained] is kept inside."


/**
 * One of cult's altars. Looking like fountain
 * After activating some doors should open
 */

/obj/structure/fountain_cult
	name = "fountain"
	desc = "Fountain with a statue of an unusual bat. It looks like an altar."
	icon = 'maps/away_inf/temple/icons/obj/structure/fountain.dmi'
	icon_state = "fountain"
	anchored = TRUE
	density = TRUE
	can_buckle = TRUE
	buckle_dir = SOUTH
	buckle_lying = FALSE

	var/filled = FALSE
	var/current_amount = 0
	var/required_amount = 300
	var/transfer_amount = 5

	var/area/area


/obj/structure/fountain_cult/Initialize()
	. = ..()
	light_color = COLOR_WHITE
	set_light(0.6, 1, 2, 1, light_color)
	area = get_area(src)


/obj/structure/fountain_cult/user_buckle_mob(mob/living/carbon/human/victim, mob/living/carbon/human/user)
	if(!in_range(user, src) || user.stat || user.restrained() || !istype(victim))
		return FALSE

	if(!user.IsAdvancedToolUser())
		return

	if (victim == user)

		var/choice = alert(user, "Do you want to stand at the altar?", "Fountain", "Yes", "No")

		if (choice == "Yes")

			add_fingerprint(user)

			user.visible_message(
				SPAN_WARNING("[user] is trying to climb the altar..."),
				SPAN_WARNING("You trying to climb the altar...")
			)

			if (do_after(user, 3 SECONDS))

				user.forceMove(loc)

				if (buckle_mob(user))
					user.visible_message(
						SPAN_WARNING("[user] climbed up on the altar."),
						SPAN_WARNING("You climbed up on altar.")
					)

					addtimer(CALLBACK(src, .proc/start_ritual), 10 SECONDS)

					return TRUE

			user.visible_message(
				SPAN_WARNING("[user] fails to climb up on the altar."),
				SPAN_WARNING("You fail to climb up on the altar.")
			)

			return FALSE

		else
			return FALSE

	else

		var/choice = alert(user, "Do you want to put [victim] on the altar?", "Fountain", "Yes", "No")

		if (choice == "Yes")

			add_fingerprint(user)

			user.visible_message(
				SPAN_WARNING("[user] is trying to put [victim] on the altar..."),
				SPAN_WARNING("You trying to to put [victim] on the altar...")
			)

			if (do_after(user, 5 SECONDS))

				victim.forceMove(loc)

				if (buckle_mob(victim))

					user.visible_message(
						SPAN_WARNING("[user] putted [victim] up on the altar."),
						SPAN_WARNING("You putted [victim] up on altar.")
					)

					addtimer(CALLBACK(src, .proc/start_ritual), 10 SECONDS)

					return TRUE

			user.visible_message(
				SPAN_WARNING("[user] fails to put [victim] on the altar..."),
				SPAN_WARNING("You fail to to put [victim] on the altar...")
			)
			return FALSE


/obj/structure/fountain_cult/user_unbuckle_mob(mob/living/carbon/human/user)
	if(!user.IsAdvancedToolUser())
		return

	if(buckled_mob?.buckled == src)

		var/mob/living/carbon/human/victim = buckled_mob

		if(victim == user)

			victim.visible_message(
				SPAN_WARNING("[victim] struggles to jump off from altar!"),\
				SPAN_NOTICE("You struggle to jump off from altar!"))

			if (!do_after(victim, 20 SECONDS))

				if (victim?.buckled)
					to_chat(victim, SPAN_WARNING("You fail to jump off!"))
				return

			if (!victim.buckled)
				return

			victim.visible_message(
				SPAN_WARNING("[victim] jumps off from altar!"),
				SPAN_NOTICE("You jumped off from the altar!")
			)

			victim.Weaken(3)

		else

			user.visible_message(
				SPAN_NOTICE("[user] begins to remove [victim] from altar!"),
				SPAN_NOTICE("You begin to remove [victim] from altar!")
			)

			if (do_after(user, 5 SECONDS, victim))

				user.visible_message(
					SPAN_NOTICE("[user] removed the noose over [victim]'s neck!"),
					SPAN_NOTICE("You removed [victim] from altar!")
				)

			else
				return

		unbuckle_mob()
		add_fingerprint(user)


/obj/structure/fountain_cult/proc/start_ritual()
	if (filled)
		return

	if (!buckled_mob)
		return

	var/mob/living/carbon/human/victim = buckled_mob

	if (istype(victim, /mob/living/carbon/human/machine))
		to_chat(victim, SPAN_OCCULT("I'M NOT INTERESTED IN YOU!"))
		unbuckle_mob()
		victim.Weaken(5)
		return

	for (var/mob/living/carbon/human/spectator in victim.in_view(loc))
		spectator.Weaken(5)
		to_chat(spectator, SPAN_OCCULT("START THE RITUAL!"))
		playsound(src, 'infinity/sound/misc/statue/scare2.ogg', 25, 1)
		shake_camera(spectator, 1 SECOND, 1)

	set_light(0)

	sleep(5 SECONDS)

	victim.apply_damage(20, BRUTE, BP_CHEST)

	set_light(1, 1, 10, 2, COLOR_RED)

	playsound(src, 'infinity/sound/effects/gore/stab1.ogg', 25, 1)

	START_PROCESSING(SSprocessing, src)


/obj/structure/fountain_cult/proc/activate_altar()
	filled = TRUE

	set_light(1, 1, 5, 2, COLOR_RED_LIGHT)

	icon_state = "fountain_active"

	sleep(5 SECONDS)

	for (var/obj/machinery/door/airlock/cult/door in area)
		door.unlock()
		sleep(2 SECONDS)
		door.open()
		sleep(2 SECONDS)
		door.lock()


/obj/structure/fountain_cult/Process()
	if (!buckled_mob || !ishuman(buckled_mob) || filled)
		if (buckled_mob)
			unbuckle_mob()
		set_light(0.6, 1, 2, 1, COLOR_WHITE)
		return PROCESS_KILL

	var/mob/living/carbon/human/victim = buckled_mob

	var/list/quotes = list(
		"YOUR BLOOD IS MINE NOW",
		"YOUR SCREAMS WILL BE HEARD ONLY HERE",
		"DON'T RESIST",
		"GIVE ME STRENGTH",
		"I'M YOUR NIGHTMARE",
		"BLOOD FOR ME",
		"SWEET BLODD",
		"YOU'RE A VICTIM"
	)

	victim.remove_blood(transfer_amount)

	if (prob(25))
		victim.agony_scream()

	if (prob (25))
		to_chat(victim, "You feel the blood being drained out of you!")

	if (prob(25))
		to_chat(victim, SPAN_OCCULT(pick(quotes)))

	playsound(src, 'sound/effects/squelch2.ogg')

	current_amount += transfer_amount

	if (current_amount >= required_amount)
		activate_altar()
		return PROCESS_KILL


/obj/structure/lever
	name = "strange lever"
	desc = "What else can you say about this lever?"
	icon = 'maps/away_inf/temple/icons/obj/structure/lever.dmi'
	icon_state = "lever"
	anchored = TRUE
	density = FALSE

	var/toggled = FALSE
	var/area/area


/obj/structure/lever/Initialize()
	. = ..()
	area = get_area(src)


/obj/structure/lever/attack_hand(mob/user)

	if (toggled)
		to_chat(user, SPAN_NOTICE("Lever already turned."))

	user.visible_message(
		SPAN_NOTICE("[user] tries to turn the lever..."),
		SPAN_NOTICE("You're trying to turn the lever...")
	)

	/// The time required to turn the lever
	var/time_to_toggle = 60 SECONDS

	// The higher the level of athletics, the faster the lever will turn
	if (user.skill_check(SKILL_HAULING, SKILL_EXPERT))
		to_chat(user, SPAN_NOTICE("The lever barely moves, but your strength is enough to turn it! Don't stop!"))
		time_to_toggle *= 0.5
	else
		to_chat(user, SPAN_WARNING("The lever barely moves, it's incredibly hard to turn!"))

	if (!do_after(user, time_to_toggle))
		return

	user.visible_message(
		SPAN_NOTICE("[user] turned the lever."),
		SPAN_NOTICE("You were able to turn the lever.")
	)

	toggle_lever()


/obj/structure/lever/attackby(obj/item/Item, mob/user)

	if (toggled)
		to_chat(user, SPAN_NOTICE("Lever already turned."))

	if (istype(Item, /obj/item/crowbar))
		user.visible_message(
			SPAN_NOTICE("[user] started inserting a [Item] into the mechanism."),
			SPAN_NOTICE("You started inserting a  [Item] into the mechanism.")
		)

		if (!do_after(user, 5 SECONDS))
			return

		user.visible_message(
			SPAN_NOTICE("[user] started inserted a [Item] into the mechanism."),
			SPAN_NOTICE("You insert a  [Item] into the mechanism.")
		)

		/// The time required to turn the lever
		var/time_to_toggle = 60 SECONDS

		if (istype(Item, /obj/item/crowbar/prybar))
			time_to_toggle *= 0.75
		else
			time_to_toggle *= 0.5

		// The higher the level of athletics, the faster the lever will turn
		if (user.skill_check(SKILL_HAULING, SKILL_EXPERT))
			to_chat(user, SPAN_NOTICE("With a [Item] and your strength, it's easy!"))
			time_to_toggle *= 0.5
		else if (user.skill_check(SKILL_HAULING, SKILL_ADEPT))
			to_chat(user, SPAN_NOTICE("The lever turns with difficulty, but at least it's not difficult for you."))
			time_to_toggle *= 0.25
		else
			to_chat(user, SPAN_WARNING("The lever turns with difficulty..."))

		if (!do_after(user, time_to_toggle))
			return

		toggle_lever()

/obj/structure/lever/proc/toggle_lever()
	playsound(src, 'infinity/sound/machines/Conveyor_switch.ogg', 25, 1)
	icon_state = "lever_toggled"

	for (var/obj/machinery/door/airlock/cult/door in area)
		door.unlock()
		sleep(2 SECONDS)
		door.open()
		sleep(2 SECONDS)
		door.lock()
