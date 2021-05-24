// Noises made when hit while typing.
GLOBAL_LIST_INIT(hit_appends, list("-OOF", "-ACK", "-UGH", "-HRNK", "-HURGH", "-GLORF"))

// Some scary sounds.
GLOBAL_LIST_INIT(scarySounds, list(
	'sound/weapons/thudswoosh.ogg',
	'sound/weapons/Taser.ogg',
	'sound/weapons/armbomb.ogg',
	'sound/voice/hiss1.ogg',
	'sound/voice/hiss2.ogg',
	'sound/voice/hiss3.ogg',
	'sound/voice/hiss4.ogg',
	'sound/voice/hiss5.ogg',
	'sound/voice/hiss6.ogg',
	'sound/effects/Glassbr1.ogg',
	'sound/effects/Glassbr2.ogg',
	'sound/effects/Glassbr3.ogg',
	'sound/items/Welder.ogg',
	'sound/items/Welder2.ogg',
	'sound/machines/airlock.ogg',
	'sound/effects/clownstep1.ogg',
	'sound/effects/clownstep2.ogg'
))

// Reference list for disposal sort junctions. Filled up by sorting junction's New()
GLOBAL_LIST_EMPTY(tagger_locations)

GLOBAL_LIST_INIT(station_prefixes, list("", "Imperium", "Heretical", "Cuban",
	"Psychic", "Elegant", "Common", "Uncommon", "Rare", "Unique",
	"Houseruled", "Religious", "Atheist", "Traditional", "Houseruled",
	"Mad", "Super", "Ultra", "Secret", "Top Secret", "Deep", "Death",
	"Zybourne", "Central", "Main", "Government", "Uoi", "Fat",
	"Automated", "Experimental", "Augmented"))

GLOBAL_LIST_INIT(station_names, list("", "Stanford", "Dorf", "Alium",
	"Prefix", "Clowning", "Aegis", "Ishimura", "Scaredy", "Death-World",
	"Mime", "Honk", "Rogue", "MacRagge", "Ultrameens", "Safety", "Paranoia",
	"Explosive", "Neckbear", "Donk", "Muppet", "North", "West", "East",
	"South", "Slant-ways", "Widdershins", "Rimward", "Expensive",
	"Procreatory", "Imperial", "Unidentified", "Immoral", "Carp", "Ork",
	"Pete", "Control", "Nettle", "Aspie", "Class", "Crab", "Fist",
	"Corrogated","Skeleton","Race", "Fatguy", "Gentleman", "Capitalist",
	"Communist", "Bear", "Beard", "Derp", "Space", "Spess", "Star", "Moon",
	"System", "Mining", "Neckbeard", "Research", "Supply", "Military",
	"Orbital", "Battle", "Science", "Asteroid", "Home", "Production",
	"Transport", "Delivery", "Extraplanetary", "Orbital", "Correctional",
	"Robot", "Hats", "Pizza"))

GLOBAL_LIST_INIT(station_suffixes, list("Station", "Frontier",
	"Suffix", "Death-trap", "Space-hulk", "Lab", "Hazard","Spess Junk",
	"Fishery", "No-Moon", "Tomb", "Crypt", "Hut", "Monkey", "Bomb",
	"Trade Post", "Fortress", "Village", "Town", "City", "Edition", "Hive",
	"Complex", "Base", "Facility", "Depot", "Outpost", "Installation",
	"Drydock", "Observatory", "Array", "Relay", "Monitor", "Platform",
	"Construct", "Hangar", "Prison", "Center", "Port", "Waystation",
	"Factory", "Waypoint", "Stopover", "Hub", "HQ", "Office", "Object",
	"Fortification", "Colony", "Planet-Cracker", "Roost", "Fat Camp",
	"Airstrip"))

GLOBAL_LIST_INIT(greek_letters, list("Alpha", "Beta", "Gamma", "Delta",
	"Epsilon", "Zeta", "Eta", "Theta", "Iota", "Kappa", "Lambda", "Mu",
	"Nu", "Xi", "Omicron", "Pi", "Rho", "Sigma", "Tau", "Upsilon", "Phi",
	"Chi", "Psi", "Omega"))

GLOBAL_LIST_INIT(phonetic_alphabet, list("Alpha", "Bravo", "Charlie",
	"Delta", "Echo", "Foxtrot", "Golf", "Hotel", "India", "Juliet",
	"Kilo", "Lima", "Mike", "November", "Oscar", "Papa", "Quebec",
	"Romeo", "Sierra", "Tango", "Uniform", "Victor", "Whiskey", "X-ray",
	"Yankee", "Zulu"))

GLOBAL_LIST_INIT(numbers_as_words, list("One", "Two", "Three", "Four",
	"Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve",
	"Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen",
	"Eighteen", "Nineteen"))

/*GLOBAL_LIST_INIT(music_tracks, list(
//[INF]
	"Kazac" = /decl/audio/track/kazac,
	"Forever Young" = /decl/audio/track/molodoy,
	"Atom" = /decl/audio/track/atom,
	"16 tonnes" = /decl/audio/track/tonnes,
	"Let in snow" = /decl/audio/track/snow,
	"Blue Moon" = /decl/audio/track/blue_moon,
	"Big Iron" = /decl/audio/track/iron,
	"River Flows in You" = /decl/audio/track/river,
	"Novoya Zemlya in window" = /decl/audio/track/zemlyane,
	"Love the way you lie" = /decl/audio/track/love,
	"Somebody" = /decl/audio/track/somebody,
	"Hydrogen" = /decl/audio/track/hydrogen,

	"Silence of Space" = /decl/audio/track/silence_of_space,
	"Fight with oneself" = /decl/audio/track/fight_with_oneself,
//[/INF]
	"A light in the Darkness" = /decl/audio/track/torch,
	"Beyond" = /decl/audio/track/ambispace,
	"Blues in Velvet Room" = /decl/audio/track/bluesinvelvetroom,
	"Creep" = /decl/audio/track/creep,
	"Clouds of Fire" = /decl/audio/track/clouds_of_fire,
	"Comet Haley" = /decl/audio/track/comet_haley,
	"D`Bert" = /decl/audio/track/dilbert,
	"D`Fort" = /decl/audio/track/df_theme,
	"Endless Space" = /decl/audio/track/endless_space,
	"Elevator" = /decl/audio/track/elevator,
	"Floating" = /decl/audio/track/floating,
	"Every light is blinking at once" = /decl/audio/track/elibao,
	"Maschine Klash" = /decl/audio/track/digit_one,
	"Hurt" = /decl/audio/track/hurt,
	"High Radiation" = /decl/audio/track/radiation,
	"Humanity Stars" = /decl/audio/track/human,
	"Lasers" = /decl/audio/track/lasers,
	"Lone Digger" = /decl/audio/track/digger,
	"Memories of Lysendraa" = /decl/audio/track/lysendraa,
	"Make This Right" = /decl/audio/track/right,
	"Marhaba" = /decl/audio/track/marhaba,
	"Night Call" = /decl/audio/track/nightcall,
	"Night City" = /decl/audio/track/miami,
	"Fleet Party Theme" = /decl/audio/track/one_loop,
	"Salute John" = /decl/audio/track/salutjohn,
	"Space Oddity" = /decl/audio/track/space_oddity,
	"Scratch" = /decl/audio/track/level3_mod,
	"Trai`Tor" = /decl/audio/track/absconditus,
	"Treacherous Voyage " = /decl/audio/track/treacherous_voyage,
	"Through the Times" = /decl/audio/track/chasing_time,
	"Thunderdome" = /decl/audio/track/thunderdome,
	"Wonderful Lady" = /decl/audio/track/wonderful,
	"When We Stand Together" = /decl/audio/track/together,
	"Wake" = /decl/audio/track/wake,
	"Phoron will make us Rich" = /decl/audio/track/pwmur,
))*/

/* /proc/setup_music_tracks(var/list/tracks) merge 02 05 2021
	. = list()
	var/track_list = LAZYLEN(tracks) ? tracks : GLOB.music_tracks
	for(var/track_name in track_list)
		var/track_path = track_list[track_name]
		. += new/datum/track(track_name, track_path) */

GLOBAL_LIST_INIT(possible_cable_colours, SetupCableColors())

/proc/SetupCableColors()
	. = list()

	var/invalid_cable_coils = list(
		/obj/item/stack/cable_coil/single,
		/obj/item/stack/cable_coil/cut,
		/obj/item/stack/cable_coil/cyborg,
		/obj/item/stack/cable_coil/fabricator,
		/obj/item/stack/cable_coil/random
	)

	var/special_name_mappings = list(/obj/item/stack/cable_coil = "Red")

	for(var/coil_type in (typesof(/obj/item/stack/cable_coil) - invalid_cable_coils))
		var/name = special_name_mappings[coil_type] || capitalize(copytext_after_last("[coil_type]", "/"))

		var/obj/item/stack/cable_coil/C = coil_type
		var/color = initial(C.color)

		.[name] = color
	. = sortAssoc(.)
