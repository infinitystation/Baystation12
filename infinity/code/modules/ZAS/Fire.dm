/obj/fire/Crossed(atom/movable/AM as mob|obj)
	. = ..()
	if(.)
		if(istype(src, /turf/simulated))
			var/turf/simulated/my_tile = loc
			if(!istype(my_tile) || !my_tile.zone || my_tile.submerged())
				if(my_tile?.fire == src)
					my_tile.fire = null
				qdel(src)
				return

			var/datum/gas_mixture/air_contents = my_tile.return_air()

			for(var/mob/living/L in loc)
				L.FireBurn(firelevel, air_contents.temperature, air_contents.return_pressure())  //Burn the mobs!

			loc.fire_act(air_contents, air_contents.temperature, air_contents.volume)
			for(var/atom/A in loc)
				A.fire_act(air_contents, air_contents.temperature, air_contents.volume)
