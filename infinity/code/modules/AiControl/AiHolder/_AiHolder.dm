/mob/living/silicon/AiHolder
	name = "AIHuldor"
	desc = "You mustn't see this."

	var/atom/holder
	var/mob/living/silicon/ai/MyAI

	invisibility = INVISIBILITY_SYSTEM
//	see_invisible = SEE_INVISIBLE_LIVING

/mob/living/silicon/AiHolder/New(nlocation)
	. = ..()
	holder = nlocation
	if(holder)
		forceMove(get_turf(holder))
		GLOB.moved_event.register(holder, src, /atom/movable/proc/move_to_turf)
		GLOB.moved_event.register(src, src, .proc/Move2Holder)
		GLOB.destroyed_event.register(holder, src, /proc/qdel)


/mob/living/silicon/AiHolder/Destroy()
	ExitHolder()
	GLOB.moved_event.unregister(holder, src)
	GLOB.moved_event.unregister(src, holder)
	GLOB.destroyed_event.unregister(holder, src)
	. = ..()

/mob/living/silicon/AiHolder/proc/Move2Holder()
	loc = holder.loc

/mob/living/silicon/AiHolder/verb/ExitHolder()
	set name = "Return to core"
	set category = "Silicon Commands"

	mind?.transfer_to(MyAI)
	MyAI = null
	holder?.onReturnAi2Core()

/mob/living/silicon/AiHolder/Life()
	. = ..()
	holder.onAiHolderLife()

/mob/living/silicon/AiHolder/Login()
	. = ..()
	Life()
	holder.onAiHolderLogin()

/mob/living/silicon/AiHolder/ClickOn(atom/A, params)
	. = ..()
	holder.onAiHolderClickOn(A, params)
