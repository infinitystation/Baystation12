/*/spell/targeted/stealth
	name = "Enter Stealth"
	desc = "This spell creates your ethereal form, temporarily making you invisible and able to pass through walls."
	feedback = "ES"
	school = "Illusion"
	charge_max = 300
	spell_flags = Z2NOCAST | INCLUDEUSER | CONSTRUCT_CHECK
	invocation = "none"
	invocation_type = SpI_NONE
	range = 0	//INF was -1 view(-1) detects usr.content but not usr as itself
	max_targets = 1
	cooldown_min = 15

	hud_state = "const_shift"

/spell/targeted/stealth/cast(list/targets)
	for(var/mob/living/simple_animal/construct/wraith/benemoth/target in targets)
		if(target.alpha > 5)
			target.last_hp = target.health
			target.health = min(target.health, 1)
			target.maxHealth = 1
			target.alpha = 5
			to_chat(target,"<span class='cult'>You are now consealed. Your attacks will deal extra damage, but any hit will kill you instatly.</span>")
			target.melee_damage_lower *= 2
			target.melee_damage_upper *= 2
		else
			target.health = target.last_hp
			target.maxHealth = 75
			target.alpha = 255
			to_chat(target,"<span class='cult'>You are now visible again. Now you have your full health and attack damage.</span>")
			target.melee_damage_lower = 25
			target.melee_damage_upper = 25*/


/spell/aoe_turf/conjure/forcewall_cult

	name = "Shield"
	desc = "Allows you to pull up a shield to protect yourself and allies from incoming threats"

	charge_max = 300
	spell_flags = 0
	invocation = "none"

	school = "conjuration"
	feedback = "FW"
	cast_sound = 'sound/magic/forcewall.ogg'

	invocation_type = SpI_NONE
	range = 0
	summon_type = /obj/effect/forcefield/cult
	duration = 200

	hud_state = "const_juggwall"

/spell/aoe_turf/conjure/forcewall_cult/cast(list/targets, mob/user)
	new summon_type(get_turf(user))
	if(user.dir == SOUTH || user.dir == NORTH)
		new summon_type(get_step(user, EAST))
		new summon_type(get_step(user, WEST))
	else
		new summon_type(get_step(user, NORTH))
		new summon_type(get_step(user, SOUTH))

/obj/effect/forcefield/cult/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(isliving(mover))
		var/mob/living/L = mover
		if(iscultist(L))
			return 1
	. = ..()