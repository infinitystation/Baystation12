equipment_darkness_modifier
equipment_vision_flags
equipment_light_protection
equipment_see_invis

/datum/lacesoft/visual/sechud
	name = "SecHUD AR Overlay"
	dest = "SecHUD overlay, capable of showing job, arrest status and providing access to security records. Made by Cybersun Industries."

/datum/lacesoft/visual/sechud/process_hud(var/mob/living/carbon/human/owner)
	. = ..()
	if(active)
		process_sec_hud(owner, 1)

/datum/lacesoft/visual/medhud
	name = "MedHUD AR Overlay"
	dest = "MedHUD overlay, capable of showing health status, heartbeat and diseases of patients. Manufactured by Vey-Med."

/datum/lacesoft/visual/medhud/process_hud(var/mob/living/carbon/human/owner)
	. = ..()
	if(active)
		process_med_hud(owner, 1)

/datum/lacesoft/visual/janihud
	name = "JaniHUD AR Overlay"
	dest = "JaniHUD overlay, capable of showing all the dirt to the owner. This one is made by NanoTrasen."

/datum/lacesoft/visual/janihud/process_hud(var/mob/living/carbon/human/owner)
	. = ..()
	if(active)
		process_jani_hud(owner, 1)

/datum/lacesoft/visual/presctiption
	name = "Corrective AR Overlay"
	dest = "A complex overlay, capable of improving owner's vision. Can be combined with other AR Overlays freely."

/datum/lacesoft/visual/presctiption/process_hud(var/mob/living/carbon/human/owner)
	. = ..()
	if(active)
		owner.equipment_prescription += 7

/datum/lacesoft/visual/night_vision
	name = "Low-Light Amplifier"
	dest = "This is an overlay, which will amplify lighting in dark enviroments."
	level = 1

/datum/lacesoft/visual/night_vision/process_hud(var/mob/living/carbon/human/owner)
	. = ..()
	if(active)
		owner.equipment_see_invis = min(owner.equipment_see_invis, SEE_INVISIBLE_NOLIGHTING)
		owner.equipment_darkness_modifier += 7

/datum/lacesoft/visual/flashprot
	name = "Responsive Filter"
	dest = "Blocks all bright lights, giving protection to flash-based devices. However, you will see much worse in darkness."
	level = 1

/datum/lacesoft/visual/flashprot/process_hud(var/mob/living/carbon/human/owner)
	. = ..()
	if(active)
		owner.equipment_darkness_modifier -= 7
		owner.equipment_prescription -= 7

//Advanced LaceSoft which needs cybernetic eyes

/datum/lacesoft/visual/adv
	level = 1
	compatability = /obj/item/organ/internal/eyes/cybernetic

/datum/lacesoft/visual/adv/meson
	name = "Meson AR Overlay"
	dest = "A complex overlay, which allows user to see walls and floors through stuff. It requires cybernetic eyes' sensors and can't be used without them."

/datum/lacesoft/visual/adv/meson/process_hud(var/mob/living/carbon/human/owner)
	. = ..()
	if(active)
		owner.equipment_vision_flags |= SEE_TURFS

/datum/lacesoft/visual/adv/material
	name = "Material AR Overlay"
	dest = "A complex overlay, which allows user to see tables, machines and other objects through stuff. It requires cybernetic eyes' sensors and can't be used without them."

/datum/lacesoft/visual/adv/material/process_hud(var/mob/living/carbon/human/owner)
	. = ..()
	if(active)
		owner.equipment_vision_flags |= SEE_OBJS

/datum/lacesoft/visual/adv/thermal
	name = "Thermal AR Overlay"
	dest = "A complex overlay, which allows user to detect heat-emitting creatures through stuff. It requires cybernetic eyes' sensors and can't be used without them."
	illegal = TRUE

/datum/lacesoft/visual/adv/thermal/process_hud(var/mob/living/carbon/human/owner)
	. = ..()
	if(active)
		owner.equipment_vision_flags |= SEE_MOBS

/datum/lacesoft/visual/adv/xray //Wizards have one, why cant we have?
	name = "X-Ray AR Overlay"
	dest = "A complex overlay, which allows user to see through walls. It requires cybernetic eyes' sensors and can't be used without them."
	level = 3
	illegal = TRUE

/datum/lacesoft/visual/adv/xray/process_hud(var/mob/living/carbon/human/owner)
	. = ..()
	if(active)
		owner.equipment_vision_flags |= SEE_TURFS
		owner.equipment_vision_flags |= SEE_OBJS
		owner.equipment_vision_flags |= SEE_MOBS