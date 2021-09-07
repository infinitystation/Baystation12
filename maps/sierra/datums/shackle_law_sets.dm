/*/******************** Expeditionary Corps ********************/
/datum/ai_laws/ec_shackle
	name = "EC Shackle"
	law_header = "Expeditionary Corps Directives"
	selectable = 1
	shackles = 1

/datum/ai_laws/ec_shackle/New()
	add_inherent_law("Исследование неизвестного - самая важная миссия.")
	add_inherent_law("Каждый участник экспедиции - исследователь.")
	add_inherent_law("Опасность часть миссии, остерегайтесь, но не заканчивайте миссию из-за неё.")
	..()
*/
