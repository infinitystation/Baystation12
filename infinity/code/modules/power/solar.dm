/obj/machinery/power/solar/broken
	color = COLOR_DARK_GRAY

/obj/machinery/power/solar/broken/New()
	..()
	color = null
	set_broken(TRUE)
	if(prob(15))
		new /obj/item/material/shard(loc)
