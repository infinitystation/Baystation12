
/obj/item/weapon/melee/baton/light
	name = "light stunbaton"
	desc = "An upgraded stunbaton, that deals less damage, but can stun much more efficient."
	icon = 'infinity/icons/obj/weapons.dmi'
	icon_state = "contractor_baton"
	item_state = "contractor_baton"
	force = 8
	sharp = 0
	edge = 0
	throwforce = 7
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_COMBAT = 3)
	attack_verb = list("beaten", "prodded", "smashed")
	base_parry_chance = 15
	stunforce = 0
	agonyforce = 45
	hitcost = 5

	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
		)

/obj/item/weapon/melee/baton/light/change_status(var/s)
	. = ..()
	if(status)
		w_class = ITEM_SIZE_NORMAL
	else
		w_class = ITEM_SIZE_SMALL

/obj/item/weapon/singularityhammer
	name = "singularity hammer"
	desc = "The pinnacle of close combat technology, the hammer harnesses the power of a miniaturized singularity to deal crushing blows."
	icon = 'infinity/icons/obj/weapons.dmi'
	icon_state = "singularity_hammer0"
	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
		)
	slot_flags = SLOT_BACK
	force = 5
	throwforce = 15
	throw_range = 1
	w_class = ITEM_SIZE_HUGE

	var/wield = 0
	var/charged = TRUE

/obj/item/weapon/singularityhammer/update_twohanding()
	var/mob/living/M = loc
	if(istype(M) && is_held_twohanded(M))
		icon_state = "singularity_hammer1"
		item_state = "singularity_hammer1"
		wield = 1
	else
		icon_state = "singularity_hammer0"
		item_state = "singularity_hammer0"
		wield = 0

	update_icon()

/obj/item/weapon/singularityhammer/proc/recharge()
	charged = TRUE

/obj/item/weapon/singularityhammer/proc/vortex(turf/pull, mob/wielder)
	for(var/atom/X in orange(5,pull))
		if(ismovable(X))
			var/atom/movable/A = X
			if(A == wielder)
				continue
			if(A && !A.anchored && !ishuman(X) && !isobserver(X))
				step_towards(A,pull)
				step_towards(A,pull)
				step_towards(A,pull)
			else if(ishuman(X))
				var/mob/living/carbon/human/H = X
				if(istype(H.shoes, /obj/item/clothing/shoes/magboots))
					var/obj/item/clothing/shoes/magboots/M = H.shoes
					if(M.magpulse)
						continue
				step_towards(H,pull)
				step_towards(H,pull)
				step_towards(H,pull)

/obj/item/weapon/singularityhammer/afterattack(atom/A as mob|obj|turf|area, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(wield)
		if(charged)
			charged = FALSE
			if(istype(A, /mob/living/))
				var/mob/living/Z = A
				Z.take_overall_damage(20,0)
			playsound(user, 'sound/weapons/marauder.ogg', 50, TRUE)
			var/turf/target = get_turf(A)
			vortex(target,user)
			addtimer(CALLBACK(src, .proc/recharge), 100)

/obj/item/weapon/melee/supermatter_sword
	name = "supermatter sword"
	desc = "In a world full of bad ideas, this might just be the worst."
	icon = 'infinity/icons/obj/weapons.dmi'
	icon_state = "claymore_supermatter"
	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
		)
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	force = 0.001
	armor_penetration = 1000

/obj/item/weapon/melee/supermatter_sword/dropped(var/mob/living/user)
	user.visible_message(SPAN_WARNING("[user] drops the [src], but at the last moment accidentally touches it's blade and turns into ashes!"), SPAN_WARNING("You drop the [src], but at the last moment you accidentally touch it's blade and turn into ashes!"))
	user.dust()
	. = ..()

/obj/item/weapon/melee/supermatter_sword/afterattack(atom/A as mob|obj|turf, mob/user, proximity)
	if(!proximity)
		return

	if(ismob(A))
		var/mob/living/L = A
		L.dust()
	else
		qdel(A)
	. = ..()

/obj/item/weapon/melee/energy/blade
	name = "energy blade"
	desc = "A high-frequency blade with built-in energy projector. It has 'May the force be within you.' written on it's handle"
	icon_state = "swordoff"
	active_icon = "swordon"
	icon = 'infinity/icons/obj/weapons.dmi'
	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
		)
	active_force = 30
	active_throwforce = 20
	force = 3
	throwforce = 15
	throw_speed = 1
	throw_range = 1
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE
	atom_flags = ATOM_FLAG_NO_TEMP_CHANGE
	origin_tech = list(TECH_MAGNET = 4, TECH_ESOTERIC = 2)
	sharp = 1
	edge = 1
	base_parry_chance = 75
	active_attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/blade1.ogg'

/obj/item/weapon/melee/energy/hammer
	name = "pulse hammer"
	desc = "A heavy combat pulse hammer, made especially for breaking walls, doors and windows."
	icon_state = "hammeroff"
	active_icon = "hammeron"
	icon = 'infinity/icons/obj/weapons.dmi'
	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
		)
	active_force = 45 //and it will SMACK ya ass
	active_throwforce = 25
	force = 15
	throwforce = 25
	throw_speed = 1
	throw_range = 1
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE
	atom_flags = ATOM_FLAG_NO_TEMP_CHANGE
	origin_tech = list(TECH_MAGNET = 4, TECH_MATERIAL = 5, TECH_ESOTERIC = 5)
	sharp = 0
	edge = 1
	base_parry_chance = 0
	active_attack_verb = list("smashed", "beaten", "smacked")
	hitsound = 'sound/weapons/marauder.ogg'

/obj/item/weapon/melee/energy/hammer/afterattack(var/atom/movable/target, mob/user, proximity)
	if(istype(target))
		var/throwdir = get_dir(user,target)
		user.visible_message(SPAN_WARNING("[user] smashes the [target] with [src]!"))
		target.throw_at(get_edge_target_turf(target, throwdir),6,4) //Its enough to break your legs
		return
	. = ..()

/obj/item/weapon/melee/energy/hammer/afterattack(var/turf/T, mob/user, proximity)
	if(istype(T, /turf/simulated/wall))
		var/turf/simulated/wall/wall = T
		user.visible_message(SPAN_WARNING("[user] smashes the [wall] with [src]!"))
		wall.take_damage(90)
		return

	. = ..()