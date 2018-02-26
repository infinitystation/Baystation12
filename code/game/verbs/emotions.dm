/mob/living/var/emoteCooldown = 100 // each 10 is real second
/mob/living/var/emoteLastUse = -1000

/mob/living/proc/emoteCooldownCheck()
	if(emoteLastUse <= (world.time - emoteCooldown))
		emoteLastUse = world.time
		return 1
	else
		to_chat(src, "<span class='danger'>Между эмоци&#255;ми должно пройти более 10 секунд.</span>")
		return 0

/mob/living/verb/laugh()
	set name = "Смеяться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("laugh")

/mob/living/verb/giggle()
	set name = "Хихикать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("giggle")

/mob/living/verb/scream()
	set name = "Кричать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("scream")

/mob/living/verb/scratch()
	set name = "Почесаться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("scratch")

/mob/living/verb/blush()
	set name = "Краснеть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("blush")

/mob/living/verb/blink()
	set name = "Проморгаться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("blink")

/mob/living/verb/bow()
	set name = "Поклониться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("bow")

/mob/living/verb/choke()
	set name = "Подавиться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("choke")

/mob/living/verb/chuckle()
	set name = "Усмехнуться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("chuckle")

/mob/living/verb/collapse()
	set name = "Рухнуть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("collapse")

/mob/living/verb/cough()
	set name = "Кашлять"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("cough")

/mob/living/verb/cry()
	set name = "Плакать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("cry")

/mob/living/verb/clap()
	set name = "Хлопать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("clap")

/mob/living/verb/drool()
	set name = "Нести чепуху"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("drool")

/mob/living/verb/faint()
	set name = "Потерять сознание"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("faint")

/mob/living/verb/frown()
	set name = "Хмуриться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("frown")

/mob/living/verb/gasp()
	set name = "Задыхаться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("gasp")

/mob/living/verb/glare()
	set name = "Смотреть с ненавистью"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("glare")

/mob/living/verb/groan()
	set name = "Вздохнуть с досадой"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("groan")

/mob/living/verb/grin()
	set name = "Оскалиться в улыбке"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("grin")

/mob/living/verb/look()
	set name = "Посмотреть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("look")

/mob/living/verb/nod()
	set name = "Кивнуть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("nod")

/mob/living/verb/moan()
	set name = "Стонать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("moan")

/mob/living/verb/shake()
	set name = "Трясти головой"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("shake")

/mob/living/verb/sigh()
	set name = "Вздыхать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("sigh")

/mob/living/verb/smile()
	set name = "Улыбнуться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("smile")

/mob/living/verb/sneeze()
	set name = "Чихнуть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("sneeze")

/mob/living/verb/grunt()
	set name = "Ворчать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("grunt")

/mob/living/verb/sniff()
	set name = "Понюхать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("sniff")

/mob/living/verb/snore()
	set name = "Храпеть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("snore")

/mob/living/verb/shrug()
	set name = "Пожать плечами"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("shrug")

/mob/living/verb/stare()
	set name = "Пялиться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("stare")

/mob/living/verb/tremble()
	set name = "Дрожать в ужасе"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("tremble")

/mob/living/verb/twitch()
	set name = "Сильно дёргаться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("twitch")

/mob/living/verb/twitch_s()
	set name = "Дёргаться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("twitch_s")

/mob/living/verb/wave()
	set name = "Махать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("wave")

/mob/living/verb/whimper()
	set name = "Хныкать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("whimper")

/mob/living/verb/whistle()
	set name = "Свистеть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("whistle")

/mob/living/verb/wink()
	set name = "Подмигнуть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("wink")

/mob/living/verb/yawn()
	set name = "Зевать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("yawn")

/mob/living/verb/salute()
	set name = "Сделать воинское приветствие"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("salute")

/mob/living/verb/eyebrow()
	set name = "Приподнять бровь"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("eyebrow")
