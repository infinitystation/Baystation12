//Hallutination Gland

/mob/living/carbon/human/proc/command()
	set category = "Abilities"
	set name = "Command creature"
	set desc = "Send a telepathic command to an unlucky recipient."

	var/list/targets = list()
	var/target = null
	var/text = null

	if(last_special < world.time)
		return

	targets += getmobs() //Fill list, prompt user with list
	target = input("Select a creature!", "Speak to creature", null, null) as null|anything in targets

	if(!target) return

	text = input("What would you like to say?", "Speak to creature", null, null)

	text = sanitize(text)

	if(!text) return

	var/mob/M = targets[target]

	if(isghost(M) || M.stat == DEAD)
		to_chat(src, "<span class='warning'>Not even a [src.species.name] can speak to the dead.</span>")
		return

	log_say("[key_name(src)] commanded to [key_name(M)]: [text]")

	to_chat(M, "<span class='danger'>�� �������� ���������� ����� ����� � �������������� ������: <i>[text]</i>. �� ���������, ��� ������ ��������� ��� ����� �����.</span>")
	if(istype(M,/mob/living/carbon/human))
		to_chat(src, "<span class='warning'>Your nose begins to bleed...</span>")
		src.drip(5)

	last_special = world.time + (240 SECONDS)

//EMP Gland

/mob/living/carbon/human/proc/emp_light()
	set category = "Abilities"
	set name = "Disable Machinery"
	set desc = "Create a small EMP, capable of disabling machinery."

	if(last_special < world.time)
		return

	empulse(get_turf(src), 1, 3)

	last_special = world.time + (80 SECONDS)

/mob/living/carbon/human/proc/emp_heavy()
	set category = "Abilities"
	set name = "Destroy Machinery"
	set desc = "Create a powerful EMP, that may destroy some machines."

	if(last_special < world.time)
		return

	empulse(get_turf(src), 3, 5)

	for(var/obj/machinery/machine in range(get_turf(src), 4))
		if(prob(5))
			machine.ex_act(3)

	last_special = world.time + (160 SECONDS)

//Quamtum Gland

/mob/living/carbon/human/proc/switch_places()
	set category = "Abilities"
	set name = "Switch Places"
	set desc = "Switch place with living creature."

	var/list/targets = list()
	var/target = null

	if(last_special < world.time)
		return

	for(var/mob/poss_target in range(get_turf(src), 8))
		targets += poss_target

	target = input("Select a creature!", "Switch places with creature", null, null) as null|anything in targets

	if(!target) return

	var/mob/mob = targets[target]

	if(istype(mob))
		if(mob != src)
			playsound(src.loc, "sparks", 50, 1)
			playsound(src.loc, 'sound/effects/phasein.ogg', 25, 1)
			var/turf/turf = get_turf(mob)
			mob.forceMove(get_turf(src))
			src.forceMove(turf)
			mob.Weaken(1)

	last_special = world.time + (120 SECONDS)

/mob/living/carbon/human/proc/create_chaos()
	set category = "Abilities"
	set name = "Create Chaos"
	set desc = "Teleport EVERY creature in your sight to another creature."

	var/list/targets = list()

	if(last_special < world.time)
		return

	for(var/mob/poss_target in range(get_turf(src), 8))
		targets += poss_target

	for(var/mob/M in targets)
		var/mob/M2 = pick(targets)
		if(istype(M))
			if(M != M2)
				playsound(M.loc, "sparks", 50, 1)
				playsound(M.loc, 'sound/effects/phasein.ogg', 25, 1)
				var/turf/turf = get_turf(M2)
				M2.forceMove(get_turf(M))
				M.forceMove(turf)

	last_special = world.time + (400 SECONDS)

//Plasma Gland

/mob/living/carbon/human/proc/create_plasma()
	set category = "Abilities"
	set name = "Create Plasma"
	set desc = "Makes you sneeze some plasma for yourself."

	if(last_special < world.time)
		return

	for(var/turf/simulated/floor/target_tile in range(2, get_turf(src)))
		target_tile.assume_gas(GAS_PHORON, 10, 25+T0C)
		src.visible_message(SPAN_NOTICE("[src] sneezes."))

	last_special = world.time + (90 SECONDS)

/mob/living/carbon/human/proc/create_spark()
	set category = "Abilities"
	set name = "Create Spark"
	set desc = "Creates a small spark to lit your plasma."

	if(last_special < world.time)
		return

	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(5, 1, src)
	s.start()

	last_special = world.time + (180 SECONDS)

//Chem Gland

/mob/living/carbon/human/proc/create_chems()
	set category = "Abilities"
	set name = "Take Gift"
	set desc = "Take your gift and create some chemicals in your bloodstream."

	if(last_special < world.time)
		return

	var/datum/reagent/random = pick(
										/datum/reagent/blood, /datum/reagent/water, /datum/reagent/acetone, /datum/reagent/aluminium, /datum/reagent/ammonia, /datum/reagent/carbon,
										/datum/reagent/copper, /datum/reagent/ethanol, /datum/reagent/hydrazine, /datum/reagent/iron, /datum/reagent/lithium, /datum/reagent/mercury,
										/datum/reagent/phosphorus, /datum/reagent/potassium, /datum/reagent/radium, /datum/reagent/acid, /datum/reagent/sodium, /datum/reagent/sugar,
										/datum/reagent/sulfur, /datum/reagent/lipozine, /datum/reagent/sodiumchloride, /datum/reagent/frostoil, /datum/reagent/capsaicin/condensed,
										/datum/reagent/inaprovaline, /datum/reagent/bicaridine, /datum/reagent/kelotane, /datum/reagent/dermaline, /datum/reagent/dylovene,
										/datum/reagent/dexalin, /datum/reagent/alkysine, /datum/reagent/hyperzine, /datum/reagent/tobacco, /datum/reagent/gold, /datum/reagent/silver,
										/datum/reagent/uranium, /datum/reagent/thermite, /datum/reagent/space_cleaner, /datum/reagent/glycerol, /datum/reagent/coolant,
										/datum/reagent/toxin/carpotoxin, /datum/reagent/toxin/phoron, /datum/reagent/toxin/cyanide, /datum/reagent/toxin/zombiepowder, /datum/reagent/mutagen,
										/datum/reagent/soporific, /datum/reagent/chloralhydrate, /datum/reagent/space_drugs, /datum/reagent/mindbreaker, /datum/reagent/slimetoxin)
	src.reagents.add_reagent(random, 5)

	last_special = world.time + (60 SECONDS)

/mob/living/carbon/human/proc/create_smoke()
	set category = "Abilities"
	set name = "Create Smoke"
	set desc = "Spread your gift with smoke!"

	if(last_special < world.time)
		return

	var/datum/reagent/random = pick(
										/datum/reagent/blood, /datum/reagent/water, /datum/reagent/acetone, /datum/reagent/aluminium, /datum/reagent/ammonia, /datum/reagent/carbon,
										/datum/reagent/copper, /datum/reagent/ethanol, /datum/reagent/hydrazine, /datum/reagent/iron, /datum/reagent/lithium, /datum/reagent/mercury,
										/datum/reagent/phosphorus, /datum/reagent/potassium, /datum/reagent/radium, /datum/reagent/acid, /datum/reagent/sodium, /datum/reagent/sugar,
										/datum/reagent/sulfur, /datum/reagent/lipozine, /datum/reagent/sodiumchloride, /datum/reagent/frostoil, /datum/reagent/capsaicin/condensed,
										/datum/reagent/inaprovaline, /datum/reagent/bicaridine, /datum/reagent/kelotane, /datum/reagent/dermaline, /datum/reagent/dylovene,
										/datum/reagent/dexalin, /datum/reagent/alkysine, /datum/reagent/hyperzine, /datum/reagent/tobacco, /datum/reagent/gold, /datum/reagent/silver,
										/datum/reagent/uranium, /datum/reagent/thermite, /datum/reagent/space_cleaner, /datum/reagent/glycerol, /datum/reagent/coolant,
										/datum/reagent/toxin/carpotoxin, /datum/reagent/toxin/phoron, /datum/reagent/toxin/cyanide, /datum/reagent/toxin/zombiepowder, /datum/reagent/mutagen,
										/datum/reagent/soporific, /datum/reagent/chloralhydrate, /datum/reagent/space_drugs, /datum/reagent/mindbreaker, /datum/reagent/slimetoxin)
	src.reagents.add_reagent(random, 45)

	var/datum/effect/effect/system/smoke_spread/chem/S = new /datum/effect/effect/system/smoke_spread/chem
	S.attach(get_turf(src))
	S.set_up(src.reagents, 30, 0, get_turf(src))
	playsound(get_turf(src), 'sound/effects/smoke.ogg', 50, 1, -3)

	last_special = world.time + (180 SECONDS)

//Mutation Gland

/mob/living/carbon/human/proc/mutate_species()
	set category = "Abilities"
	set name = "Change Species"
	set desc = "Change your species. From human to resomi."

	if(last_special < world.time)
		return

	var/new_species = input("Select new species!", "Switch species", null, null) as null|anything in list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_SKRELL, SPECIES_PROMETHEAN, SPECIES_YEOSA, SPECIES_VATGROWN, SPECIES_SPACER, SPECIES_TRITONIAN, SPECIES_GRAVWORLDER, SPECIES_TAJARA, SPECIES_RESOMI)
	src.visible_message(SPAN_WARNING("[src]'s flesh rapidly mutates and he transforms into [lowertext(new_species)]!"))
	src.set_species(new_species)
	last_special = world.time + (120 SECONDS)

/mob/living/carbon/human/proc/mutate_appearance()
	set category = "Abilities"
	set name = "Change Appearance"
	set desc = "Change your hair, face, skin and appearance."

	if(last_special < world.time)
		return

	var/new_facial = input("Please select facial hair color.", "Character Generation",rgb(r_facial,g_facial,b_facial)) as color
	if(new_facial)
		r_facial = hex2num(copytext(new_facial, 2, 4))
		g_facial = hex2num(copytext(new_facial, 4, 6))
		b_facial = hex2num(copytext(new_facial, 6, 8))

	var/new_hair = input("Please select hair color.", "Character Generation",rgb(r_hair,g_hair,b_hair)) as color
	if(new_facial)
		r_hair = hex2num(copytext(new_hair, 2, 4))
		g_hair = hex2num(copytext(new_hair, 4, 6))
		b_hair = hex2num(copytext(new_hair, 6, 8))

	var/new_eyes = input("Please select eye color.", "Character Generation",rgb(r_eyes,g_eyes,b_eyes)) as color
	if(new_eyes)
		r_eyes = hex2num(copytext(new_eyes, 2, 4))
		g_eyes = hex2num(copytext(new_eyes, 4, 6))
		b_eyes = hex2num(copytext(new_eyes, 6, 8))
		update_eyes()

	var/new_tone = input("Please select skin tone level: 1-220 (1=albino, 35=caucasian, 150=black, 220='very' black)", "Character Generation", "[35-s_tone]")  as text

	if (!new_tone)
		new_tone = 35
	s_tone = max(min(round(text2num(new_tone)), 220), 1)
	s_tone =  -s_tone + 35

	// hair
	var/list/all_hairs = typesof(/datum/sprite_accessory/hair) - /datum/sprite_accessory/hair
	var/list/hairs = list()

	// loop through potential hairs
	for(var/x in all_hairs)
		var/datum/sprite_accessory/hair/H = new x // create new hair datum based on type x
		hairs.Add(H.name) // add hair name to hairs
		qdel(H) // delete the hair after it's all done

	var/new_style = input("Please select hair style", "Character Generation",h_style)  as null|anything in hairs

	// if new style selected (not cancel)
	if (new_style)
		h_style = new_style

	// facial hair
	var/list/all_fhairs = typesof(/datum/sprite_accessory/facial_hair) - /datum/sprite_accessory/facial_hair
	var/list/fhairs = list()

	for(var/x in all_fhairs)
		var/datum/sprite_accessory/facial_hair/H = new x
		fhairs.Add(H.name)
		qdel(H)

	new_style = input("Please select facial style", "Character Generation",f_style)  as null|anything in fhairs

	if(new_style)
		f_style = new_style

	var/new_gender = alert(usr, "Please select gender.", "Character Generation", "Male", "Female", "Neutral")
	if (new_gender)
		if(new_gender == "Male")
			gender = MALE
		else if(new_gender == "Female")
			gender = FEMALE
		else
			gender = NEUTER
	regenerate_icons()

	visible_message("<span class='notice'>\The [src] morphs and changes [get_visible_gender() == MALE ? "his" : get_visible_gender() == FEMALE ? "her" : "their"] appearance!</span>",
					"<span class='notice'>You change your appearance!</span>", "<span class='warning'>Oh, god!  What the hell was that?  It sounded like flesh getting squished and bone ground into a different shape!</span>")
	last_special = world.time + (240 SECONDS)

//Egg Gland

/mob/living/carbon/human/proc/vomit_egg()
	set category = "Abilities"
	set name = "Lay an Egg"
	set desc = "Lay a small egg. In a strange way, but still, egg is egg."

	if(last_special < world.time)
		return

	new /obj/item/reagent_containers/food/snacks/egg/alien(get_turf(src))
	src.visible_message(SPAN_WARNING("[src] vomits a strange egg!"))
	new /obj/effect/decal/cleanable/vomit(get_turf(src))
	playsound(src.loc, 'sound/effects/splat.ogg', 50, 1)

	last_special = world.time + (60 SECONDS)

/mob/living/carbon/human/proc/lay_creature()
	set category = "Abilities"
	set name = "Create a Child"
	set desc = "Born one of your Childs."

	if(last_special < world.time)
		return

	src.faction = "creature"
	new /mob/living/simple_animal/hostile/creature(get_turf(src))
	src.visible_message(SPAN_DANGER("[src] vomits a strange green creature!"))
	new /obj/effect/decal/cleanable/vomit(get_turf(src))
	playsound(src.loc, 'sound/effects/splat.ogg', 50, 1)

	last_special = world.time + (360 SECONDS)

//Slime Gland

/mob/living/carbon/human/proc/vomit_slime()
	set category = "Abilities"
	set name = "Produce a slime"
	set desc = "Vomit a slime, which will be friendly to you."

	if(last_special < world.time)
		return

	var/mob/living/carbon/slime/slime = new(get_turf(src))
	slime.Leader = src
	slime.Friends[src] = src
	src.visible_message(SPAN_WARNING("[src] vomits a globe of slime!"))
	slime.colour = pick("grey", "orange", "blue", "purple", "metal")
	new /obj/effect/decal/cleanable/vomit(get_turf(src))
	playsound(src.loc, 'sound/effects/splat.ogg', 50, 1)

	last_special = world.time + (60 SECONDS)

/mob/living/carbon/human/proc/mark_slime_enemy()
	set category = "Abilities"
	set name = "Mark an enemy"
	set desc = "Mark an enemy to all slimes in your sight. They will try to attack him"

	var/list/slimes = list()

	if(last_special < world.time)
		return

	for(var/mob/living/carbon/slime/slime in range(get_turf(src), 8))
		slimes += slime

	var/list/targets = list()
	var/target = null

	for(var/mob/poss_target in range(get_turf(src), 8))
		targets += poss_target

	target = input("Select a creature!", "Mark target", null, null) as null|anything in targets

	if(!target) return

	var/mob/mob = targets[target]

	for(var/mob/living/carbon/slime/slime in slimes)
		slime.Target = mob

	last_special = world.time + (90 SECONDS)

//Spider Gland

/mob/living/carbon/human/proc/vomit_spiderling()
	set category = "Abilities"
	set name = "Produce a Spiderling"
	set desc = "Produce a small spider, that can grow into a deadly beast."

	if(last_special < world.time)
		return

	src.visible_message(SPAN_WARNING("A small spider crawls out from [src]'s mouth!"))
	new /obj/effect/spider/spiderling(get_turf(src))

	last_special = world.time + (120 SECONDS)

/mob/living/carbon/human/proc/vomit_spider()
	set category = "Abilities"
	set name = "Produce a Hunted"
	set desc = "Produce a big hunter spider, that is very dangerous and deadly."

	if(last_special < world.time)
		return

	src.visible_message(SPAN_DANGER("A strange, black spider rips out from [src]'s mouth!"))
	new /mob/living/simple_animal/hostile/giant_spider/hunter(get_turf(src))

	last_special = world.time + (360 SECONDS)

//Gravity Gland

/mob/living/carbon/human/proc/change_gravity()
	set category = "Abilities"
	set name = "Change your gravity"
	set desc = "Change gravity for yourself to escape from troubles."

	if(last_special < world.time)
		return

	src.throw_at(get_edge_target_turf(src, rand(1, 8)),20,1)

	last_special = world.time + (60 SECONDS)

/mob/living/carbon/human/proc/mass_gravity()
	set category = "Abilities"
	set name = "Change Gravity in sight"
	set desc = "Create a small gravitational anomaly."

	if(last_special < world.time)
		return

	for(var/atom/movable/target in range(get_turf(src), 8))
		if(istype(target, /obj/item) || istype(target, /mob))
			var/throwdir = get_dir(target,src)
			target.throw_at(get_edge_target_turf(target, throwdir),8,1)

	last_special = world.time + (360 SECONDS)