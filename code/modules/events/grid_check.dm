/datum/event/grid_check	//NOTE: Times are measured in master controller ticks!
	announceWhen		= 5

/datum/event/grid_check/start()
	power_failure(0, severity, using_map.contact_levels)

/datum/event/grid_check/announce()
	command_announcement.Announce("ќбнаружена аномальная активность электроэнергии на станции [station_name()]. ¬ качестве меры предосторожности, мощность станции будет отключена на неопределЄнный срок.", "јвтоматическая проверка сети", new_sound = 'sound/AI/poweroff.ogg')
