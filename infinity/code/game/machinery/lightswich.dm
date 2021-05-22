/obj/machinery/light_switch/on
	icon_state = "light1"
	on = 1

#define LS_MODE_MANUAL		0
#define LS_MODE_ONLY_OFF	1
#define LS_MODE_FULL_AUTO	2
/obj/machinery/light_switch
	var/smart = LS_MODE_FULL_AUTO

/obj/machinery/light_switch/examine(mob/user, distance)
	. = ..()
	if(distance)
		to_chat(user, "Auto mode: [smart]")

/obj/machinery/light_switch/proc/sync_motionMode()
	if(connected_area)
		for(var/obj/machinery/light_switch/L in connected_area)
			if(L.smart != smart)
				L.smart = smart

/obj/machinery/light_switch/proc/motion_detect(var/area/myarea, var/atom/movable/detected)
	// Furniture, simple_animals - doesn't care
	if(!(ishuman(detected) || istype(detected, /mob/living/exosuit)))
		return
	// Regular manual lightswitch
	if(smart == LS_MODE_MANUAL)
		return
	// Smart 1 only turns off light. Turn on it manualy
	if(smart == LS_MODE_ONLY_OFF && !on)
		return
	var/anyoneElse = FALSE
	if((locate(/mob/living/carbon/human) in connected_area) || (locate(/mob/living/exosuit) in connected_area))
		anyoneElse = TRUE
	
	// We won't turn lights off if there other humans presented
	if(!(on ^ anyoneElse))
		return

	set_state(!on)
	//visible_message("Выключатель тихо щелкнул и в[on?"":"ы"]ключился как только [detected.name] [on?"вошел в":"покидает"] помещение.")

/obj/machinery/light_switch/Initialize()
	. = ..()
	if(connected_area)
		GLOB.entered_event.register(connected_area, src, /obj/machinery/light_switch/proc/motion_detect)
		GLOB.exited_event.register(connected_area, src, /obj/machinery/light_switch/proc/motion_detect)
		
/obj/machinery/light_switch/Destroy()
	GLOB.entered_event.unregister(connected_area, src, /obj/machinery/light_switch/proc/motion_detect)
	GLOB.exited_event.unregister(connected_area, src, /obj/machinery/light_switch/proc/motion_detect)
	. = ..()

/obj/machinery/light_switch/verb/configure_motion_detector()
	set name = "Toggle motion sensor"
	set desc = "Adjust lightswitche's motion sensors"
	set category = "Object"
	set src in view(1)

	if(!CanPhysicallyInteract(usr))
		return
	
	var/selection = input(usr, "Set smart motion detectors mode.", "Mode" , "") as null|anything in list("Manual", "Only turn off", "Full auto")
	if(!CanPhysicallyInteract(usr))
		return
	switch(selection)
		if("Manual")
			smart = LS_MODE_MANUAL
		if("Only turn off")
			smart = LS_MODE_ONLY_OFF
		if("Full auto")
			smart = LS_MODE_FULL_AUTO
	sync_motionMode()

#undef LS_MODE_FULL_AUTO
#undef LS_MODE_ONLY_OFF
#undef LS_MODE_MANUAL
