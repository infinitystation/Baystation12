/*#ifdef DEBUG
/world/Error(exception/e, datum/e_src)
	. = ..()
	SSwebhooks.send(WEBHOOK_SEND_RUNTIME, list("file" = e.file, "line" = e.line, "msg" = e.name, "desc" = e.desc))
#endif*/
/proc/DiscordSanitize(t)
	t = replacetext(t, "|", "\\|")
	t = replacetext(t, "*", "\\*")
	t = replacetext(t, "`", "\\`")
	t = replacetext(t, "~", "\\~")
	t = replacetext(t, "_", "\\_")
	. = t
