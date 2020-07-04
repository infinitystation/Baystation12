/* THE GUN
 * =======
 */

/obj/item/weapon/gun/energy/laser/craftable
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

	bulk = GUN_BULK_SNIPER_RIFLE
	w_class = ITEM_SIZE_HUGE

/* PROJECTILES
 * ===========
 */

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

/* CRAFTING
 * ===========
 */

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
		if(3) to_chat(user, "It has an emitter installed.")
		if(4) to_chat(user, "It has a powerccell installed.")
		if(5) to_chat(user, "It has a capacitor installed.")
		if(6) to_chat(user, "It has a firing mechanism installed.")
		if(7) to_chat(user, "It has an igniter installed.")
		if(8) to_chat(user, "It has an electronic frame installed.")
		if(9) to_chat(user, "It has a reserve powercell installed.")
		if(10) to_chat(user, "It has a firing processor installed.")
		if(11) to_chat(user, "It has a weapon board installed.")
		if(12) to_chat(user, "It has a capacitor-retranslator installed.")
		if(13) to_chat(user, "It has cable coils installed.")
		if(14) to_chat(user, "It has a cable welded into place.")
		if(15) to_chat(user, "It has a little part of shitcode inside.")
		if(16) to_chat(user, "It has lenses and a scope.")
		if(17) to_chat(user, "It has processed and calibrated lenses.")
	if(ishuman(user))
		if(user.skill_check(SKILL_DEVICES, SKILL_EXPERT))
			switch(buildstate)
				if(0) to_chat(user, "Looks like you need something as lenses frame... A pipe?")
				if(1) to_chat(user, "The pipe is unsecured - fix it with tape roll.")
				if(2) to_chat(user, "You some little laser, for start. A high-power micro-laser shouldn't melt the frame and be powerful enough.")
				if(3) to_chat(user, "You need a power storage... A hive power cell will be enough.")
				if(4) to_chat(user, "The energy should be concetrated in capacitor before firing. Advanced one should be enough.")
				if(5) to_chat(user, "It need firing mechanism. Steel one would fit perfectly...")
				if(6) to_chat(user, "I don't remember why, but igniter is necessary here.")
				if(7) to_chat(user, "It need a frame for circuits, plastic one.")
				if(8) to_chat(user, "It need a device power cell for idle capacity.")
				if(9) to_chat(user, "It will not work without circuits. A small processor unit from some PDA should be enough.")
				if(10) to_chat(user, "I need a power control circuit here - otherwise, it will explode in my hands after second shoot....")
				if(11) to_chat(user, "A standard superconductive magnetic coil need here.")
				if(12) to_chat(user, "It cannot work without cables...")
				if(13) to_chat(user, "I need to weld it together.")
				if(14) to_chat(user, "It need calibration, circuits frequencies should be messed up.")
				if(15) to_chat(user, "It need lenses for firepower... And scope. Yeap, I wanna scope here.")
				if(16) to_chat(user, "Lenses should be calibrated. I don't know how to do that... RCD may help.")
				if(17) to_chat(user, "A screwdriver should secure it all.")

/obj/item/weapon/laserframe/attackby(obj/item/W as obj, mob/user as mob)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	add_fingerprint(user)
	if(loc == user.loc)
		to_chat(user, SPAN_NOTICE("You cannot interact with [src] while it in your hands."))
		return
	if(ishuman(user))
		if(!(user.skill_check(SKILL_DEVICES, SKILL_EXPERT)))
			to_chat(user, SPAN_NOTICE("You don't know enough about devices to assemble it..."))
	switch(buildstate)
		if(0)
			if(istype(W, /obj/item/pipe))
				to_chat(user, SPAN_NOTICE("You add [W] to install the lenses."))
				buildstate++
				qdel(W)
		if(1)
			if(istype(W,/obj/item/weapon/tape_roll))
				user.visible_message(
					SPAN_NOTICE("[user] secures the pipe with [W]."),
					SPAN_NOTICE("You secure the pipe with [W]."))
				buildstate++
		if(2)
			if(istype(W,/obj/item/weapon/stock_parts/micro_laser))
				to_chat(user, SPAN_NOTICE("You install [W]."))
				buildstate++
				qdel(W)
		if(3)
			if(istype(W,/obj/item/weapon/cell/high))
				to_chat(user, SPAN_NOTICE("You put [W] inside."))
				buildstate++
				qdel(W)
		if(4)
			if(istype(W,/obj/item/weapon/stock_parts/capacitor))
				to_chat(user, SPAN_NOTICE("You install [W]."))
				buildstate++
				qdel(W)
		if(5)
			if(istype(W,/obj/item/stack/material) && W.get_material_name() == MATERIAL_STEEL)
				var/obj/item/stack/material/M = W
				if(M.use(5))
					to_chat(user, SPAN_NOTICE("You created and installed a trigger mechanism."))
					buildstate++
				else
					to_chat(user, SPAN_NOTICE("You need at least 5 metal sheets to complete this task."))
		if(6)
			if(istype(W,/obj/item/device/assembly/igniter))
				to_chat(user, SPAN_NOTICE("You put [W] inside the trigger mechanism."))
				buildstate++
				qdel(W)
		if(7)
			if(istype(W,/obj/item/stack/material) && W.get_material_name() == MATERIAL_PLASTIC)
				var/obj/item/stack/material/P = W
				if(P.use(10))
					to_chat(user, SPAN_NOTICE("You have prepared and install a frame for electronic systems."))
					buildstate++
				else
					to_chat(user, SPAN_NOTICE("You need at least ten plastic sheets to complete this task."))
		if(8)
			if(istype(W,/obj/item/weapon/cell/device))
				to_chat(user, SPAN_NOTICE("You install [W]."))
				buildstate++
				qdel(W)
		if(9)
			if(istype(W,/obj/item/weapon/stock_parts/computer/processor_unit/small))
				to_chat(user, SPAN_NOTICE("You install [W]."))
				buildstate++
				qdel(W)
		if(10)
			if(istype(W,/obj/item/weapon/module/power_control))
				to_chat(user, SPAN_NOTICE("You install [W]."))
				buildstate++
				qdel(W)
		if(11)
			if(istype(W,/obj/item/weapon/stock_parts/smes_coil))
				to_chat(user, SPAN_NOTICE("You install [W]."))
				buildstate++
				qdel(W)
		if(12)
			if(isCoil(W))
				var/obj/item/stack/cable_coil/C = W
				if(C.use(30))
					to_chat(user, SPAN_NOTICE("You installed the wiring inside, connecting the electronics inside."))
					buildstate++
				else
					to_chat(user, SPAN_NOTICE("You need at least 30 segments of [W] to complete this task."))
		if(13)
			if(isWelder(W))
				var/obj/item/weapon/weldingtool/T = W
				if(T.remove_fuel(0,user))
					if(!src || !T.isOn()) return
					playsound(src.loc, 'sound/items/Welder2.ogg', 100, 1)
					to_chat(user, SPAN_NOTICE("You weld the cables into places."))
					buildstate++
		if(14)
			if(isMultimeter(W))
				to_chat(user, SPAN_NOTICE("You reprogrammed the resulting internal device with [W]."))
				buildstate++
		if(15)
			if(istype(W,/obj/item/stack/material) && W.get_material_name() == MATERIAL_GLASS)
				var/obj/item/stack/material/M = W
				if(M.use(40))
					to_chat(user, SPAN_NOTICE("You install lenses and scope."))
					buildstate++
				else
					to_chat(user, SPAN_NOTICE("You need at least five glass sheets to complete this task."))
		if(16)
			if(istype(W,/obj/item/weapon/rcd))
				to_chat(user, SPAN_NOTICE("You processed the lens with [W], making it perfect."))
				buildstate++
		if(17)
			if(isScrewdriver(W))
				to_chat(user, SPAN_NOTICE("You secure everything with [W]."))
				new /obj/item/weapon/gun/energy/laser/craftable(get_turf(src))
				qdel(src)
			return
	update_icon()
	..()
