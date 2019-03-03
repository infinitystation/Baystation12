// используется в whitelist.dm при проверке на доступность расы
/datum/species/proc/whitelistName(var/mob/living/carbon/human/H)
	return get_bodytype(H)
