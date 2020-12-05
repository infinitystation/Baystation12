/obj/item/integrated_circuit/input/list_picker
	name = "list picker"
	desc = "A touch screen with all the data you need to pick."
	icon_state = "screen"
	complexity = 3
	inputs = list("List" = IC_PINTYPE_LIST)
	outputs = list("Picked element" = IC_PINTYPE_ANY)
	activators = list("on pressed" = IC_PINTYPE_PULSE_OUT, "on picked" = IC_PINTYPE_PULSE_OUT)
	spawn_flags = IC_SPAWN_DEFAULT|IC_SPAWN_RESEARCH
	power_draw_per_use = 5

/obj/item/integrated_circuit/input/list_picker/get_topic_data(mob/user)
	return list("Press" = "list_pick=1")

/obj/item/integrated_circuit/input/list_picker/OnICTopic(href_list, user)
	if(href_list["list_pick"])
		activate_pin(1)
		var/list/input_list = get_pin_data(IC_INPUT, 1)
		if(input_list.len)
			var/pick_element = input("Choose an element.") in input_list
			if(pick_element)
				set_pin_data(IC_OUTPUT, 1, pick_element)
				push_data()
				activate_pin(2)
		else
			to_chat(user, "<span class='notice'>There is no list to pick from!</span>")
		return IC_TOPIC_REFRESH

/obj/item/integrated_circuit/input/image_recognition
	name = "image recognition scanner"
	desc = "A scanner that is able to help you recognize a certain object and their current state."
	extended_desc = "(Returns an icon_state of the target.)"
	icon_state = "video_camera"
	complexity = 5
	inputs = list(
		"target" = IC_PINTYPE_REF
		)
	outputs = list(
		"state" = IC_PINTYPE_STRING,
		)
	activators = list(
		"scan" = IC_PINTYPE_PULSE_IN,
		"on scanned" = IC_PINTYPE_PULSE_OUT,
		"not scanned" = IC_PINTYPE_PULSE_OUT
		)
	spawn_flags = IC_SPAWN_RESEARCH
	power_draw_per_use = 80

/obj/item/integrated_circuit/input/image_recognition/do_work()
	var/atom/H = get_pin_data_as_type(IC_INPUT, 1, /atom)
	var/turf/T = get_turf(src)

	if(!istype(H) || !(H in view(T)))
		activate_pin(3)
	else
		set_pin_data(IC_OUTPUT, 1, H.icon_state)
		push_data()
		activate_pin(2)