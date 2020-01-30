/obj/machinery/keycard_authentication
	name = "keycard authentication device"
	icon = 'icons/obj/monitors.dmi'
	icon_state = "auth_off"

	anchored = 1
	power_channel = ENVIRON

	var/master_tag
	var/frequency = 1449
	var/list/commands = list("open", "close")

	var/datum/radio_frequency/radio_connection

	interact_offline = FALSE

/* To-do - sprite idle state
/obj/machinery/keycard_authentication/on_update_icon()
	if(on)
		icon_state = "keycard_standby"
	else
		icon_state = "keycard_off"*/

/obj/machinery/keycard_authentication/attackby(obj/item/I as obj, mob/user as mob)
	//Swiping ID on the keycard button
	if(istype(I, /obj/item/weapon/card/id)))
		if(has_access(req_access, I.GetAccess())))
			activate()
		// todo - make red/green/blue light states when swiping, and also some kind of cooldown/waiting
		flick("auth_on", src)
		return
	..()

/* we use only keycard, not hands
/obj/machinery/keycard_authentication/interface_interact(mob/user)
	if(!CanInteract(user, DefaultTopicState()))
		return FALSE
	return TRUE */

/obj/machinery/keycard_authentication/proc/activate()
	// Guess there's must be a check for current airlock status to use right command.
	if(radio_connection)
		var/datum/signal/signal = new
		signal.transmission_method = 1 //radio signal
		signal.data["tag"] = master_tag

		// The first command in var is the current one we will use.
		signal.data["command"] = commands[1]

		if(radio_connection.post_signal(src, signal, range = AIRLOCK_CONTROL_RANGE, radio_filter = RADIO_AIRLOCK))
			// After success, we should swap commands.
			// I know what this is pretty silly but uhhhh okay.
			commands = list(commands[2], commands[1])

/obj/machinery/keycard_authentication/proc/set_frequency(new_frequency)
	radio_controller.remove_object(src, frequency)
	frequency = new_frequency
	radio_connection = radio_controller.add_object(src, frequency, RADIO_AIRLOCK)

/obj/machinery/keycard_authentication/Initialize()
	. = ..()
	set_frequency(frequency)

/obj/machinery/keycard_authentication/New()
	..()
	if(radio_controller)
		set_frequency(frequency)

/obj/machinery/keycard_authentication/Destroy()
	if(radio_controller)
		radio_controller.remove_object(src, frequency)
	return ..()
