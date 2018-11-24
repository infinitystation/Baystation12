/datum/event/communications_blackout/announce()
	var/alert = pick(	"���������� �������� ����-�����. ��������� ������ �������������������� ����� ���������. ���������� ����������� � ����*%fj00)`5vc-BZZT", \
						"���������� �������� ����-�����. ��������� ������ �������������������� ����� ������*3mga;b4;'1v�-BZZZT", \
						"���������� �������� ����-�����. ��������� �����#MCi46:5.;@63-BZZZZT", \
						"���������� �������� ��-'fZ\\kg5_0-BZZZZZT", \
						"�������:%� MCayj^j<.3-BZZZZZZT", \
						"#4nd%;f4y6,>�%-BZZZZZZZT")

	for(var/mob/living/silicon/ai/A in GLOB.player_list)	//AIs are always aware of communication blackouts.
		if(A.z in affecting_z)
			to_chat(A, "<br>")
			to_chat(A, "<span class='warning'><b>[alert]</b></span>")
			to_chat(A, "<br>")

	if(prob(80))	//Announce most of the time, just not always to give some wiggle room for possible sabotages.
		priority_announcement.Announce(alert, new_sound = sound('sound/misc/interference.ogg', volume=25), zlevels = affecting_z)


/datum/event/communications_blackout/start()
	for(var/obj/machinery/telecomms/T in telecomms_list)
		if(T.z in affecting_z)
			if(prob(T.outage_probability))
				T.overloaded_for = max(severity * rand(90, 120), T.overloaded_for)

