/decl/emote
	var/list/emote_sound = null
	// three-dimensional array
	// first is the species, associated to a list of genders, associated to a list of the sound effects to use
	var/list/sounded_species = null

/decl/emote/do_emote(var/atom/user, var/extra_params)
	..()
	if(emote_sound) do_sound(user)

/decl/emote/proc/do_sound(var/atom/user)
	var/mob/living/carbon/human/H = user
	if(H.stat) return // No dead or unconcious people screaming pls.
	if(istype(H))
		if(sounded_species)
			if(H.species.name in sounded_species)
				if(islist(emote_sound))
					if(H.species.name == SPECIES_SKRELL)
						if(H.h_style == "Skrell Male Tentacles")
							return playsound(user.loc, pick(emote_sound[MALE]), 50, 0)
						else
							return playsound(user.loc, pick(emote_sound[FEMALE]), 50, 0)
					if(emote_sound[H.gender])
						return playsound(user.loc, pick(emote_sound[H.gender]), 50, 0)
		return playsound(user.loc, pick(emote_sound), 50, 0)
