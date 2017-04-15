/client/verb/ooc(message as text)
	set name = "OOC"
	set category = "OOC"

	sanitize_and_communicate(/decl/communication_channel/ooc, src, message)

/client/verb/looc(message as text)
	set name = "LOOC"
	set desc = "Local OOC, seen only by those in view. Remember: Just because you see someone that doesn't mean they see you."
	set category = "OOC"

	sanitize_and_communicate(/decl/communication_channel/ooc/looc, src, message)

/client/verb/self_notes()
	set name = "View Admin Remarks"
	set category = "TEST"
	set desc = "View the notes that admins have written about you"

	if(!holder)
		to_chat(usr, "no test for you")
		return

	show_note(null, usr.ckey, null, 1)
