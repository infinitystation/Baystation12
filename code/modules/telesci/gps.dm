GLOBAL_LIST_EMPTY(GPS_LIST)

/obj/item/device/tgps
	name = "global positioning system"
	desc = "Helping lost spacemen find their way through the planets since 2016."
	icon = 'icons/obj/telescience.dmi'
	icon_state = "gps-c"
	w_class = 2.0
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	item_flags = ITEM_FLAG_NO_PRINT
	pass_flags = PASS_FLAG_TABLE
	slot_flags = SLOT_BELT
	origin_tech = "programming=2;engineering=2"
	var/gpstag = "COM0"
	var/emped = 0

/obj/item/device/tgps/New()
	..()
	GLOB.GPS_LIST += src
	name = "global positioning system ([gpstag])"
	overlays += "working"

/obj/item/device/tgps/Destroy()
	GLOB.GPS_LIST -= src
	..()

/obj/item/device/tgps/emp_act(severity)
	emped = 1
	overlays -= "working"
	overlays += "emp"
	spawn(300)
		emped = 0
		overlays -= "emp"
		overlays += "working"

/obj/item/device/tgps/attack_self(mob/user as mob)
	var/obj/item/device/tgps/t = ""
	if(emped)
		t += "ERROR"
	else
		t += "<BR><A href='?src=\ref[src];tag=1'>Set Tag</A> "
		t += "<BR>Tag: [gpstag]"

		for(var/obj/item/device/tgps/G in GLOB.GPS_LIST)
			var/turf/pos = get_turf(G)
			var/area/gps_area = get_area(G)
			var/tracked_gpstag = G.gpstag
			if(G.emped == 1)
				t += "<BR>[tracked_gpstag]: ERROR"
			else
				t += "<BR>[tracked_gpstag]: [format_text(gps_area.name)] ([pos.x], [pos.y], [pos.z])"

	var/datum/browser/popup = new(user, "GPS", name, 600, 450)
	popup.set_content(t)
	popup.set_title_image(user.browse_rsc_icon(src.icon, src.icon_state))
	popup.open()

/obj/item/device/tgps/Topic(href, href_list)
	..()
	if(href_list["tag"] )
		var/a = input("Please enter desired tag.", name, gpstag) as text
		a = uppertext(copytext(sanitize(a), 1, 5))
		if(src.loc == usr)
			gpstag = a
			name = "global positioning system ([gpstag])"
			attack_self(usr)

/obj/item/device/tgps/science
	icon_state = "gps-s"
	gpstag = "SCI0"

/obj/item/device/tgps/engineering
	icon_state = "gps-e"
	gpstag = "ENG0"
