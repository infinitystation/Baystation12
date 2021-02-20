/obj/machinery/power/shield_generator/verb/change_color()
	set src in oview(1)
	set category = "Object"
	set name = "Change shield's color"

	if(!(usr)) //BS12 EDIT
		return
	if(!CanPhysicallyInteract(usr))
		return
	if((!istype(usr, /mob/living/carbon)) || (istype(usr, /mob/living/carbon/brain)))//Is humanoid, and is not a brain
		to_chat(usr, "<span class='warning'>You can't use it!</span>")
		return
	if( usr.stat || usr.restrained() )//Is not asleep/dead and is not restrained
		to_chat(usr, "<span class='warning'>You can't use it!</span>")
		return
	if(check_flag(MODEFLAG_OVERCHARGE))
		to_chat(usr, "<span class='warning'>Щиты перегружены, им не до декоративный покраски!</span>")

/*	для лулзов и если будут абузить перекраску
	if(prob(10))
		var/mob/living/mob = usr
		mob.electrocute_act(31, src)
*/
	var/new_color = input(usr, "Enter a color, please.", "Color", COLOR_DEEP_SKY_BLUE) as color|null
	if(new_color)
		for(var/obj/effect/shield/S in field_segments)
			S.color = new_color
