/mob/observer/eye/AiHolder
	name = "AIHuldor"
	desc = "You mustn't see this."

	var/atom/holder
	var/mob/living/silicon/ai/MyAI

	invisibility = INVISIBILITY_SYSTEM
	see_invisible = SEE_INVISIBLE_LIVING

/mob/observer/eye/AiHolder/New(nlocation)
	. = ..()
	holder = nlocation
	if(holder)
		forceMove(get_turf(holder))
		GLOB.moved_event.register(holder, src, /atom/movable/proc/move_to_turf)
		GLOB.moved_event.register(src, src, .proc/Move2Holder)
		GLOB.destroyed_event.register(holder, src, /proc/qdel)


/mob/observer/eye/AiHolder/Destroy()
	ExitHolder()
	GLOB.moved_event.unregister(holder, src)
	GLOB.moved_event.unregister(src, holder)
	GLOB.destroyed_event.unregister(holder, src)
	. = ..()

/mob/observer/eye/AiHolder/proc/Move2Holder()
	loc = holder.loc

/mob/observer/eye/AiHolder/verb/ExitHolder()
	set name = "Return to core"
	set category = "Silicon Commands"

	mind?.transfer_to(MyAI)
	MyAI = null
	holder?.onReturnAi2Core()

/mob/observer/eye/AiHolder/Life()
	. = ..()
	holder.onAiHolderLife()

/mob/observer/eye/AiHolder/Login()
	. = ..()
	Life()
	holder.onAiHolderLogin()

/mob/observer/eye/AiHolder/ClickOn(atom/A, params)
	. = ..()
	holder.onAiHolderClickOn(A, params)
