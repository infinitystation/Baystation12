/mob/living/simple_animal/hostile/commanded
	name = "commanded"
	stance = COMMANDED_STOP
	natural_weapon = /obj/item/natural_weapon
	density = FALSE
	var/list/command_buffer = list()
	var/list/known_commands = list("stay", "stop", "attack", "follow", "guard", "forget master", "obey")
	var/mob/master = null //undisputed master. Their commands hold ultimate sway and ultimate power.
	var/list/allowed_targets = list() //WHO CAN I KILL D:
	var/retribution = 1 //whether or not they will attack us if we attack them like some kinda dick.
	var/list/protected_mobs  = list() // who under our protection

	ai_holder_type = /datum/ai_holder/simple_animal/melee/commanded

/datum/ai_holder/simple_animal/melee/commanded/can_attack(atom/movable/the_target, vision_required)
	var/mob/living/simple_animal/hostile/commanded/H = holder
	if(!(the_target in H.allowed_targets))
		return FALSE
	return ..()

/datum/ai_holder/simple_animal/melee/commanded/find_target(list/possible_targets, has_targets_list)
	ai_log("commanded/find_target() : Entered.", AI_LOG_TRACE)
	var/mob/living/simple_animal/hostile/commanded/C = holder
	if(!C.allowed_targets.len)
		return null
	var/mode = "specific"
	if(C.allowed_targets[1] == "everyone") //we have been given the golden gift of murdering everything. Except our master, of course. And our friends. So just mostly everyone.
		mode = "everyone"
	for(var/atom/A in list_targets())
		var/mob/M = null
		if(A == src)
			continue
		if(isliving(A))
			M = A
		if(M && M.stat)
			continue
		if(mode == "specific")
			if(!(A in C.allowed_targets))
				continue
			C.stance = STANCE_IDLE
			give_target(A)
			return A
		else
			C.allowed_targets += A
			if(M == C.master || (weakref(M) in C.friends))
				continue
			C.stance = STANCE_IDLE
			give_target(M)
			return A
	return ..()
/mob/living/simple_animal/hostile/commanded/proc/add_allowed_targets(var/L)
	if(!(L in allowed_targets))
		allowed_targets += L


/mob/living/simple_animal/hostile/commanded/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "", var/italics = 0, var/mob/speaker = null, var/sound/speech_sound, var/sound_vol)
	if((weakref(speaker) in friends) || speaker == master)
		command_buffer.Add(speaker)
		command_buffer.Add(lowertext(html_decode(message)))
	return 0

/mob/living/simple_animal/hostile/commanded/hear_radio(var/message, var/verb="says", var/datum/language/language=null, var/part_a, var/part_b, var/part_c, var/mob/speaker = null, var/hard_to_hear = 0)
	if((weakref(speaker) in friends) || speaker == master)
		command_buffer.Add(speaker)
		command_buffer.Add(lowertext(html_decode(message)))
	return 0

/mob/living/simple_animal/hostile/commanded/Life()
	. = ..()
	if(!.)
		return FALSE
	while(command_buffer.len > 0)
		var/mob/speaker = command_buffer[1]
		var/text = command_buffer[2]
		var/filtered_name = lowertext(html_decode(name))
		if(dd_hasprefix(text,filtered_name) || dd_hasprefix(text,"everyone") || dd_hasprefix(text, "everybody")) //in case somebody wants to command 8 bears at once.
			var/substring = copytext(text,length(filtered_name)+1) //get rid of the name.
			listen(speaker,substring)
		command_buffer.Remove(command_buffer[1],command_buffer[2])
	. = ..()
	if(.)
		switch(stance)
			if(COMMANDED_FOLLOW)
				follow_target()
			if(COMMANDED_STOP)
				commanded_stop()

//TODO:use AI following behaviour
/mob/living/simple_animal/hostile/commanded/proc/follow_target()
	set_AI_busy(TRUE)
	if(!target_mob)
		return
		
	if(target_mob in ai_holder.list_targets())
		walk_to(src,target_mob,1,move_speed)
		ai_holder.destination = target_mob.loc
	else if(ai_holder.destination)
		ai_holder.min_distance_to_destination = 0
		ai_holder.walk_to_destination()
		step(src, get_dir(src.loc, target_mob.loc), move_speed)
		if(get_dist(src,target_mob)<=3)
			step(src, get_dir(src.loc, target_mob.loc), move_speed)
		ai_holder.min_distance_to_destination = 1


/mob/living/simple_animal/hostile/commanded/proc/commanded_stop() //basically a proc that runs whenever we are asked to stay put. Probably going to remain unused.
	return

/mob/living/simple_animal/hostile/commanded/proc/listen(var/mob/speaker, var/text)
	for(var/command in known_commands)
		if(findtext(text,command))
			switch(command)
				if("stay")
					if(stay_command(speaker,text)) //find a valid command? Stop. Don't try and find more.
						break
				if("stop")
					if(stop_command(speaker,text))
						break
				if("attack")
					if(attack_command(speaker,text))
						break
				if("follow")
					if(follow_command(speaker,text))
						break
				if("guard")
					if(guard_command(speaker,text))
						break
				if("forget master")
					if(forget_master_command(speaker,text))
						break
				if("obey")
					if(obey_command(speaker,text))
						break				
				else
					misc_command(speaker,text) //for specific commands

	return 1

//returns a list of everybody we wanna do stuff with.
/mob/living/simple_animal/hostile/commanded/proc/get_targets_by_name(var/text, var/filter_friendlies = 0)
	var/list/possible_targets = hearers(src,10)
	. = list()
	for(var/mob/M in possible_targets)
		if(filter_friendlies && ((weakref(M) in friends) || M.faction == faction || M == master || M == src))
			continue
		var/found = 0
		if(findtext(text, "[M]"))
			found = 1
		else
			var/list/parsed_name = splittext(replace_characters(lowertext(html_decode("[M]")),list("-"=" ", "."=" ", "," = " ", "'" = " ")), " ") //this big MESS is basically 'turn this into words, no punctuation, lowercase so we can check first name/last name/etc'
			for(var/a in parsed_name)
				if(a == "the" || length(a) < 2) //get rid of shit words.
					continue
				if(findtext(text,"[a]"))
					found = 1
					break
		if(found)
			. += M


/mob/living/simple_animal/hostile/commanded/proc/clear_protected_mobs()
	for(var/mob/living/carbon/guarded in protected_mobs)
		guarded.guards -= src
	protected_mobs = list()

/mob/living/simple_animal/hostile/commanded/proc/attack_command(var/mob/speaker,var/text)
	clear_protected_mobs() // I must attack something, don`t guard
	target_mob = null //want me to attack something? Well I better forget my old target.
	set_AI_busy(FALSE)
	walk_to(src,0)
	stance = STANCE_ATTACK
	if(text == " attack." || findtext(text,"everyone") || findtext(text,"anybody") || findtext(text, "somebody") || findtext(text, "someone")) //if its just 'attack' then just attack anybody, same for if they say 'everyone', somebody, anybody. Assuming non-pickiness.
		allowed_targets = list("everyone")//everyone? EVERYONE
		return 1

	var/list/targets = get_targets_by_name(text)
	allowed_targets -= "everyone"
	for(var/target in targets):
		add_allowed_targets(target)

	return targets.len != 0

/mob/living/simple_animal/hostile/commanded/proc/stay_command(var/mob/speaker,var/text)
	target_mob = null
	stance = COMMANDED_STOP
	set_AI_busy(TRUE)
	walk_to(src,0)
	return 1

/mob/living/simple_animal/hostile/commanded/proc/stop_command(var/mob/speaker,var/text)
	clear_protected_mobs()
	allowed_targets = list()
	walk_to(src,0)
	target_mob = null //gotta stop SOMETHIN
	stance = STANCE_IDLE
	set_AI_busy(FALSE)
	return 1

/mob/living/simple_animal/hostile/commanded/proc/follow_command(var/mob/speaker,var/text)
	//we can assume 'stop following' is handled by stop_command
	clear_protected_mobs()
	if(findtext(text,"me"))
		stance = COMMANDED_FOLLOW
		target_mob = speaker //this wont bite me in the ass later.
		return 1

	var/list/targets = get_targets_by_name(text)
	if(targets.len > 1 || !targets.len) //CONFUSED. WHO DO I FOLLOW?
		return 0

	stance = COMMANDED_FOLLOW //GOT SOMEBODY. BETTER FOLLOW EM.
	target_mob = targets[1] //YEAH GOOD IDEA
	friends += weakref(target_mob)

	return 1

/mob/living/simple_animal/hostile/commanded/proc/guard_command(var/mob/living/carbon/speaker,var/text)
	if(findtext(text,"me"))
		stance = COMMANDED_FOLLOW
		target_mob = speaker
		clear_protected_mobs()
		if(!(src in speaker.guards))
			speaker.guards += src
		return 1

	var/list/targets = get_targets_by_name(text)
	if(!targets.len) 
		return 0
		
	for(var/mob/living/carbon/guarded_mob in targets) // only carbon lives need protection
		if(!(src in guarded_mob.guards))
			guarded_mob.guards += src
			protected_mobs += guarded_mob
		friends += weakref(guarded_mob)

	stance = COMMANDED_FOLLOW
	target_mob = pick(targets)
	return 1

/mob/living/simple_animal/hostile/commanded/proc/forget_master_command(var/mob/speaker,var/text)
	master = null // I`m alone, again, maybe my name is Hachiko?
	walk_to(src,0)
	target_mob = null //gotta stop SOMETHIN
	stance = STANCE_IDLE
	set_AI_busy(FALSE)
	return 1

/mob/living/simple_animal/hostile/commanded/proc/obey_command(var/mob/speaker,var/text)
	var/list/targets =  list()
	for(var/mob/living/carbon/human/H in get_targets_by_name(text)) //I want to obey humans
		targets += H
	if(targets.len > 1 || !targets.len) //CONFUSED. WHO DO I OBEY?
		return 0
	master = targets[1]
	return 1	

/mob/living/simple_animal/hostile/commanded/proc/misc_command(var/mob/speaker,var/text)
	return 0

/mob/living/simple_animal/hostile/commanded/hit_with_weapon(obj/item/O, mob/living/user, var/effective_force, var/hit_zone)
	//if they attack us, we want to kill them. None of that "you weren't given a command so free kill" bullshit.
	. = ..()
	if(. && retribution)
		target_mob = user
		add_allowed_targets(user) //fuck this guy in particular.
		stance = STANCE_ATTACK
		if(weakref(user) in friends) //We were buds :'(
			friends -= weakref(user)
		ai_holder.react_to_attack(user)


/mob/living/simple_animal/hostile/commanded/attack_hand(mob/living/carbon/human/M as mob)
	..()
	
	if(!(M.a_intent == I_HELP) && retribution) //assume he wants to hurt us.
		target_mob = M
		add_allowed_targets(M)
		stance = STANCE_ATTACK
		if(weakref(M) in friends)
			friends -= weakref(M)
		ai_holder.react_to_attack(M)

	if(M.a_intent == I_HELP && retribution)
		if(prob(10))
			target_mob = M
			add_allowed_targets(M)
			stance = STANCE_ATTACK
			if(weakref(M) in friends)
				friends -= weakref(M)
			ai_holder.react_to_attack(M)


/mob/living/simple_animal/hostile/commanded/proc/hunt_on(mob/M)
	if(M in ai_holder.list_targets())
		set_AI_busy(FALSE)
		stance = STANCE_ATTACK
		allowed_targets += M


