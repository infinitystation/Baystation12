proc/create_new_xenomorph(var/alien_caste,var/target)

	target = get_turf(target)
	if(!target || !alien_caste) return

	var/mob/living/carbon/human/new_alien = new(target)
	new_alien.set_species("Xenophage [alien_caste]")
	return new_alien

/mob/living/carbon/human/xdrone/New(var/new_loc)
	h_style = "Bald"
	. = ..(new_loc, "Xenophage Drone")
	GLOB.xenomorphs.add_antagonist(src.mind, 1)

/mob/living/carbon/human/xsentinel/New(var/new_loc)
	h_style = "Bald"
	. = ..(new_loc, "Xenophage Sentinel")
	GLOB.xenomorphs.add_antagonist(src.mind, 1)

/mob/living/carbon/human/xhunter/New(var/new_loc)
	h_style = "Bald"
	. = ..(new_loc, "Xenophage Hunter")
	GLOB.xenomorphs.add_antagonist(src.mind, 1)

/mob/living/carbon/human/xwarrior/New(var/new_loc)
	h_style = "Bald"
	. = ..(new_loc, "Xenophage Warrior")
	GLOB.xenomorphs.add_antagonist(src.mind, 1)


/mob/living/carbon/human/xqueen/New(var/new_loc)
	h_style = "Bald"
	. = ..(new_loc, "Xenophage Queen")
	GLOB.xenomorphs.add_antagonist(src.mind, 1)

/mob/living/carbon/human/xspitter/New(var/new_loc)
	h_style = "Bald"
	. = ..(new_loc, "Xenophage Spitter")
	GLOB.xenomorphs.add_antagonist(src.mind, 1)

/mob/living/carbon/human/xlord/New(var/new_loc)
	h_style = "Bald"
	. = ..(new_loc, "Xenophage Hivelord")
	GLOB.xenomorphs.add_antagonist(src.mind, 1)
