/mob/living/bot
	var/fireloss = 0
	var/bruteloss = 0
	var/oxyloss = 0

/mob/living/bot/getFireLoss()
	return fireloss

/mob/living/bot/getBruteLoss()
	return bruteloss

/mob/living/bot/getOxyLoss()
	return oxyloss

/mob/living/bot/adjustFireLoss(var/amount)
	if(status_flags & GODMODE) return
	fireloss = max(0, fireloss + min(amount, health))

/mob/living/bot/adjustBruteLoss(var/amount)
	if(status_flags & GODMODE) return
	bruteloss = max(0, bruteloss + min(amount, health))

/mob/living/bot/adjustOxyLoss(var/amount)
	if(status_flags & GODMODE) return
	oxyloss = max(0, oxyloss + min(amount, maxHealth - oxyloss))

/mob/living/bot/setFireLoss(var/amount)
	if(status_flags & GODMODE)
		fireloss = 0
		return
	fireloss = max(0, amount)

/mob/living/bot/setOxyLoss(var/amount)
	if(status_flags & GODMODE)
		oxyloss = 0
		return
	oxyloss = max(0, amount)

/mob/living/bot/updatehealth()
	if(status_flags & GODMODE)
		health = maxHealth
		set_stat(CONSCIOUS)
		setOxyLoss(0)
		setToxLoss(0)
	else
		health = maxHealth - getFireLoss() - getBruteLoss()
