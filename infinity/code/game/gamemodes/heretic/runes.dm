var/list/Tier1Runes = 	   list(
								/mob/proc/cult_communicate,
								/mob/proc/rune_convert,
								/mob/proc/rune_book_summon,
								/mob/proc/rune_teleport,
								/mob/proc/rune_astral,
								/mob/proc/rune_offering,
								/mob/proc/rune_spire,
								/mob/proc/rune_curse_pain,
								/mob/proc/rune_chosen,
								/mob/proc/rune_wall,
								/mob/living/carbon/human/proc/activate_carvings
							   )


var/list/Tier2Runes = 	   list(
								/mob/proc/rune_armor,
								/mob/proc/rune_cultistshift,
								/mob/proc/rune_spiritrealm,
								/mob/proc/rune_necro_basic,
								/mob/proc/rune_blooddrain,
								/mob/proc/rune_curse_mirrors
							   )

var/list/Tier3Runes = 	   list(
								/mob/proc/rune_massshift,
								/mob/proc/rune_god_eye,
								/mob/proc/rune_see_ghosts,
								/mob/proc/bloody_bond,
								/mob/proc/rune_blood_boil,
								/mob/proc/rune_necro_advanced,
								/mob/proc/rune_dark_chorus,
								/mob/proc/rune_weapon,
								/mob/proc/rune_silence
							   )

var/list/Tier4Runes =      list(
								/mob/proc/rune_necro_max,
								/mob/proc/rune_wall_mega,
								/mob/proc/rune_weapon_bloody,
								/mob/proc/rune_hellhunter,
								/mob/proc/rune_dark_phoenix
							   )

var/list/TierNarNarRunes = list(
								/mob/proc/apocalypse,
								/mob/proc/narnar
							   )



/mob/proc/make_rune(var/rune, var/cost = 5, var/tome_required = 0)
	var/has_tome = 0
	var/has_robes = 0
	var/cult_ground = 0
	var/has_dagger = 0
	if(istype(get_active_hand(), /obj/item/book/tome) || istype(get_inactive_hand(), /obj/item/book/tome))
		has_tome = 1

	if(!(get_active_hand().sharp || get_inactive_hand().sharp))
		to_chat(src, "<span class='warning'>You can't manage to slise open your finger without anything sharp!</span>")
		return

	else if(tome_required && mob_needs_tome() && !has_tome)
		to_chat(src, "<span class='warning'>This rune is too complex to draw by memory, you need to have a tome in your hand to draw it.</span>")
		return

	if(istype(get_equipped_item(slot_head), /obj/item/clothing/head/culthood) && istype(get_equipped_item(slot_wear_suit), /obj/item/clothing/suit/storage/hooded/cultrobes) && istype(get_equipped_item(slot_shoes), /obj/item/clothing/shoes/cult)) //INF was /obj/item/clothing/suit/cultrobes
		has_robes = 1
	var/turf/T = get_turf(src)
	if(T.holy)
		to_chat(src, "<span class='warning'>This place is blessed, you may not draw runes on it - defile it first.</span>")
		return
	if(!istype(T, /turf/simulated))
		to_chat(src, "<span class='warning'>You need more space to draw a rune here.</span>")
		return
	if(istype(get_active_hand(), /obj/item/melee/cultblade/dagger) || istype(get_inactive_hand(), /obj/item/melee/cultblade/dagger))
		has_dagger = 1
	if(locate(/obj/effect/rune) in T)
		to_chat(src, "<span class='warning'>There's already a rune here.</span>") // Don't cross the runes
		return
	if(T.icon_state == "cult" || T.icon_state == "cult-narsie")
		cult_ground = 1
	var/self
	var/timer = 0
	var/damage = 1

	if(has_dagger)
		damage *= 0.8
		timer = -5

	if(has_tome)
		if(has_robes && cult_ground)
			self = "Feeling greatly empowered, you slice open your finger and make a rune on the engraved floor. It shifts when your blood touches it, and starts vibrating as you begin to chant the ritual that binds your life essence with the dark arcane energies flowing through the surrounding world."
			timer += 10
			damage *= 0.2
		else if(has_robes)
			self = "Feeling empowered in your robes, you slice open your finger and start drawing a rune, chanting the ritual that binds your life essence with the dark arcane energies flowing through the surrounding world."
			timer += 30
			damage *= 0.8
		else if(cult_ground)
			self = "You slice open your finger and slide it over the engraved floor, watching it shift when your blood touches it. It vibrates when you begin to chant the ritual that binds your life essence with the dark arcane energies flowing through the surrounding world." // Sadly, you don't have access to the bell nor the candelbarum
			timer += 20
			damage *= 0.8
		else
			self = "You slice open one of your fingers and begin drawing a rune on the floor whilst chanting the ritual that binds your life essence with the dark arcane energies flowing through the surrounding world."
			timer += 40
	else
		self = "Working without your tome, you try to draw the rune from your memory"
		if(has_robes && cult_ground)
			self += ". You feel that you remember it perfectly, finishing it with a few bold strokes. The engraved floor shifts under your touch, and vibrates once you begin your chants."
			timer = 30
		else if(has_robes)
			self += ". You don't remember it well, but you feel strangely empowered. You begin chanting, the unknown words slipping into your mind from beyond."
			timer += 50
		else if(cult_ground)
			self += ", watching as the floor shifts under your touch, correcting the rune. You begin your chants, and the ground starts to vibrate."
			timer += 40
		else
			self += ", having to cut your finger two more times before you make it resemble the pattern in your memory. It still looks a little off."
			timer += 80
			damage *= 2

	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		for(var/datum/active_effect/cult_tattoo/fast/tattoo in H.active_effects)
			if(istype(tattoo))
				timer *= 0.5
				break

	visible_message("<span class='warning'>\The [src] slices open a finger and begins to chant and paint symbols on the floor.</span>", "<span class='notice'>[self]</span>", "You hear chanting.")

	if(do_after(src, timer))
		var/bloodstone_compensated = 0
		for(var/obj/structure/cult/bloodstone/stone in GLOB.cult.bloodstones)
			var/old_comp = bloodstone_compensated
			bloodstone_compensated = min(cost * damage, bloodstone_compensated + stone.blood_stored)
			stone.blood_stored -= bloodstone_compensated - old_comp
			if(bloodstone_compensated == cost * damage)
				break
		if(bloodstone_compensated < cost * damage)
			remove_blood_simple(cost * damage - bloodstone_compensated)
		if(locate(/obj/effect/rune) in T)
			return
		var/obj/effect/rune/R = new rune(T, get_rune_color(), get_blood_name())
		var/area/A = get_area(R)
		log_and_message_admins("created \an [R.cultname] rune at \the [A.name].")
		R.add_fingerprint(src)
		return R
	return 0

/mob/living/carbon/human/make_rune(var/rune, var/cost, var/tome_required)
	if(should_have_organ(BP_HEART) && vessel && !vessel.has_reagent(/datum/reagent/blood, species.blood_volume * 0.5))
		to_chat(src, "<span class='danger'>You are too weak to draw runes.</span>")
		return
	..()

/mob/proc/remove_blood_simple(var/blood)
	return

/mob/living/carbon/human/remove_blood_simple(var/blood)
	if(should_have_organ(BP_HEART))
		vessel.remove_reagent(/datum/reagent/blood, blood * 0.9)
	drip(0.1 * blood)

/mob/proc/get_blood_name()
	return "blood"

/mob/living/silicon/get_blood_name()
	return "oil"

/mob/living/carbon/human/get_blood_name()
	if(species)
		return species.get_blood_name()
	return "blood"

/mob/living/simple_animal/construct/get_blood_name()
	return "ichor"

/mob/proc/mob_needs_tome()
	return 0

/mob/living/carbon/human/mob_needs_tome()
	for(var/datum/active_effect/cult_tattoo/memorise/tattoo in active_effects)
		if(istype(tattoo))
			return 0
	return 1

/mob/proc/get_rune_color()
	return "#c80000"

/mob/living/simple_animal/construct/get_rune_color()
	return "#ffbb00"

/mob/living/carbon/human/get_rune_color()
	return species.blood_color




/obj/effect/rune
	name = "rune"
	desc = "A strange collection of symbols drawn in ."
	anchored = TRUE
	icon = 'infinity/icons/effects/uristrunes.dmi'
	icon_state = "blank"
	unacidable = TRUE
	layer = RUNE_LAYER

	var/blood
	var/bcolor
	var/cultname = "bugged rune. Call an admin to fix this"

	var/strokes = 2 //How many of those fancy symbols we got
	var/datum/ritual/ritual
	var/ritualtype = /datum/ritual

/obj/effect/rune/New(var/loc, var/blcolor = "#c80000", var/nblood = "blood")
	..()
	bcolor = blcolor
	blood = nblood
	desc += blood
	ritual = new ritualtype
	update_icon()

/obj/effect/rune/huge
	icon = 'infinity/icons/effects/large_runes.dmi'
	icon_state = "rune_large"
	pixel_x = -32
	pixel_y = -32

/obj/effect/rune/huge/on_update_icon()
	overlays.Cut()
	color = bcolor
	desc = "A strange collection of symbols drawn in [blood]."

/obj/effect/rune/on_update_icon()
	overlays.Cut()
	if(GLOB.cult.rune_strokes[type])
		var/list/f = GLOB.cult.rune_strokes[type]
		for(var/i in f)
			var/image/t = image('icons/effects/uristrunes.dmi', "rune-[i]")
			overlays += t
	else
		var/list/q = list(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
		var/list/f = list()
		for(var/i = 1 to strokes)
			var/j = pick(q)
			f += j
			q -= f
			var/image/t = image('icons/effects/uristrunes.dmi', "rune-[j]")
			overlays += t
		GLOB.cult.rune_strokes[type] = f.Copy()
	color = bcolor
	desc = "A strange collection of symbols drawn in [blood]."

/obj/effect/rune/examine(mob/user)
	. = ..()
	if(iscultist(user))
		to_chat(user, "<span class = 'cult italic'>This is \a [cultname] rune.</span>")
		to_chat(user, "<span class = 'cult italic'>[ritual.desc]</span>")

/obj/effect/rune/attackby(var/obj/item/I, var/mob/living/user)
	if(istype(I, /obj/item/book/tome) && iscultist(user))
		user.visible_message("<span class='notice'>[user] rubs \the [src] with \the [I], and \the [src] is absorbed by it.</span>", "You retrace your steps, carefully undoing the lines of \the [src].")
		qdel(src)
		return
	else if((istype(I, /obj/item/melee/cultblade/dagger) || istype(I, /obj/item/material/knife)) && iscultist(user))
		if(user.is_muzzled())
			to_chat(user, "You are unable to speak the words of the rune.")
			return
		if(GLOB.cult.powerless)
			to_chat(user, "You read the words, but nothing happens.")
			return fizzle(user)
		cast_self(user)
	else if(istype(I, /obj/item/nullrod))
		user.visible_message("<span class='notice'>[user] hits \the [src] with \the [I], and it disappears, fizzling.</span>", "<span class='notice'>You disrupt the vile magic with the deadening field of \the [I].</span>", "You hear a fizzle.")
		qdel(src)
		return

/obj/effect/rune/attack_hand(var/mob/living/user)
	if(!iscultist(user))
		to_chat(user, "You can't mouth the arcane scratchings without fumbling over them.")
		return
	if(user.is_muzzled())
		to_chat(user, "You are unable to speak the words of the rune.")
		return
	if(GLOB.cult.powerless)
		to_chat(user, "You read the words, but nothing happens.")
		return fizzle(user)
	cast_self(user)

/obj/effect/rune/attack_ai(var/mob/living/user) // Cult borgs!
	if(Adjacent(user))
		attack_hand(user)

/obj/effect/rune/attack_generic(var/mob/living/user) // Cult constructs/slimes/whatnot!
	attack_hand(user)

/obj/effect/rune/proc/cast_self(var/mob/living/user)
	if(!ritual)
		fizzle(user)
		return
	ritual.cast(src, user)

/obj/effect/rune/proc/fizzle(var/mob/living/user)
	visible_message("<span class='warning'>The markings pulse with a small burst of light, then fall dark.</span>", "You hear a fizzle.")



//Tier 1 runes

/obj/effect/rune/convert
	cultname = "convertion ritual"
	strokes = 3
	ritualtype = /datum/ritual/convert

/obj/effect/rune/book_summon
	cultname = "attributes summoning"
	strokes = 2
	ritualtype = /datum/ritual/book_summon

/obj/effect/rune/teleport
	cultname = "teleportation"
	strokes = 2
	ritualtype = /datum/ritual/teleport

	var/destination

/obj/effect/rune/teleport/New()
	..()
	var/area/A = get_area(src)
	destination = A.name
	GLOB.cult.teleport_runes += src

/obj/effect/rune/teleport/Destroy()
	GLOB.cult.teleport_runes -= src
	var/turf/T = get_turf(src)
	for(var/atom/movable/A in contents)
		A.forceMove(T)
	return ..()

/obj/effect/rune/astral
	cultname = "astral journey"
	strokes = 5
	ritualtype = /datum/ritual/astral

/obj/effect/rune/spire
	cultname = "spire ritual"
	strokes = 4
	ritualtype = /datum/ritual/spire

/obj/effect/rune/offering
	cultname = "offering"
	strokes = 3
	ritualtype = /datum/ritual/offering

/obj/effect/rune/curse_pain
	cultname = "curse of pain"
	strokes = 2
	ritualtype = /datum/ritual/curse_pain

/obj/effect/rune/chosen
	cultname = "blood vision"
	strokes = 4
	ritualtype = /datum/ritual/chosen

/obj/effect/rune/wall
	cultname = "shield"
	strokes = 3
	ritualtype = /datum/ritual/wall

//Tier 2 runes

/obj/effect/rune/armor
	cultname = "armor"
	strokes = 3
	ritualtype = /datum/ritual/armor

/obj/effect/rune/cultistshift
	cultname = "bloody call"
	strokes = 6
	ritualtype = /datum/ritual/cultistshift

/obj/effect/rune/spiritrealm
	cultname = "spirit realm"
	strokes = 4
	ritualtype = /datum/ritual/spiritrealm

/obj/effect/rune/necro_basic
	cultname = "zombification"
	strokes = 2
	ritualtype = /datum/ritual/necro_basic

/obj/effect/rune/blooddrain
	cultname = "blood drain"
	strokes = 3
	ritualtype = /datum/ritual/blooddrain

/obj/effect/rune/curse_mirrors
	cultname = "mirror curse"
	strokes = 7
	ritualtype = /datum/ritual/curse_mirrors

//Tier 3 runes

/obj/effect/rune/massshift
	cultname = "joined souls"
	strokes = 9 //Very hard rune
	ritualtype = /datum/ritual/massshift

/obj/effect/rune/god_eye
	cultname = "eye of god"
	strokes = 5
	ritualtype = /datum/ritual/god_eye

/obj/effect/rune/see_ghosts
	cultname = "vision of undead"
	strokes = 6
	ritualtype = /datum/ritual/see_ghosts

/obj/effect/rune/huge/bloody_bond
	cultname = "bloody bond"
	ritualtype = /datum/ritual/bloody_bond

/obj/effect/rune/blood_boil
	cultname = "blood boil"
	strokes = 2
	ritualtype = /datum/ritual/blood_boil

/obj/effect/rune/necro_advanced
	cultname = "revive"
	strokes = 4
	ritualtype = /datum/ritual/necro_advanced

/obj/effect/rune/dark_chorus
	cultname = "dark chorus"
	strokes = 3
	ritualtype = /datum/ritual/dark_chorus

/obj/effect/rune/weapon
	cultname = "weapon"
	strokes = 7
	ritualtype = /datum/ritual/weapon

/obj/effect/rune/silence
	cultname = "curse of silence"
	strokes = 5
	ritualtype = /datum/ritual/silence

//Tier 4 runes

/obj/effect/rune/necro_max
	cultname = "necromantic"
	strokes = 8
	ritualtype = /datum/ritual/necro_max

/obj/effect/rune/wall_mega
	cultname = "shieldcasting"
	strokes = 3
	ritualtype = /datum/ritual/weapon_bloody

/obj/effect/rune/weapon_bloody
	cultname = "bloody weapon"
	strokes = 6
	ritualtype = /datum/ritual/weapon_bloody

/obj/effect/rune/hellhunter
	cultname = "hellhunter"
	strokes = 4
	ritualtype = /datum/ritual/hellhunter

/obj/effect/rune/dark_phoenix
	cultname = "dark phoenix curse"
	strokes = 8
	ritualtype = /datum/ritual/dark_phoenix

//Tier 5 runes

/obj/effect/rune/huge/apocalypse
	cultname = "apocalypse"
	ritualtype = /datum/ritual/apocalypse

/obj/effect/rune/huge/narnar
	cultname = "reality tearing"
	icon_state = "apoc"
	ritualtype = /datum/ritual/narnar
