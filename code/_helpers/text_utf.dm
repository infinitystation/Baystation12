/proc/extA2U(t)
	if(!t)
		return

	t = replacetext(t, "&#255;", "\\u044f")
	t = replacetext(t, "&#1103;", "\\u044f")

	t = call("pagefile_conv", "json2utf")(t)

	return t

/proc/convert1251_to_utf(t)
	if(!t)
		return

	t = replacetext(t, "&#255;", "&#x044f")
	t = replacetext(t, "&#1103;", "&#x044f")

	t = call("pagefile_conv", "chat2utf")(t)

	return t