/*******************
sierra specific items
*******************/

/obj/item/storage/backpack/explorer
	name = "explorer backpack"
	desc = "A rugged backpack."
	icon_state = "exppack"

/obj/item/storage/backpack/satchel_explorer
	name = "explorer satchel"
	desc = "A rugged satchel for field work."
	icon_state = "satchel-exp"
	worn_access = TRUE

/obj/item/storage/backpack/messenger/explorer
	name = "explorer messenger bag"
	desc = "A rugged backpack worn over one shoulder."
	icon_state = "courierbagexp"

/***********
Unique items
***********/

/obj/item/pen/multi/cmd/hop
	name = "head of personnel's pen"
	icon = 'maps/sierra/icons/obj/uniques.dmi'
	icon_state = "pen_xo"
	desc = "A slightly bulky pen with a silvery case. Twisting the top allows you to switch the nib for different colors."

/obj/item/pen/multi/cmd/captain
	name = "captain's pen"
	icon = 'maps/sierra/icons/obj/uniques.dmi'
	icon_state = "pen_co"
	desc = "A slightly bulky pen with a golden case. Twisting the top allows you to switch the nib for different colors."

/obj/item/pen/multi/cmd/attack_self(mob/user)
	if(++selectedColor > 3)
		selectedColor = 1
	colour = colors[selectedColor]
	to_chat(user, "<span class='notice'>Changed color to '[colour].'</span>")

/obj/item/storage/fakebook
	name = "Workplace Crisis Management"
	desc = "Also known as 'I fucked up, what do?'. A very popular book among the NanoTrasen management."
	icon = 'icons/obj/library.dmi'
	icon_state = "booknanoregs"
	attack_verb = list("bashed", "whacked", "educated")
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = 2
	startswith = list(
			/obj/item/reagent_containers/pill/cyanide,
			/obj/item/paper/sierrau/liason_note
	)

/obj/effect/paint/hull
	color = "#436b8e"

/obj/item/device/boombox/anchored //for bar's private rooms
	name = "stationary boombox"
	anchored = TRUE

/obj/item/device/boombox/anchored/attack_hand(var/mob/user)
	interact(user)

/obj/item/tape/research
	req_access = list(list(access_research, access_explorer))

/******
Passports
******/

// SolGov Passports
/obj/item/passport/scg
	name = "\improper SCG passport"
	icon_state = "passport_scg"
	desc = "A passport from the Sol Central Government."

/obj/item/passport/scg/earth
	name = "\improper Earth passport"
	desc = "A passport from the Earth, within Sol Central Government space."

/obj/item/passport/scg/venus
	name = "\improper Venusian passport"
	desc = "A passport from Venus, within Sol Central Government space."

/obj/item/passport/scg/luna
	name = "\improper Luna passport"
	desc = "A passport from Luna, within Sol Central Government space."

/obj/item/passport/scg/mars
	name = "\improper Martian passport"
	desc = "A passport from Mars, within Sol Central Government space."

/obj/item/passport/scg/phobos
	name = "\improper Phobos passport"
	desc = "A passport from Phobos, within Sol Central Government space."

/obj/item/passport/scg/ceres
	name = "\improper Ceres passport"
	desc = "A passport from Ceres, within Sol Central Government space."

/obj/item/passport/scg/pluto
	name = "\improper Plutonian passport"
	desc = "A passport from Pluto, within Sol Central Government space."

/obj/item/passport/scg/tiamat
	name = "\improper Tiamat passport"
	desc = "A passport from Tiamat, within Sol Central Government space."

/obj/item/passport/scg/gauss
	name = "\improper Gauss passport"
	desc = "A passport from Gauss, within Sol Central Government space."

/obj/item/passport/scg/ceti_epsilon
	name = "\improper Cetite passport"
	desc = "A passport from Ceti Epsilon, within Sol Central Government space."

/obj/item/passport/scg/lordania
	name = "\improper Lordanian passport"
	desc = "A passport from Lordania, within Sol Central Government space."

/obj/item/passport/scg/kingston
	name = "\improper Kingstonian passport"
	desc = "A passport from Kingston, within Sol Central Government space."

/obj/item/passport/scg/cinu
	name = "\improper Cinusian passport"
	desc = "A passport from Cinu, within Sol Central Government space."

/obj/item/passport/scg/yuklid
	name = "\improper Yuklid V passport"
	desc = "A passport from Yuklid V, within Sol Central Government space."

/obj/item/passport/scg/lorriman
	name = "\improper Lorriman passport"
	desc = "A passport from Gesshire, near-independent scientific colony within Sol Central Government space."

/obj/item/passport/scg/tersten
	name = "\improper Tersten passport"
	desc = "A passport from Tersten, within Sol Central Government space."

/obj/item/passport/scg/south_gaia
	name = "\improper Southern Gaian passport"
	desc = "A passport from the southern part of Gaia, under control of the Sol Central Government."

/obj/item/passport/scg/birdcage
	name = "\improper Colchis passport"
	icon_state = "passport"
	desc = "A passport from Colchis habitat within SCG space, commonly known as Birdcage."


// ICCG Passports
/obj/item/passport/iccg
	name = "\improper ICCG passport"
	icon_state = "passport_iccg"
	desc = "A passport from the Independent Colonial Confederation of Gilgamesh."

/obj/item/passport/iccg/north_gaia
	name = "\improper Northern Gaian passport"
	desc = "A passport from the northern part of Gaia, under control of the Independent Colonial Confederation of Gilgamesh."

/obj/item/passport/iccg/terra
	name = "\improper Terran passport"
	desc = "A passport from Terra, within ICCG space."

/obj/item/passport/iccg/novayazemlya
	name = "\improper Novaya Zemlya passport"
	desc = "A passport from Novaya Zemlya, within ICCG space."


// independent
/obj/item/passport/independent
	name = "\improper Independent passport"
	icon_state = "passport"
	desc = "Passport of one of the many independent colonies"

/obj/item/passport/independent/magnitka
	name = "\improper Magnitkan passport"
	desc = "A passport from Magnitka, an independent colony."

/obj/item/passport/independent/kaldark
	name = "\improper Kaldark passport"
	desc = "A passport from Kaldark, an independent colony."

/obj/item/passport/independent/brinkburn
	name = "\improper Brinkburn passport"
	desc = "A passport from Brinkburn, an independent colony."

/obj/item/passport/independent/mirania
	name = "\improper Mirania passport"
	desc = "A passport from Mirania, an independent colony."

/obj/item/passport/independent/avalon
	name = "\improper Avalon passport"
	desc = "A passport from Avalon, an independent colony."

/obj/item/passport/independent/eremus
	name = "\improper Eremus passport"
	icon_state = "passport"
	desc = "A passport from Eremus, the most populated system bordering Resomi Empire."

/obj/item/passport/independent/asranda
	name = "\improper Randian passport"
	icon_state = "passport"
	desc = "A passport issued by the Republic of Asranda, an isolated colony resembling long-gone Resomi Republic."


// xeno passports
/obj/item/passport/xeno
	name = "\improper Xeno passport"
	icon = 'infinity/icons/obj/passports.dmi'
	icon_state = "passport"
	desc = "A passport for Xenos."

/obj/item/passport/xeno/tajara
	name = "\improper Tajaran passport"
	icon = 'infinity/icons/obj/passports.dmi'
	icon_state = "passport_taj"
	desc = "A passport that apparently belongs to the Tajara."

/obj/item/passport/xeno/resomi
	name = "\improper Resomi registration document"
	icon_state = "passport"
	desc = "Something like a passport for Resomi."

/obj/item/passport/xeno/unathi
	name = "\improper Unathi registration document"
	icon_state = "passport"
	desc = "Passport, belongs to Unathi species."
