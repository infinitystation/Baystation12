#define UPDATE_ADD "add"
#define UPDATE_REMOVE "remove"

// Rewrite this shit, maybe make all mechanic based on alpha or object screen state.

// This overlay should be visible every time, or at least be visible when cone active.
// Also there is problem what image can gone after reconnection, this is a first issue which should be fixed with something...


/obj/screen/fov
	icon = 'infinity/icons/mob/hide.dmi'
	icon_state = "combat"
	name = ""
	screen_loc = "SOUTH,WEST"
	mouse_opacity = FALSE
	layer = UNDER_HUD_LAYER
	plane = HUD_PLANE
	var/state = FOV_ACTIVE
	var/mob/living/owner

// Updating position so scopes will work fine
/obj/screen/fov/proc/update_position()
	if(!owner || !owner.client) return
	owner.client.screen_loc = "1:[-client.pixel_x],1:[-client.pixel_y]"
