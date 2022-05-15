
/**
 * Client verb to get his own species and job experience.
 */
/client/verb/get_own_experience()
	set name = "Get Job and Species Experience"
	set category = "Special Verbs"
	get_player_experience_page(usr.client, usr.ckey)
