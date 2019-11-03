/turf/simulated/floor/Crossed(atom/movable/O)
	. = ..()
	if(isliving(O))
		var/area/A = get_area(O)
		var/mob/living/crosser = O
		var/soundplayed
		for(var/obj/item/lordwessel/BOWL in crosser.contents)
			if(!(A in BOWL.known_areas) && !BOWL.is_silent_teleporting)
				if(!soundplayed)
					to_chat(O, "<center><b><font size=4>New area:<br>[A]</font></b></center>")
					sound_to(O, 'infinity/sound/effects/lordvessel/ds-new-area.ogg')
					soundplayed = 1
				BOWL.known_areas += A