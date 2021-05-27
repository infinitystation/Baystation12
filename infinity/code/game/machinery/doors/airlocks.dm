/obj/machinery/door/airlock/autoname/command
	door_color = COLOR_COMMAND_BLUE

/obj/machinery/door/airlock/autoname/engineering
	door_color = COLOR_AMBER

/obj/machinery/door/airlock/autoname/centcom
	airlock_type = "centcomm"
	name = "\improper Airlock"
	icon = 'icons/obj/doors/centcomm/door.dmi'
	fill_file = 'icons/obj/doors/centcomm/fill_steel.dmi'
	paintable = AIRLOCK_PAINTABLE|AIRLOCK_STRIPABLE

/obj/machinery/door/airlock/autoname/civilian
	stripe_color = COLOR_CIVIE_GREEN

/obj/machinery/door/airlock/autoname/medical
	door_color = COLOR_WHITE
	stripe_color = COLOR_DEEP_SKY_BLUE

/obj/machinery/door/airlock/autoname/mining
	door_color = COLOR_PALE_ORANGE
	stripe_color = COLOR_BEASTY_BROWN

/obj/machinery/door/airlock/autoname/maintenance
	name = "Maintenance Access"
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/security/striped
	stripe_color = COLOR_ORANGE

/obj/machinery/door/airlock/engineering/striped
	stripe_color = COLOR_RED

/obj/machinery/door/airlock/centcom
	name = "Airlock"
	icon = 'icons/obj/doors/centcomm/door.dmi'


/obj/machinery/door/airlock/glass/command/no_stripe
	stripe_color = null

/obj/machinery/door/airlock/glass/security/no_stripe
	stripe_color = null

/obj/machinery/door/airlock/glass/engineering/no_stripe
	stripe_color = null

/obj/machinery/door/airlock/glass/medical/no_stripe
	stripe_color = null

/obj/machinery/door/airlock/vault
	name = "Vault"
	icon = 'icons/obj/doors/vault/door.dmi'
	explosion_resistance = 20
	opacity = TRUE
	secured_wires = 1
	assembly_type = /obj/structure/door_assembly/door_assembly_highsecurity //Until somebody makes better sprites.

/obj/machinery/door/airlock/proc/get_new_ntnet_id()
	t_ntnet_id = pick(alphabet) + num2text(rand(100,999))
	var/list/IDS = list()
	for(var/obj/machinery/door/airlock/i in GLOB.airlocks)
		if(i == src)
			continue
		IDS += i.t_ntnet_id
	if(t_ntnet_id in IDS)
		get_new_ntnet_id()
		return

/client/proc/debug_airlocks_id()
	set name = "Debug Airlocks ID"
	set category = "Debug"
//html{background: linear-gradient(180deg, #373737, #171717);color: #a4bad6;}hr{background-color: #40628a;height: 1px;}
	var/stylesheet = {"<style>
							div.id_airlocksbugged{
								background: #844;
								border-radius: 5px;
								border-color: #a00;
								padding: 20px;
							}
							table, td, th {
								border: 1px solid #6a6;
							}
							td, th {
								width: 100px;
							}
							table.id_airlocksbugged{
							border: 1px solid #a66;
							}
							table.id_airlocksbugged td, table.id_airlocksbugged th{
							border: 1px solid #a66;
							}
							.airlocksid_stable{
								background: #4c4;
								border-radius: 5px;
								border: #0a0 solid 3px;
								padding: 30px;
								font-size: 30px;
							}
						</style>"}
	var/IDS_table = {"<table>
					<tr>
						<th>ID
						<th>NAME
						<th>LOCATION"}
	var/list/IDS = list()
	var/list/bugged_airlocks = list()
	var/bugged_airlocks_table = {"<tr>
									<th class='id_airlocksbugged'>ID
									<th class='id_airlocksbugged'>NAME
									<th class='id_airlocksbugged'>LOCATION
									<th class='id_airlocksbugged'>ID PAIR
									<th class='id_airlocksbugged'>PAIR NAME
									<th class='id_airlocksbugged'>PAIR LOCATION"}
	var/data = ""
	for(var/obj/machinery/door/airlock/TEST in GLOB.airlocks)
/*
		for(var/obj/machinery/door/airlock/I in SSmachines.machinery)
			if(TEST.t_ntnet_id == I.t_ntnet_id && I != TEST)
				bugged_airlocks += "[I.name] | ID: [I.t_ntnet_id] | Location: [I.loc]"
				continue
*/
		IDS += {"	<td>[TEST.t_ntnet_id]
					<td>[TEST.name]
					<td>([GET_ATOMLOC_HREF_FOR(TEST)] ([TEST.loc]))"}
	for(var/obj/machinery/door/airlock/i in GLOB.airlocks)
		for(var/obj/machinery/door/airlock/n in GLOB.airlocks)
			if(n == i) 
				continue
			if(n.t_ntnet_id == i.t_ntnet_id)
				bugged_airlocks += {"	<td class='id_airlocksbugged'>[n.t_ntnet_id]
										<td class='id_airlocksbugged'>[n.name]
										<td class='id_airlocksbugged'>[n.loc] ([GET_ATOMLOC_HREF_FOR(n)])

										<td class='id_airlocksbugged'>[i.t_ntnet_id]
										<td class='id_airlocksbugged'>[i.name]
										<td class='id_airlocksbugged'>[i.loc] ([GET_ATOMLOC_HREF_FOR(i)])"}

	if(bugged_airlocks.len)
		data += {"<div class = 'id_airlocksbugged'>
					<center>
						<h2>
							Airlocks with same ID's:
						</h2>
						<br>
						<div align='center'>
							<table class="id_airlocksbugged">
								[bugged_airlocks_table]<tr>
								[bugged_airlocks.Join("<tr>")]
							</table>
						</div>
					</center>
				</div><hr>"}
	else
		data += "<div class = 'airlocksid_stable'>Airlocks ID system stable</div>"
	data += "<center><h1>All airlocks IDs:</h1></center><hr>"
	if(IDS.len)
		data += "<div align='center'>[IDS_table]<tr>[IDS.Join("<tr>")]</div>"
	else
		data += "<div class = 'id_airlocksbugged'>ERROR CODE 523 (Origin Is Unreachable): Airlocks isn't initialized or not found.</div>"
	data += stylesheet
	//show_browser(src, data, "airlocks_ntnet_id_debug")
	var/datum/browser/popup = new(src.virtual_eye, "ailocksdebug", "Airlock ID Debug", 700, 800)
	popup.set_content(data)
	popup.open()
	return 1
