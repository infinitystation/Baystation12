/proc/alien_queen_exists(var/ignore_self,var/mob/living/carbon/human/self)
	for(var/mob/living/carbon/human/Q in GLOB.living_mob_list_)
		if(self && ignore_self && self == Q)
			continue
		if(Q.species.name != "Xenophage Queen")
			continue
		if(!Q.key || !Q.client || Q.stat)
			continue
		return 1
	return 0

/mob/living/carbon/human/proc/gain_plasma(var/amount)

	var/obj/item/organ/internal/xeno/plasmavessel/I = internal_organs_by_name[BP_PLASMA]
	if(!istype(I)) return

	if(amount)
		I.stored_plasma += amount
	I.stored_plasma = max(0,min(I.stored_plasma,I.max_plasma))

/mob/living/carbon/human/proc/check_alien_ability(var/cost,var/needs_foundation,var/needs_organ)

	var/obj/item/organ/internal/xeno/plasmavessel/P = internal_organs_by_name[BP_PLASMA]
	if(!istype(P))
		to_chat(src, "<span class='danger'>Your plasma vessel has been removed!</span>")
		return

	if(needs_organ)
		var/obj/item/organ/internal/I = internal_organs_by_name[needs_organ]
		if(!I)
			to_chat(src, "<span class='danger'>Your [needs_organ] has been removed!</span>")
			return
		else if(!I.is_usable())
			to_chat(src, "<span class='danger'>Your [needs_organ] is too damaged to function!</span>")
			return

	if(P.stored_plasma < cost)
		to_chat(src, "<span class='warning'>You don't have enough phoron stored to do that.</span>")
		return 0

	if(needs_foundation)
		var/turf/T = get_turf(src)
		var/has_foundation
		if(T)
			//TODO: Work out the actual conditions this needs.
			if(!(istype(T,/turf/space)))
				has_foundation = 1
		if(!has_foundation)
			to_chat(src, "<span class='warning'>You need a solid foundation to do that on.</span>")
			return 0

	P.stored_plasma -= cost
	return 1

// Free abilities.
/mob/living/carbon/human/proc/transfer_plasma(mob/living/carbon/human/M as mob in oview(1))
	set name = "Transfer Plasma"
	set desc = "Transfer Plasma to another alien"
	set category = "Abilities"

	if (get_dist(src,M) > 1)
		to_chat(src, "<span class='alium'>You need to be closer.</span>")
		return

	var/obj/item/organ/internal/xeno/plasmavessel/I = M.internal_organs_by_name[BP_PLASMA]
	if(!istype(I))
		to_chat(src, "<span class='alium'>Their plasma vessel is missing.</span>")
		return

	var/amount = input("Amount:", "Transfer Plasma to [M]") as num
	if (amount)
		amount = abs(round(amount))
		if(check_alien_ability(amount,0,BP_PLASMA) && !is_ventcrawling)
			M.gain_plasma(amount)
			to_chat(M, "<span class='alium'>[src] has transfered [amount] plasma to you.</span>")
			to_chat(src, "<span class='alium'>You have transferred [amount] plasma to [M].</span>")
	return

// Queen verbs.
/mob/living/carbon/human/proc/lay_egg()

	set name = "Lay Egg (500)"
	set desc = "Lay an egg to produce huggers to impregnate prey with."
	set category = "Abilities"

	if(!config.alien_eggs_allowed)
		to_chat(src, "You begin to lay an egg, but hesitate. You suspect it isn't allowed.")
		verbs -= /mob/living/carbon/human/proc/lay_egg
		return

	if(locate(/obj/structure/alien/egg) in get_turf(src))
		to_chat(src, "There's already an egg here.")
		return

	if(check_alien_ability(500,1,BP_EGG) && !is_ventcrawling)
		visible_message("<span class='alium'><B>[src] has laid an egg!</B></span>")
		new /obj/structure/alien/egg(loc)

	return

/mob/living/carbon/human/proc/plant()
	set name = "Plant Weeds (350)"
	set desc = "Plants some alien weeds"
	set category = "Abilities"

	var/obj/structure/alien/A = locate() in loc
	if(A)
		to_chat(src, "<span class='alium'>We can't plant here!</span>")
		return
		if(!do_mob(src, src, 100))
			return
	if(check_alien_ability(350,1,BP_RESIN) && !is_ventcrawling)
		visible_message("<span class='alium'><B>[src] has planted some alien weeds!</B></span>")
		new /obj/structure/alien/weeds/node(loc)
	return

/mob/living/carbon/human/proc/corrosive_acid(O as obj|turf in oview(1)) //If they right click to corrode, an error will flash if its an invalid target./N
	set name = "Corrosive Acid (75)"
	set desc = "Drench an object in acid, destroying it over time."
	set category = "Abilities"

	if(!(O in oview(1)))
		to_chat(src, "<span class='alium'>[O] is too far away.</span>")
		return

	// OBJ CHECK
	var/cannot_melt
	if(isobj(O))
		var/obj/I = O
		if(I.unacidable)
			cannot_melt = 1
	else
		if(istype(O, /turf/simulated/wall))
			var/turf/simulated/wall/W = O
			if(W.material.flags & MATERIAL_UNMELTABLE)
				cannot_melt = 1
		else if(istype(O, /turf/simulated/floor))
			var/turf/simulated/floor/F = O
			if(F.flooring?.flags & TURF_ACID_IMMUNE)
				cannot_melt = 1

	if(cannot_melt)
		to_chat(src, "<span class='alium'>You cannot dissolve this object.</span>")
		return

	if(check_alien_ability(75,0,BP_ACID) && !is_ventcrawling)
		new /obj/effect/acid(get_turf(O), O)
		visible_message("<span class='alium'><B>[src] vomits globs of vile stuff all over [O]. It begins to sizzle and melt under the bubbling mess of acid!</B></span>")

	return

/mob/living/carbon/human/proc/strong_corrosive_acid(O as obj|turf in oview(1)) //If they right click to corrode, an error will flash if its an invalid target./N
	set name = "Corrosive Acid (75)"
	set desc = "Drench an object in acid, destroying it over time."
	set category = "Abilities"

	if(!(O in oview(1)))
		to_chat(src, "<span class='alium'>[O] is too far away.</span>")
		return

	// OBJ CHECK
	var/cannot_melt
	if(isobj(O))
		var/obj/I = O
		if(I.unacidable)
			cannot_melt = 1
	else
		if(istype(O, /turf/simulated/wall))
			var/turf/simulated/wall/W = O
			if(W.material.flags & MATERIAL_UNMELTABLE)
				cannot_melt = 1
		else if(istype(O, /turf/simulated/floor))
			var/turf/simulated/floor/F = O
			if(F.flooring?.flags & TURF_ACID_IMMUNE)
				cannot_melt = 1

	if(cannot_melt)
		to_chat(src, "<span class='alium'>You cannot dissolve this object.</span>")
		return

	if(check_alien_ability(75,0,BP_ACID) && !is_ventcrawling)
		new /obj/effect/acid/strong(get_turf(O), O)
		visible_message("<span class='alium'><B>[src] vomits globs of vile stuff all over [O]. It begins to sizzle and melt under the bubbling mess of acid!</B></span>")

	return

/mob/living/carbon/human/proc/moderate_corrosive_acid(O as obj|turf in oview(1)) //If they right click to corrode, an error will flash if its an invalid target./N
	set name = "Corrosive Acid (75)"
	set desc = "Drench an object in acid, destroying it over time."
	set category = "Abilities"

	if(!(O in oview(1)))
		to_chat(src, "<span class='alium'>[O] is too far away.</span>")
		return

	// OBJ CHECK
	var/cannot_melt
	if(isobj(O))
		var/obj/I = O
		if(I.unacidable)
			cannot_melt = 1
	else
		if(istype(O, /turf/simulated/wall))
			var/turf/simulated/wall/W = O
			if(W.material.flags & MATERIAL_UNMELTABLE)
				cannot_melt = 1
		else if(istype(O, /turf/simulated/floor))
			var/turf/simulated/floor/F = O
			if(F.flooring?.flags & TURF_ACID_IMMUNE)
				cannot_melt = 1

	if(cannot_melt)
		to_chat(src, "<span class='alium'>You cannot dissolve this object.</span>")
		return

	if(check_alien_ability(75,0,BP_ACID) && !is_ventcrawling)
		new /obj/effect/acid/moderate(get_turf(O), O)
		visible_message("<span class='alium'><B>[src] vomits globs of vile stuff all over [O]. It begins to sizzle and melt under the bubbling mess of acid!</B></span>")

	return

/mob/living/carbon/human/proc/neurotoxin(mob/target as mob in oview())
	set name = "Spit Neurotoxin (50)"
	set desc = "Spits neurotoxin at someone, paralyzing them for a short time if they are not wearing protective gear."
	set category = "Abilities"


	if(stat || paralysis || stunned || weakened || lying || restrained() || buckled)
		to_chat(src, "You cannot spit neurotoxin in your current state.")
		return

	if(!(isxenomorph(target) || isalien(target)))
		visible_message("<span class='warning'>[src] spits neurotoxin at [target]!</span>", "<span class='alium'>You spit neurotoxin at [target].</span>")
		if(!check_alien_ability(50,0,BP_ACID) && !is_ventcrawling)
			return

		var/obj/item/projectile/energy/neurotoxin/A = new /obj/item/projectile/energy/neurotoxin(usr.loc)
		A.launch(target,get_organ_target())

/mob/living/carbon/human/proc/spit_acid(mob/target as mob in oview())
	set name = "Spit Acid (50)"
	set desc = "Spits some acid at someone, dealing some damage to them if they are not wearing protective gear."
	set category = "Abilities"


	if(stat || paralysis || stunned || weakened || lying || restrained() || buckled)
		to_chat(src, "You cannot spit acid in your current state.")
		return

	if(!(isxenomorph(target) || isalien(target)))
		visible_message("<span class='warning'>[src] spits some acid at [target]!</span>", "<span class='alium'>You spit acid at [target].</span>")
		if(!check_alien_ability(50,0,BP_ACID) && !is_ventcrawling)
			return

		var/obj/item/projectile/energy/alien_acid/A = new /obj/item/projectile/energy/alien_acid(usr.loc)
		A.launch(target,get_organ_target())

/mob/living/carbon/human/proc/resin() // -- TLE
	set name = "Secrete Resin (75)"
	set desc = "Secrete tough, malleable resin."
	set category = "Abilities"

	var/obj/structure/alien/A = locate() in loc
	var/obj/structure/bed/nest/B = locate() in loc
	var/obj/machinery/door/unpowered/simple/resin/C = locate() in loc
	if((A && !istype(A, /obj/structure/alien/weeds)) || B || C)
		to_chat(src, "<span class='alium'>We can't secrete more resin here!</span>")
		return
	var/choice = input("Choose what you wish to shape.","Resin building") as null|anything in list("resin door","resin wall","resin membrane","resin nest") //would do it through typesof but then the player choice would have the type path and we don't want the internal workings to be exposed ICly - Urist
	if(!choice)
		return

	if(!check_alien_ability(75,1,BP_RESIN) && !is_ventcrawling)
		return

	visible_message("<span class='warning'><B>[src] vomits up a thick purple substance and begins to shape it!</B></span>", "<span class='alium'>You shape a [choice].</span>")
	switch(choice)
		if("resin door")
			new /obj/machinery/door/unpowered/simple/resin(loc)
		if("resin wall")
			new /obj/structure/alien/resin/wall(loc)
		if("resin membrane")
			new /obj/structure/alien/resin/membrane(loc)
		if("resin nest")
			new /obj/structure/bed/nest(loc)
	return

mob/living/carbon/human/proc/xeno_infest(mob/living/carbon/human/M as mob in oview())
	set name = "Infest (500)"
	set desc = "Link a victim to the hivemind."
	set category = "Abilities"

	if(!M.Adjacent(src))
		to_chat(src, SPAN_ALIEN("Оно слишком далеко."))
		return

	if(!M.mind)
		to_chat(src, SPAN_ALIEN("Плоть без разума принесёт пользу Улью лишь в качестве пищи."))
		return

	if(M.species.get_bodytype(M) == "Xenophage" || !isnull(M.internal_organs_by_name["hive node"]))
		to_chat(src, SPAN_ALIEN("Оно уже часть нашего Улья."))
		return

	var/obj/item/organ/affecting = M.get_organ(BP_CHEST)
	if(!affecting || BP_IS_ROBOTIC(affecting))
		to_chat(src, SPAN_ALIEN("Это тело несовметимо с нашей физиологией..."))
		return

	src.visible_message(SPAN_DANGER("[src] встает перед [M], а затем, из её брюшка появляется полое, прозрачное жало!"))

	if(!do_mob(src, M, 150))
		return

	if(!M || !M.Adjacent(src))
		to_chat(src, "<span class='warning'>They are too far away.</span>")
		return

	if(M.species.get_bodytype(M) == "Xenophage" || !isnull(M.internal_organs_by_name["hive node"]) || !affecting || BP_IS_ROBOTIC(affecting))
		return

	if(!check_alien_ability(500,1,"egg sac") && !is_ventcrawling)
		return

	src.visible_message(SPAN_DANGER("[src] протыкает грудь [M] с помощью полой трубки и вводит что-то внутрь!"))
	to_chat(M, SPAN_DANGER("Уродливая и бесформенная масса вводится под ваши ребра через трубку!"))
	var/obj/item/organ/internal/xeno/hivenode/node = new(affecting)
	node.replaced(M,affecting)

/mob/living/carbon/human/proc/pry_open(obj/machinery/door/A in filter_list(oview(1), /obj/machinery/door))
	set name = "Pry Open Airlock"
	set desc = "Pry open an airlock with your claws."
	set category = "Abilities"

	if(!istype(A) || incapacitated())
		return

	if(!A.Adjacent(src))
		to_chat(src, "<span class='warning'>\The [A] is too far away.</span>")
		return

	if(!A.density)
		return

	src.visible_message("\The [src] begins to pry open \the [A]!")


	if(A.stat != NOPOWER)
		playsound(A.loc, 'infinity/sound/effects/metal_creaking.ogg', 25, 1)
		if(!do_mob(src,src,65))
			return

	if(!A.density)
		return

//	A.do_animate("spark")
//	sleep(5)
//	A.set_broken(TRUE)
	A.open(1) //var/check =
//	src.visible_message("\The [src] slices \the [A]'s controls[check ? ", ripping it open!" : ", breaking it!"]")

/mob/living/carbon/human/proc/evolve_hivelord()
	set name = "Evolve to queen (500)"
	set desc = "Produce an interal egg sac capable of spawning children. Only one queen can exist at a time."
	set category = "Abilities"

	if(alien_queen_exists())
		to_chat(src, "<span class='notice'>We already have an active queen.</span>")
		return

	if(check_alien_ability(500))
		visible_message("<span class='alium'><B>[src] begins to twist and contort!</B></span>", "<span class='alium'>You begin to evolve!</span>")
		src.set_species("Xenophage Queen")

	return

/mob/living/carbon/human/proc/evolve_hunter()
	set name = "Evolve (300)"
	set desc = "Raise natural speed in cost of some armor. Also, your attacks will be stronger."
	set category = "Abilities"

	if(check_alien_ability(300))
		visible_message("<span class='alium'><B>[src] begins to twist and contort!</B></span>", "<span class='alium'>You begin to evolve!</span>")
		src.set_species("Xenophage Warrior")

	return

/mob/living/carbon/human/proc/evolve_sentinel()
	set name = "Evolve (300)"
	set desc = "Evolve an additional acid gland, capable of shooting acid."
	set category = "Abilities"

	if(check_alien_ability(300))
		visible_message("<span class='alium'><B>[src] begins to twist and contort!</B></span>", "<span class='alium'>You begin to evolve!</span>")
		src.set_species("Xenophage Spitter")

	return

/mob/living/carbon/human/proc/evolve_drone()
	set name = "Evolve (300)"
	set desc = "Produce a better armor and acid gland."
	set category = "Abilities"

	if(check_alien_ability(300))
		visible_message("<span class='alium'><B>[src] begins to twist and contort!</B></span>", "<span class='alium'>You begin to evolve!</span>")
		src.set_species("Xenophage Hivelord")

	return

/mob/living/carbon/human/proc/mimic()
	set name = "Mimic"
	set desc = "Use your internal color sacs to mimic to your environment."
	set category = "Abilities"

	if(check_alien_ability(5))
		if(src.alpha < 255)
			src.alpha = 255
		else
			src.alpha = 0
	return

/mob/living/carbon/human/proc/create_hugger()
	set name = "Vomit Facehugger (100)"
	set desc = "Vomit a facehugger, capable of latching onto people and stunning them."
	set category = "Abilities"

	if(check_alien_ability(100))
		visible_message("<span class='alium'><B>[src] vomits a strange creature with legs and a tail!</B></span>", "<span class='alium'>You vomit a facehugger!</span>")
		var/obj/item/clothing/mask/facehugger/facehugger = new(get_turf(src))
		src.put_in_hands(facehugger)
	return