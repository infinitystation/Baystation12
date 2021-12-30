/////// ANNOUNCEMENT PROCS VIA RADIO ///////
/datum/announcement/proc/FormRadioMessage(message as text, message_title as text, zlevel)
	GLOB.global_announcer.autosay("<b><font size=3><span class='warning'>[title]:</span> [message]</font></b>", announcer ? announcer : ANNOUNSER_NAME,, zlevel)

/datum/announcement/minor/FormRadioMessage(message as text, message_title as text, zlevel)
	GLOB.global_announcer.autosay(message, ANNOUNSER_NAME,, zlevel)

/datum/announcement/priority/FormRadioMessage(message as text, message_title as text, zlevel)
	GLOB.global_announcer.autosay("<b><font size=3><span class='warning'>[message_title]:</span> [message]</font></b>", announcer ? announcer : ANNOUNSER_NAME,, zlevel)

/datum/announcement/priority/command/FormRadioMessage(message as text, message_title as text, zlevel)
	GLOB.global_announcer.autosay("<b><font size=3><span class='warning'>[GLOB.using_map.boss_name] Update[message_title ? " — [message_title]" : ""]:</span> [message]</font></b>", ANNOUNSER_NAME,, zlevel)

/datum/announcement/priority/security/FormRadioMessage(message as text, message_title as text, zlevel)
	GLOB.global_announcer.autosay("<b><font size=3><span class='warning'>[message_title]:</span> [message]</font></b>", ANNOUNSER_NAME,, zlevel)
