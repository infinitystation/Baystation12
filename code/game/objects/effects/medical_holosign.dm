/obj/effect/medical_holosign
	name = "medical holosign"
	desc = "A small holographic glow that indicates a medic is coming to treat a patient."
	icon = 'icons/effects/medi_holo.dmi'
	icon_state = "medi_holo"
	var/duration = 30

/obj/effect/medical_holosign/Initialize(mapload, var/creator)
	. = ..()
	playsound(loc, 'sound/machines/ping.ogg', 50, 0) //make some noise!
	set_light(l_range = 2, l_power = 1, l_color = "#4c88ad")
	if(creator)
		visible_message("<span class='notice'>[creator] created a medical hologram!</span>")
	addtimer(CALLBACK(src,/datum/proc/qdel_self), duration)
