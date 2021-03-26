// Used for creating the exchange areas.
/area/turbolift
	name = "Turbolift"
	base_turf = /turf/simulated/open
	requires_power = 0
	sound_env = SMALL_ENCLOSED

	var/lift_floor_label = null
	var/lift_floor_name = null
	var/lift_announce_str = "Ding!"
	var/arrival_sound = 'sound/machines/ding.ogg'

	forced_ambience = list('infinity/sound/SS2/music/02_elevator.mp3')//inf