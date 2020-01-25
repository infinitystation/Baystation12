/obj/machinery/keycard_lock
	icon = 'infinity/icons/obj/airlock_machines.dmi'
	icon_state = "keycard_standby"
	name = "access control"

	anchored = 1
	power_channel = ENVIRON

	var/master_tag
	var/frequency = 1449
	var/command = "open"

	var/datum/radio_frequency/radio_connection

	var/on = 1
	interact_offline = FALSE

/obj/machinery/keycard_lock/on_update_icon()
	if(on)
		icon_state = "keycard_standby"
	else
		icon_state = "keycard_off"

/obj/machinery/keycard_lock/attackby(obj/item/I as obj, mob/user as mob)
	//Swiping ID on the keycard button
	if(istype(I, /obj/item/weapon/card/id)))
		if(has_access(req_access, I.GetAccess())))
			activate()
		return
	..()

/obj/machinery/keycard_lock/interface_interact(mob/user)
	if(!CanInteract(user, DefaultTopicState()))
		return FALSE
	flick("keycard_swipe", src)
	return TRUE

/obj/machinery/keycard_lock/proc/activate()
	if(radio_connection)
		var/datum/signal/signal = new
		signal.transmission_method = 1 //radio signal
		signal.data["tag"] = master_tag
		signal.data["command"] = command

		radio_connection.post_signal(src, signal, range = AIRLOCK_CONTROL_RANGE, radio_filter = RADIO_AIRLOCK)

/obj/machinery/keycard_lock/proc/set_frequency(new_frequency)
	radio_controller.remove_object(src, frequency)
	frequency = new_frequency
	radio_connection = radio_controller.add_object(src, frequency, RADIO_AIRLOCK)

/obj/machinery/keycard_lock/Initialize()
	. = ..()
	set_frequency(frequency)


/obj/machinery/keycard_lock/New()
	..()

	if(radio_controller)
		set_frequency(frequency)

/obj/machinery/keycard_lock/Destroy()
	if(radio_controller)
		radio_controller.remove_object(src, frequency)
	return ..()
