/client/verb/stop_all_sounds()
	set name = "Stop all sounds"
	set desc = "Stop all sounds that are currently playing."
	set category = "OOC"

	if(!mob)
		return

	mob << sound(null)
