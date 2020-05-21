/datum/lacesoft/illegal/armgun
	name = "\"Duzzle\" arm-mounted energy gun"
	dest = "This software can activate mounted energy gun, if you have one."
	illegal = TRUE
	compatability = /obj/item/weapon/gun/energy/gun/small/armgun
	bodytag = BP_R_ARM

/datum/lacesoft/illegal/armgun/activate(var/mob/living/carbon/human/owner)
	. = ..()
	var/obj/item/weapon/gun/energy/gun/small/armgun/armgun = locate(owner.get_organ(bodytag))
	if(istype(armgun))
		armgun.forceMove(get_turf(owner))
		owner.put_in_r_hand(armgun)

/datum/lacesoft/illegal/armgun/deactivate(var/mob/living/carbon/human/owner)
	. = ..()

	var/obj/item/weapon/gun/energy/gun/small/armgun/armgun = owner.r_hand
	if(istype(armgun))
		owner.drop_from_inventory(armgun)
		armgun.forceMove(owner.get_organ(bodytag))