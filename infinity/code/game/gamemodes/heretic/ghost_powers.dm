/datum/antagonist/cultist/add_ghost_magic(var/mob/observer/ghost/M)
	if(max_cult_rating >= CULT_GHOSTS_1)
		M.verbs += /mob/observer/ghost/proc/flick_lights
		M.verbs += /mob/observer/ghost/proc/bloody_doodle
		M.verbs += /mob/observer/ghost/proc/shatter_glass
		M.verbs += /mob/observer/ghost/proc/slice
		if(max_cult_rating >= CULT_GHOSTS_2)
			M.verbs += /mob/observer/ghost/proc/move_item
			M.verbs += /mob/observer/ghost/proc/whisper_to_cultist
			M.verbs += /mob/observer/ghost/proc/bite_someone
			M.verbs += /mob/observer/ghost/proc/chill_someone
			if(max_cult_rating >= CULT_GHOSTS_3)
				M.verbs += /mob/observer/ghost/proc/whisper_to_anyone
				M.verbs += /mob/observer/ghost/proc/bloodless_doodle
				M.verbs += /mob/observer/ghost/proc/toggle_visiblity
				if(max_cult_rating >= CULT_GHOSTS_4)
					M.verbs += /mob/observer/ghost/proc/posess_obj
					M.verbs += /mob/observer/ghost/proc/small_emp

/mob/observer/ghost/proc/small_emp()
	set category = "Cult"
	set name = "Small EMP"
	set desc = "Create a tiny EMP to disable electronics."

	if(!ghost_ability_check())
		return

	empulse(get_turf(src), -1, 0)

	ghost_magic_cd = world.time + 120 SECONDS

/mob/observer/ghost/proc/posess_obj()
	set category = "Cult"
	set name = "Throw object"
	set desc = "Throw object to yourself."

	if(!ghost_ability_check())
		return

	var/list/choices = list()
	for(var/obj/O in range(get_turf(src), 2))
		if(O.anchored)
			continue
		choices += O

	var/obj/choice = input(src, "What object do you like to throw?") as null|anything in choices

	var/throwdir = get_dir(choice, src)
	choice.throw_at(get_edge_target_turf(choice, throwdir),get_dist(src, choice),1)

	ghost_magic_cd = world.time + 120 SECONDS
