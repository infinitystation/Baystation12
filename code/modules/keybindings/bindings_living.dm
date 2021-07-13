/mob/living/key_down(_key, client/user)
	switch(_key)
		if("B")
			if(user.keys_held["Shift"])
				lay_down()
			else
				resist()
			return
		if("J")
			if(!aiming)
				aiming = new(src)
			aiming.toggle_active()
			return
	return ..()
