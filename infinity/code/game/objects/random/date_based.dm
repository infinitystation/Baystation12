/obj/random/date_based/christmas/xmaslights
	name = "xmas lights"
	icon = 'infinity/icons/obj/christmas.dmi'
	icon_state = "xmaslights_off"
	alpha = 150
	layer = BLOB_SHIELD_LAYER

/obj/random/date_based/christmas/xmaslights/spawn_choices()
	return list(/obj/machinery/xmaslights)

/obj/random/date_based/christmas/tinsel
	name = "random xmas tinsel"
	icon = 'infinity/icons/obj/christmas.dmi'
	icon_state = "tinsel1"
	alpha = 150
	layer = BLOB_SHIELD_LAYER

/obj/random/date_based/christmas/tinsel/spawn_choices()
	return list(/obj/structure/sign/tinsel)

/obj/random/date_based/christmas/doorwreath
	name = "xmas doorwreath"
	icon = 'infinity/icons/obj/christmas.dmi'
	icon_state = "doorwreath"
	alpha = 150
	layer = BLOB_SHIELD_LAYER

/obj/random/date_based/christmas/doorwreath/spawn_choices()
	return list(/obj/structure/sign/doorwreath)
