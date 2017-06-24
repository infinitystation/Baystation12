/var/obj/effect/lobby_image = new/obj/effect/lobby_image()
var/list/accept_list = list()

/obj/effect/lobby_image
	name = "Baystation12"
	desc = "This shouldn't be read."
	screen_loc = "WEST,SOUTH"

/obj/effect/lobby_image/initialize()
	icon = using_map.lobby_icon
	var/known_icon_states = icon_states(icon)
	for(var/lobby_screen in using_map.lobby_screens)
		if(!(lobby_screen in known_icon_states))
			error("Lobby screen '[lobby_screen]' did not exist in the icon set [icon].")
			using_map.lobby_screens -= lobby_screen

	if(using_map.lobby_screens.len)
		icon_state = pick(using_map.lobby_screens)
	else
		icon_state = known_icon_states[1]

/mob/new_player/Login()
	update_Login_details()	//handles setting lastKnownIP and computer_id for use by the ban systems as well as checking for multikeying

	spawn(20)
		if(!(key in accept_list))
			client.language = alert("Language: ",,"ru", "eng")
			if(client.language == "eng")
				alert("We have actual rules and strongly recommend you read them before to play. Ignorance of the rules does not exempt from liability.")
			else
				alert("ћы имеем актуальные правила и насто€тельно рекомендуем ¬ам ознакомиться с ними перед началом игры. Ќезнание правил не освобождает от ответственности.")
			accept_list += key
		client.show_motd("welcome_[client.language]")

	to_chat(src, "<div class='info'>Game ID: <div class='danger'>[game_id]</div></div>")

	if(!mind)
		mind = new /datum/mind(key)
		mind.active = 1
		mind.current = src

	loc = null
	client.screen += lobby_image
	my_client = client
	set_sight(sight|SEE_TURFS)
	player_list |= src

	if(!client.banprisoned)
		new_player_panel()
	else
		new_player_panel_prisoner()

	if(client)
		//handle_privacy_poll()
		client.playtitlemusic()
		maybe_send_staffwarns("connected as new player")
