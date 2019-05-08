/mob/living/swarm
	hud_type = /datum/hud/swarm

/datum/hud/swarm/FinalizeInstantiation()
	var/mob/living/swarm/target = mymob
	var/datum/hud_data/hud_data
	if(!istype(target))
		hud_data = new()
	else
		hud_data = target.species.hud

	src.adding = list()
	src.other = list()
	src.hotkeybuttons = list()

	var/list/hud_elements = list()
	var/obj/screen/using
	//var/obj/screen/inventory/inv_box

	if(hud_data.has_a_intent)

		using = new /obj/screen/intent()
		src.adding += using
		action_intent = using
		hud_elements |= using

	mymob.zone_sel = new /obj/screen/zone_sel( null )
	mymob.zone_sel.overlays.Cut()
	mymob.zone_sel.overlays += image('icons/mob/zone_sel.dmi', "[mymob.zone_sel.selecting]")
	hud_elements |= mymob.zone_sel