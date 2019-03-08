// Used by robots and robot preferences.
GLOBAL_LIST_INIT(robot_module_types, list(
	"Standard", "Engineering", "Surgeon",  "Crisis",
	"Miner",    "Janitor",     "Service",  "Clerical", "Security",
	"Research"
)) // This shouldn't be a static list. Am I the only one who cares about extendability around here?

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

GLOBAL_LIST_INIT(music_tracks, list(
	"Special New Year" = /music_track/somebody,
	"SNY: Kazac" = /music_track/kazac,
	"SNY: Forever Young" = /music_track/molodoy,
	"SNY: Atom" = /music_track/atom,
	"SNY: 16 tonnes" = /music_track/tonnes,
	"SNY: Let in snow" = /music_track/snow,
	"SNY: Blue Moon" = /music_track/blue_moon,
	"SNY: Big Iron" = /music_track/iron,
	"SNY: River Flows in You" = /music_track/river,
	"SNY: Novoya Zemlya in window" = /music_track/zemlyane,
	"SNY: Love the way you lie" = /music_track/love,
	"SNY: Somebody" = /music_track/somebody,
	"SNY: Hydrogen" = /music_track/hydrogen,
	"A light in the Darkness" = /music_track/torch,
	"Beyond" = /music_track/ambispace,
	"Blues in Velvet Room" = /music_track/bluesinvelvetroom,
	"Creep" = /music_track/creep,
	"Clouds of Fire" = /music_track/clouds_of_fire,
	"Comet Haley" = /music_track/comet_haley,
	"D`Bert" = /music_track/dilbert,
	"D`Fort" = /music_track/df_theme,
	"Endless Space" = /music_track/endless_space,
	"Elevator" = /music_track/elevator,
	"Floating" = /music_track/floating,
	"Every light is blinking at once" = /music_track/elibao,
	"Maschine Klash" = /music_track/digit_one,
	"Hurt" = /music_track/hurt,
	"High Radiation" = /music_track/radiation,
	"Humanity Stars" = /music_track/human,
	"Lasers" = /music_track/lasers,
	"Lone Digger" = /music_track/digger,
	"Memories of Lysendraa" = /music_track/lysendraa,
	"Make This Right" = /music_track/right,
	"Marhaba" = /music_track/marhaba,
	"Night Call" = /music_track/nightcall,
	"Night City" = /music_track/miami,
	"Fleet Party Theme" = /music_track/one_loop,
	"Salute John" = /music_track/salutjohn,
	"Space Oddity" = /music_track/space_oddity,
	"Scratch" = /music_track/level3_mod,
	"Trai`Tor" = /music_track/absconditus,
	"Treacherous Voyage " = /music_track/treacherous_voyage,
	"Through the Times" = /music_track/chasing_time,
	"Thunderdome" = /music_track/thunderdome,
	"Wonderful Lady" = /music_track/wonderful,
	"When We Stand Together" = /music_track/together,
	"Wake" = /music_track/wake,
	"Phoron will make us Rich" = /music_track/pwmur,
))

/proc/setup_music_tracks(var/list/tracks)
	. = list()
	var/track_list = LAZYLEN(tracks) ? tracks : GLOB.music_tracks
	for(var/track_name in track_list)
		var/track_path = track_list[track_name]
		. += new/datum/track(track_name, track_path)

GLOBAL_LIST_INIT(possible_cable_colours, SetupCableColors())

/proc/SetupCableColors()
	. = list()

	var/invalid_cable_coils = list(
		/obj/item/stack/cable_coil/single,
		/obj/item/stack/cable_coil/cut,
		/obj/item/stack/cable_coil/cyborg,
		/obj/item/stack/cable_coil/random
	)

	var/special_name_mappings = list(/obj/item/stack/cable_coil = "Red")

	for(var/coil_type in (typesof(/obj/item/stack/cable_coil) - invalid_cable_coils))
		var/name = special_name_mappings[coil_type] || capitalize(copytext_after_last("[coil_type]", "/"))

		var/obj/item/stack/cable_coil/C = coil_type
		var/color = initial(C.color)

		.[name] = color
	. = sortAssoc(.)
