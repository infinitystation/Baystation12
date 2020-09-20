/obj/item/weapon/reagent_containers/food/snacks/monkeycube/lizard
	name = "lizard cube"
	monkey_type = /mob/living/simple_animal/lizard

/obj/item/weapon/reagent_containers/food/snacks/sliceable/ryebread
	name = "rye bread"
	icon_state = "Some plain old Earthen bread. Made of a rye."
	desc = "Some plain old Earthen rye bread."
	icon = 'infinity/icons/obj/food.dmi'
	icon_state = "bread-rye"
	slice_path = /obj/item/weapon/reagent_containers/food/snacks/slice/ryebread
	slices_num = 6
	center_of_mass = "x=16;y=9"
	nutriment_desc = list("rye" = 10)
	nutriment_amt = 10
	bitesize = 2
	trash = null

/obj/item/weapon/reagent_containers/food/snacks/slice/ryebread
	name = "rye bread slice"
	desc = "A slice of home. A rye home."
	icon = 'infinity/icons/obj/food.dmi'
	icon_state = "bread-rye-slice"
	bitesize = 2
	center_of_mass = "x=16;y=4"
	whole_path = /obj/item/weapon/reagent_containers/food/snacks/sliceable/ryebread
	trash = null

/obj/item/weapon/reagent_containers/food/snacks/slice/ryebread
	filled = TRUE

//Donuts of death

/obj/item/weapon/storage/box/donut/strange
	startswith = list(/obj/item/weapon/reagent_containers/food/snacks/donut/normal/death = 6)

/obj/item/weapon/reagent_containers/food/snacks/donut/normal/death/On_Consume(var/mob/M)
	if(!reagents.total_volume)
		M.visible_message("<span class='notice'>[M] finishes eating \the [src].</span>","<span class='notice'>You finish eating \the [src].</span>")
		M.drop_item()
		disaster()
		qdel(src)

/obj/item/weapon/reagent_containers/food/snacks/donut/normal/death/proc/disaster()
	var/turf/T = get_turf(src)
	var/area/A = T.loc
	if(isspace(A))
		return
	for(var/obj/machinery/door/airlock/D in A)
		D.close()
		D.lock()
	var/obj/machinery/alarm/R = locate() in A
	if(R)
		R.mode = 3
		R.apply_mode()

/datum/uplink_item/item/stealthy_weapons/death_donuts
	name = "Death Donuts Box"
	desc = "Box filled with special electromagnetic donuts. After being eaten, they will lock down the area and turn on siphon in air alarm."
	item_cost = 16
	path = /obj/item/weapon/storage/box/donut/strange