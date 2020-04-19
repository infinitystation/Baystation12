/atom/var/mob/AiHolder/AiHolder
/atom/proc/AiControl(mob/living/silicon/ai/ai)
	if(!istype(ai)) return
	if(!AiHolder) return
	if(!AiHolder.MyAI) switch(alert(ai, "Are you sure that you want to put yourself in turret?", "Ai Control", "Yes", "No"))
		if("Yes") assume_AI_control(ai)
	else to_chat(ai, "[src] already occupied by another AI.")

/atom/proc/assume_AI_control(mob/living/silicon/ai/ai)
	if(!AiHolder) AIHOLDERINIT
	ai.mind?.transfer_to(AiHolder)
	AiHolder.MyAI = ai
	ai.Controlling = src

/atom/proc/onReturnAi2Core()
/atom/proc/onAiHolderLife()
/atom/proc/onAiHolderLogin()
/atom/proc/onAiHolderClickOn(var/atom/A, var/params)

#define AIHOLDER_CRASHMESSAGE "ATTEMPT TO CALL A FUNCTION OF THE HOLDER WITH src = [src.type]"
/mob/AiHolder/onReturnAi2Core()
	CRASH(AIHOLDER_CRASHMESSAGE)
/mob/AiHolder/onAiHolderLife()
	CRASH(AIHOLDER_CRASHMESSAGE)
/mob/AiHolder/onAiHolderLogin()
	CRASH(AIHOLDER_CRASHMESSAGE)
/mob/AiHolder/onAiHolderClickOn(var/atom/A, var/params)
	CRASH(AIHOLDER_CRASHMESSAGE)
/mob/AiHolder/assume_AI_control(mob/living/silicon/ai/ai)
	CRASH(AIHOLDER_CRASHMESSAGE)
/mob/AiHolder/AiControl(mob/living/silicon/ai/ai)
	CRASH(AIHOLDER_CRASHMESSAGE)
#undef AIHOLDER_CRASHMESSAGE

