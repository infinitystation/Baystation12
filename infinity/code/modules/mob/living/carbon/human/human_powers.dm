/mob/living/proc/toggle_pass_table()
	set category = "Abilities"
	set name = "Toggle Agility" //Dunno a better name for this. You have to be pretty agile to hop over stuff!!!
	set desc = "Allows you to start/stop hopping over things such as hydroponics trays, tables, and railings."
	pass_flags ^= PASS_FLAG_TABLE //I dunno what this fancy ^= is but Aronai gave it to me.
	to_chat(src, "You [pass_flags&PASS_FLAG_TABLE ? "will" : "will NOT"] move over tables/railings/trays!")

/mob/living/carbon/human/proc/resomi_sonar_ping()
	set name = "Listen In"
	set desc = "Allows you to listen in to movement and noises around you."
	set category = "Abilities"

	if(incapacitated())
		to_chat(src, "<span class='warning'>You need to recover before you can use this ability.</span>")
		return
	if(is_deaf() || is_below_sound_pressure(get_turf(src)))
		to_chat(src, "<span class='warning'>You are for all intents and purposes currently deaf!</span>")
		return
	to_chat(src, "<span class='notice'>You take a moment to listen in to your environment...</span>")
	if(do_after(src, delay = 5, do_flags = DO_DEFAULT & ~DO_USER_SAME_HAND))
		var/heard_something = FALSE
		for(var/mob/living/L in range(client.view, src))
			var/turf/T = get_turf(L)
			if(!T || L == src || L.stat == DEAD || is_below_sound_pressure(T))
				continue
			heard_something = TRUE
			var/image/ping_image = image(icon = 'icons/effects/effects.dmi', icon_state = "sonar_ping", loc = src)
			ping_image.plane = HUD_PLANE
			ping_image.layer = UNDER_HUD_LAYER
			ping_image.pixel_x = (T.x - src.x) * WORLD_ICON_SIZE
			ping_image.pixel_y = (T.y - src.y) * WORLD_ICON_SIZE
			image_to(src, ping_image)
			addtimer(CALLBACK(src, .proc/clear_sonar_effect, src.client, ping_image), 8)
			var/feedback = list("<span class='notice'>There are noises of movement ")
			var/direction = get_dir(src, L)
			if(direction)
				feedback += "towards the [dir2text(direction)], "
				switch(get_dist(src, L) / client.view)
					if(0 to 0.2)
						feedback += "very close by."
					if(0.2 to 0.4)
						feedback += "close by."
					if(0.4 to 0.6)
						feedback += "some distance away."
					if(0.6 to 0.8)
						feedback += "further away."
					else
						feedback += "far away."
			else // No need to check distance if they're standing right on-top of us
				feedback += "right on top of you."
			feedback += "</span>"
			to_chat(src, jointext(feedback,null))
		if(!heard_something)
			to_chat(src, "<span class='notice'>You hear no movement but your own.</span>")
	else
		to_chat(src, "<span class='notice'>You need to stand still while you listen.</span>")

/mob/living/carbon/human/proc/toggle_sprint() //for tajaran (in past)
	set category = "Abilities"
	set name = "Sprint"
	set desc = "Acceleration for nutrients."

	var/obj/aura/speed/bio/tajaran/aura = locate() in auras
	if(!aura)
		to_chat(src, SPAN_WARNING("You don't possess a sprint ability."))
		return
	if(nutrition < aura.minimal_nutrition)
		to_chat(src, SPAN_WARNING("You are too exhausted..."))
		return
	aura.toggle()

//xeno abilities

/mob/living/carbon/human/proc/tackle()
	set category = "Abilities"
	set name = "Tackle"
	set desc = "Tackle someone down."

	if(last_special > world.time)
		return

	if(incapacitated(INCAPACITATION_DISABLED) || buckled || pinned.len)
		to_chat(src, "<span class='warning'>You cannot tackle in your current state.</span>")
		return

	var/list/choices = list()
	for(var/mob/living/M in view(1,src))
		if(!istype(M,/mob/living/silicon) && Adjacent(M))
			choices += M
	choices -= src

	var/mob/living/T = input(src,"Who do you wish to tackle?") as null|anything in choices

	if(!T || !src || src.stat) return

	if(!Adjacent(T)) return

	//check again because we waited for user input
	if(last_special > world.time)
		return

	if(incapacitated(INCAPACITATION_DISABLED) || buckled || pinned.len)
		to_chat(src, "<span class='warning'>You cannot tackle in your current state.</span>")
		return

	last_special = world.time + 50

	playsound(loc, 'sound/weapons/pierce.ogg', 25, 1, -1)
	T.Weaken(rand(1,3))
	if(prob(75))
		visible_message("<span class='danger'>\The [src] has tackled down [T]!</span>")
	else
		visible_message("<span class='danger'>\The [src] tried to tackle down [T]!</span>")
		src.Weaken(rand(2,4)) //failure, you both get knocked down

/mob/living/carbon/human/proc/leap()
	set category = "Abilities"
	set name = "Leap"
	set desc = "Leap at a target and grab them aggressively."

	if(last_special > world.time)
		return

	if(incapacitated(INCAPACITATION_DISABLED) || buckled || pinned.len)
		to_chat(src, "<span class='warning'>You cannot leap in your current state.</span>")
		return

	var/list/choices = list()
	for(var/mob/living/M in oview(6,src))
		if(!istype(M,/mob/living/silicon))
			choices += M
	choices -= src

	var/mob/living/T = input(src,"Who do you wish to leap at?") as null|anything in choices

	if(!T || !isturf(T.loc) || !src || !isturf(loc)) return

	if(get_dist(get_turf(T), get_turf(src)) > 4) return

	//check again because we waited for user input
	if(last_special > world.time)
		return

	if(incapacitated(INCAPACITATION_DISABLED) || buckled || pinned.len || stance_damage >= 4)
		to_chat(src, "<span class='warning'>You cannot leap in your current state.</span>")
		return

	playsound(src.loc, 'sound/voice/shriek1.ogg', 50, 1)

	last_special = world.time + (17.5 SECONDS)

	src.visible_message("<span class='danger'>\The [src] leaps at [T]!</span>")
	src.throw_at(get_step(get_turf(T),get_turf(src)), 4, 1, src)

	sleep(5)

	if(!src.Adjacent(T))
		to_chat(src, "<span class='warning'>You miss!</span>")
		return

	T.Weaken(3)
	if(mind && !player_is_antag(mind))
		Weaken(3)

	if(src.make_grab(src, T))
		src.visible_message("<span class='warning'><b>\The [src]</b> seizes [T]!</span>")
