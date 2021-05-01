/obj/item/weapon/material/kitchen/rollingpin/aluminium
	default_material = MATERIAL_ALUMINIUM
	icon_state = "rolling_pin"
	icon = 'icons/obj/augment.dmi'
	
/obj/item/organ/internal/augment/active/polytool/kitchen
	name = "Kitchen toolset"
	action_button_name = "Deploy Kitchen Tool"
	desc = "A lightweight augmentation for the kitchen and garden. This one comes with a series of common tools."
	paths = list(
		/obj/item/weapon/material/kitchen/rollingpin/aluminium,
		/obj/item/weapon/material/knife/kitchen,
		/obj/item/weapon/wirecutters/clippers,
		/obj/item/weapon/material/hatchet,
		/obj/item/weapon/material/minihoe,
		/obj/item/weapon/reagent_containers/glass/beaker/bowl
	)

/obj/item/organ/internal/augment/active/polytool/surgical_hi_tech
	name = "hi-tech surgical toolset"
	action_button_name = "Deploy Hi-Tech Surgical Tool"
	desc = "Part of Zeng-Hu Hi-Tech Pharmaceutical's line of biomedical augmentations, this device contains the full set of tools any surgeon would ever need."
	paths = list(
		/obj/item/weapon/bonesetter/bone_mender,
		/obj/item/weapon/scalpel/laser2,
		/obj/item/weapon/circular_saw/plasmasaw,
		/obj/item/weapon/hemostat/pico,
		/obj/item/weapon/retractor,
		/obj/item/weapon/FixOVein/clot
	)

//Stunbaton
/obj/item/weapon/melee/baton/augment
	bcell = null
	hitcost = null
	icon = 'icons/obj/augment.dmi'
	icon_state = "baton"

/obj/item/weapon/melee/baton/augment/examine_cell(mob/user)
	to_chat(user, "<span class='notice'>The baton is running off an external power supply.</span>")

/obj/item/weapon/melee/baton/augment/on_update_icon()
	if(status)
		icon_state = "baton_active"
		item_state = "baton_active"
		set_light(0.4, 0.1, 1, 2, "#006aff")
	else
		item_state = "baton"
		icon_state = "baton"
		set_light(0)

/obj/item/weapon/melee/baton/augment/set_status(var/newstatus, mob/user)
	if(status != newstatus)
		change_status(newstatus)
		to_chat(user, "<span class='notice'>[src] is now [status ? "on" : "off"].</span>")
		playsound(loc, "sparks", 75, 1, -1)
	
/obj/item/organ/internal/augment/active/simple/baton
	name = "stunbaton"
	desc = "A sturdy housing for a steel utility baton."
	action_button_name = "Deploy baton"
	icon_state = "baton"
	allowed_organs = list(BP_AUGMENT_R_ARM, BP_AUGMENT_L_ARM)
	holding_type = /obj/item/weapon/melee/baton/augment
	//Limited to robolimbs
	augment_flags = AUGMENTATION_MECHANIC
	
//boosters
/obj/item/organ/internal/augment/boost/anatomy
	name = "Surgery interceptor"
	desc = "A miniature computer with a primitive AI, this piece of engineering uses predictive algorithms and machine learning to provide near-instant response to any situation during surgery."
	buffs = list(SKILL_ANATOMY = 1)
	injury_debuffs = list(SKILL_ANATOMY = -1)

/obj/item/organ/internal/augment/boost/anatomy/buff()
	if((. = ..()))
		to_chat(owner, SPAN_NOTICE("Notice: Surgeon-2.0 finished reboot.."))

/obj/item/organ/internal/augment/boost/anatomy/debuff()
	if((. = ..()))
		to_chat(owner, SPAN_WARNING("Catastrophic damage detected: Surgeon-2.0 shutting down."))
		
/obj/item/organ/internal/augment/boost/medical
	name = "Medical interceptor"
	desc = "A miniature computer with a primitive AI, this piece of engineering uses predictive algorithms and machine learning to provide мore accurate diagnosis, as well as to prescribe optimal treatment."
	buffs = list(SKILL_MEDICAL = 1)
	injury_debuffs = list(SKILL_MEDICAL = -1)

/obj/item/organ/internal/augment/boost/medical/buff()
	if((. = ..()))
		to_chat(owner, SPAN_NOTICE("Notice: Med-3.5 finished reboot.."))

/obj/item/organ/internal/augment/boost/medical/debuff()
	if((. = ..()))
		to_chat(owner, SPAN_WARNING("Catastrophic damage detected: %ERROR% shutting down."))

/obj/item/organ/internal/augment/boost/pilot
	name = "Pilot interceptor"
	desc = "A miniature computer with a primitive AI, this piece of engineering uses predictive algorithms and machine learning to provide мore accurate routing and maneuvers on different shuttles."
	buffs = list(SKILL_PILOT = 1)
	injury_debuffs = list(SKILL_PILOT = -1)

/obj/item/organ/internal/augment/boost/pilot/buff()
	if((. = ..()))
		to_chat(owner, SPAN_NOTICE("Notice: Flyer finished reboot.."))

/obj/item/organ/internal/augment/boost/pilot/debuff()
	if((. = ..()))
		to_chat(owner, SPAN_WARNING("Catastrophic damage detected: %ERROR% shutting down."))
