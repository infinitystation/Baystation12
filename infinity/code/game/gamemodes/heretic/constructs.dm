
#define SOULSTONE_CRACKED -1
#define SOULSTONE_EMPTY 0
#define SOULSTONE_ESSENCE 1

/obj/item/device/soulstone
	name = "soul stone shard"
	icon = 'infinity/icons/obj/cult.dmi'
	icon_state = "soulstone"
	item_state = "electronic"
	desc = "A strange, ridged chunk of some glassy red material. Achingly cold to the touch."
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT
	origin_tech = list(TECH_BLUESPACE = 4, TECH_MATERIAL = 4)

	var/full = SOULSTONE_EMPTY
	var/is_evil = 1
	var/mob/living/simple_animal/shade = null
	var/smashing = 0
	var/soulstatus = null

/obj/item/device/soulstone/Initialize(var/mapload)
	shade = new /mob/living/simple_animal/shade(src)
	. = ..(mapload)

/obj/item/device/soulstone/disrupts_psionics()
	return (full == SOULSTONE_EMPTY) ? src : FALSE

/obj/item/device/soulstone/proc/shatter()
	playsound(loc, "shatter", 70, 1)
	for(var/i=1 to rand(2,5))
		new /obj/item/weapon/material/shard(get_turf(src), MATERIAL_NULLGLASS)
	qdel(src)

/obj/item/device/soulstone/withstand_psi_stress(var/stress, var/atom/source)
	. = ..(stress, source)
	if(. > 0)
		. = max(0, . - rand(2,5))
		shatter()

/obj/item/device/soulstone/full
	full = SOULSTONE_ESSENCE
	icon_state = "soulstone2"

/obj/item/device/soulstone/Destroy()
	QDEL_NULL(shade)
	return ..()

/obj/item/device/soulstone/examine(mob/user)
	. = ..()
	if(full == SOULSTONE_EMPTY)
		to_chat(user, "The shard still flickers with a fraction of the full artifact's power, but it needs to be filled with the essence of someone's life before it can be used.")
	if(full == SOULSTONE_ESSENCE)
		to_chat(user,"The shard has gone transparent, a seeming window into a dimension of unspeakable horror.")
	if(full == SOULSTONE_CRACKED)
		to_chat(user, "This one is cracked and useless.")

/obj/item/device/soulstone/on_update_icon()
	if(full == SOULSTONE_EMPTY)
		icon_state = "[(is_evil) ? "" : "purified_"]soulstone"
	if(full == SOULSTONE_ESSENCE)
		icon_state = "[(is_evil) ? "" : "purified_"]soulstone2" //TODO: A spookier sprite. Also unique sprites.
	if(full == SOULSTONE_CRACKED)
		icon_state = "[(is_evil) ? "" : "purified_"]soulstone"//TODO: cracked sprite
		SetName("cracked soulstone")

/obj/item/device/soulstone/attackby(var/obj/item/I, var/mob/user)
	..()
	if(is_evil && istype(I, /obj/item/weapon/nullrod))
		to_chat(user, "<span class='notice'>You cleanse \the [src] of taint, purging its shackles to its creator..</span>")
		is_evil = 0
		icon_state = "purified_soulstone"
		update_icon()
		return
	if(I.force >= 5)
		if(full != SOULSTONE_CRACKED)
			user.visible_message("<span class='warning'>\The [user] hits \the [src] with \the [I], and it breaks.[shade.client ? " You hear a terrible scream!" : ""]</span>", "<span class='warning'>You hit \the [src] with \the [I], and it cracks.[shade.client ? " You hear a terrible scream!" : ""]</span>", shade.client ? "You hear a scream." : null)
			playsound(loc, 'sound/effects/Glasshit.ogg', 75)
			set_full(SOULSTONE_CRACKED)
		else
			user.visible_message("<span class='danger'>\The [user] shatters \the [src] with \the [I]!</span>")
			shatter()

/obj/item/device/soulstone/attack(var/mob/living/simple_animal/M, var/mob/user)
	if(M == shade)
		to_chat(user, "<span class='notice'>You recapture \the [M].</span>")
		M.forceMove(src)
		return
	if(full == SOULSTONE_ESSENCE)
		to_chat(user, "<span class='notice'>\The [src] is already full.</span>")
		return
	if(M.stat != DEAD && !M.is_asystole())
		to_chat(user, "<span class='notice'>Kill or maim the victim first.</span>")
		return
	for(var/obj/item/W in M)
		M.drop_from_inventory(W)
	M.dust()
	set_full(SOULSTONE_ESSENCE)

/obj/item/device/soulstone/attack_self(var/mob/user)
	if(full != SOULSTONE_ESSENCE) // No essence - no shade
		to_chat(user, "<span class='notice'>This [src] has no life essence.</span>")
		return

	if(!shade.key) // No key = hasn't been used
		to_chat(user, "<span class='notice'>You cut your finger and let the blood drip on \the [src].</span>")
		user.remove_blood_simple(1)
		var/datum/ghosttrap/cult/shade/S = get_ghost_trap("soul stone")
		S.request_player(shade, "The soul stone shade summon ritual has been performed. ")
	else if(!shade.client) // Has a key but no client - shade logged out
		to_chat(user, "<span class='notice'>\The [shade] in \the [src] is dormant.</span>")
		return
	else if(shade.loc == src)
		var/choice = alert("Would you like to invoke the spirit within?",,"Yes","No")
		if(choice == "Yes")
			if(is_evil)
				shade.icon_state = "shade"
				shade.icon_living = "shade"
				shade.icon_dead = "shade"
				shade.faction = "cult"
			else
				shade.icon_state = "shade_angelic"
				shade.icon_living = "shade_angelic"
				shade.icon_dead = "shade_angelic"
				shade.faction = "neutral"
			shade.dropInto(loc)
			to_chat(user, "<span class='notice'>You summon \the [shade].</span>")
		if(choice == "No")
			return

/obj/item/device/soulstone/proc/set_full(var/f)
	full = f
	update_icon()

/obj/structure/constructshell
	name = "empty shell"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "construct"
	desc = "A wicked machine used by those skilled in magical arts. It is inactive."

/obj/structure/constructshell/cult
	icon_state = "construct-cult"
	desc = "This eerie contraption looks like it would come alive if supplied with a missing ingredient."

/obj/structure/constructshell/attackby(var/obj/item/I, var/mob/user)
	if(istype(I, /obj/item/device/soulstone))
		var/obj/item/device/soulstone/S = I
		if(!S.shade.client)
			to_chat(user, "<span class='notice'>\The [I] has essence, but no soul. Activate it in your hand to find a soul for it first.</span>")
			return
		if(S.shade.loc != S)
			to_chat(user, "<span class='notice'>Recapture the shade back into \the [I] first.</span>")
			return
		var/construct = alert(user, "Please choose which type of construct you wish to create.",,"Artificer", "Wraith", "Juggernaut")
		var/ctype
		switch(construct)
			if("Artificer")
				ctype = /mob/living/simple_animal/construct/builder
			if("Wraith")
				ctype = /mob/living/simple_animal/construct/wraith
			if("Juggernaut")
				ctype = /mob/living/simple_animal/construct/armoured
		var/mob/living/simple_animal/construct/C = new ctype(get_turf(src))
		C.key = S.shade.key
		if(!S.is_evil)
			C.faction = "neutral"
		C.is_angelic = !S.is_evil
		//C.cancel_camera()
		if(S.is_evil)
			GLOB.cult.add_antagonist(C.mind)
		C.process_spells()
		qdel(S)
		qdel(src)

/obj/item/device/soulstone/heretic/pure
	icon_state = "purified_soulstone"
	is_evil = 0

/obj/item/device/soulstone/heretic/attack(var/mob/living/M, var/mob/user)
	if(M == shade)
		to_chat(user, "<span class='notice'>You recapture \the [M].</span>")
		M.forceMove(src)
		return
	if(full == SOULSTONE_ESSENCE)
		to_chat(user, "<span class='notice'>\The [src] is already full.</span>")
		return
	if(M.stat != DEAD && !M.is_asystole())
		to_chat(user, "<span class='notice'>Kill or maim the victim first.</span>")
		return
	for(var/obj/item/W in M)
		M.drop_from_inventory(W)

	shade = new(src)
	shade.ckey = M.ckey

	M.dust()
	set_full(SOULSTONE_ESSENCE)

/obj/item/device/soulstone/heretic/attack_self(var/mob/user)
	if(full != SOULSTONE_ESSENCE)
		to_chat(user, "<span class='notice'>This [src] has no life essence.</span>")
		return

	if(!shade.key) // No key = hasn't been used
		to_chat(user, "<span class='notice'>You cut your finger and let the blood drip on \the [src].</span>")
		user.remove_blood_simple(1)
		var/datum/ghosttrap/cult/shade/S = get_ghost_trap("soul stone")
		S.request_player(shade, "The soul stone shade summon ritual has been performed. ")
	else if(!shade.client) // Has a key but no client - shade logged out
		to_chat(user, "<span class='notice'>\The [shade] in \the [src] is dormant.</span>")
		return
	else if(shade.loc == src)
		var/choice = alert("Would you like to invoke the spirit within?",,"Yes","No")
		if(choice == "Yes")
			if(is_evil)
				shade.icon_state = "shade"
				shade.icon_living = "shade"
				shade.icon_dead = "shade"
				shade.faction = "cult"
			else
				shade.icon_state = "shade_angelic"
				shade.icon_living = "shade_angelic"
				shade.icon_dead = "shade_angelic"
				shade.faction = "neutral"
			shade.dropInto(loc)
			to_chat(user, "<span class='notice'>You summon \the [shade].</span>")
		if(choice == "No")
			return
	else if(shade.loc != src)
		to_chat(user, "<span class='notice'>You recapture \the [shade].</span>")
		shade.forceMove(src)
		return

/mob/living/simple_animal/construct
	name = "Construct"
	real_name = "Construct"
	desc = ""
	speak = list("Hsssssssszsht.", "Hsssssssss...", "Tcshsssssssszht!")
	speak_emote = list("hisses")
	emote_hear = list("wails","screeches")
	response_help  = "thinks better of touching"
	response_disarm = "flailed at"
	response_harm   = "punched"
	icon_dead = "shade_dead"
	speed = -1
	a_intent = I_HURT
	stop_automated_movement = 1
	status_flags = CANPUSH
	universal_speak = FALSE
	universal_understand = TRUE
	attack_sound = 'sound/weapons/spiderlunge.ogg'
	min_gas = null
	max_gas = null
	minbodytemp = 0
	show_stat_health = 1
	faction = "cult"
	supernatural = 1
	see_in_dark = 8
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	mob_swap_flags = HUMAN|SIMPLE_ANIMAL|SLIME|MONKEY
	mob_push_flags = ALLMOBS
	bleed_colour = "#331111"

	meat_type =     null
	meat_amount =   0
	bone_material = null
	bone_amount =   0
	skin_material = null
	skin_amount =   0

	var/nullblock = 0
	var/is_angelic = 0
	var/list/construct_spells = list()
	var/list/angelic_spells = list()

/mob/living/simple_animal/construct/cultify()
	return

/mob/living/simple_animal/construct/New()
	..()
	name = text("[initial(name)] ([random_id(/mob/living/simple_animal/construct, 1000, 9999)])")
	real_name = name
	if(!is_angelic)
		add_language(LANGUAGE_CULT)
		add_language(LANGUAGE_CULT_GLOBAL)
	update_icon()
	flick("make_[icon_state][is_angelic]", src)

/mob/living/simple_animal/construct/proc/process_spells()
	if(is_angelic)
		for(var/spell in angelic_spells)
			src.add_spell(new spell, "holy_spell_ready")
		return

	for(var/spell in construct_spells)
		src.add_spell(new spell, "const_spell_ready")

/mob/living/simple_animal/construct/death(gibbed, deathmessage, show_dead_message)
	var/obj/item/weapon/ectoplasm/ectoplasm = new(src.loc)
	if(is_angelic)
		ectoplasm.icon_state = "angelplasm"
	..(null,"collapses in a shattered heap.","The bonds tying you to this mortal plane have been severed.")
	ghostize()
	qdel(src)

/mob/living/simple_animal/construct/on_update_icon()
	overlays.Cut()
	..()
	add_glow()

/mob/living/simple_animal/construct/attack_generic(var/mob/user)
	if(istype(user, /mob/living/simple_animal/construct/builder))
		if(health < maxHealth)
			adjustBruteLoss(-5)
			user.visible_message("<span class='notice'>\The [user] mends some of \the [src]'s wounds.</span>")
		else
			to_chat(user, "<span class='notice'>\The [src] is undamaged.</span>")
		return
	return ..()

/mob/living/simple_animal/construct/examine(mob/user)
	. = ..(user)
	var/msg = "<span cass='info'>*---------*\nThis is \icon[src] \a <EM>[src]</EM>!\n"
	if (src.health < src.maxHealth)
		msg += "<span class='warning'>"
		if (src.health >= src.maxHealth/2)
			msg += "It looks slightly dented.\n"
		else
			msg += "<B>It looks severely dented!</B>\n"
		msg += "</span>"
	msg += "*---------*</span>"

	to_chat(user, msg)

/obj/item/weapon/ectoplasm
	name = "ectoplasm"
	desc = "Spooky."
	gender = PLURAL
	icon = 'infinity/icons/obj/cult.dmi'
	icon_state = "ectoplasm"

/mob/living/simple_animal/construct/UnarmedAttack(var/atom/A, var/proximity)
	if(istype(A, /obj/effect/rune) && is_angelic)
		A.visible_message("<span class='notice'>[src] hits \the [A], and it disappears, fizzling.</span>", "<span class='notice'>You disrupt the vile magic with the deadening field of your fists.</span>", "You hear a fizzle.")
		qdel(A)

	. = ..()

/mob/living/simple_animal/construct/electrocute_act(shock_damage, obj/source, siemens_coeff = 1, def_zome = null)
	return 0

/////////////////Juggernaut///////////////



/mob/living/simple_animal/construct/armoured
	name = "Juggernaut"
	real_name = "Juggernaut"
	desc = "A possessed suit of armour driven by the will of the restless dead"
	icon = 'infinity/icons/mob/cult.dmi'
	icon_state = "juggernaut"
	icon_living = "juggernaut"
	maxHealth = 250
	health = 250
	speak_emote = list("rumbles")
	response_harm   = "harmlessly punches"
	harm_intent_damage = 0
	melee_damage_lower = 30
	melee_damage_upper = 30
	attacktext = "smashed their armoured gauntlet into"
	mob_size = MOB_LARGE
	speed = 3
	environment_smash = 2
	attack_sound = 'sound/weapons/heavysmash.ogg'
	status_flags = 0
	resistance = 10
	construct_spells = list(/spell/aoe_turf/conjure/forcewall_cult)
	angelic_spells = list(/spell/aoe_turf/conjure/forcewall_holy)
	can_escape = TRUE

/mob/living/simple_animal/construct/armoured/Life()
	weakened = 0
	if ((. = ..()))
		return

/mob/living/simple_animal/construct/armoured/bullet_act(var/obj/item/projectile/P)
	if(istype(P, /obj/item/projectile/energy) || istype(P, /obj/item/projectile/beam))
		var/reflectchance = 80 - round(P.damage/3)
		if(prob(reflectchance))
			adjustBruteLoss(P.damage * 0.5)
			visible_message("<span class='danger'>The [P.name] gets reflected by [src]'s shell!</span>", \
							"<span class='userdanger'>The [P.name] gets reflected by [src]'s shell!</span>")

			// Find a turf near or on the original location to bounce to
			if(P.starting)
				var/new_x = P.starting.x + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
				var/new_y = P.starting.y + pick(0, 0, -1, 1, -2, 2, -2, 2, -2, 2, -3, 3, -3, 3)
				var/turf/curloc = get_turf(src)

				// redirect the projectile
				P.redirect(new_x, new_y, curloc, src)

			return -1 // complete projectile permutation

	return (..(P))

/mob/living/simple_animal/construct/armoured/holy
	faction = "neutral"
	is_angelic = 1

/mob/living/simple_animal/construct/armoured/holy/Initialize()
	. = ..()
	process_spells()



////////////////////////Wraith/////////////////////////////////////////////



/mob/living/simple_animal/construct/wraith
	name = "Wraith"
	real_name = "Wraith"
	desc = "A wicked bladed shell contraption piloted by a bound spirit"
	icon = 'infinity/icons/mob/cult.dmi'
	icon_state = "wraith"
	icon_living = "wraith"
	icon_dead = "wraith_dead"
	maxHealth = 75
	health = 75
	melee_damage_lower = 25
	melee_damage_upper = 25
	attacktext = "slashed"
	speed = -1
	environment_smash = 1
	see_in_dark = 7
	attack_sound = 'sound/weapons/rapidslice.ogg'
	construct_spells = list(/spell/targeted/ethereal_jaunt/shift)
	angelic_spells = list(/spell/targeted/ethereal_jaunt/holy_shift)

/mob/living/simple_animal/construct/wraith/holy
	faction = "neutral"
	is_angelic = 1

/mob/living/simple_animal/construct/wraith/holy/Initialize()
	. = ..()
	process_spells()

/*
/mob/living/simple_animal/construct/wraith/benemoth
	name = "Benemoth"
	real_name = "Benemoth"
	desc = "An upgraded version of Wraith, this construct is capable of fast movement and sudden attacks"
	icon = 'infinity/icons/mob/cult.dmi'
	icon_state = "chosen"
	icon_living = "chosen"
	maxHealth = 75
	health = 75
	melee_damage_lower = 25
	melee_damage_upper = 25
	attacktext = "slashed"
	speed = -1.5
	environment_smash = 1
	see_in_dark = 7
	attack_sound = 'sound/weapons/rapidslice.ogg'
	construct_spells = list(/spell/targeted/ethereal_jaunt/shift,
							/spell/targeted/stealth)

	var/last_hp = 75

/mob/living/simple_animal/construct/wraith/benemoth/UnarmedAttack(var/atom/A, var/proximity)
	if(alpha < 255)
		health = last_hp
		maxHealth = 75
		alpha = 255
		melee_damage_lower = 25
		melee_damage_upper = 25

	if(health < maxHealth / 2 && alpha == 255)
		melee_damage_lower = 10 //NOPE
		melee_damage_upper = 10

	. = ..()*/

/////////////////////////////Artificer/////////////////////////



/mob/living/simple_animal/construct/builder
	name = "Artificer"
	real_name = "Artificer"
	desc = "A bulbous construct dedicated to building and maintaining The Cult of Nar-Sie's armies"
	icon = 'infinity/icons/mob/cult.dmi'
	icon_state = "artificer"
	icon_living = "artificer"
	maxHealth = 50
	health = 50
	response_harm = "viciously beaten"
	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 5
	attacktext = "slashed" //L - Logic
	speed = 0
	environment_smash = 1
	attack_sound = 'sound/weapons/rapidslice.ogg'
	construct_spells = list(/spell/aoe_turf/conjure/construct/lesser,
							/spell/aoe_turf/conjure/wall,
							/spell/aoe_turf/conjure/pylon,
							/spell/aoe_turf/conjure/soulstone,
							/spell/targeted/projectile/cult_missile
							)
	angelic_spells = list(/spell/aoe_turf/conjure/construct/lesser/holy,
						  /spell/aoe_turf/conjure/soulstone/holy,
						  /spell/targeted/projectile/holy_missile
						  )



/mob/living/simple_animal/construct/builder/UnarmedAttack(var/atom/A, var/proximity)
	if(is_angelic)
		if(istype(A, /turf/simulated/wall/cult))
			var/turf/simulated/wall/cult/W = A
			visible_message("<span class='notice'>\The [src] touches \the [A], and the enchantment affecting it fizzles away.</span>", "<span class='notice'>You touch \the [A], and the enchantment affecting it fizzles away.</span>")
			W.ChangeTurf(/turf/simulated/wall)

		if(istype(A, /turf/simulated/floor/cult))
			var/turf/simulated/floor/cult/F = A
			visible_message("<span class='notice'>\The [src] touches \the [A], and the enchantment affecting it fizzles away.</span>", "<span class='notice'>You touch \the [A], and the enchantment affecting it fizzles away.</span>")
			F.ChangeTurf(/turf/simulated/floor)
	else
		if(istype(A, /turf))
			var/turf/T = A
			T.cultify()
	. = ..()

/mob/living/simple_animal/construct/builder/holy
	faction = "neutral"
	is_angelic = 1

/mob/living/simple_animal/construct/builder/holy/Initialize()
	. = ..()
	process_spells()

/mob/living/simple_animal/construct/builder/proteon
	name = "Proteon"
	real_name = "Proteon"
	desc = "An upgraded version of Builder, capable of healing allied Nar'Sien cultists with his punches."
	icon = 'infinity/icons/mob/cult.dmi'
	icon_state = "proteon"
	icon_living = "proteon"
	maxHealth = 75
	health = 75
	response_harm = "viciously beaten"
	harm_intent_damage = 5
	melee_damage_lower = 5
	melee_damage_upper = 5
	attacktext = "rammed"
	speed = 0
	environment_smash = 1
	attack_sound = 'sound/weapons/rapidslice.ogg'
	construct_spells = list(/spell/aoe_turf/conjure/construct/lesser,
							/spell/aoe_turf/conjure/wall,
							/spell/aoe_turf/conjure/pylon
							)

/mob/living/simple_animal/construct/builder/proteon/UnarmedAttack(var/atom/A, var/proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(!proximity)
			return
		if(iscultist(L))
			L.adjustBruteLoss(-2)
			L.adjustFireLoss(-2)
			visible_message(SPAN_WARNING("[src] starts to secrete some dark red liquid onto [L]."))
			return
	. = ..()


/*////////////////////////////Behemoth/////////////////////////


/mob/living/simple_animal/construct/behemoth
	name = "Behemoth"
	real_name = "Behemoth"
	desc = "The pinnacle of occult technology, Behemoths are the ultimate weapon in the Cult of Nar-Sie's arsenal."
	icon = 'infinity/icons/mob/cult.dmi'
	icon_state = "behemoth"
	icon_living = "behemoth"
	maxHealth = 750
	health = 750
	speak_emote = list("rumbles")
	response_harm   = "harmlessly punched"
	harm_intent_damage = 0
	melee_damage_lower = 50
	melee_damage_upper = 50
	attacktext = "brutally crushed"
	speed = 5
	environment_smash = 2
	attack_sound = 'sound/weapons/heavysmash.ogg'
	resistance = 10
	var/energy = 0
	var/max_energy = 1000
	construct_spells = list(/spell/aoe_turf/conjure/forcewall/lesser)
	can_escape = TRUE

*////////////////////////Harvester////////////////////////////////



/mob/living/simple_animal/construct/harvester
	name = "Harvester"
	real_name = "Harvester"
	desc = "The promised reward of the livings who follow Nar-Sie. Obtained by offering their bodies to the geometer of blood"
	icon = 'infinity/icons/mob/cult.dmi'
	icon_state = "harvester"
	icon_living = "harvester"
	icon_dead = "harvester_dead"
	maxHealth = 150
	health = 150
	melee_damage_lower = 25
	melee_damage_upper = 25
	attacktext = "violently stabbed"
	speed = -1
	environment_smash = 1
	see_in_dark = 7
	attack_sound = 'sound/weapons/pierce.ogg'

	construct_spells = list(
			/spell/targeted/harvest
		)

////////////////Glow//////////////////
/mob/living/simple_animal/construct/proc/add_glow()
	var/image/eye_glow = image(icon,"glow_[icon_state][is_angelic]")
	eye_glow.plane = EFFECTS_ABOVE_LIGHTING_PLANE
	eye_glow.layer = EYE_GLOW_LAYER
	overlays += eye_glow
	//set_light(-2, 0.1, 1.5, l_color = "#ffffff")

////////////////HUD//////////////////////

/mob/living/simple_animal/construct/Life()
	. = ..()
	if(.)
		if(fire)
			if(fire_alert)							fire.icon_state = "fire1"
			else									fire.icon_state = "fire0"
		if(pullin)
			if(pulling)								pullin.icon_state = "pull1"
			else									pullin.icon_state = "pull0"

		if(purged)
			if(purge > 0)							purged.icon_state = "purge1"
			else									purged.icon_state = "purge0"

		silence_spells(purge)

/mob/living/simple_animal/construct/armoured/Life()
	. = ..()
	if(healths)
		switch(health)
			if(250 to INFINITY)		healths.icon_state = "juggernaut_health0"
			if(208 to 249)			healths.icon_state = "juggernaut_health1"
			if(167 to 207)			healths.icon_state = "juggernaut_health2"
			if(125 to 166)			healths.icon_state = "juggernaut_health3"
			if(84 to 124)			healths.icon_state = "juggernaut_health4"
			if(42 to 83)			healths.icon_state = "juggernaut_health5"
			if(1 to 41)				healths.icon_state = "juggernaut_health6"
			else					healths.icon_state = "juggernaut_health7"

/*
/mob/living/simple_animal/construct/behemoth/Life()
	. = ..()
	if(healths)
		switch(health)
			if(750 to INFINITY)		healths.icon_state = "juggernaut_health0"
			if(625 to 749)			healths.icon_state = "juggernaut_health1"
			if(500 to 624)			healths.icon_state = "juggernaut_health2"
			if(375 to 499)			healths.icon_state = "juggernaut_health3"
			if(250 to 374)			healths.icon_state = "juggernaut_health4"
			if(125 to 249)			healths.icon_state = "juggernaut_health5"
			if(1 to 124)			healths.icon_state = "juggernaut_health6"
			else					healths.icon_state = "juggernaut_health7"*/

/mob/living/simple_animal/construct/builder/Life()
	. = ..()
	if(healths)
		switch(health)
			if(50 to INFINITY)		healths.icon_state = "artificer_health0"
			if(42 to 49)			healths.icon_state = "artificer_health1"
			if(34 to 41)			healths.icon_state = "artificer_health2"
			if(26 to 33)			healths.icon_state = "artificer_health3"
			if(18 to 25)			healths.icon_state = "artificer_health4"
			if(10 to 17)			healths.icon_state = "artificer_health5"
			if(1 to 9)				healths.icon_state = "artificer_health6"
			else					healths.icon_state = "artificer_health7"



/mob/living/simple_animal/construct/wraith/Life()
	. = ..()
	if(healths)
		switch(health)
			if(75 to INFINITY)		healths.icon_state = "wraith_health0"
			if(62 to 74)			healths.icon_state = "wraith_health1"
			if(50 to 61)			healths.icon_state = "wraith_health2"
			if(37 to 49)			healths.icon_state = "wraith_health3"
			if(25 to 36)			healths.icon_state = "wraith_health4"
			if(12 to 24)			healths.icon_state = "wraith_health5"
			if(1 to 11)				healths.icon_state = "wraith_health6"
			else					healths.icon_state = "wraith_health7"


/mob/living/simple_animal/construct/harvester/Life()
	. = ..()
	if(healths)
		switch(health)
			if(150 to INFINITY)		healths.icon_state = "harvester_health0"
			if(125 to 149)			healths.icon_state = "harvester_health1"
			if(100 to 124)			healths.icon_state = "harvester_health2"
			if(75 to 99)			healths.icon_state = "harvester_health3"
			if(50 to 74)			healths.icon_state = "harvester_health4"
			if(25 to 49)			healths.icon_state = "harvester_health5"
			if(1 to 24)				healths.icon_state = "harvester_health6"
			else					healths.icon_state = "harvester_health7"

#undef SOULSTONE_CRACKED
#undef SOULSTONE_EMPTY
#undef SOULSTONE_ESSENCE
