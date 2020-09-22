/datum/configuration
	var/discord_url
	var/discord_password

	var/event_status = 0
	var/lighting_style = "SMOOTH"

	var/sql_enabled = 1
	var/ntnet_radius_multiplyer = 1
	var/ntnet_speed_limiter = 4

	var/admin_midis_allowed = 0

	var/default_latejoin_cooldown = 3 SECONDS
	var/observers_allowed = TRUE

	var/ambience_probability = 5
	var/ambience_delay = 2 MINUTE

	var/deny_notdead_observer_becoming = FALSE

	var/donaters_only_emoji = FALSE
