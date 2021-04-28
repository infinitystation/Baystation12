/decl/webhook/near_end
	id = WEBHOOK_NEAR_END

// Наличие даты означает, что раунд неминуемо закончится. И нам надо послать другое сообщение. Да-да =( 
/decl/webhook/near_end/get_message(var/list/data)
	. = ..()
	if(!data.len)
		.["content"] = "Здесь должно было быть сообщение о *неминуемом* конце раунда, но кто то вызвал вебхук вручную."
		return
	var/loretext = data["reason"]
	if(!loretext || loretext == "")
		loretext = "Телеметрия нестабильна! Данные были повреждены!"
	.["embeds"] = list(list(
		"title" = "**Конец раунда неминуем! *Авейтеры собирайтесь!***",
		"description" = loretext,
		"color" = COLOR_WEBHOOK_XENO
	))

