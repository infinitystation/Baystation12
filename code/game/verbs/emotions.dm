/mob/living/var/emoteCooldown = 200 // each 10 is real second
/mob/living/var/emoteLastUse = -1000

/mob/living/verb/emoteCooldownCheck()
	if(emoteLastUse <= (world.time - emoteCooldown))
		emoteLastUse = world.time
		return 1
	else
		src << "ћежду эмоциями должно пройти более 20 секунд"
		return 0



/mob/living/verb/laugh()
	set name = "—меяться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("laugh")

/mob/living/verb/giggle()
	set name = "’ихикать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("giggles")

/mob/living/verb/scream()
	set name = "ƒушераздирающе кричать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("scream")

/mob/living/verb/blush()
	set name = " раснеть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("blush")

/mob/living/verb/bow()
	set name = "ѕоклониться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("bow")

/mob/living/verb/choke()
	set name = "ѕодавиться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("choke")

/mob/living/verb/chuckle()
	set name = "”смехнуться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("chuckle")

/mob/living/verb/collapse()
	set name = "–ухнуть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("collapse")

/mob/living/verb/cough()
	set name = " ашлять"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("cough")

/mob/living/verb/drool()
	set name = "Ќести чепуху"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("drool")

/mob/living/verb/faint()
	set name = "ѕотерять сознание"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("faint")

/mob/living/verb/frown()
	set name = "’муриться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("frown")

/mob/living/verb/gasp()
	set name = "«адыхаться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("gasp")

/mob/living/verb/glare()
	set name = "—вирепо посмотреть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("glare")

/mob/living/verb/grin()
	set name = "ќскалиться в улыбке"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("grin")

/mob/living/verb/look()
	set name = "ѕосмотреть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("look")

/mob/living/verb/nod()
	set name = " ивнуть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("nod")

/mob/living/verb/shake()
	set name = "“рясти головой"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("shake")

/mob/living/verb/sigh()
	set name = "¬здыхать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("sigh")

/mob/living/verb/smile()
	set name = "”лыбнуться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("smile")

/mob/living/verb/sneeze()
	set name = "„ихнуть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("sneeze")

/mob/living/verb/sniff()
	set name = "—опеть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("sniff")

/mob/living/verb/snore()
	set name = "’рапеть"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("snore")

/mob/living/verb/stare()
	set name = "ѕялиться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("stare")

/mob/living/verb/tremble()
	set name = "“репетать в страхе"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("tremble")

/mob/living/verb/twitch()
	set name = "—ильно дЄргаться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("twitch")

/mob/living/verb/twitch_s()
	set name = "ƒЄргаться"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("twitch_s")

/mob/living/verb/wave()
	set name = "ћахать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("wave")

/mob/living/verb/whimper()
	set name = "’ныкать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("whimper")

/mob/living/verb/yawn()
	set name = "«евать"
	set category = "Emotions"
	if(emoteCooldownCheck() == 1)
		emote("yawn")



