/area/mbay/chemistry
	name = "Chemistry"
	icon_state = "chem"
	req_access = list(access_chemistry)

/area/mbay/mentalhealth
	name = "Mental Health"
	icon_state = "medbay3"
	ambience = list('sound/ambience/signal.ogg')
	req_access = list(access_psychiatrist)

/area/mbay/morgue
	name = "Morgue"
	icon_state = "morgue"
	ambience = list('sound/ambience/ambimo1.ogg','sound/ambience/ambimo2.ogg','sound/music/main.ogg')
	req_access = list(access_morgue)

/area/mbay/sleeper
	name = "Emergency Treatment Center"
	icon_state = "exam_room"
	req_access = list(access_medical_equip)

/area/mbay/surgery
	name = "Operating Theatre"
	icon_state = "surgery"
	req_access = list(access_surgery)

/area/mbay/infirmreception
	name = "Infirmary Reception"
	icon_state = "medbay2"
	req_access = list(access_medical_equip)

/area/mbay/snaryaga
	name = "Medical Equipement"
	icon_state = "exam_room"
	req_access = list(access_medical_equip)

/area/mbay/patroom
	name = "Patients room"
	icon_state = "patients"

/area/mbay/zoo
	name = "Mental zootherapie"
	icon_state = "patients"

/area/mbay/koridor
	name = "Passage hall"
	icon_state = "patients"

/area/mbay/maintenance_equipstorage
	name = "Maintenance Storage"
	icon_state = "medbay4"

/area/mbay/enter
	name = "Main entry gate"
	icon_state = "medbay4"

/area/mbay/exit
	name = "Emergency Exit"
	icon_state = "medbay4"

/area/mbay/cmo
	icon_state = "heads_cmo"
	name = "Command - CMO's Office"
	req_access = list(access_cmo)

/area/mbay/virology
	name = "Virology"
	icon_state = "virology"
	req_access = list(access_virology)