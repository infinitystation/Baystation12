/obj/item/clothing/suit/space/void/engineering/alt/inf
	icon = 'icons/obj/infinity_items/spacesuits.dmi'
	icon_state = "engi"
	item_icons = list(slot_wear_suit_str = 'icons/mob/onmob/infinity_spacesuits.dmi')
	armor = list(melee = 40, bullet = 5, laser = 20,energy = 5, bomb = 45, bio = 100, rad = 100)

/obj/item/clothing/suit/space/void/engineering/alt/inf/update_icon()
	overlays.Cut()
	if (tank)
		var/indicator = get_indicator()
		var/image/ind = overlay_image(icon, "[icon_state]_ind[indicator]")
		overlays += ind

/obj/item/clothing/suit/space/void/engineering/alt/inf/New()
	START_PROCESSING(SSobj, src)

/obj/item/clothing/suit/space/void/engineering/alt/inf/Destroy()
	STOP_PROCESSING(SSobj, src)

/obj/item/clothing/suit/space/void/engineering/alt/inf/Process()
	update_icon()

/obj/item/clothing/suit/space/void/engineering/alt/inf/proc/get_indicator()
	var/indicator = 0
	var/gauge_pressure = 0
	if (!tank)
		return -1
	if(tank.air_contents)
		gauge_pressure = tank.air_contents.return_pressure()
		if(gauge_pressure >= 1015)
			gauge_pressure = 0.99
		else
			gauge_pressure = (gauge_pressure/1015)
		indicator = round(gauge_pressure * 7)
		return indicator
	else
		return 0

/obj/item/clothing/suit/space/void/engineering/alt/inf/get_mob_overlay(mob/user_mob, slot)
	var/image/res = ..()
	if(tank)
		var/indicator = get_indicator()
		var/image/ind = overlay_image(res.icon, "[icon_state]_ind[indicator]")
		res.overlays += ind
	return res

/obj/item/clothing/head/helmet/space/void/military
	name = "military voidsuit helmet"
	desc = "A somewhat tacky voidsuit helmet, a fact mitigated by heavy armor plating."
	icon_state = "rig0-secTG"
	item_state = "rig0-secTG"
	armor = list(melee = 50, bullet = 45, laser = 50, energy = 10, bomb = 35, bio = 100, rad = 30)
	item_state_slots = list(
		slot_l_hand_str = "sec_helm",
		slot_r_hand_str = "sec_helm",
		)
	siemens_coefficient = 0.6
	light_overlay = "helmet_light_dual"

