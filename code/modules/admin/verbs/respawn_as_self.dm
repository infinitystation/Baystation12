/client/proc/respawn_as_self()
	set name = "Respawn As Self"
	set desc = "Respawn yourself as your currenly loaded character. Instantly. Right where you stand."
	set category = "Special Verbs"

	if(!check_rights(R_SPAWN))
		return

	if(!src.prefs)
		to_chat(src, "<span class='warning'>No preferences found on your client.</span>")

	if(alert(usr, "Are you sure you wanna respawn yourself where you are? If you're already in a living mob, it'll be deleted!", "Confirmation", "Yes", "No") == "No")
		return

	var/mob/mymob = src.mob
	var/mob/living/carbon/human/H = new(mymob.loc)
	prefs.copy_to(H, src.mob, 1)
	H.key = src.key
	qdel(mymob)
