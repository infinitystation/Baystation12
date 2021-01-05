/datum/click_handler/default/aimodule/OnClick(var/atom/A, var/params)
	aiclick(A,params,user,0)

/datum/click_handler/default/aimodule/OnDblClick(var/atom/A, var/params)
	aiclick(A,params,user,1)

/datum/click_handler/default/aimodule/proc/aiclick(var/atom/A, var/params, var/mob/user, var/clicktype)
	var/obj/item/integrated_circuit/manipulation/ai/C = user.loc
	if(get_dist(A, user) <= 7)
		C.set_pin_data(IC_OUTPUT, 2, weakref(A))
		C.push_data()
		if(clicktype != 1)
			var/list/modifiers = params2list(params)
			if(modifiers["middle"])
				C.activate_pin(7)
			else if(modifiers["shift"])
				C.activate_pin(9)
			else if(modifiers["ctrl"])
				C.activate_pin(10)
			else if(modifiers["alt"])
				C.activate_pin(11)
			else
				C.activate_pin(6)
		else
			C.activate_pin(8)

/obj/item/integrated_circuit/manipulation/magnetizer
	name = "floor magnet"
	desc = "Magnetize your assembly to the floor so no one can pick it up while it is active. Assembly can still be moved."

	outputs = list(
		"enabled" = IC_PINTYPE_BOOLEAN
	)
	activators = list(
		"toggle" = IC_PINTYPE_PULSE_IN,
		"on toggle" = IC_PINTYPE_PULSE_OUT
	)

	complexity = 16
	cooldown_per_use = 5 SECOND
	power_draw_per_use = 50
	power_draw_idle = 0
	spawn_flags = IC_SPAWN_DEFAULT
	origin_tech = list(TECH_ENGINEERING = 4, TECH_MAGNETS = 4)

/obj/item/integrated_circuit/manipulation/magnetizer/do_work(ord)
	if(!isturf(assembly.loc))
		return

	if(ord == 1 && src.loc == assembly)
		assembly.magnetized = !assembly.magnetized
		power_draw_idle = assembly.magnetized ? 50 : 0

		visible_message(
			assembly.magnetized ? \
			"<span class='notice'>\The [get_object()] sticks to the floor!</span>" \
			: \
			"<span class='notice'>\The [get_object()] deactivates its magnets</span>"
		)

		set_pin_data(IC_OUTPUT, 1, assembly.magnetized)
		push_data()
		activate_pin(2)

/obj/item/integrated_circuit/manipulation/magnetizer/power_fail()
	assembly.magnetized = 0
	power_draw_idle = 0
	set_pin_data(IC_OUTPUT, 1, assembly.magnetized)

/obj/item/integrated_circuit/manipulation/magnetizer/disconnect_all()
	assembly.magnetized = 0
	power_draw_idle = 0
	set_pin_data(IC_OUTPUT, 1, assembly.magnetized)
