/client/proc/cmd_admin_say(msg as text)
	set category = "Special Verbs"
	set name = "Asay" //Gave this shit a shorter name so you only have to time out "asay" rather than "admin say" to use it --NeoFite
	set hidden = 1
	if(!check_rights(R_ADMIN))	return

	msg = sanitize(msg)
	msg = emoji_parse_by_user(msg, src)//inf
	if(!msg)	return

	log_admin("ADMIN: [key_name(src)] : [msg]")

	if(check_rights(R_ADMIN,0))
		for(var/client/C in GLOB.admins)
			if(R_ADMIN & C.holder.rights)
				to_chat(C, "<span class='admin_channel'>" + create_text_tag("admin", "ADMIN:", C) + " <span class='name'>[key_name(usr, 1)]</span>([admin_jump_link(mob, src)]): <span class='message linkify'>[msg]</span></span>")

	SSstatistics.add_field_details("admin_verb","M") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/cmd_staff_say(msg as text)
	set category = "Special Verbs"
	set name = "Ssay"	// INF was set name = "Msay"
	set hidden = 1

	if(!check_rights(0))	// INF was if(!check_rights(R_ADMIN|R_MOD))
		return

	msg = sanitize(msg)
	msg = emoji_parse_by_user(msg, src)//inf
	log_staff_say("[key_name(src)] : [msg]")

	if (!msg)
		return

	var/sender_name = key_name(usr, 1)
	if(check_rights(R_ADMIN, 0))
		sender_name = "<span class='admin'>[sender_name]</span>"
	for(var/client/C in GLOB.admins)
// INF	to_chat(C, "<span class='staff_channel'>" + create_text_tag("staff", "STAFF:", C) + " \[[holder.rank]\]" + " <span class='name'>[check_rights(R_INVESTIGATE, 0, C) ? sender_name : src]</span>[check_rights(R_INVESTIGATE, 0, C) ? "([admin_jump_link(mob, C.holder)])" : null]: <span class='message'>[msg]</span></span>")
		to_chat(C, "<span class='mod_channel'>" + create_text_tag("mod", "MOD:", C) + " <span class='name'>[sender_name]</span>([admin_jump_link(mob, C.holder)]): <span class='message linkify'>[msg]</span></span>")
	SSstatistics.add_field_details("admin_verb","SS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
