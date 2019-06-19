// jumping from bay, delete if they add acrobatics skill
/mob/living/carbon/proc/can_jump_act()
	// if(get_skill_value(SKILL_HAULING) >= SKILL_ADEPT) // inf - let it be here uncommented to know how it worked in past
	//	return 0
	if(incapacitated() || buckled || handcuffed)
		// No jumping if you're fucked up or cuffed!
		to_chat(src, "<span notice='warning'>You're in no state to jump!</span>")
		return 0
	if(nutrition < 150)
		// Too "tired" to jump.
		to_chat(src, "<span notice='warning'>You feel too exhausted to jump. Maybe a snack would help.</span>")
		return 0
	return 1

/mob/living/carbon/proc/jump_act(atom/target)
	if(!can_jump_act())
		return

	var/jump_range = 3
	var/jump_force = 0
	// A short timer keeps us from simply using jumping to bypass move speed.

	visible_message("<span class='notice'>\The [src] crouches and prepares to jump...</span>", "You crouch and prepare to jump...")

	if(do_after(src, 2 SECONDS))
		// Second check to make sure we didn't get messed up in the intervening 2 seconds.
		if(!can_jump_act())
			to_chat(src, "<span class='notice'>You find yourself unable to jump!</span>")
			return
		visible_message("<span class='notice'>\The [src] makes a long jump!</span>", "You make a long jump!")

		// Briefly allow us to pass tables, to jump over counters and whatnot, and spinning so we don't look like a fucking Beyblade.
		var/prev_spin = does_spin
		var/old_flags = pass_flags

		does_spin = 0
		pass_flags |= PASS_FLAG_TABLE

		playsound(src, 'sound/effects/throw.ogg', 50, 1)
		throw_at(target, jump_range, jump_force, src)

		nutrition -= 25
		does_spin = prev_spin
		pass_flags = old_flags
