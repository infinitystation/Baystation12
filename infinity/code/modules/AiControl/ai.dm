/mob/living/silicon/ai/var/atom/Controlling
/mob/living/silicon/ai/rejuvenate()
	. = ..()
	Controlling?.AiHolder?.ExitHolder()

/mob/living/silicon/ai/adjustFireLoss(var/amount)
	var/old = fireloss
	. = ..()
	if(old != fireloss) Controlling?.AiHolder?.ExitHolder()

/mob/living/silicon/ai/adjustBruteLoss(var/amount)
	var/old = bruteloss
	. = ..()
	if(old != bruteloss) Controlling?.AiHolder?.ExitHolder()

/mob/living/silicon/ai/adjustOxyLoss(var/amount)
	var/old = oxyloss
	. = ..()
	if(old != oxyloss) Controlling?.AiHolder?.ExitHolder()

/mob/living/silicon/ai/Destroy()
	Controlling?.AiHolder?.ExitHolder()
	. = ..()
