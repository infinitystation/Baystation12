/obj/structure/cult
	density = 1
	anchored = 1
	icon = 'icons/obj/cult.dmi'

/obj/structure/cult/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/structure/cult/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()



/obj/structure/cult/talisman
	name = "altar"
	desc = "A bloodstained altar dedicated to Nar-Sie."
	icon_state = "talismanaltar"

	var/cooldown_time = 0

/obj/structure/cult/talisman/attack_hand(mob/user as mob)

	if(!iscultist(user))
		to_chat(user, SPAN_WARNING("You don't understand anything written on [src]!"))
		return
	if(cooldown_time > world.time)
		to_chat(user, SPAN_WARNING("[src] is not ready yet for this!"))
		return

	var/choice = alert(user,"You study the schematics etched into the altar...",,"\"Black Death\" Dagger","Construct Shell","Flask of Unholy Water")
	switch(choice)
		if("Flask of Unholy Water")
			new /obj/item/weapon/reagent_containers/glass/beaker/unholywater(get_turf(src))

		if("\"Black Death\" Dagger")
			new /obj/item/weapon/material/knife/ritual/shadow(get_turf(src))

		if("Construct Shell")
			new /obj/structure/constructshell/cult(get_turf(src))

	cooldown_time = world.time + 3 MINUTES

	visible_message(SPAN_WARNING("With flash of bright light, [choice] appears on the [src]."))

	var/obj/effect/temporary/effect = new(get_turf(src), 6, 'infinity/icons/effects/cult.dmi', "bloodsparkles")
	effect.dir = src.dir



/obj/structure/cult/forge
	name = "daemon forge"
	desc = "A forge used in crafting the unholy weapons used by the armies of Nar-Sie."
	icon_state = "forge"
	var/cooldown_time = 0

/obj/structure/cult/forge/attack_hand(mob/user as mob)

	if(!iscultist(user))
		to_chat(user, SPAN_WARNING("The heat radiating from [src] pushes you back!"))
		return
	if(cooldown_time > world.time)
		to_chat(user, SPAN_WARNING("[src] is not ready yet for this!"))
		return

	var/choice = alert(user,"You study the schematics etched into the altar...",,"\"Black Death\" Dagger","Construct Shell","Flask of Unholy Water")
	switch(choice)
		if("Shielded Robe")
			new /obj/item/clothing/suit/storage/hooded/cultrobes/cult_shield(get_turf(src))

		if("Flagellant's Robe")
			new /obj/item/clothing/suit/storage/hooded/cultrobes/berserker(get_turf(src))

		if("Mirror Shield")
			new /obj/item/weapon/shield/mirror(get_turf(src))

	cooldown_time = world.time + 3 MINUTES

	visible_message(SPAN_WARNING("With flash of bright light, [choice] appears on the [src]."))

	var/obj/effect/temporary/effect = new(get_turf(src), 6, 'infinity/icons/effects/cult.dmi', "bloodsparkles")
	effect.dir = src.dir



/obj/structure/cult/pylon
	name = "pylon"
	desc = "A floating crystal that hums with an unearthly energy."
	icon = 'icons/obj/pylon.dmi'
	icon_state = "pylon"
	var/isbroken = 0
	light_max_bright = 0.5
	light_inner_range = 1
	light_outer_range = 13
	light_color = "#3e0000"

	var/range = 1

/obj/structure/cult/pylon/attack_hand(mob/M as mob)
	attackpylon(M, 5)

/obj/structure/cult/pylon/attack_generic(var/mob/user, var/damage)
	attackpylon(user, damage)

/obj/structure/cult/pylon/attackby(obj/item/W as obj, mob/user as mob)

	if(istype(W, /obj/item/stack/material/cult))
		var/obj/item/stack/material/cult/S = W
		S.set_amount(S.amount - 1)
		repair(user)
		return

	attackpylon(user, W.force)

/obj/structure/cult/pylon/proc/attackpylon(mob/user as mob, var/damage)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!isbroken)
		if(prob(1+ damage * 5))
			user.visible_message(
				"<span class='danger'>[user] smashed the pylon!</span>",
				"<span class='warning'>You hit the pylon, and its crystal breaks apart!</span>",
				"You hear a tinkle of crystal shards"
				)

			var/obj/effect/temporary/effect = new(get_turf(src), 6, 'infinity/icons/effects/cult.dmi', "bloodsparkles")
			effect.dir = src.dir

			user.do_attack_animation(src)
			playsound(get_turf(src), 'sound/effects/Glassbr3.ogg', 75, 1)
			isbroken = 1
			set_density(0)
			icon_state = "pylon-broken"
			set_light(0)
		else
			to_chat(user, SPAN_WARNING("You hit the pylon!"))
			playsound(get_turf(src), 'sound/effects/Glasshit.ogg', 75, 1)
	else
		if(prob(damage * 2))
			to_chat(user, SPAN_WARNING("You pulverize what was left of the pylon!"))
			qdel(src)
		else
			to_chat(user, SPAN_WARNING("You hit the pylon!"))
		playsound(get_turf(src), 'sound/effects/Glasshit.ogg', 75, 1)

	update_icon()

/obj/structure/cult/pylon/proc/repair(mob/user as mob)
	if(isbroken)
		to_chat(user, "You repair the pylon.")
		isbroken = 0
		set_density(1)
		icon_state = "pylon"
		set_light(light_max_bright, light_inner_range, light_outer_range, light_color)

/obj/structure/cult/pylon/Process()
	if(isbroken)
		return

	for(var/mob/living/L in range(5, src))
		if(iscultist(L))
			if(L.health != L.maxHealth)
				if(ishuman(L))
					var/mob/living/carbon/human/H = L
					H.adjustBruteLoss(-0.5)
					H.adjustFireLoss(-0.5)
					H.updatehealth()
					if(H.should_have_organ(BP_HEART) && H.vessel && !H.vessel.has_reagent(/datum/reagent/blood, H.species.blood_volume * 0.7))
						H.vessel.add_reagent(/datum/reagent/blood, 1)
				else
					var/mob/living/simple_animal/M = L
					if(M.health < M.maxHealth)
						M.adjustBruteLoss(-1)
						M.adjustFireLoss(-1)

	var/list/turfs = list()
	var/list/turfs_old = list()

	for(var/turf/simulated/turf in range(range - 1, src))
		turfs_old.Add(turf)

	for(var/turf/simulated/turf in range(range, src))
		if(turf in turfs_old)
			continue
		turfs.Add(turf)

	if(turfs.len == 0)
		range = min(range + 1, 7)
		return

	var/turf/simulated/T = pick(turfs)
	T.cultify()

/obj/structure/cult/tome
	name = "archives"
	desc = "A desk covered in arcane manuscripts and tomes in unknown languages. Looking at the text makes your skin crawl."
	icon_state = "tomealtar"
	light_color = "#ed9200"
	light_outer_range = 3
	light_color= "ed9200"

/obj/structure/cult/forge/attack_hand(mob/user as mob)

	if(!iscultist(user))
		to_chat(user, SPAN_WARNING("These books won't open and it hurts to even try and read the covers!"))
		return
	if(cooldown_time > world.time)
		to_chat(user, SPAN_WARNING("[src] is not ready yet for this!"))
		return

	var/choice = alert(user,"You flip through the black pages of the archives...",,"Zealot's Blindfold","Blood Halberd","Veil Walker Set")
	switch(choice)
		if("Zealot's Blindfold")
			new /obj/item/clothing/glasses/hud/health/cultblind(get_turf(src))

		if("Blood Halberd")
			var/obj/item/weapon/melee/cult_spear/spear = new(get_turf(src))
			spear.owner = user

		if("Veil Walker Set")
			new /obj/item/weapon/cult_shift(get_turf(src))
			new /obj/item/device/flashlight/flare/culttorch(get_turf(src))

	cooldown_time = world.time + 3 MINUTES

	var/obj/effect/temporary/effect = new(get_turf(src), 6, 'infinity/icons/effects/cult.dmi', "bloodsparkles")
	effect.dir = src.dir

	visible_message(SPAN_WARNING("With flash of bright light, [choice] appears on the [src]."))

/obj/effect/gateway
	name = "gateway"
	desc = "You're pretty sure that abyss is staring back."
	icon = 'icons/obj/cult.dmi'
	icon_state = "hole"
	density = 1
	unacidable = 1
	anchored = 1.0
	var/spawnable = null

/obj/effect/gateway/active
	light_outer_range=5
	light_color="#ff0000"
	spawnable=list(
		/mob/living/simple_animal/hostile/scarybat,
		/mob/living/simple_animal/hostile/creature,
		/mob/living/simple_animal/hostile/faithless
	)

/obj/effect/gateway/active/cult
	light_max_bright	= 0.5
	light_inner_range	= 2
	light_outer_range	= 5
	light_color			= "#ff0000"
	spawnable=list(
		/mob/living/simple_animal/hostile/scarybat/cult,
		/mob/living/simple_animal/hostile/creature/cult,
		/mob/living/simple_animal/hostile/faithless/cult
	)

/obj/effect/gateway/active/New()
	..()
	addtimer(CALLBACK(src, .proc/create_and_delete), rand(30,60) SECONDS)


/obj/effect/gateway/active/proc/create_and_delete()
	var/t = pick(spawnable)
	new t(src.loc)
	qdel(src)

/obj/effect/gateway/active/Crossed(var/atom/A)
	if(!istype(A, /mob/living))
		return

	var/mob/living/M = A

	if(M.stat != DEAD)
		if(M.HasMovementHandler(/datum/movement_handler/mob/transformation))
			return
		if(M.has_brain_worms())
			return //Borer stuff - RR

		if(iscultist(M)) return
		if(!ishuman(M) && !isrobot(M)) return

		M.AddMovementHandler(/datum/movement_handler/mob/transformation)
		M.icon = null
		M.overlays.len = 0
		M.set_invisibility(101)

		if(istype(M, /mob/living/silicon/robot))
			var/mob/living/silicon/robot/Robot = M
			if(Robot.mmi)
				qdel(Robot.mmi)
		else
			for(var/obj/item/W in M)
				M.drop_from_inventory(W)
				if(istype(W, /obj/item/weapon/implant))
					qdel(W)

		var/mob/living/new_mob = new /mob/living/simple_animal/construct/harvester(A.loc)
		new_mob.a_intent = I_HURT
		if(M.mind)
			M.mind.transfer_to(new_mob)
		else
			new_mob.key = M.key

		to_chat(new_mob, SPAN_WARNING("<B>You suddenly morph into a Harvester!</B>"))

		GLOB.cult.add_antagonist(new_mob.mind, ignore_role = 1, do_not_equip = 1)

/obj/machinery/door/unpowered/simple/cult
	name = "runed door"
	material = MATERIAL_CULT

/obj/machinery/door/unpowered/simple/cult/allowed(mob/M)
	if(!iscultist(M))
		M.Weaken(2)
		return 0
	return ..(M)
