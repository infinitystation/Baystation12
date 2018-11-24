/spell/aoe_turf/blink
	name = "Blink"
	desc = "This spell randomly teleports you a short distance."
	feedback = "BL"
	school = "conjuration"
	charge_max = 20
	spell_flags = Z2NOCAST | IGNOREDENSE | IGNORESPACE | NO_SOMATIC
	invocation = "none"
	invocation_type = SpI_NONE
	range = 14 // infinity-ss13: old first number - 7
	inner_radius = 1

	level_max = list(Sp_TOTAL = 4, Sp_SPEED = 4, Sp_POWER = 4)
	cooldown_min = 5 //4 deciseconds reduction per rank
	hud_state = "wiz_blink"

/spell/aoe_turf/blink/cast(var/list/targets, mob/user)
	if(!targets.len)
		return

	var/turf/T = pick(targets)
	var/turf/starting = get_turf(user)
	if(T)
		if(user.buckled)
			user.buckled = null
		user.forceMove(T)

		var/datum/effect/effect/system/smoke_spread/smoke = new /datum/effect/effect/system/smoke_spread()
		smoke.set_up(10, 0, starting) // infinity-ss13: old first number - 5
		smoke.start()

		/* infinity-ss13
		smoke = new()
		smoke.set_up(3, 0, T)
		smoke.start()
		*/

	return

/spell/aoe_turf/blink/empower_spell()
	if(!..())
		return 0
	inner_radius += 1

	return "You've increased the inner range of [src]."