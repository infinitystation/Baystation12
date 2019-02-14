/*
	The global hud:
	Uses the same visual objects for all players.
*/

GLOBAL_DATUM_INIT(global_hud, /datum/global_hud, new())

/datum/global_hud
	var/obj/screen/nvg
	var/obj/screen/thermal
	var/obj/screen/meson
	var/obj/screen/science
	var/obj/screen/holomap

/datum/global_hud/proc/setup_overlay(var/icon_state)
	var/obj/screen/screen = new /obj/screen()
	screen.screen_loc = "1,1"
	screen.icon = 'icons/obj/hud_full.dmi'
	screen.icon_state = icon_state
	screen.mouse_opacity = 0

	return screen

/datum/global_hud/New()
	nvg = setup_overlay("nvg_hud")
	thermal = setup_overlay("thermal_hud")
	meson = setup_overlay("meson_hud")
	science = setup_overlay("science_hud")

		// The holomap screen object is actually totally invisible.
	// Station maps work by setting it as an images location before sending to client, not
	// actually changing the icon or icon state of the screen object itself!
	// Why do they work this way? I don't know really, that is how /vg designed them, but since they DO
	// work this way, we can take advantage of their immutability by making them part of
	// the global_hud (something we have and /vg doesn't) instead of an instance per mob.
	holomap = new /obj/screen()
	holomap.name = "holomap"
	holomap.icon = null
	holomap.screen_loc = ui_holomap
	holomap.mouse_opacity = 0