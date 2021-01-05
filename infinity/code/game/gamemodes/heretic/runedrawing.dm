/mob/proc/rune_convert()
	set category = "Cult Magic"
	set name = "Rune: Convertion Ritual"

	make_rune(/obj/effect/rune/convert, tome_required = 1)

/mob/proc/rune_book_summon()
	set category = "Cult Magic"
	set name = "Rune: Attributes Summoning"

	make_rune(/obj/effect/rune/book_summon, cost = 15)

/mob/proc/rune_teleport()
	set category = "Cult Magic"
	set name = "Rune: Teleportation"

	var/obj/effect/rune/teleport/rune = make_rune(/obj/effect/rune/teleport)
	rune.destination = sanitize(input(src, "Choose a new rune name.", "Destination", "") as text|null)

/mob/proc/rune_astral()
	set category = "Cult Magic"
	set name = "Rune: Astral Journey"

	make_rune(/obj/effect/rune/astral)

/mob/proc/rune_offering()
	set category = "Cult Magic"
	set name = "Rune: Offering"

	make_rune(/obj/effect/rune/offering, tome_required = 1)

/mob/proc/rune_spire()
	set category = "Cult Magic"
	set name = "Rune: Spire"

	make_rune(/obj/effect/rune/spire, tome_required = 1)

/mob/proc/rune_curse_pain()
	set category = "Cult Magic"
	set name = "Rune: Pain Curse"

	make_rune(/obj/effect/rune/curse_pain, cost = 20, tome_required = 1)

/mob/proc/rune_chosen()
	set category = "Cult Magic"
	set name = "Rune: Blood Vision"

	make_rune(/obj/effect/rune/chosen)

/mob/proc/rune_wall()
	set category = "Cult Magic"
	set name = "Rune: Shielding"

	make_rune(/obj/effect/rune/wall, cost = 10)

//Tier 2 runes

/mob/proc/rune_armor()
	set category = "Cult Magic"
	set name = "Rune: Armor"

	make_rune(/obj/effect/rune/armor, tome_required = 1)

/mob/proc/rune_cultistshift()
	set category = "Cult Magic"
	set name = "Rune: Bloody Call"

	make_rune(/obj/effect/rune/cultistshift, tome_required = 1)

/mob/proc/rune_spiritrealm()
	set category = "Cult Magic"
	set name = "Rune: Spirit Realm"

	make_rune(/obj/effect/rune/spiritrealm, cost = 15)

/mob/proc/rune_necro_basic()
	set category = "Cult Magic"
	set name = "Rune: Zombification"

	make_rune(/obj/effect/rune/necro_basic, tome_required = 1)

/mob/proc/rune_blooddrain()
	set category = "Cult Magic"
	set name = "Rune: Blood Drain"

	make_rune(/obj/effect/rune/blooddrain, tome_required = 1)

/mob/proc/rune_curse_mirrors()
	set category = "Cult Magic"
	set name = "Rune: Mirror Curse"

	make_rune(/obj/effect/rune/curse_mirrors, cost = 20, tome_required = 1)

//Tier 3 runes

/mob/proc/rune_massshift()
	set category = "Cult Magic"
	set name = "Rune: joined souls"
	 //Very hard rune
	make_rune(/obj/effect/rune/massshift, cost = 15, tome_required = 1)

/mob/proc/rune_god_eye()
	set category = "Cult Magic"
	set name = "Rune: God's Eye"

	make_rune(/obj/effect/rune/god_eye, cost = 10)

/mob/proc/rune_see_ghosts()
	set category = "Cult Magic"
	set name = "Rune: Undead Vision"

	make_rune(/obj/effect/rune/see_ghosts, tome_required = 1)

/mob/proc/bloody_bond()
	set category = "Cult Magic"
	set name = "Rune: Bloody Bond"
	make_rune(/obj/effect/rune/huge/bloody_bond, cost = 20, tome_required = 1)

/mob/proc/rune_blood_boil()
	set category = "Cult Magic"
	set name = "Rune: Blood Boil"

	make_rune(/obj/effect/rune/blood_boil, cost = 25)

/mob/proc/rune_necro_advanced()
	set category = "Cult Magic"
	set name = "Rune: Revival"

	make_rune(/obj/effect/rune/necro_advanced, cost = 20, tome_required = 1)

/mob/proc/rune_dark_chorus()
	set category = "Cult Magic"
	set name = "Rune: Dark Chorus"

	make_rune(/obj/effect/rune/dark_chorus, tome_required = 1)

/mob/proc/rune_weapon()
	set category = "Cult Magic"
	set name = "Rune: Weapon"

	make_rune(/obj/effect/rune/weapon)

/mob/proc/rune_silence()
	set category = "Cult Magic"
	set name = "Rune: Curse of silence"

	make_rune(/obj/effect/rune/silence, cost = 25, tome_required = 1)

//Tier 4 runes

/mob/proc/rune_necro_max()
	set category = "Cult Magic"
	set name = "Rune: Dark Necromancy"

	make_rune(/obj/effect/rune/necro_max, cost = 35, tome_required = 1) //Its KIIIINDA powerful

/mob/proc/rune_wall_mega()
	set category = "Cult Magic"
	set name = "Rune: Shieldcasting"

	make_rune(/obj/effect/rune/wall_mega, cost = 15, tome_required = 1)

/mob/proc/rune_weapon_bloody()
	set category = "Cult Magic"
	set name = "Rune: Bloody Weapon"

	make_rune(/obj/effect/rune/weapon_bloody, cost = 15, tome_required = 1)

/mob/proc/rune_hellhunter()
	set category = "Cult Magic"
	set name = "Rune: Hellhunter Equipment"

	make_rune(/obj/effect/rune/hellhunter, tome_required = 1)

/mob/proc/rune_dark_phoenix()
	set category = "Cult Magic"
	set name = "Rune: Dark Phoenix Curse"

	make_rune(/obj/effect/rune/dark_phoenix, cost = 45, tome_required = 1)

//Tier 5 runes

/mob/proc/apocalypse()
	set category = "Cult Magic"
	set name = "Rune: Apocalypse"
	make_rune(/obj/effect/rune/huge/apocalypse, cost = 55, tome_required = 1)

/mob/proc/narnar()
	set category = "Cult Magic"
	set name = "Rune: Reality Tearing"
	make_rune(/obj/effect/rune/huge/narnar, cost = 60, tome_required = 1)
