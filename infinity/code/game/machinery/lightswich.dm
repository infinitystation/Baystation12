/obj/machinery/light_switch/on
	icon_state = "light1"
	on = 1

/obj/machinery/light_switch
	var/smart = 1

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
	if(!ishuman(detected))
		return
	// Regular manual lightswitch
	if(smart == 0)
		return
	// Smart 1 only turns off light. Turn on it manualy
	if(smart == 1 && !on)
		return
	var/anyoneElse = FALSE
	if(locate(/mob/living/carbon/human) in connected_area)
		anyoneElse = TRUE
	
	// We won't turn lights off if there other humans presented
	if(!(on ^ anyoneElse))
		return

	set_state(!on)
	visible_message("[src] в[on?"":"ы"]ключился как только [detected.name] [on?"вошел в":"покинул"] помещение.")

/obj/machinery/light_switch/Initialize()
	. = ..()
	if(connected_area)
		GLOB.entered_event.register(connected_area, src, /obj/machinery/light_switch/proc/motion_detect)
		GLOB.exited_event.register(connected_area, src, /obj/machinery/light_switch/proc/motion_detect)

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
			smart = 0
		if("Only turn off")
			smart = 1
		if("Full auto")
			smart = 2
	sync_motionMode()
