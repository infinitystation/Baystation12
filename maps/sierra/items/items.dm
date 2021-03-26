/*******************
sierra specific items
*******************/

/obj/item/weapon/storage/backpack/explorer
	name = "explorer backpack"
	desc = "A rugged backpack."
	icon_state = "exppack"

/obj/item/weapon/storage/backpack/satchel_explorer
	name = "explorer satchel"
	desc = "A rugged satchel for field work."
	icon_state = "satchel-exp"
	worn_access = TRUE

/obj/item/weapon/storage/backpack/messenger/explorer
	name = "explorer messenger bag"
	desc = "A rugged backpack worn over one shoulder."
	icon_state = "courierbagexp"

/***********
Unique items
***********/

/obj/item/weapon/pen/multi/cmd/hop
	name = "head of personnel's pen"
	icon = 'maps/sierra/icons/obj/uniques.dmi'
	icon_state = "pen_xo"
	desc = "A slightly bulky pen with a silvery case. Twisting the top allows you to switch the nib for different colors."

/obj/item/weapon/pen/multi/cmd/captain
	name = "captain's pen"
	icon = 'maps/sierra/icons/obj/uniques.dmi'
	icon_state = "pen_co"
	desc = "A slightly bulky pen with a golden case. Twisting the top allows you to switch the nib for different colors."

/obj/item/weapon/pen/multi/cmd/attack_self(mob/user)
	if(++selectedColor > 3)
		selectedColor = 1
	colour = colors[selectedColor]
	to_chat(user, "<span class='notice'>Changed color to '[colour].'</span>")

/obj/item/weapon/storage/fakebook
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
			/obj/item/weapon/reagent_containers/pill/cyanide,
			/obj/item/weapon/paper/sierrau/liason_note
	)

/obj/effect/paint/hull
	color = COLOR_HULL

/obj/item/device/boombox/anchored //for bar's private rooms
	name = "stationary boombox"
	anchored = 1

/obj/item/device/boombox/anchored/attack_hand(var/mob/user)
	interact(user)

/obj/item/tape/research
	req_access = list(list(access_research, access_explorer))

/******
Passports
******/

/obj/item/weapon/passport
	name = "passport"
	icon = 'maps/torch/icons/obj/uniques.dmi'
	icon_state = "passport"
	force = 0.5
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("whipped")
	hitsound = 'sound/weapons/towelwhip.ogg'
	desc = "A passport. Its origin seems unknown."
	var/info //Everything inside. You can only see this if you open the passport by yourself.
	var/fingerprint_hash //Kinda identification.

/obj/item/weapon/passport/proc/set_info(mob/living/carbon/human/H)
	if(!istype(H))
		return
	var/decl/cultural_info/culture = H.get_cultural_value(TAG_HOMEWORLD)
	var/pob = culture ? culture.name : "Unset"
	if(H.dna)
		fingerprint_hash = md5(H.dna.uni_identity)
	else
		fingerprint_hash = "N/A"
	info = "\icon[src] [src]:\nName: [H.real_name]\nSpecies: [H.get_species()]\nGender: [gender2text(H.gender)]\nAge: [H.age]\nPlace of Birth: [pob]\nFingerprint: [fingerprint_hash]"

/obj/item/weapon/passport/attack_self(mob/user as mob)
	user.visible_message(SPAN_NOTICE("[user] opens and checks [src]."), \
		SPAN_NOTICE("You open [src] and check for some main information."), \
		SPAN_ITALIC("You hear the faint rustle of pages."))
	if(info)
		to_chat(user, "[info].")
	else
		to_chat(user, SPAN_WARNING("[src] is completely blank!"))

/obj/item/weapon/passport/scg
	name = "\improper SCG passport"
	icon_state = "passport_scg"
	desc = "A passport from the Sol Central Government."

/obj/item/weapon/passport/earth
	name = "\improper Earth passport"
	icon_state = "passport_scg2"
	desc = "A passport from the Earth, within Sol Central Government space."

/obj/item/weapon/passport/venus
	name = "\improper Venusian passport"
	icon_state = "passport_scg2"
	desc = "A passport from Venus, within Sol Central Government space."

/obj/item/weapon/passport/luna
	name = "\improper Luna passport"
	icon_state = "passport_scg2"
	desc = "A passport from Luna, within Sol Central Government space."

/obj/item/weapon/passport/mars
	name = "\improper Martian passport"
	icon_state = "passport_scg2"
	desc = "A passport from Mars, within Sol Central Government space."

/obj/item/weapon/passport/phobos
	name = "\improper Phobos passport"
	icon_state = "passport_scg2"
	desc = "A passport from Phobos, within Sol Central Government space."

/obj/item/weapon/passport/ceres
	name = "\improper Ceres passport"
	icon_state = "passport_scg2"
	desc = "A passport from Ceres, within Sol Central Government space."

/obj/item/weapon/passport/pluto
	name = "\improper Plutonian passport"
	icon_state = "passport_scg2"
	desc = "A passport from Pluto, within Sol Central Government space."

/obj/item/weapon/passport/tiamat
	name = "\improper Tiamat passport"
	icon_state = "passport_scg2"
	desc = "A passport from Tiamat, within Sol Central Government space."

/obj/item/weapon/passport/eos
	name = "\improper Eos passport"
	icon_state = "passport_scg2"
	desc = "A passport from Eos, within Sol Central Government space."

/obj/item/weapon/passport/ceti_epsilon
	name = "\improper Cetite passport"
	icon_state = "passport_scg2"
	desc = "A passport from Ceti Epsilon, within Sol Central Government space."

/obj/item/weapon/passport/lordania
	name = "\improper Lordanian passport"
	icon_state = "passport_scg2"
	desc = "A passport from Lordania, within Sol Central Government space."

/obj/item/weapon/passport/kingston
	name = "\improper Kingstonian passport"
	icon_state = "passport_scg2"
	desc = "A passport from Kingston, within Sol Central Government space."

/obj/item/weapon/passport/cinu
	name = "\improper Cinusian passport"
	icon_state = "passport_scg2"
	desc = "A passport from Cinu, within Sol Central Government space."

/obj/item/weapon/passport/yuklid
	name = "\improper Yuklid V passport"
	icon_state = "passport_scg2"
	desc = "A passport from Yuklid V, within Sol Central Government space."

/obj/item/weapon/passport/lorriman
	name = "\improper Lorriman passport"
	icon_state = "passport_scg2"
	desc = "A passport from Gesshire, near-independent scientific colony within Sol Central Government space."

/obj/item/weapon/passport/tersten
	name = "\improper Tersten passport"
	icon_state = "passport_scg2"
	desc = "A passport from Tersten, within Sol Central Government space."

/obj/item/weapon/passport/south_gaia
	name = "\improper Southern Gaian passport"
	icon_state = "passport_scg2"
	desc = "A passport from the southern part of Gaia, under control of the Sol Central Government."

/obj/item/weapon/passport/iccg
	name = "\improper ICCG passport"
	icon_state = "passport_iccg"
	desc = "A passport from the Independent Colonial Confederation of Gilgamesh."

/obj/item/weapon/passport/north_gaia
	name = "\improper Northern Gaian passport"
	icon_state = "passport_iccg2"
	desc = "A passport from the northern part of Gaia, under control of the Independent Colonial Confederation of Gilgamesh."

/obj/item/weapon/passport/terra
	name = "\improper Terran passport"
	icon_state = "passport_iccg2"
	desc = "A passport from Terra, within ICCG space."

/obj/item/weapon/passport/novayazemlya
	name = "\improper Novaya Zemlya passport"
	icon_state = "passport_iccg2"
	desc = "A passport from Novaya Zemlya, within ICCG space."

/obj/item/weapon/passport/saveel
	name = "\improper Saveel passport"
	icon_state = "passport"
	desc = "A passport from Saveel, an isolationist frontier colony."

/obj/item/weapon/passport/magnitka
	name = "\improper Magnitkan passport"
	icon_state = "passport"
	desc = "A passport from Magnitka, an independant colony."

/obj/item/weapon/passport/empiremohranda
	name = "\improper Mohrandade passport"
	icon_state = "passport"
	desc = "A passport from the Empire of Mohranda, a frontier empire established on Lohrene and Mohranda, in the Luggust system."