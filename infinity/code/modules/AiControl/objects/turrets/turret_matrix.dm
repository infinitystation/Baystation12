/obj/machinery/porta_turret/var/tmp/list/turret_matrix = list()

/obj/machinery/porta_turret/proc/UpdateTurretMatrix(mob/living/A)
	if(A.client)
		CleenTurret_matrix()
		for(var/turf/T in block(locate(x - A.client.view, y - A.client.view, z), locate(x + A.client.view, y + A.client.view, z)))
			var/atom/atom2conect
			var/mob/living/L = locate(/mob/living) in T
			var/obj/machinery/porta_turret/Turrtet = locate(/obj/machinery/porta_turret) in T
			var/obj/machinery/door/airlock/Airlok = locate(/obj/machinery/door/airlock) in T
			var/colour
			var/mtext
			if(Turrtet) AddImageConnected2atom(Turrtet, Turrtet.raised ? TURRET_COLOR : TURRET_COLOR_CLOSED)
			else if(L)
				if(assess_living(L))
					colour = TURRET_ENEMY_COLOR
					mtext = "ENEMY"
				else
					colour = TURRET_ALLOWED_COLOR
					mtext = ""
				atom2conect = L
			else if(Airlok)
				if(Airlok.density)
					colour = TURRET_DOOR_CLOSED_COLOR
					mtext = "CLSD"
				else
					colour = TURRET_DOOR_OPEN_COLOR
					mtext = "OPEN"
				atom2conect = Airlok
			else if(T.density)
				atom2conect = T
				colour = TURRET_WALL_COLOR
			else
				atom2conect = T
				colour = "#000000"
			AddImageConnected2atom(atom2conect, colour, nmap_text = mtext)

/obj/machinery/porta_turret/proc/AddImageConnected2atom(atom/A, colour, nicon = IM_ICON, nicon_state = "white", nmap_text = null)
	if(turret_matrix[A]) qdel(turret_matrix[A])

	var/image/im_turf_underlay

	var/image/im_back = image(nicon, A, nicon_state)
	im_back.plane = FULLSCREEN_PLANE
	im_back.color = colour

	var/image/im_matrix = image(IM_ICON, isturf(A) ? A : get_turf(A), "matrix")
	im_matrix.plane = FULLSCREEN_PLANE + 0.1
	im_matrix.layer = im_back.layer + 0.2

	if(!isturf(A))
		var/turf/AT = get_turf(A)
		im_turf_underlay = image(nicon, AT, "white")
		im_turf_underlay.color = "#000000"

	/*(!isturf(A) && im_turf_underlay) ? (im_turf_underlay.overlays += im_matrix) : (*/
	im_back.overlays += im_matrix

	AiHolder.client.images += im_back
	AiHolder.client.images += im_matrix
	if(im_turf_underlay) AiHolder.client.images += im_turf_underlay
	if(nmap_text)
		var/image/mtext = new()
		mtext.color = "#ffffff"
		mtext.maptext_y = 5
		mtext.maptext = nmap_text
		mtext.layer = im_back.layer + 0.1
		im_back.overlays += mtext
		AiHolder.client.images += mtext

	turret_matrix[A] = im_back

/obj/machinery/porta_turret/proc/CleenTurret_matrix(mob/living/A)
	for(var/atom/M in turret_matrix)
		var/image/im = turret_matrix[M]
		for(var/image/i in im.overlays)
			A?.client?.images -= i
			qdel(i)
		for(var/image/i in im.underlays)
			A?.client?.images -= i
			qdel(i)
		A?.client?.images -= im
		qdel(turret_matrix[M])
		turret_matrix.Remove(M)
