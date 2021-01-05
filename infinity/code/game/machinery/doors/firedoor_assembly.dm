/obj/structure/firedoor_assembly/border_only
	name = "unidirectional emergency shutter assembly"
	result = /obj/machinery/door/firedoor/border_only

/obj/structure/firedoor_assembly/border_only/verb/rotate_clock()
	set category = "Object"
	set name = "Rotate Assembly (Clockwise)"
	set src in view(1)
	if(usr.incapacitated() || anchored)
		return
	set_dir(turn(dir, -90))

/obj/structure/firedoor_assembly/border_only/verb/rotate_anticlock()
	set category = "Object"
	set name = "Rotate Assembly (Counter-clockwise)"
	set src in view(1)
	if(usr.incapacitated()|| anchored)
		return
	set_dir(turn(dir, 90))
