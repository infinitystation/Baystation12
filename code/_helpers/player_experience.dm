/**
 * Datum helper proc, that returns browser windows with job and species experience of player, whose ckey is passed.
 * Currently has two usages:
 * * 1. game/verbs/player_experience.dm get_own_experience() client verb.
 * * 2. modules/admin/topic.dm Topic() case with href_list["playerexperience"].
 *
 * Arguments:
 * * user - client who is trying to get player experience
 * * ckey - the ckey of the player, whose experience to fetch
 */
/datum/proc/get_player_experience_page(client/user, var/ckey)

	if(!user)
		return

	if(!SSdbcore.IsConnected())
		to_chat(user, SPAN_DANGER("Database is not connected. Can't get player experience."))
		return

	// We don't need to return a page, if the ckey was not specified
	if(!ckey)
		to_chat(user, SPAN_NOTICE("No ckey were specified"))
		return

	var/datum/db_query/select_player_exp = SSdbcore.NewQuery(
		"SELECT exp, species_exp FROM [format_table_name("player")] WHERE ckey = :ckey",
		list("ckey" = ckey)
	)

	if(!select_player_exp.Execute())
		return

	var/list/player_exp
	var/list/player_species_exp
	if(select_player_exp.NextRow())
		player_exp = params2list(select_player_exp.item[1])
		player_species_exp = params2list(select_player_exp.item[2])

	QDEL_NULL(select_player_exp)

	if(!player_exp && !player_species_exp)
		to_chat(user, SPAN_NOTICE("[ckey] has no tracked experience!"))
		return

	var/data = {"<html lang="en">
				<head>
					<meta charset="UTF-8">
				</head>"}

	if(player_exp)
		data += {"<h3>General and Job Experience for [ckey]</h3>
				<table>
					<tr>
						<th>Category</th>
						<th>Time(minutes)</th>
					</tr>"}
		for(var/exp_type in player_exp)
			data += {"<tr>
						<td>[exp_type]</td>
						<td>[player_exp[exp_type]]</td>
					</tr>"}

		data += "</table>"

	if(player_species_exp)
		data += {"<h3>Species Experience for [ckey]</h3>
				<table>
					<tr>
						<th>Species</th>
						<th>Time(minutes)</th>
					</tr>"}
		for(var/species in player_species_exp)
			data += {"<tr>
						<td>[species]</td>
						<td>[player_species_exp[species]]</td>
					</tr>"}

		data += "</table>"

	data += {"<style>
				html {
					font-family: serif;
					background: rgb(34,34,34);
					color: rgb(153, 178, 195);

					text-align: center;
				}
				table {
					font-size: 20px;
					width: 100%;
					border-collapse: collapse;

					border: 1px solid rgb(153, 178, 195);
		 		}
				th {
					font-weight: normal;
					padding: 10px 8px;
					border: 2px solid rgb(153, 178, 195);
				}
				td {
					padding: 9px 8px;
					border: 1px solid rgb(153, 178, 195);
				}
				h3 {
					font-weight: bold;
				}
			</style>
			</html>"}

	var/datum/browser/popup = new(user, "player_experience", "", 350, 600)
	popup.set_content(data)
	popup.open()
