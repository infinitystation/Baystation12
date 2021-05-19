/obj/item/weapon_case
	name = "weapon case"
	desc = "A case suited for weapons."
	icon = 'infinity/icons/obj/storage.dmi'
	icon_state = "weapon_case0"
	w_class = ITEM_SIZE_LARGE

	var/open = FALSE // Is the box open?
	var/obj/item/gun/gun

/obj/item/weapon_case/on_update_icon()

	overlays.Cut()

	// Icon states and overlays
	if( open )
		icon_state = "weapon_case1"
		if( gun )
			var/image/gunimg = image(gun.icon, icon_state = gun.icon_state)
			gunimg.pixel_y = -3
			overlays += gunimg
		return
	else
		icon_state = "weapon_case0"

/obj/item/weapon_case/attack_hand( mob/user as mob )
	if( open && gun )
		user.put_in_hands( gun )
		to_chat(user, SPAN_NOTICE("You take \the [src.gun] out of \the [src]."))
		src.gun = null
		update_icon()
		return
	..()

/obj/item/weapon_case/attack_self( mob/user as mob )
	open = !open
	update_icon()

/obj/item/weapon_case/attackby( obj/item/I as obj, mob/user as mob )
	if( istype(I, /obj/item/gun) )
		if( src.open )
			if(gun)
				to_chat(user, SPAN_NOTICE("\the [src] is already occuped by [gun]"))
				return
			if(!user.unEquip(I, src))
				return
			src.gun = I
			update_icon()
			to_chat(user, SPAN_NOTICE("You put \the [I] in \the [src]!"))
		else
			to_chat(user, SPAN_NOTICE("You try to push \the [I] through the lid but it doesn't work!"))
		return

	..()

/obj/item/weapon_case/custom
	name = "weapon case"
	desc = "A case suited for weapons."

	var/owner = null
	var/obj/item/gun/holding_weapon = null

/obj/item/weapon_case/custom/Initialize()
	. = ..()
	gun = new holding_weapon(src)
	desc = "A box suited for weapons. This case has a label <b>\"Approved for personal storage\"</b> with a seal from CENTCOM. \
			Owner: [owner]. It should contain the [gun.name]"
