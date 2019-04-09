/obj/item/organ/internal/sensor
	name = "Swarm sensors"
	desc = "Сенсоры, похожи на сенсоры боргов, но их больше и они меньше"
	icon = 'icons/swarm/obj/organ/internal.dmi'
	icon_state = "sensor"
	organ_tag = BP_SENSOR
	parent_organ = BP_SHELL
	var/flash_protection = FLASH_PROTECTION_NONE
	max_damage = 200
	var/night_vision = 0

/obj/item/organ/internal/sensor/Process() //Eye damage replaces the old eye_stat var.
	..()
	if(!owner)
		return
	if(is_bruised())
		owner.eye_blurry = 20
	if(is_broken())
		owner.eye_blind = 20
	if(night_vision == TRUE)
		owner.see_invisible = 15