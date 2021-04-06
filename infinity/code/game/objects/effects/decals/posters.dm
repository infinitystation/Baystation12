//spice kittenz posters
/*
/decl/poster/tjpost/New()
	..()
	. = pick(subtypesof(/decl/poster/tjpost))
*/
/obj/structure/sign/poster/tjpost
//	desc = "A large piece of space-resistant printed paper with an emblem of CCA."
	icon = 'infinity/icons/obj/posters.dmi'
	icon_state = "tposter"

/obj/structure/sign/poster/tjpost/New()
	if(!poster_type)
		poster_type = pick(subtypesof(/decl/poster/tjpost))
	..()
/*
/obj/structure/sign/poster/tjpost/tj_1
	icon_state = "tposter_1"
	poster_type = /decl/poster/tjpost/tj_1
*/
/obj/structure/sign/poster/tjpost/tj_2
	icon_state = "tposter_2"
	poster_type = /decl/poster/tjpost/tj_2

/obj/structure/sign/poster/tjpost/tj_3
	icon_state = "tposter_3"
	poster_type = /decl/poster/tjpost/tj_3

/obj/structure/sign/poster/tjpost/tj_4
	icon_state = "tposter_4"
	poster_type = /decl/poster/tjpost/tj_4

/obj/structure/sign/poster/tjpost/tj_5
	icon_state = "tposter_5"
	poster_type = /decl/poster/tjpost/tj_5

/obj/structure/sign/poster/tjpost/tj_6
	icon_state = "tposter_6"
	poster_type = /decl/poster/tjpost/tj_6

/obj/structure/sign/poster/tjpost/tj_7
	icon_state = "tposter_7"
	poster_type = /decl/poster/tjpost/tj_7

/obj/structure/sign/poster/tjpost/tj_8
	icon_state = "tposter_8"
	poster_type = /decl/poster/tjpost/tj_8

/obj/structure/sign/poster/tjpost/tj_9
	icon_state = "tposter_9"
	poster_type = /decl/poster/tjpost/tj_9

/obj/structure/sign/poster/tjpost/tj_10
	icon_state = "tposter_10"
	poster_type = /decl/poster/tjpost/tj_10

/obj/structure/sign/poster/tjpost/tj_11
	icon_state = "tposter_11"
	poster_type = /decl/poster/tjpost/tj_11

/obj/structure/sign/poster/tjpost/tj_12
	icon_state = "tposter_12"
	poster_type = /decl/poster/tjpost/tj_12

/obj/structure/sign/poster/tjpost/tj_13
	icon_state = "tposter_13"
	poster_type = /decl/poster/tjpost/tj_13

/obj/structure/sign/poster/tjpost/tj_14
	icon_state = "tposter_14"
	poster_type = /decl/poster/tjpost/tj_14

/obj/structure/sign/poster/tjpost/tj_15
	icon_state = "tposter_15"
	poster_type = /decl/poster/tjpost/tj_15

/obj/structure/sign/poster/tjpost/tj_16
	icon_state = "tposter_16"
	poster_type = /decl/poster/tjpost/tj_16

/obj/structure/sign/poster/tjpost/tj_17
	icon_state = "tposter_17"
	poster_type = /decl/poster/tjpost/tj_17

/obj/structure/sign/poster/tjpost/tj_18
	icon_state = "tposter_18"
	poster_type = /decl/poster/tjpost/tj_18

/obj/structure/sign/poster/tjpost/tj_19
	icon_state = "tposter_19"
	poster_type = /decl/poster/tjpost/tj_19

/obj/structure/sign/poster/tjpost/tj_20
	icon_state = "tposter_20"
	poster_type = /decl/poster/tjpost/tj_20

/obj/structure/sign/poster/tjpost/tj_21
	icon_state = "tposter_21"
	poster_type = /decl/poster/tjpost/tj_21

/obj/structure/sign/poster/tjpost/tj_22
	icon_state = "tposter_22"
	poster_type = /decl/poster/tjpost/tj_22
/decl/poster/tjpost
	icon_state = "tposter"
	name = "Liberation day"
	desc = "A memorable photo, which depicted how the soldiers of the Kaytam clan raise their flag \
	over the overseer citadel in Naliar. Looks like one of CCA posters..."
/* let's try to not use posters of specific groups, like governments or corporations
/decl/poster/tjpost/tj_1
	icon_state = "tposter_1"
	name = "CCA emblem"
	desc = "A poster with an emblem of CCA."
*/
/decl/poster/tjpost/tj_2
	icon_state = "tposter_2"
	name = "Patriotic poster"
	desc = "It reminds you that the galaxy around is not very friendly, and you should watch your safety yourself."

/decl/poster/tjpost/tj_3
	icon_state = "tposter_3"
	name = "Technical poster"
	desc = "It is a guide on how to use the carabiner TV-3C, there is detailed \
	information about assembly, disassembly, and maintenance, but one of the written dialects of Ahdomai. \
	An another one of CCA posters."

/decl/poster/tjpost/tj_4
	icon_state = "tposter_4"
	name = "Jet poster"
	desc = "It shows one of the most common fighter-interceptor FLA. An image at port shows CCA insignia."

/decl/poster/tjpost/tj_5
	icon_state = "tposter_5"
	name = "Heli-poster"
	desc = "It shows transport helicopters flying over the ruins of the suburbs of Naliar. \
	The photo was taken shortly before the final assault, and saw him every tajaran. \
	An another one historian posters of CCA."

/decl/poster/tjpost/tj_6
	icon_state = "tposter_6"
	name = "FLA MBT-86"
	desc = "It shows one of the FLA MBT used by the eastern forces at the end of the Conflict. \
	An another one historian posters of CCA."

/decl/poster/tjpost/tj_7
	icon_state = "tposter_7"
	name = "Sa'a poster"
	desc = "It offers views of the mountains of Sa'a, Ahdomai."

/decl/poster/tjpost/tj_8
	icon_state = "tposter_8"
	name = "First mech poster"
	desc = "It shows the first combat mech created by the Kaytam clan used in urban combat in Naliar. \
	No CCA symbol, hm..."

/decl/poster/tjpost/tj_9
	icon_state = "tposter_9"
	name = "CCA Army"
	desc = "It shows one of the tanks of Zhan-Hazan, and behind him you can see the attack helicopter."

/decl/poster/tjpost/tj_10
	icon_state = "tposter_10"
	name = "Assault Drones"
	desc = "This poster depicts the flying combat drones times of Ahdomai Conflict."

/decl/poster/tjpost/tj_11
	icon_state = "tposter_11"
	name = "Sunrise on S'Randjiir"
	desc = "The picture was taken from the dome of one of the gas producing factories on it."

/decl/poster/tjpost/tj_12
	icon_state = "tposter_12"
	name = "Ir-Shira class station"
	desc = "One of the mobile station class of Ir-Shira, descended from the shipyards over \
	Adamem to gateway in the neighboring system. CCA insignia at hull."

/decl/poster/tjpost/tj_13
	icon_state = "tposter_13"
	name = "109 year"
	desc = "Each tajaran knows what happened in the 109 year. The first satellite was launched into Ahdomai orbit."

/decl/poster/tjpost/tj_14
	icon_state = "tposter_14"
	name = "298 year"
	desc = "First crew change in orbit of the first space station of Ahdomai."

/decl/poster/tjpost/tj_15
	icon_state = "tposter_15"
	name = "Winter night"
	desc = "You see one of the quiet winter nights of Ahdomai, \
	it becomes easier from the memories of the beauty of your home. Even if you aren't tajara."

/decl/poster/tjpost/tj_16
	icon_state = "tposter_16"
	name = "Ta'Apa Charka"
	desc = "One of the icebergs on the holy land for tajaran."

/decl/poster/tjpost/tj_17
	icon_state = "tposter_17"
	name = "Maya'Thcha mountaints"
	desc = "Mountains Maya'Thcha in its beauty, Ahdomai."

/decl/poster/tjpost/tj_18
	icon_state = "tposter_18"
	name = "Sunrise in the forest"
	desc = "Sunrise in one of the forests. Nice and simple. Naturally. Corporative woodchoppers will be there soon..."

/decl/poster/tjpost/tj_19
	icon_state = "tposter_19"
	name = "Bayan"
	desc = "The Bayan village in the winter. Looks like some old wooden town at hill..."

/decl/poster/tjpost/tj_20
	icon_state = "tposter_20"
	name = "Mirr-Shorrkra"
	desc = "View of Mirr-Shorrkra from the Naff'Yark, Ahdomai."

/decl/poster/tjpost/tj_21
	icon_state = "tposter_21"
	name = "Unknown liberator"
	desc = "You can see the beautiful spokeswoman of tajara that fought for the liberation of Ahdomai \
	during a long war."

/decl/poster/tjpost/tj_22
	icon_state = "tposter_22"
	name = "Mryarov Mraporting"
	desc = "There is a drone blimp-bomber of the Kaytam clan."

//spess humen posterz (humpost-kompost hddd)
/*
/decl/poster/humpost/New()
	..()
	if(!poster_type)
		poster_type = pick(subtypesof(/decl/poster/humpost))
*/

/obj/structure/sign/poster/humpost
	name = "poster"
	icon = 'infinity/icons/obj/posters.dmi'
	icon_state= "humposter"

/obj/structure/sign/poster/humpost/New()
	if(!poster_type)
		poster_type = pick(subtypesof(/decl/poster/humpost))
	..()
/* animated paper?...
/obj/structure/sign/poster/humpost/hum_1
	icon_state = "humposter_1"
	poster_type = /decl/poster/humpost/hum_1
*/
/*let's try to not use posters of specific groups, like governments or corporations
/obj/structure/sign/poster/humpost/hum_2
	icon_state = "humposter_2"
	poster_type = /decl/poster/humpost/hum_2
*/
/obj/structure/sign/poster/humpost/hum_3
	icon_state = "humposter_3"
	poster_type = /decl/poster/humpost/hum_3
/* unused due someone's report
/obj/structure/sign/poster/humpost/hum_4
	icon_state = "humposter_4"
	poster_type = /decl/poster/humpost/hum_4
*/
/obj/structure/sign/poster/humpost/hum_5
	icon_state = "humposter_5"
	poster_type = /decl/poster/humpost/hum_5
/*let's try to not use posters of specific groups, like governments or corporations
/obj/structure/sign/poster/humpost/hum_6
	icon_state = "humposter_6"
	poster_type = /decl/poster/humpost/hum_6
*/
/obj/structure/sign/poster/humpost/hum_7
	icon_state = "humposter_7"
	poster_type = /decl/poster/humpost/hum_7

/obj/structure/sign/poster/humpost/hum_8
	icon_state = "humposter_8"
	poster_type = /decl/poster/humpost/hum_8

/obj/structure/sign/poster/humpost/hum_9
	icon_state = "humposter_9"
	poster_type = /decl/poster/humpost/hum_9

/obj/structure/sign/poster/humpost/hum_10
	icon_state = "humposter_10"
	poster_type = /decl/poster/humpost/hum_10

/obj/structure/sign/poster/humpost/hum_11
	icon_state = "humposter_11"
	poster_type = /decl/poster/humpost/hum_11

/obj/structure/sign/poster/humpost/hum_12
	icon_state = "humposter_12"
	poster_type = /decl/poster/humpost/hum_12

/obj/structure/sign/poster/humpost/hum_13
	icon_state = "humposter_13"
	poster_type = /decl/poster/humpost/hum_13

/obj/structure/sign/poster/humpost/hum_14
	icon_state = "humposter_14"
	poster_type = /decl/poster/humpost/hum_14
/* we need something like 'contraband = 1' for this sort of posters, cause too political
/obj/structure/sign/poster/humpost/hum_15
	icon_state = "humposter_15"
	poster_type = /decl/poster/humpost/hum_15
*/
/obj/structure/sign/poster/humpost/hum_16
	icon_state = "humposter_16"
	poster_type = /decl/poster/humpost/hum_16

/obj/structure/sign/poster/humpost/hum_17
	icon_state = "humposter_17"
	poster_type = /decl/poster/humpost/hum_17

/obj/structure/sign/poster/humpost/hum_18
	icon_state = "humposter_18"
	poster_type = /decl/poster/humpost/hum_18

/obj/structure/sign/poster/humpost/hum_19
	icon_state = "humposter_19"
	poster_type = /decl/poster/humpost/hum_19
/*
/obj/structure/sign/poster/humpost/hum_20
	icon_state = "humposter_20"
	poster_type = /decl/poster/humpost/hum_20
*/
/obj/structure/sign/poster/humpost/hum_21
	icon_state = "humposter_21"
	poster_type = /decl/poster/humpost/hum_21

/decl/poster/humpost
	icon_state = "humposter"
	name = "Moon City"
	desc = "A photo of the oldest city at the Moon, Sol System - Selena. Looks like it was taken from one of observation towers."

/* animated paper?...
/decl/poster/humpost/hum_1
	icon_state = "humposter_1"
	name = "SCG Peacemakers"
	desc = "Poster calling to join the ranks of the peacemaking forces of the SCG... Wow, it's animated!"
*/
/* let's try to not use posters of specific groups, like governments or corporations
/decl/poster/humpost/hum_2
	icon_state = "humposter_2"
	name = "NanoTrasen"
	desc = "Boring poster of a boring corporation with boring text from a boring person. Smells like profit."
*/
/decl/poster/humpost/hum_3
	icon_state = "humposter_3"
	name = "Bodka"
	desc = "Advertising poster of vodka, drink from real men for real men. Feel like a space bear."
/* unused due someone's report
/decl/poster/humpost/hum_4
	icon_state = "humposter_4"
	name = "S.A.L.O."
	desc = "This poster has a beautiful view of a golden field under azure skies. \
	In the corner - a package of fat, which looks at you seductive boar. Salo - zakuson for real men!"
*/
/decl/poster/humpost/hum_5
	icon_state = "humposter_5"
	name = "Mars Terraforming"
	desc = "What it was before and what it is now. Our future is in our hands."
/* let's try to not use posters of specific groups, like governments or corporations
/decl/poster/humpost/hum_6
	icon_state = "humposter_6"
	name = "SCG emblem"
	desc = "Patriotic poster with an emblem of SCG and some dull text for marine recruiters on it."
*/
/decl/poster/humpost/hum_7
	icon_state = "humposter_7"
	name = "Jeneva"
	desc = "Uhh, Geneva!"

/decl/poster/humpost/hum_8
	icon_state = "humposter_8"
	name = "Alpha Centauri"
	desc = "This poster is dedicated to the colonization of Alpha Centauri, one of the oldest human colonies."

/decl/poster/humpost/hum_9
	icon_state = "humposter_9"
	name = "Gateway"
	desc = "In 2171 first gateway is built in the solar system, connecting it with the Tau Ceti system."

/decl/poster/humpost/hum_10
	icon_state = "humposter_10"
	name = "Bluespace Illuminator"
	desc = "In 2145, humanity accidentally opened the blue space, and on the poster one of the pictures taken from \
	inside the first ship that got there."

/decl/poster/humpost/hum_11
	icon_state = "humposter_11"
	name = "Sea"
	desc = "On the poster view from one of the Islands of Bermuda. A great place, a ticket to which can buy the \
	best workers for only 999.9 thallers."

/decl/poster/humpost/hum_12
	icon_state = "humposter_12"
	name = "First Martian"
	desc = "Jimmy Gideon is the first man to set foot on Mars, the first Martian, the first father of the Governor of \
	Mars."

/decl/poster/humpost/hum_13
	icon_state = "humposter_13"
	name = "Expedition"
	desc = "2301: the Twenty-third Moges expedition started EC."

/decl/poster/humpost/hum_14
	icon_state = "humposter_14"
	name = "Olympus"
	desc = "Spires of Olympus - the capital of Mars and Sol Central Government."
/* we need something like 'contraband = 1' for this sort of posters, cause too political
/decl/poster/humpost/hum_15
	icon_state = "humposter_15"
	name = "Gaya"
	desc = "Join the SCG fleet! Liberate Gaia! Avenge your comrades! Kill Gilgamesh agressors!.. \
	Some old poster from old days."
*/
/decl/poster/humpost/hum_16
	icon_state = "humposter_16"
	name = "Venus"
	desc = "View of one of the best resorts in the galaxy - Verena resorts. Venus - the most expensive, \
	popular and pleasant place to stay!"

/decl/poster/humpost/hum_17
	icon_state = "humposter_17"
	name = "First Spacecraft"
	desc = "2284: the First spacecraft of mankind, equipped with bluespace engine makes its first successful jump."

/decl/poster/humpost/hum_18
	icon_state = "humposter_18"
	name = "WetSkrell"
	desc = "You can see a pretty skrell in red dress and with long headtails, which have decorative bands. \
	It is advertising a site with \"adult recreation procedures\", the wetskrell.nt."

/decl/poster/humpost/hum_19
	icon_state = "humposter_19"
	name = "Explorer"
	desc = "You see a very pumped-up guy with a huge machete. He has good muscle and a face of a real man. \
	You can also read a text at bottom: \"Join the ranks of the Expeditionary Corps - see the start, \
	explore the university!\"... And die far away from home at god-forgotten planet for low payment, yeah."
/*
/decl/poster/humpost/hum_20
	icon_state = "humposter_20"
	name = "Free poster slot"
	desc = "Your desc here"
*/
/decl/poster/humpost/hum_21
	icon_state = "humposter_21"
	name = "Lusty Xeno Specie"
	desc = "An another one poster about some pornsite with potential new sexual xeno species... \
	Who the fuck forget it at the space vessel? May be we haven't enought time with families, but we aren't so mad... \
	Or we are?"
