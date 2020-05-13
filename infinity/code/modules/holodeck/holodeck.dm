/obj/item/clothing/gloves/boxing/hologlove/attack_self(mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(hits)
		audible_message("\icon[src] <b>The gloves</b> сообщает, \"Счётчик ударов был сброшен.\"")
		hits = 0
		return

	var/new_hits = input(user, "Введите количество ударов перед опрокидыванием.", "Счётчик ударов", hits) as num|null
	if(new_hits)
		new_hits = max(min(round(text2num(new_hits)), 100), 2) //between 5 and 100
		audible_message("\icon[src] <b>The gloves</b> сообщает, \"Количество ударов перед опрокидыванием выставлено на [new_hits].\"")
		hits_needed = new_hits
		return

/obj/item/clothing/gloves/boxing/hologlove/examine(mob/user)
	. = ..()
	to_chat(user, "Hits counter reads: [hits]/[hits_needed].")
