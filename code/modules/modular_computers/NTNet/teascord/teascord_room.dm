/datum/computer_file/data/teascord_room/
	var/title = "Teatime"
	var/private = 0

	var/invited_clients = list()
	var/connected_clients = list()

/datum/computer_file/data/teascord_room/New()
	ntnet_global.teascord_rooms |= src
	title = "Teatime - [sequential_id(type)]"
	. = ..()

/datum/computer_file/data/teascord_room/Destroy()
	ntnet_global.teascord_rooms -= src
	for(var/datum/computer_file/data/teascord_account/IC in invited_clients)
		IC.active_invites -= src
	. = ..()

/datum/computer_file/data/teascord_room/proc/join(var/datum/computer_file/data/teascord_account/C)
	connected_clients |= C
	if(C in invited_clients)
		invited_clients -= C
	if(C.connected_client)
		var/datum/nano_module/teascord/TNM = C.connected_client
		TNM.conversation = src
	for(var/datum/computer_file/data/teascord_account/T in connected_clients)
		if(T == C)
			continue
		if(T.connected_client)
			var/datum/nano_module/teascord/TNM = T.connected_client
			TNM.program.computer.visible_message("[C.nickname] joins the conversation '[title]'.", 1)
			playsound(TNM.program.computer, 'sound/machines/twobeep.ogg', 50, 1)

/datum/computer_file/data/teascord_room/proc/leave(var/datum/computer_file/data/teascord_account/C)
	connected_clients -= C
	if(C.connected_client)
		var/datum/nano_module/teascord/TNM = C.connected_client
		TNM.conversation = null
	for(var/datum/computer_file/data/teascord_account/T in connected_clients)
		if(T.connected_client)
			var/datum/nano_module/teascord/TNM = T.connected_client
			TNM.program.computer.visible_message("[C.nickname] leaves the conversation '[title]'.", 1)
			playsound(TNM.program.computer, 'sound/machines/twobeep.ogg', 25, 1)
	if(!LAZYLEN(connected_clients))
		Destroy()

/datum/computer_file/data/teascord_room/proc/invite(var/datum/computer_file/data/teascord_account/inviter, var/datum/computer_file/data/teascord_account/invited)
	var/datum/nano_module/teascord/invited_TNM = invited.connected_client

	invited_clients |= invited
	invited.active_invites |= src

	invited_TNM.program.computer.visible_message("[inviter.login] invites you in conversation '[title]'.", 1)
	playsound(invited_TNM.program.computer, 'sound/machines/twobeep.ogg', 50, 1)
