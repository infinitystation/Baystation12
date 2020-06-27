/datum/language/ling
	name = LANGUAGE_CHANGELING_GLOBAL
	desc = "Changelings can commune over a distance via pheromones."
	speech_verb = "передает"
	colour = "changeling"
	key = "g"
	flags = RESTRICTED | HIVEMIND
	shorthand = "N/A"
	hidden_from_codex = TRUE

/datum/language/ling/broadcast(var/mob/living/speaker,var/message,var/speaker_mask)
//[INF]
	if(speaker.mind && speaker.mind.changeling)
		..(speaker, message, "[speaker.mind.changeling.changelingID] ([speaker.mind])")
	else
		..(speaker, message)
//[/INF]
/*[ORIG]
	if(speaker.mind && speaker.mind.changeling)
		..(speaker,message,speaker.mind.changeling.changelingID)
	else
		..(speaker,message)
[/ORIG]*/
/datum/language/corticalborer
	name = LANGUAGE_BORER_GLOBAL
	desc = "Cortical borers possess a strange link between their tiny minds."
	speech_verb = "поет"
	ask_verb = "поет"
	exclaim_verb = "поет"
	colour = "alien"
	key = "z"
	flags = RESTRICTED | HIVEMIND
	shorthand = "N/A"
	hidden_from_codex = TRUE

/datum/language/corticalborer/broadcast(var/mob/living/speaker,var/message,var/speaker_mask)

	var/mob/living/simple_animal/borer/B

	if(istype(speaker,/mob/living/carbon))
		var/mob/living/carbon/M = speaker
		B = M.has_brain_worms()
	else if(istype(speaker,/mob/living/simple_animal/borer))
		B = speaker

	if(B)
		if(B.host)
			if(B.host.nutrition < 50 || B.host.stat)
				to_chat(speaker, SPAN_WARNING("Your host is too weak to relay your broadcast."))
				return FALSE
			B.host.nutrition -= rand(1, 3)
		speaker_mask = B.truename
	..(speaker,message,speaker_mask)

/datum/language/vox
	name = LANGUAGE_VOX
	desc = "The common tongue of the various Vox ships making up the Shoal. It sounds like chaotic shrieking to everyone else."
	speech_verb = "визжит"
	ask_verb = "рокочет"
	exclaim_verb = "верещит"
	colour = "vox"
	key = "x"
	flags = WHITELISTED
	syllables = list("ti","ti","ti","hi","hi","ki","ki","ki","ki","ya","ta","ha","ka","ya","chi","cha","kah", \
	"SKRE","AHK","EHK","RAWK","KRA","AAA","EEE","KI","II","KRI","KA")
	machine_understands = 0
	shorthand = "Vox"

/datum/language/vox/can_speak_special(var/mob/speaker)
	if(!ishuman(speaker))
		return FALSE
	var/mob/living/carbon/human/H = speaker
	var/obj/item/organ/internal/hindtongue/tongue = H.internal_organs_by_name[BP_HINDTONGUE]
	if(!istype(tongue) || !tongue.is_usable())
		to_chat(speaker, SPAN_WARNING("You are not capable of speaking [name]!"))
		return FALSE
	return TRUE

/datum/language/vox/get_random_name()
	return ..(FEMALE,1,6)

/datum/language/cultcommon
	name = LANGUAGE_CULT
	desc = "The chants of the occult, the incomprehensible."
	speech_verb = "молвит"
	ask_verb = "молвит"
	exclaim_verb = "напевает"
	colour = "cult"
	key = "f"
	flags = RESTRICTED
	space_chance = 100
	syllables = list("ire","ego","nahlizet","certum","veri","jatkaa","mgar","balaq", "karazet", "geeri", \
		"orkan", "allaq", "sas'so", "c'arta", "forbici", "tarem", "n'ath", "reth", "sh'yro", "eth", "d'raggathnor", \
		"mah'weyh", "pleggh", "at", "e'ntrath", "tok-lyr", "rqa'nap", "g'lt-ulotf", "ta'gh", "fara'qha", "fel", "d'amar det", \
		"yu'gular", "faras", "desdae", "havas", "mithum", "javara", "umathar", "uf'kal", "thenar", "rash'tla", \
		"sektath", "mal'zua", "zasan", "therium", "viortia", "kla'atu", "barada", "nikt'o", "fwe'sh", "mah", "erl", "nyag", "r'ya", \
		"gal'h'rfikk", "harfrandid", "mud'gib", "fuu", "ma'jin", "dedo", "ol'btoh", "n'ath", "reth", "sh'yro", "eth", \
		"d'rekkathnor", "khari'd", "gual'te", "nikka", "nikt'o", "barada", "kla'atu", "barhah", "hra" ,"zar'garis")
	machine_understands = 0
	shorthand = "CT"
	hidden_from_codex = TRUE

/datum/language/cult
	name = LANGUAGE_CULT_GLOBAL
	desc = "The initiated can share their thoughts by means defying all reason."
	speech_verb = "молвит"
	ask_verb = "молвит"
	exclaim_verb = "напевает"
	colour = "cult"
	key = "y"
	flags = RESTRICTED | HIVEMIND
	shorthand = "N/A"
	hidden_from_codex = TRUE

/datum/language/alium
	name = LANGUAGE_ALIUM
	colour = "cult"
	speech_verb = "шипит"
	key = "c"
	flags = RESTRICTED
	syllables = list("qy","bok","mok","yok","dy","gly","ryl","byl","dok","forbici", "tarem", "n'ath", "reth", "sh'yro", "eth", "d'raggathnor","niii",
	"d'rekkathnor", "khari'd", "gual'te", "ki","ki","ki","ki","ya","ta","wej","nym","assah","qwssa","nieasl","qyno","shaffar",
	"eg","bog","voijs","nekks","bollos","qoulsan","borrksakja","neemen","aka","nikka","qyegno","shafra","beolas","Byno")
	machine_understands = 0
	shorthand = "AL"
	hidden_from_codex = TRUE

/datum/language/alium/New()
	speech_verb = pick("шипит","ворчит","свистит","булькает","щебечет","визжит","трещит","щелкает")
	..()

/datum/language/alium/get_random_name()
	var/new_name = ""
	var/length = rand(1,3)
	for(var/i=0 to length)
		new_name += pick(syllables)
	return capitalize(new_name)
