/obj/structure/changeling_cocoon
	name = "meaty cocoon"
	desc = "A gross looking cocoon, made of some sort of bilogical mass..."
	icon = 'infinity/icons/obj/changeling.dmi'
	icon_state = "cocoon_progress"
	w_class = ITEM_SIZE_NO_CONTAINER
	layer = ABOVE_WINDOW_LAYER
	density = 1
	var/mob/living/carbon/human/victim = null
	var/birth_time = 60*2 //seconds
	var/idle_time = 0
	var/idle_time_max = 60 //seconds
	var/progress = 0 //in seconds
	var/last_sound_time
	var/health
	var/max_health = 100

/obj/structure/changeling_cocoon/Initialize()
	. = ..()
	last_sound_time = world.time
	health = max_health
	START_PROCESSING(SSobj, src)

/obj/structure/changeling_cocoon/Process()
	if(!victim?.client)
		idle_time++
		if(idle_time >= idle_time_max)
			if(victim)
				victim.Drain()
			qdel(src)
		return
	if(health < max_health)
		if(prob(4))
			src.visible_message(SPAN_WARNING("\icon[src] [src] slowly restores damaged sections with biomass..."))
		health++
	progress++
	if(progress >= birth_time)
		birth()
	on_update_icon()
	if(progress % 10 == 0) //every 10 seconds
		var/time = birth_time - progress
		if(time > 0)
			to_chat(victim, SPAN_LING("До вылупления осталось [time] секунд."))
	if(world.time >= last_sound_time + 20 SECONDS)
		last_sound_time = world.time
		playsound(get_turf(src), 'infinity/sound/effects/lingextends.ogg', 15, 1, -4.5)
		src.visible_message(pick(
			SPAN_WARNING("\icon[src] [src] pulses and faintly moves..."),
			SPAN_WARNING("\icon[src] [src]... breaths?"),
			SPAN_WARNING("\icon[src] [src] exchanges faint breath."),
			SPAN_WARNING("\icon[src] [src] has something under biomass - it moves around the victim...")))

/obj/structure/changeling_cocoon/Destroy()
	drop_victim()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/structure/changeling_cocoon/on_update_icon()
	if(progress <= birth_time)
		icon_state = "cocoon_progress"

//	switch(health) //todo

/obj/structure/changeling_cocoon/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(istype(I, /obj/item/device/scanner))
		var/obj/item/device/scanner/scanner = I
		scanner.scan(victim)
		return
	if(user.a_intent == I_HURT)
		user.do_attack_animation(src)
		var/damage = I.force
		if(I.damtype == BURN)
			damage *= 2
		playsound(get_turf(src), I.hitsound, 15, 1)
		take_damage(damage)
		user.visible_message(SPAN_WARNING("[user] [pick(I.attack_verb)]s [src]!"), SPAN_WARNING("You [pick(I.attack_verb)] [src]!"))
	else
		user.visible_message(SPAN_WARNING("[user] pokes [src] with [I]."), SPAN_WARNING("You poke [src] with [I]."))

/obj/structure/changeling_cocoon/attack_generic(var/mob/user, var/damage, var/attack_verb)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	user.visible_message(SPAN_DANGER("\The [user] [attack_verb] \the [src]!"))
	attack_animation(user)
	take_damage(damage)

/obj/structure/changeling_cocoon/attack_hand(var/mob/M)
	if(M.a_intent == I_HURT)
		if(M in contents)
			M.setClickCooldown(DEFAULT_ATTACK_COOLDOWN * 2) //double cooldown
			M.visible_message(SPAN_DANGER("Something rips [src] from inside!"), SPAN_WARNING("We bite and tear [src]!"))
			playsound(get_turf(src), 'sound/weapons/bite.ogg', 20, 1)
			take_damage(20) //todo: update with species attack state, bite one (or not?)
		else
			M.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			M.do_attack_animation(src)
			M.visible_message(SPAN_WARNING("[M] kicks [src]!"), SPAN_WARNING("You kick [src]!"))
			playsound(get_turf(src), pick(('sound/weapons/genhit1.ogg'), ('sound/weapons/genhit2.ogg'), pick('sound/weapons/genhit3.ogg')), 50, 1)
			take_damage(3) //todo: update with species attack states
	else
		M.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		if(M in contents)
			to_chat(M, "You touch [src]. It feels slimy and warm - you can see everything around it.")
		else
			M.visible_message(SPAN_WARNING("[M] touches [src]..."), "You touch [src]. It feels slimy and warm.")

/obj/structure/changeling_cocoon/bullet_act(var/obj/item/projectile/Proj)
	if(!(Proj.damage_type == BRUTE || Proj.damage_type == BURN))
		return
	switch(Proj.damage_type)
		if(BRUTE) visible_message(SPAN_WARNING("[src] tears appart!"))
		if(BURN) visible_message(SPAN_WARNING("[src] melts!"))
	take_damage(Proj.damage)
	..()

/obj/structure/changeling_cocoon/ex_act(severity)
	switch(severity)
		if(1)
			qdel(src)
		if(2)
			take_damage(90)
		if(3)
			take_damage(40)

/* todo
/obj/structure/changeling_cocoon/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	return
*/

/obj/structure/changeling_cocoon/take_damage(var/amount)
	health -= amount
	if(health < max_health / 4 && victim)
		visible_message(SPAN_WARNING("\icon[src] [src] breaks appart and a goo flows from it!"))
		new /obj/effect/decal/cleanable/filth(src)
		drop_victim()
		icon_state = "cocoon_opened"
	if(health < 0)
		visible_message(SPAN_WARNING("\icon[src] [src] breaks appart!"))
		qdel(src)

/obj/structure/changeling_cocoon/examine(mob/user)
	. = ..()
	spawn(1 SECOND)
		if(Adjacent(user) && victim)
			to_chat(user, SPAN_DANGER("[src] has faint pulse!"))
/*
/obj/structure/changeling_cocoon/attack_ghost(var/mob/observer/ghost/user)
	if(convert(user))
		spawn(1 SECOND)
			if(user) qdel(user) // Remove the keyless ghost if it exists.
*/
/obj/structure/changeling_cocoon/proc/drop_victim()
	if(victim)
		visible_message(SPAN_DANGER("[victim] dropped from [src]!"))
		victim.dropInto(loc)
		victim = null

/obj/structure/changeling_cocoon/proc/background()
	if(!victim?.client)
		return
	to_chat(victim, SPAN_LING("Кокон изменяет тело и сознание.<br>\
	Скорее всего, тело умрет до вылупления. Но затем, <i>мы</i> возрадимся.<br>\
	Мы будем частью общности - одним из сородичей, что будем работать на её благо и ставить её интересы \
	выше собственных, в том числе и жизни. Мы должны взять под контроль корабль, поглотив его экипаж и превратив \
	этим в себе подобных. Пока экипаж не станет слишком малочисленен и слаб, чтобы можно было охотиться без опаски \
	- нам следует осторожность.<br>\
	Если наш кокон никто не потревожит, то вскоро <i>мы</i> проснемся и прогрызете себе путь на свободу, включившись в охоту. \
	Наше тело требует новые геномы, чтобы жить и развиваться. Не стоит поглощать или убивать сородичей \
	- мы все практически родственники.<br>\
	Сегодня экипаж станет нашим ужином. Удачной охоты."))

/*
Revive in the next proc causes runtimes like
Runtime in unsorted.dm, line 1116: GC: -- [0x20006bc] | /obj/item/organ/external/foot was unable to be GC'd --
x7
I don't know how to fix it, tried two days, sorry.
*/

/obj/structure/changeling_cocoon/proc/birth()
	if(!victim.client)
		return
	victim.revive()
	spawn(4 SECONDS)
		GLOB.changelings.add_antagonist(victim.mind, 1)
	spawn(7 SECONDS)
		if(victim.mind.changeling) //just to don't fuck up with runtimes further
			victim.mind.changeling.chem_storage = 30
			victim.mind.changeling.chem_charges = 30
			victim.mind.changeling.geneticpoints = 5
	spawn(10 SECONDS)
		to_chat(victim, SPAN_LING(FONT_LARGE("Отныне, <b><i>мы едины!</b></i> Нужно разорвать наш кокон, чтобы выбраться!")))
		to_chat(victim, SPAN_NOTICE("(Атакуйте кокон)"))
	STOP_PROCESSING(SSobj, src)
/*
/obj/structure/changeling_cocoon/proc/convert(mob/user)
	if(!victim)
		to_chat(user, SPAN_WARNING("Превращение уже завершилось."))
		return
	if(jobban_isbanned(user, MODE_CHANGELING))
		to_chat(user, SPAN_WARNING("У вас имеется бан на роль генокрадов. Вы не можете играть за них."))
		return
	if(src.victim.client)
		to_chat(user, SPAN_WARNING("Кто-то уже занял это тело до Вас."))
		return
	var/confirm = alert(user, "Вы хотите стать новым генокрадом?", "Новый генокрад", "Нет", "Да")
	if(!user || !src || confirm != "Да")
		return
	victim.ckey = user.ckey
	background()
	to_chat(victim, SPAN_DANGER("Не покидайте тело и игру, чтобы процесс превращения продолжался и другие игроки не заняли его."))
	return 1
*/
