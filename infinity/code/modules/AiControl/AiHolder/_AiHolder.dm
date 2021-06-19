/mob/AiHolder
	name = "AIHuldor"
	desc = "You mustn't see this."

	var/atom/holder
	var/mob/living/silicon/ai/MyAI
	density = FALSE
	invisibility = INVISIBILITY_SYSTEM
//	see_invisible = SEE_INVISIBLE_LIVING

	simulated = FALSE

/mob/AiHolder/New(nlocation)
	. = ..()
	holder = nlocation
	if(holder)
		forceMove(get_turf(holder))
		GLOB.moved_event.register(holder, src, /atom/movable/proc/move_to_turf)
		GLOB.moved_event.register(src, src, .proc/Move2Holder)
		GLOB.destroyed_event.register(holder, src, /proc/qdel)


/mob/AiHolder/Destroy()
	ExitHolder()
	GLOB.moved_event.unregister(holder, src)
	GLOB.moved_event.unregister(src, holder)
	GLOB.destroyed_event.unregister(holder, src)
	. = ..()

/mob/AiHolder/proc/Move2Holder()
	loc = holder.loc

/mob/AiHolder/verb/ExitHolder()
	set name = "Return to core"
	set category = "Silicon Commands"

	mind?.transfer_to(MyAI)
	MyAI = null
	holder?.onReturnAi2Core()

/mob/AiHolder/Life()
	. = ..()
	holder.onAiHolderLife()

/mob/AiHolder/Login()
	. = ..()
	Life()
	holder.onAiHolderLogin()

/mob/AiHolder/ClickOn(atom/A, params)
	. = ..()
	holder.onAiHolderClickOn(A, params)

/mob/AiHolder/bullet_act()
	return
/mob/AiHolder/emp_act()
	return
/mob/AiHolder/ex_act()
	return
