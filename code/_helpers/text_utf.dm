/proc/extA2U_debug(t)
	if(!t)
		return

	t = replacetext(t, "&#255;", "\\u044f")
	t = replacetext(t, "&#1103;", "\\u044f")

	t = call("pagefile_conv", "json2utf")(t)

	return t

/proc/convert1251_to_utf_debug(t)
	if(!t)
		return

	t = replacetext(t, "&#255;", "&#x044f")
	t = replacetext(t, "&#1103;", "&#x044f")

	t = call("pagefile_conv", "chat2utf")(t)

	return t