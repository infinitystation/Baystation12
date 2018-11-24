/datum/event/gravity
	announceWhen = 5

/datum/event/gravity/setup()
	endWhen = rand(15, 60)

/datum/event/gravity/announce()
	priority_announcement.Announce("Feedback surge detected in the gravity generation systems. Artificial gravity has been disabled whilst the system reinitializes.", "Gravity Failure", zlevels = affecting_z)

/datum/event/gravity/start()
	gravity_is_on = 0
	if(!SSmachines.gravity_generators)
		for(var/area/A in world)
			A.gravitychange(gravity_is_on)
	else
		for(var/A in SSmachines.gravity_generators)
			var/obj/machinery/gravity_generator/main/B = A
			B.eventshutofftoggle()
/*
/datum/event/gravity/end()
	if(!gravity_is_on)
		gravity_is_on = 1

		if(!SSmachines.gravity_generators)
			for(var/area/A in world)
				A.gravitychange(gravity_is_on)
		else
			for(var/A in SSmachines.gravity_generators)
				var/obj/machinery/gravity_generator/main/B = A
				B.eventshutofftoggle()

		priority_announcement.Announce("Gravity generators are again functioning within normal parameters. Sorry for any inconvenience.", "Gravity Restored", zlevels = affecting_z)*/
