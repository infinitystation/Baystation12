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