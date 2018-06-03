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

/mob/verb/json_conv_stress()
	set name = "JSON conv test"
	set category = "Test"

	var/t = "—Џ≈Ў№ ∆≈ ≈ў≈ Ё“»’ ћя√ »’, ‘–јЌ÷”«— »’ Ѕ”Ћќ„≈ , ƒј ¬џѕ≈… „јё. —ъещь же еще этих м€гких, французских булочек да выпей чаю. 1234567890®!є;%:?*()_+ єєєєєєє"
	t = replacetext(t, "€", "&#1103;")
	t = json_encode(t)

	for(var/i = 1 to 40000)
		extA2U(t)

/mob/verb/gchat_conv_stress()
	set name = "GCHAT conv test"
	set category = "Test"

	var/t = "—Џ≈Ў№ ∆≈ ≈ў≈ Ё“»’ ћя√ »’, ‘–јЌ÷”«— »’ Ѕ”Ћќ„≈ , ƒј ¬џѕ≈… „јё. —ъещь же еще этих м€гких, французских булочек да выпей чаю. 1234567890®!є;%:?*()_+ єєєєєєє"
	t = replacetext(t, "€", "&#1103;")

	for(var/i = 1 to 40000)
		convert1251_to_utf(t)