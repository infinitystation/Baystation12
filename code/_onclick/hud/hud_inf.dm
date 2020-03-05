/*
/datum/hud/proc/update_ling_chem()
	if(mymob && ling_chem)
		var/stamina = mymob.get_stamina()
		if(stamina < 100)
			stamina_bar.invisibility = 0
			stamina_bar.icon_state = "prog_bar_[Floor(stamina/5)*5]"
*/

/obj/screen/ling_chem
	name = "chemical storage"
	icon = 'infinity/icons/obj/action_buttons/changeling.dmi'
	icon_state = "power_display"
	invisibility = INVISIBILITY_MAXIMUM
	screen_loc = ui_ling_chem
