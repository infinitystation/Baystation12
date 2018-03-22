/client/proc/respawn_as_self()
	set name = "Respawn As Self"
	set desc = "Respawn yourself as your currenly loaded character. Instantly. Right where you stand."
	set category = "Special Verbs"

	if(!check_rights(R_SPAWN))
		return

	if(!src.prefs)
		to_chat(src, "<span class='warning'>No preferences found on your client.</span>")

	var/mob/M = src.mob
	var/answer = alert(usr, "Are you sure you wanna respawn yourself where you are? If you're already in a living mob, it'll be deleted! Pick \"Spawn via ckey\" if you want to spawn another person (he will spawn where it staying)", "Confirmation", "Yes", "No", "Spawn via ckey")
	if(answer == "No")
		return

	if(answer == "Spawn via ckey")
		var/input = ckey(input(src, "Please specify which key will be respawned.", "Key", ""))
		if(!input)
			return

		for(var/mob/C in GLOB.player_list)
			if(C.ckey == input)
				M = C
				break

	var/mob/living/carbon/human/H = new(M.loc)
	prefs.copy_to(H, M, 1)
	H.key = M.key
	qdel(M)
