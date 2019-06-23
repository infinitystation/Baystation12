/datum/ai_icon
	var/name
	var/icon = 'infinity/icons/mob/AI.dmi'
	var/alive_icon
	var/alive_light = COLOR_WHITE
	var/nopower_icon = "4"
	var/nopower_light = COLOR_WHITE
	var/dead_icon = "ai-crash"
	var/dead_light = "#000099"

/datum/ai_icon/New(var/name, var/alive_icon, var/dead_icon, var/dead_light, var/icon)
	src.name          = name       || src.name
	src.icon          = icon       || src.icon
	src.alive_icon    = alive_icon || src.alive_icon
	src.dead_icon     = dead_icon  || src.dead_icon
	src.dead_light    = dead_light || src.dead_light

/datum/ai_icon/proc/may_used_by_ai(var/mob/user)
	return TRUE

/datum/ai_icon/malf
	name = "Unlawed"
	alive_icon = "ai-malf"
	alive_light = "#45644b"

/datum/ai_icon/malf/New()
	..()
	name = "[name] (Malf)"

/datum/ai_icon/malf/may_used_by_ai(var/mob/living/silicon/ai/AI)
	return istype(AI) && AI.is_malf_or_traitor()

/datum/ai_icon/red
	name = "Red"
	alive_icon = "ai-red"
	alive_light = "#f04848"
	dead_icon = "ai-malf-crash"

/datum/ai_icon/green
	name = "Green"
	alive_icon = "ai-wierd"
	alive_light = "#00ff99"
	dead_icon = "ai-wierd-crash"

/datum/ai_icon/blue
	name = "Blue"
	alive_icon = "ai"
	alive_light = "#81ddff"

/datum/ai_icon/angry
	name = "Angry"
	alive_icon = "ai-angryface"
	alive_light = "#ffff33"

/datum/ai_icon/bliss
	name = "Bliss"
	alive_icon = "ai-bliss"
	alive_light = "#5c7a4a"

/datum/ai_icon/chatterbox
	name = "Chatterbox"
	alive_icon = "ai-president"
	alive_light = "#40666b"

/datum/ai_icon/database
	name = "Database"
	alive_icon = "ai-database"
	dead_icon = "ai-database-crash"

/datum/ai_icon/dorf
	name = "Dorf"
	alive_icon = "ai-dorf"

/datum/ai_icon/dugtodeep
	name = "Dug Too Deep"
	alive_icon = "ai-toodeep"
	alive_light = "#81ddff"

/datum/ai_icon/firewall
	name = "Firewall"
	alive_icon = "ai-magma"
	alive_light = "#ff4126"

/datum/ai_icon/glitchman
	name = "Glitchman"
	alive_icon = "ai-glitchman"
	dead_icon = "ai-glitchman-crash"

/datum/ai_icon/goon
	name = "Goon"
	alive_icon = "ai-goon"
	alive_light = "#3e5c80"
	dead_icon = "ai-goon-crash"

/datum/ai_icon/heartline
	name = "Heartline"
	alive_icon = "ai-heartline"
	dead_icon = "ai-heartline_dead"

/datum/ai_icon/helios
	name = "Helios"
	alive_icon = "ai-helios"
	alive_light = "#f2cf73"

/datum/ai_icon/inverted
	name = "Inverted"
	alive_icon = "ai-u"
	alive_light = "#81ddff"

/datum/ai_icon/lonestar
	name = "Lonestar"
	alive_icon = "ai-lonestar"
	alive_light = "#58751c"

/datum/ai_icon/matrix
	name = "Matrix"
	alive_icon = "ai-matrix"
	alive_light = "#449944"

/datum/ai_icon/monochrome
	name = "Monochrome"
	alive_icon = "ai-mono"
	alive_light = "#585858"

/datum/ai_icon/nanotrasen
	name = "NanoTrasen"
	alive_icon = "ai-nanotrasen"
	alive_light = "#000029"

/datum/ai_icon/rainbow
	name = "Rainbow"
	alive_icon = "ai-clown"
	alive_light = "#e50213"

/datum/ai_icon/smiley
	name = "Smiley"
	alive_icon = "ai-smiley"
	alive_light = "#f3dd00"

/datum/ai_icon/soviet
	name = "Soviet"
	alive_icon = "ai-redoctober"
	alive_light = "#ff4307"
	dead_icon = "ai-soviet-crash"

/datum/ai_icon/Static
	name = "Static"
	alive_icon = "ai-static"
	alive_light = "#4784c1"
	dead_icon = "ai-static-crash"

/datum/ai_icon/text
	name = "Text"
	alive_icon = "ai-text"

/datum/ai_icon/trapped
	name = "Trapped"
	alive_icon = "ai-hades"
	dead_icon = "ai-hades-crash"

/datum/ai_icon/triumvirate
	name = "Triumvirate"
	alive_icon = "ai-triumvirate"
	alive_light = "#020b2b"

/datum/ai_icon/triumvirate_static
	name = "Triumvirate Static"
	alive_icon = "ai-static"
	alive_light = "#020b2b"

/datum/ai_icon/hotdogger
	name = "Dancing Hotdog"
	alive_icon = "ai-hotdog"
	alive_light = "#81ddff"

/datum/ai_icon/malf/clown
	name = "Clown"
	alive_icon = "ai-clown2"
	alive_light = "#e50213"
	dead_icon = "ai-clown2-crash"

//infinity Changes: Icons from VG station
/datum/ai_icon/fabulous
	name = "VG_Fabulous"
	alive_icon = "ai-fabulous"
	alive_light = "#001542"

/datum/ai_icon/girl
	name = "VG_Girl"
	alive_icon = "ai-girl"

/datum/ai_icon/malf/girl
	name = "VG_Girl_malf"
	alive_icon = "ai-girl-malf"

/datum/ai_icon/boy
	name = "VG_boy"
	alive_icon = "ai-boy"
	alive_light = "#81ddff"

/datum/ai_icon/malf/boy
	name = "VG_Boy_malf"
	alive_icon = "ai-boy-malf"
	alive_light = "#81ddff"

/datum/ai_icon/alien
	name = "VG_Alien"
	alive_icon = "ai-alien"
	alive_light = "#31003e"
	dead_icon = "ai-alien-crash"

/datum/ai_icon/SindiKot
	name = "VG_SindiCat"
	alive_icon = "ai-syndicatmeow"
	alive_light = "#ff008d"

/datum/ai_icon/wasp
	name = "VG_Wasp"
	alive_icon = "ai-wasp"
	alive_light = "#ffce00"

/datum/ai_icon/presid
	name = "VG_President"
	alive_icon = "ai-pres"
	alive_light = "#009630"

/datum/ai_icon/angel
	name = "VG_Angel"
	alive_icon = "ai-angel"
	alive_light = "#faffae"
	dead_icon = "ai-angel-crash"

//TG Icons
/datum/ai_icon/thinking
	name = "TG_thinking"
	alive_icon = "ai-thinking"
	dead_icon = "ai-thinking_dead"

/datum/ai_icon/random
	name = "TG_random"
	alive_icon = "ai-random"

/datum/ai_icon/gondola
	name = "TG_gondola"
	alive_icon = "ai-gondola"

//Elar Icons
/datum/ai_icon/citadel
	name = "Citadel AI"
	alive_icon = "citadel"
	alive_light = "#5600ff"

/datum/ai_icon/vega
	name = "Vega"
	alive_icon = "ai-vega"
	alive_light = "#6000ff"
	dead_icon = "ai-vega-dead"

//Bay Custom Icons
/datum/ai_icon/atlantiscze
	name = "Atlantiscze"
	alive_icon = "atlantiscze-ai"
	alive_light = "#009c27"
	dead_icon = "atlantiscze-ai-crash"