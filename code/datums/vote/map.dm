/datum/vote/map
	name = "map"
	manual_allowed = 0
	time_set = 60
	additional_header = "<td align = 'center'><b>Recommended Players</b></td></tr>"

/datum/vote/map/can_run(mob/creator, automatic)
	if(automatic)
		return TRUE

/datum/vote/map/setup_vote(mob/creator, automatic)
	initiator = (!automatic && istype(creator)) ? creator.ckey : "the server"
	choices += GLOB.playable_maps
	for(var/datum/map/M in choices)
		display_choices[M] = M.full_name
		additional_text[M] ="<td align = 'center'>~[M.recommended_players]</td>"
	choices += "extend"
	display_choices["extend"] = "�������� ��� �����"

/datum/vote/map/report_result()
	if(..())
		return 1
	if(result[1] == "extend")
		log_game("������ ������� ��������� ������� �����.")
		SSticker.end_game_state = END_GAME_READY_TO_END
		return

	if(result[1])
		var/datum/map/M = result[1]
		fdel("maps/~mapsystem/map_in_use.dm")
		text2file("#if !defined(using_map_DATUM)\n\
						#include \"../[M.path]/[M.path].dm\"\n\
					#elif !defined(MAP_OVERRIDE)\n\
						#warn A map has already been included, ignoring map rotates.\n\
					#endif",
		 "maps/~mapsystem/map_in_use.dm")
		if(!SSticker.update_server)
			SSvote.reset()
			SSticker.update_map(M.full_name)
		else
			send2mainirc("��������� ������ ����� - [M.full_name]!")
			SSticker.end_game_state = END_GAME_READY_TO_END
