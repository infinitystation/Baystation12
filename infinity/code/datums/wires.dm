/datum/wires/explosive/frag
	holder_type = /obj/item/weapon/grenade/frag/ied

/datum/wires/explosive/frag/CanUse(var/mob/living/L)
	var/obj/item/weapon/grenade/frag/ied/P = holder
	if(P.open_panel)
		return 1
	return 0

/datum/wires/explosive/frag/explode()
	var/obj/item/weapon/grenade/frag/ied/P = holder
	P.detonate(get_turf(P))

/datum/wires/explosive/belt
	holder_type = /obj/item/weapon/grenade/frag/high_yield/belt

/datum/wires/explosive/belt/CanUse(var/mob/living/L)
	var/obj/item/weapon/grenade/frag/high_yield/belt/P = holder
	if(P.open_panel)
		return 1
	return 0

/datum/wires/explosive/belt/explode()
	var/obj/item/weapon/grenade/frag/high_yield/belt/P = holder
	playsound(P.loc, 'infinity/sound/weapons/beltbomb.ogg', 100)
	sleep(0.5 SECONDS)
	P.detonate(get_turf(P))

/datum/wires/explosive/lfrag
	holder_type = /obj/item/weapon/grenade/frag/high_yield/ied

/datum/wires/explosive/lfrag/CanUse(var/mob/living/L)
	var/obj/item/weapon/grenade/frag/high_yield/ied/P = holder
	if(P.open_panel)
		return 1
	return 0

/datum/wires/explosive/lfrag/explode()
	var/obj/item/weapon/grenade/frag/high_yield/ied/P = holder
	P.detonate(get_turf(P))