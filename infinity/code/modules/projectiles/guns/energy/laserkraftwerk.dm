/obj/item/weapon/gun/energy/laser/mainkraft
	name = "laser"
	desc = "Very similar to a laser weapon. It is assembled qualitatively, with love, but with their own hands and from scrap materials, which is extremely noticeable, including sticks and no less well-known second component."
	icon = 'infinity/icons/obj/guns/lkw.dmi'
	icon_state = "lkwf"
	scope_zoom = 1.2
	wielded_item_state = "lkw-wielded"
	item_icons = list(
		slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
		slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi',
		slot_back_str = 'infinity/icons/mob/onmob/onmob_back.dmi',
		slot_belt_str = 'infinity/icons/mob/onmob/onmob_belt.dmi'
		)
	firemodes = list(
		list(mode_name="medium laser", projectile_type=/obj/item/projectile/beam/lkw),
		list(mode_name="heavy laser", projectile_type=/obj/item/projectile/beam/pulse/lkw),
		list(mode_name="light laser", projectile_type=/obj/item/projectile/beam/confuseray/lkw),
		)

/obj/item/projectile/beam/confuseray/lkw
	damage = 10
	agony = 10
	damage_type = BURN
	life_span = 15

/obj/item/projectile/beam/lkw
	damage = 30
	armor_penetration = 20

/obj/item/projectile/beam/pulse/lkw
	damage = 10
	armor_penetration = 50

/obj/item/weapon/laserframe
	name = "laser stock"
	desc = "It might be a laser, someday. Or emitter... Or projecror... Or flashlight... Or... Or something else."
	icon = 'infinity/icons/obj/guns/lkw.dmi'
	icon_state = "lkw0"
	var/buildstate = 0

/obj/item/weapon/laserframe/on_update_icon()
	icon_state = "lkw[buildstate]"

/obj/item/weapon/laserframe/examine(mob/user)
	. = ..(user)
	switch(buildstate)
		if(1) to_chat(user, "It has a pipe segment installed.")
		if(2) to_chat(user, "It has a pipe segment taperolled.")
		if(3) to_chat(user, "It has a emitter installed.")
		if(4) to_chat(user, "It has a powerccell installed.")
		if(5) to_chat(user, "It has a firing mechanism installed.")
		if(6) to_chat(user, "It has an igniter installed.")
		if(7) to_chat(user, "It has an electronic frame installed.")
		if(8) to_chat(user, "It has a reserve powercell installed.")
		if(9) to_chat(user, "It has a firing processor installed.")
		if(10) to_chat(user, "It has a weapon board installed.")
		if(11) to_chat(user, "It has a capacitor-retranslator installed.")
		if(12) to_chat(user, "It has a cable-coils installed.")
		if(13) to_chat(user, "It has a cable welded into place.")
		if(14) to_chat(user, "It has a little part of shitcode inside.")
		if(15) to_chat(user, "It has a lenses and scope.")
		if(16) to_chat(user, "It has a processed and calibrated lenses.")
		if(17) to_chat(user, "It's almost assembled.")

/obj/item/weapon/laserframe/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/pipe))
		if(buildstate == 0)
			qdel(W)
			to_chat(user, "<span class='notice'>You have mounted the housing to install the lenses.</span>")
			buildstate++
			update_icon()
			return
	else if(istype(W,/obj/item/weapon/tape_roll))
		if(buildstate == 1)
			user.visible_message("<span class='notice'>\The [user] secures the pipe with the izolenta.</span>")
			add_fingerprint(user)
			buildstate++
			update_icon()
		return
	else if(istype(W,/obj/item/weapon/stock_parts/micro_laser))
		if(buildstate == 2)
			qdel(W)
			to_chat(user, "<span class='notice'>You've installed an emitter.</span>")
			buildstate++
			update_icon()
		return
	else if(istype(W,/obj/item/weapon/cell/high))
		if(buildstate == 3)
			qdel(W)
			to_chat(user, "<span class='notice'>You put a battery inside.</span>")
			buildstate++
			update_icon()
		return
	else if(istype(W,/obj/item/weapon/stock_parts/capacitor))
		if(buildstate == 4)
			qdel(W)
			to_chat(user, "<span class='notice'>You've installed a capacitor..</span>")
			buildstate++
			update_icon()
		return
	else if(istype(W,/obj/item/stack/material) && W.get_material_name() == MATERIAL_STEEL)
		if(buildstate == 5)
			var/obj/item/stack/material/M = W
			if(M.use(10))
				to_chat(user, "<span class='notice'>You created and installed a trigger mechanism.</span>")
				buildstate++
				update_icon()
			else
				to_chat(user, "<span class='notice'>You need at least ten metal sheets to complete this task.</span>")
			return
	else if(istype(W,/obj/item/device/assembly/igniter))
		if(buildstate == 6)
			qdel(W)
			to_chat(user, "<span class='notice'>You put an igniter inside trigger mechanism.</span>")
			buildstate++
			update_icon()
			return
	else if(istype(W,/obj/item/stack/material) && W.get_material_name() == MATERIAL_PLASTIC)
		if(buildstate == 7)
			var/obj/item/stack/material/P = W
			if(P.use(10))
				to_chat(user, "<span class='notice'>You have prepared and installed a housing for electronic systems.</span>")
				buildstate++
				update_icon()
			else
				to_chat(user, "<span class='notice'>You need at least ten plastic sheets to complete this task.</span>")
			return
	else if(istype(W,/obj/item/weapon/cell/device))
		if(buildstate == 8)
			qdel(W)
			to_chat(user, "<span class='notice'>You've installed an internal reserve power cell.</span>")
			buildstate++
			update_icon()
			return
	else if(istype(W,/obj/item/weapon/stock_parts/computer/processor_unit/small))
		if(buildstate == 9)
			qdel(W)
			to_chat(user, "<span class='notice'>You've installed a processor.</span>")
			buildstate++
			update_icon()
			return
	else if(istype(W,/obj/item/weapon/module/power_control))
		if(buildstate == 10)
			qdel(W)
			to_chat(user, "<span class='notice'>You've installed a circuitbord.</span>")
			buildstate++
			update_icon()
			return
	else if(istype(W,/obj/item/weapon/stock_parts/smes_coil))
		if(buildstate == 11)
			qdel(W)
			to_chat(user, "<span class='notice'>You've installed an additional capacitor-retranslator</span>")
			buildstate++
			update_icon()
		return
	else if(isCoil(W))
		var/obj/item/stack/cable_coil/C = W
		if(buildstate == 12)
			if(C.use(30))
				to_chat(user, "<span class='notice'>You installed the wiring inside, connecting the electronics inside.</span>")
				buildstate++
				update_icon()
			else
				to_chat(user, "<span class='notice'>You need at least 30 segments of cable coil to complete this task.</span>")
			return
	else if(isWelder(W))
		if(buildstate == 13)
			var/obj/item/weapon/weldingtool/T = W
			if(T.remove_fuel(0,user))
				if(!src || !T.isOn()) return
				playsound(src.loc, 'sound/items/Welder2.ogg', 100, 1)
				to_chat(user, "<span class='notice'>You weld the cables into places.</span>")
			buildstate++
			update_icon()
		return
	else if(isMultimeter(W))
		if(buildstate == 14)
			to_chat(user, "<span class='notice'>You reprogrammed the resulting internal device with a multimeter.You fixed bugs, added new features and fixed crutches. Then you compile that shitcode and it works</span>")
			buildstate++
			update_icon()
		return
	else if(istype(W,/obj/item/stack/material) && W.get_material_name() == MATERIAL_GLASS)
		if(buildstate == 15)
			var/obj/item/stack/material/M = W
			if(M.use(40))
				to_chat(user, "<span class='notice'>You install lenses and scope.</span>")
				buildstate++
				update_icon()
			else
				to_chat(user, "<span class='notice'>You need at least five glass sheets to complete this task.</span>")
			return
	else if(istype(W,/obj/item/weapon/rcd))
		if(buildstate == 16)
			to_chat(user, "<span class='notice'>You processed the lens with RCD, making it perfect.</span>")
			buildstate++
			update_icon()
		return
	else if(isScrewdriver(W))
		if(buildstate == 17)
			to_chat(user, "<span class='notice'>You fixed all with a screwdriver.</span>")
			new /obj/item/weapon/gun/energy/laser/mainkraft(get_turf(src))
			qdel(src)
		return
	else
		..()