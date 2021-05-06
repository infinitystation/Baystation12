/obj/item/random_gland
	name = "alien gland"
	desc = "A strange alien gland."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "gland"

/obj/item/random_gland/Initialize()
	. = ..()
	var/gland_type = pick(subtypesof(/obj/item/organ/internal/gland))
	new gland_type(get_turf(src))
	qdel(src)

/obj/item/organ/internal/gland
	name = "alien gland"
	desc = "A strange alien gland."
	icon = 'infinity/icons/obj/abductor.dmi'
	icon_state = "gland"
	organ_tag = BP_GLAND
	parent_organ = BP_CHEST

	var/real_name = ""
	var/first_names = list("organic", "araneae cloister", "gastric animation",
						   "white matter", "anthropmorphic", "roe-enzymatic",
						   "pliant cartilage", "neural crosstalk", "contamination",
						   "electron", "intrinsic", "effluvium sanguine-synonym",
						   "pseudonuclear", "quantic", "anagraphic")

	var/second_names = list("replicator", "accelerator", "galvanizer",
							"randomiser", "transmorphosizer", "synthesizer",
							"enabler", "uninhibitor", "incubator",
							"discharger", "pharma-provider", "emitter",
							"destabilizer", "de-observation matrix", "scrambler")
	var/activated = 0
	var/effected = 0
	var/mastered = 0
	var/to_master = 40
	var/uses = 5
	var/abilities = list()

	var/mind_text = "В вас была введена эксперементальная гланда, что полностью изменила ваше тело и до неузнаваемости исказила ваш разум. Вы ни за что не хотите что бы ее удаляли."

/obj/item/organ/internal/gland/proc/set_species(var/mob/living/carbon/human/mob, var/species)
	for(var/obj/item/W in mob)
		mob.drop_from_inventory(W)
	mob.regenerate_icons()
	src.forceMove(get_turf(mob))
	mob.internal_organs.Remove(src)
	mob.set_species(species)
	src.forceMove(mob)
	mob.internal_organs.Add(src)

/obj/item/organ/internal/gland/proc/SetRandomIcon_State()
	icon_state = "gland[rand(1,9)]"

/obj/item/organ/internal/gland/proc/SetRandomName()
	real_name = "[pick(first_names)] [pick(second_names)]"

/obj/item/organ/internal/gland/Initialize()
	SetRandomIcon_State()
	SetRandomName()
	. = ..()
	START_PROCESSING(SSprocessing, src)

/obj/item/organ/internal/gland/Destroy()
	STOP_PROCESSING(SSprocessing, src)
	. = ..()

/obj/item/organ/internal/gland/Process()
	if(effected >= to_master && !mastered)
		master_gland()

	if(owner && istype(owner))
		if(activated)
			effect(owner)

/obj/item/organ/internal/gland/examine(mob/user)
	. = ..()
	to_chat(user, "On closer look, you can say that it is definetly [real_name]")

/obj/item/organ/internal/gland/proc/master_gland()
	to_chat(owner, SPAN_NOTICE("Вы чувствуете как ваша сила растет, превышая все границы."))
	mastered = 1
	for(var/ability in abilities)
		owner.verbs += ability

/obj/item/organ/internal/gland/proc/effect(var/mob/living/carbon/human/mob)
	return



/obj/item/organ/internal/gland/healing/organ/effect(var/mob/living/carbon/human/mob)
	if(istype(mob))
		var/mob/living/carbon/human/H = mob
		for(var/obj/item/organ/I in H.internal_organs)
			if(I.damage > 0)
				I.damage = max(I.damage - 1, 0)
				if(I.organ_tag == BP_BRAIN)
					H.confused++
					H.drowsyness++
				if(prob(5))
					to_chat(H, SPAN_WARNING("You feel a soothing sensation within your [I.parent_organ]..."))
					effected++
				return 1
		. = ..()



/obj/item/organ/internal/gland/healing/organs_bad/effect(var/mob/living/carbon/human/mob)
	if(istype(mob))
		var/mob/living/carbon/human/H = mob
		for(var/obj/item/organ/I in H.internal_organs)
			if(I.damage > 0)
				I.damage = max(I.damage - 1, 0)
				if(prob(5))
					to_chat(H, SPAN_WARNING("You feel a sharp pain within your [I.parent_organ]..."))
					effected++
				if (H.getOxyLoss())
					H.adjustOxyLoss(0.5)
				return 1
		. = ..()


/obj/item/organ/internal/gland/healing
	mind_text = "В вас была введена эксперементальная гланда, что полностью изменила ваше тело и до неузнаваемости исказила ваш разум. Вы ни за что не хотите что бы ее удаляли. Вы чувствуете невероятную силу и ощущение, что вам никто не повредит. Никто и никогда."

/obj/item/organ/internal/gland/healing/effect(var/mob/living/carbon/human/mob)
	if(istype(mob))
		var/mob/living/carbon/human/H = mob

		if(prob(5))
			effected++

		if(H.vessel.total_volume < H.vessel.maximum_volume)
			H.regenerate_blood(5)
		if (H.getOxyLoss())
			H.adjustOxyLoss(-5)
			return 1
		if (H.getBruteLoss())
			H.adjustBruteLoss(-5)
			return 1
		if (H.getFireLoss())
			H.adjustFireLoss(-5)
			return 1



/obj/item/organ/internal/gland/spider
	mind_text = "В вас была введена эксперементальная гланда, что полностью изменила ваше тело и до неузнаваемости исказила ваш разум. Вы ни за что не хотите что бы ее удаляли. У вас появилось навязчивое желание создавать и защищать своих деток, даже не понимая про кого идет речь. Вы хотите уничтожить всех, кто может навредить Им."
	abilities = list(/mob/living/carbon/human/proc/vomit_spider, /mob/living/carbon/human/proc/vomit_spiderling)
	to_master = 10

/obj/item/organ/internal/gland/spider/effect(var/mob/living/carbon/human/mob)
	if(istype(mob))
		var/mob/living/carbon/human/H = mob
		if(H.faction != "spiders")
			H.faction = "spiders"

		if(prob(0.4))
			H.visible_message(SPAN_WARNING("A small spider crawls out from [H]'s mouth!"))
			new /obj/effect/spider/spiderling(get_turf(H))
			effected++



/obj/item/organ/internal/gland/slime
	mind_text = "В вас была введена эксперементальная гланда, что полностью изменила ваше тело и до неузнаваемости исказила ваш разум. Вы ни за что не хотите что бы ее удаляли. У вас появилось навязчивое желание создавать и защищать своих деток, даже не понимая про кого идет речь. Вы хотите уничтожить всех, кто может навредить Им."
	abilities = list(/mob/living/carbon/human/proc/mark_slime_enemy, /mob/living/carbon/human/proc/vomit_slime)
	to_master = 10

/obj/item/organ/internal/gland/slime/effect(var/mob/living/carbon/human/mob)
	if(istype(mob))
		var/mob/living/carbon/human/H = mob

		if(prob(0.5))
			var/mob/living/carbon/slime/slime = new(get_turf(H))
			slime.Leader = H
			slime.Friends[H] = H
			H.visible_message(SPAN_WARNING("[H] vomits a globe of slime!"))
			slime.colour = pick("grey", "orange", "blue", "purple", "metal")
			new /obj/effect/decal/cleanable/vomit(get_turf(H))
			playsound(H.loc, 'sound/effects/splat.ogg', 50, 1)
			effected++
			return 1

		if(prob(0.05))
			to_chat(H, "<span class='danger'>Your flesh rapidly mutates!</span>")
			set_species(SPECIES_PROMETHEAN, H)
			H.shapeshifter_set_colour("#05ff9b")
			effected = to_master



/obj/item/organ/internal/gland/species
	mind_text = "В вас была введена эксперементальная гланда, что полностью изменила ваше тело и до неузнаваемости исказила ваш разум. Вы ни за что не хотите что бы ее удаляли. Вы желаете знать все и быть всем. Вы хотите лишь одного - изменять свое тело."
	abilities = list(/mob/living/carbon/human/proc/mutate_appearance, /mob/living/carbon/human/proc/mutate_species)
	to_master = 10

/obj/item/organ/internal/gland/species/effect(var/mob/living/carbon/human/mob)
	if(istype(mob))
		var/mob/living/carbon/human/H = mob

		if(prob(0.5))
			var/new_species = pick(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_SKRELL, SPECIES_YEOSA, SPECIES_VATGROWN, SPECIES_SPACER, SPECIES_TRITONIAN, SPECIES_GRAVWORLDER, SPECIES_TAJARA, SPECIES_RESOMI)
			H.visible_message(SPAN_WARNING("[H]'s flesh rapidly mutates and he transforms into [lowertext(new_species)]!"))
			set_species(new_species, H)
			effected++




/obj/item/reagent_containers/food/snacks/egg/alien
	name = "alien egg"
	desc = "Strange, a bit glowing egg with a thick shell."
	icon_state = "lizard_egg"
	w_class = ITEM_SIZE_SMALL

/obj/item/reagent_containers/food/snacks/egg/alien/Initialize()
	. = ..()
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
	src.reagents.add_reagent(random, 15)



/obj/item/organ/internal/gland/egg
	mind_text = "В вас была введена эксперементальная гланда, что полностью изменила ваше тело и до неузнаваемости исказила ваш разум. Вы ни за что не хотите что бы ее удаляли. У вас появилось настойчивое желание основать свой Улей. У вас ощущение, что от этого будет зависеть будущее вас и всей вашей расы."
	abilities = list(/mob/living/carbon/human/proc/vomit_egg, /mob/living/carbon/human/proc/lay_creature)
	to_master = 10

/obj/item/organ/internal/gland/egg/effect(var/mob/living/carbon/human/mob)
	if(istype(mob))
		var/mob/living/carbon/human/H = mob

		if(prob(0.5))
			new /obj/item/reagent_containers/food/snacks/egg/alien(get_turf(H))
			H.visible_message(SPAN_WARNING("[H] vomits a strange egg!"))
			new /obj/effect/decal/cleanable/vomit(get_turf(H))
			playsound(H.loc, 'sound/effects/splat.ogg', 50, 1)
			effected++



/obj/item/organ/internal/gland/hallucination
	mind_text = "В вас была введена эксперементальная гланда, что полностью изменила ваше тело и до неузнаваемости исказила ваш разум. Вы ни за что не хотите что бы ее удаляли. Вы хотите повелевать другими людьми, понимая, что скоро ваше желание станет реальностью. У вас появляется настойчивое желание находится в толпе..."
	abilities = list(/mob/living/carbon/human/proc/commune, /mob/living/carbon/human/proc/command)
	to_master = 15

/obj/item/organ/internal/gland/hallucination/effect(var/mob/living/carbon/human/mob)
	if(istype(mob))
		var/mob/living/carbon/human/H = mob

		if(prob(1))
			for(var/mob/living/carbon/human/M in range(8, H))
				if(istype(M) && M != H)
					M.hallucination(3, 50)
					effected++



/obj/item/organ/internal/gland/emp
	mind_text = "В вас была введена эксперементальная гланда, что полностью изменила ваше тело и до неузнаваемости исказила ваш разум. Вы ни за что не хотите что бы ее удаляли. У вас появилось недоверие к электронике и настойчивое желание ее уничтожить."
	abilities = list(/mob/living/carbon/human/proc/emp_light, /mob/living/carbon/human/proc/emp_heavy)
	to_master = 20

/obj/item/organ/internal/gland/emp/effect(var/mob/living/carbon/human/mob)
	if(istype(mob))
		var/mob/living/carbon/human/H = mob

		if(prob(1))
			empulse(H, 2, 4)
			effected++



/obj/item/organ/internal/gland/chemical
	mind_text = "В вас была введена эксперементальная гланда, что полностью изменила ваше тело и до неузнаваемости исказила ваш разум. Вы ни за что не хотите что бы ее удаляли. Вы чувствуете, что в вашей крови есть некий дар, и что вам явно надо делится им с другими."
	abilities = list(/mob/living/carbon/human/proc/create_chems, /mob/living/carbon/human/proc/create_smoke)
	to_master = 24

/obj/item/organ/internal/gland/chemical/effect(var/mob/living/carbon/human/mob)
	if(istype(mob))
		var/mob/living/carbon/human/H = mob

		if (H.getToxLoss())
			H.adjustToxLoss(-3)

		var/obj/item/organ/I = H.internal_organs_by_name[BP_LIVER]

		if(I.damage > 0)
			I.damage = max(I.damage - 3, 0)

		if(prob(2.5))
			var/datum/reagent/random = pick(
										/datum/reagent/blood, /datum/reagent/water, /datum/reagent/acetone, /datum/reagent/aluminium, /datum/reagent/ammonia, /datum/reagent/carbon,
										/datum/reagent/copper, /datum/reagent/ethanol, /datum/reagent/hydrazine, /datum/reagent/iron, /datum/reagent/lithium, /datum/reagent/mercury,
										/datum/reagent/phosphorus, /datum/reagent/potassium, /datum/reagent/radium, /datum/reagent/acid, /datum/reagent/sodium, /datum/reagent/sugar,
										/datum/reagent/sulfur, /datum/reagent/lipozine, /datum/reagent/sodiumchloride, /datum/reagent/frostoil, /datum/reagent/capsaicin/condensed,
										/datum/reagent/inaprovaline, /datum/reagent/bicaridine, /datum/reagent/kelotane, /datum/reagent/dermaline, /datum/reagent/dylovene,
										/datum/reagent/dexalin, /datum/reagent/alkysine, /datum/reagent/hyperzine, /datum/reagent/tobacco, /datum/reagent/gold, /datum/reagent/silver,
										/datum/reagent/uranium, /datum/reagent/thermite, /datum/reagent/space_cleaner, /datum/reagent/glycerol, /datum/reagent/coolant,
										/datum/reagent/toxin/carpotoxin, /datum/reagent/toxin/phoron, /datum/reagent/toxin/cyanide,  /datum/reagent/mutagen, /datum/reagent/space_drugs,
										/datum/reagent/mindbreaker)
			H.reagents.add_reagent(random, 5)
			effected++



/obj/item/organ/internal/gland/plasma
	mind_text = "В вас была введена эксперементальная гланда, что полностью изменила ваше тело и до неузнаваемости исказила ваш разум. Вы ни за что не хотите что бы ее удаляли. Вы внезапно начинаете ощущать непреодолимое желание находится в фороне..."
	abilities = list(/mob/living/carbon/human/proc/create_plasma, /mob/living/carbon/human/proc/create_spark)
	to_master = 20

/obj/item/organ/internal/gland/plasma/effect(var/mob/living/carbon/human/mob)
	if(istype(mob))
		var/mob/living/carbon/human/H = mob

		if (H.getOxyLoss())
			H.adjustOxyLoss(-5)
			return 1

		if (H.getToxLoss())
			H.adjustToxLoss(-5)
			return 1

		if(prob(2))
			for(var/turf/simulated/floor/target_tile in range(2, get_turf(H)))
				target_tile.assume_gas(GAS_PHORON, 10, 25+T0C)
			H.visible_message(SPAN_NOTICE("[H] sneezes."))
			effected++



/obj/item/organ/internal/gland/quantum
	mind_text = "В вас была введена эксперементальная гланда, что полностью изменила ваше тело и до неузнаваемости исказила ваш разум. Вы ни за что не хотите что бы ее удаляли. Вы внезапно осознаете, что вам подвластно само время и пространство. Вы желаете... Приключений."
	abilities = list(/mob/living/carbon/human/proc/switch_places, /mob/living/carbon/human/proc/create_chaos)
	to_master = 24

/obj/item/organ/internal/gland/quantum/effect(var/mob/living/carbon/human/mob)
	if(istype(mob))
		var/mob/living/carbon/human/H = mob

		if(prob(1))
			for(var/mob/living/carbon/human/M in range(8, H))
				if(istype(M) && M != H)
					playsound(H.loc, "sparks", 50, 1)
					playsound(H.loc, 'sound/effects/phasein.ogg', 25, 1)
					var/turf/turf = get_turf(M)
					M.forceMove(get_turf(H))
					H.forceMove(turf)
					M.Weaken(1)
					H.Weaken(1)
					effected++



/obj/item/organ/internal/gland/hunger
	mind_text = "В вас была введена эксперементальная гланда, что полностью изменила ваше тело и до неузнаваемости исказила ваш разум. Вы ни за что не хотите что бы ее удаляли. Вы хотите лишь одного. ПОГЛОЩАТЬ. Ваш голод начинает давить на вас, не позволяя думать ни о чем другом."
	abilities = list(/mob/living/carbon/human/proc/vomit)

/obj/item/organ/internal/gland/hunger/effect(var/mob/living/carbon/human/mob)
	if(istype(mob))
		var/mob/living/carbon/human/H = mob

		if(H.species.gluttonous != GLUT_ANYTHING)
			H.species.gluttonous = GLUT_ANYTHING
			H.species.stomach_capacity = 5000 //He must devour everything
			H.verbs += /mob/living/carbon/proc/devour
			to_chat(H, SPAN_DANGER("Suddenly, you feel very hungry! You want to eat a whole man!"))
			return

		H.nutrition = 5 //Always hungry

		if(prob(5))
			effected++

		if(prob(0.25))
			to_chat(H, SPAN_DANGER("You cannot hold your hunger anymore!"))
			to_chat(H, SPAN_DANGER("You want to eat human flesh!"))

/obj/item/organ/internal/gland/gravity
	mind_text = "В вас была введена эксперементальная гланда, что полностью изменила ваше тело и до неузнаваемости исказила ваш разум. Вы ни за что не хотите что бы ее удаляли. По вашим ощущениям, вы постоянно падаете, без возможности нащупать поверхрность..."
	abilities = list(/mob/living/carbon/human/proc/change_gravity, /mob/living/carbon/human/proc/mass_gravity)
	to_master = 24

/obj/item/organ/internal/gland/gravity/effect(var/mob/living/carbon/human/mob)
	if(istype(mob))
		var/mob/living/carbon/human/H = mob

		if(prob(1))
			H.throw_at(get_edge_target_turf(H, rand(1, 8)),20,1)
			effected++