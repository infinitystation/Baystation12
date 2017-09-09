/obj/item/airbag
	name = "personal airbag"
	desc = "One-use protection from high-speed collisions."
	icon = 'icons/obj/airbag.dmi'
	icon_state = "airbag"
	item_state = "syringe_kit"
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT
	var/airbag_destroy_time = 70 //7 seconds

/obj/item/airbag/New(atom/A, var/deployed)
	..(A)
	if(deployed)
		icon_state = "airbag_deployed"
		anchored = 1
		spawn(airbag_destroy_time)
			for(var/atom/movable/AM in contents)
				AM.forceMove(get_turf(src))
			qdel(src)

/obj/item/airbag/proc/deploy(mob/user)
	var/obj/item/airbag/deployed_bag = new(get_turf(src), TRUE)
	if(user)
		to_chat(user, "<span class='notice'>Your [src.name] deploys!</span>")
		user.forceMove(deployed_bag)
	playsound(deployed_bag, 'sound/effects/bamfgas.ogg', 100, 1)
	qdel(src)