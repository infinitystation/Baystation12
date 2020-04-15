AIHOLDER_INITIALIZE(/obj/machinery/porta_turret)

/obj/machinery/porta_turret/Destroy()
	CleenTurret_matrix(AiHolder)
	qdel(AiHolder)
	. = ..()

/obj/machinery/porta_turret/attack_ai(mob/living/silicon/ai/ai)
	if(!AiHolder) AIHOLDERINIT
	if(istype(ai) && !AiHolder?.MyAI) AiControl(ai)
	. = ..()

/obj/machinery/porta_turret/assume_AI_control(mob/living/silicon/ai/ai)
	. = ..()
	onAiHolderLife()

/obj/machinery/porta_turret/onReturnAi2Core()
	. = ..()
	CleenTurret_matrix(AiHolder)

/obj/machinery/porta_turret/onAiHolderLife()
	. = ..()
	if(AiHolder?.client) UpdateTurretMatrix(AiHolder)

/obj/machinery/porta_turret/assess_and_assign(mob/living/L, list/targets, list/secondarytargets)
	if(!AiHolder.client) . = ..()

/obj/machinery/porta_turret/onAiHolderClickOn(atom/A, params)
	. = ..()
	var/list/modifiers = params2list(params)
	if(modifiers["middle"])
		if(raised) popDown()
		else popUp()
		spawn(1 SECOND) to_chat(AiHolder, "Your turret's cover now [raised ? "open" : "closed"]")

	else if(A != src) target(A)

	onAiHolderLife()
