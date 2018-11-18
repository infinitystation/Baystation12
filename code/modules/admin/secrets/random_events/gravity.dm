/**********
* Gravity *
**********/
/datum/admin_secret_item/random_event/gravity
	name = "Toggle Artificial Gravity"

/datum/admin_secret_item/random_event/gravity/can_execute(var/mob/user)
	if(GAME_STATE < RUNLEVEL_GAME)
		return 0
	return ..()

/datum/admin_secret_item/random_event/gravity/execute(var/mob/user)
	. = ..()
	if(!.)
		return

	var/choice = input(user, "Make Command Report?") in list("Yes", "No")
	gravity_is_on = !gravity_is_on
	if(!SSmachines.gravity_generators)
		for(var/area/A in world)
			A.gravitychange(gravity_is_on)
	else
		for(var/A in SSmachines.gravity_generators)
			var/obj/machinery/gravity_generator/main/B = A
			B.eventshutofftoggle()

	feedback_inc("admin_secrets_fun_used",1)
	feedback_add_details("admin_secrets_fun_used","Grav")
	if(choice == "Yes")
		if(gravity_is_on)
			command_announcement.Announce("Gravity generators are again functioning within normal parameters. Sorry for any inconvenience.", "Gravity Restored")
			message_admins("<span class='notice'>[key_name_admin(user)] toggled gravity on.</span>", 1)
		else
			command_announcement.Announce("Feedback surge detected in mass-distributions systems. Artificial gravity has been disabled whilst the system reinitializes.", "Gravity Failure")
			message_admins("<span class='notice'>[key_name_admin(usr)] toggled gravity off.</span>", 1)
