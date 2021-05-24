/obj/item/weapom/attachment
	name = "Main attachment"
	icon = 'icons/obj/infinity_object.dmi'
	var/type

/obj/item/attachment/scope
	type = 1
	var/scope_zoom = 1

/obj/item/attachment/scope/sniper
	name = "Sniper scope"
	icon_state = "sniper"
	scope_zoom = 2

/obj/item/attachment/scope/acog
	name = "Assoult scope"
	icon_state = "acog"
	scope_zoom = 1.4

/obj/item/attachment/underbarrel
	name = "Main underbarrel attachment"
	icon_state = "acog"
	type = 2

/obj/item/attachment/inbarrel
	name = "Main in barrel attachment"
	icon_state = "acog"
	type = 3

/obj/item/attachment/underbarrel
	name = "Main stock attachment"
	icon_state = "acog"
	type = 4
