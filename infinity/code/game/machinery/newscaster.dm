/obj/machinery/newscaster
	icon       = 'infinity/icons/obj/terminals_holo.dmi'
	icon_state = "newscaster_map" //no confusion if ya' messing with map

/obj/machinery/newscaster/Initialize()
	icon_state = replacetext(icon_state,"_map","")
	. = ..()
	update_icon()

/obj/machinery/newscaster/on_update_icon()
	overlays.Cut()
	if(inoperable())
		set_light(0)
		if(hitstaken > 0) overlays += "[icon_state]_crack[hitstaken]"
		if(stat & BROKEN) overlays += "[icon_state]_crack3"
		return
	var/icon/screen = icon(icon,news_network?.wanted_issue ? "[icon_state]_screen_wanted" : "[icon_state]_screen")
	screen.ColorTone(alert ? "#017237" : "#00ffff")
	overlays       += getHologramIcon(screen, TRUE, TRUE)
	set_light(0.9, 0.1, 1, 2, alert ? "#017237" : "#00ffff")