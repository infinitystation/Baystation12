//Contains the rapid pipe dispencer.

/obj/item/rpd
	name = "rapid pipe dispencer"
	icon = 'infinity/icons/obj/items.dmi'
	icon_state = "rpd"
	item_state = "rpd"
	opacity = 0
	density = FALSE
	anchored = FALSE
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	force = 10.0
	throwforce = 10.0
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_ENGINEERING = 4, TECH_MATERIAL = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 50000)
	var/wait = 0
	var/pipe_color = "white"

/obj/item/rpd/proc/get_console_data(var/list/pipe_categories, var/color_options = FALSE)
	. = list()
	. += "<table>"
	if(color_options)
		. += "<tr><td>Color</td><td><a href='?src=\ref[src];color=\ref[src]'><font color = '[pipe_color]'>[pipe_color]</font></a></td></tr>"
	for(var/category in pipe_categories)
		var/datum/pipe/cat = category
		. += "<tr><td><font color = '#517087'><strong>[initial(cat.category)]</strong></font></td></tr>"
		for(var/datum/pipe/pipe in pipe_categories[category])
			var/line = "[pipe.name]</td>"
			. += "<tr><td>[line]<td><a href='?src=\ref[src];build=\ref[pipe]'>Dispense</a></td><td><a href='?src=\ref[src];buildfive=\ref[pipe]'>5x</a></td><td><a href='?src=\ref[src];buildten=\ref[pipe]'>10x</a></td></tr>"
	.+= "</table>"
	. = JOINTEXT(.)

/obj/item/rpd/proc/build_quantity(var/datum/pipe/P, var/quantity)
	for(var/I = quantity;I > 0;I -= 1)
		P.Build(P, usr.loc, pipe_color)

/obj/item/rpd/Topic(href, href_list, state = GLOB.physical_state)
	if((. = ..()))
		return

	if(href_list["build"])
		if(!wait)
			var/datum/pipe/P = locate(href_list["build"])
			P.Build(P, usr.loc, pipe_color)
			wait = 1
			spawn(10)
				wait = 0

	if(href_list["buildfive"])
		if(!wait)
			var/datum/pipe/P = locate(href_list["buildfive"])
			build_quantity(P, 5)
			wait = 1
			spawn(15)
				wait = 0

	if(href_list["buildten"])
		if(!wait)
			var/datum/pipe/P = locate(href_list["buildten"])
			build_quantity(P, 10)
			wait = 1
			spawn(20)
				wait = 0

	if(href_list["color"])
		var/choice = input(usr, "What color do you want pipes to have?") as null|anything in pipe_colors
		if(!choice)
			return 1
		pipe_color = choice
		updateUsrDialog()

/obj/item/rpd/attack_self(user as mob)
	var/datum/browser/popup = new (user, "Pipe List", "[src] Control Panel")
	popup.set_content(get_console_data(GLOB.all_pipe_datums_by_category, TRUE))
	popup.open()

/obj/item/rpd/attackby(var/obj/item/W as obj, var/mob/user as mob)
	if (istype(W, /obj/item/pipe) || istype(W, /obj/item/pipe_meter))
		to_chat(usr, "<span class='notice'>You put \the [W] back into \the [src].</span>")
		user.drop_item()
		add_fingerprint(usr)
		qdel(W)
		return
	else
		return ..()
