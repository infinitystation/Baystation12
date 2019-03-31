//Contains the rapid pipe dispencer.

/obj/item/weapon/rpd
	name = "rapid pipe dispencer"
	icon = 'icons/obj/items_inf.dmi'
	icon_state = "rpd"
	item_state = "rpd"
	opacity = 0
	density = 0
	anchored = 0.0
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

/obj/item/weapon/rpd/Initialize()
	. = ..()

/obj/item/weapon/rpd/attack_self(mob/user)
	if(..())
		return
	var/dat = {"
	<b>Regular pipes:</b><BR>
	<A href='?src=\ref[src];make=0;dir=1'>Pipe</A><BR>
	<A href='?src=\ref[src];make=1;dir=5'>Bent Pipe</A><BR>
	<A href='?src=\ref[src];make=5;dir=1'>Manifold</A><BR>
	<A href='?src=\ref[src];make=8;dir=1'>Manual Valve</A><BR>
	<A href='?src=\ref[src];make=9;dir=1'>Digital Valve</A><BR>
	<A href='?src=\ref[src];make=44;dir=1'>Automatic Shutoff Valve</A><BR>
	<A href='?src=\ref[src];make=20;dir=1'>Pipe Cap</A><BR>
	<A href='?src=\ref[src];make=19;dir=1'>4-Way Manifold</A><BR>
	<A href='?src=\ref[src];make=18;dir=1'>Manual T-Valve</A><BR>
	<A href='?src=\ref[src];make=43;dir=1'>Manual T-Valve - Mirrored</A><BR>
	<A href='?src=\ref[src];make=21;dir=1'>Upward Pipe</A><BR>
	<A href='?src=\ref[src];make=22;dir=1'>Downward Pipe</A><BR>
	<b>Supply pipes:</b><BR>
	<A href='?src=\ref[src];make=29;dir=1'>Pipe</A><BR>
	<A href='?src=\ref[src];make=30;dir=5'>Bent Pipe</A><BR>
	<A href='?src=\ref[src];make=33;dir=1'>Manifold</A><BR>
	<A href='?src=\ref[src];make=41;dir=1'>Pipe Cap</A><BR>
	<A href='?src=\ref[src];make=35;dir=1'>4-Way Manifold</A><BR>
	<A href='?src=\ref[src];make=37;dir=1'>Upward Pipe</A><BR>
	<A href='?src=\ref[src];make=39;dir=1'>Downward Pipe</A><BR>
	<b>Scrubbers pipes:</b><BR>
	<A href='?src=\ref[src];make=31;dir=1'>Pipe</A><BR>
	<A href='?src=\ref[src];make=32;dir=5'>Bent Pipe</A><BR>
	<A href='?src=\ref[src];make=34;dir=1'>Manifold</A><BR>
	<A href='?src=\ref[src];make=42;dir=1'>Pipe Cap</A><BR>
	<A href='?src=\ref[src];make=36;dir=1'>4-Way Manifold</A><BR>
	<A href='?src=\ref[src];make=38;dir=1'>Upward Pipe</A><BR>
	<A href='?src=\ref[src];make=40;dir=1'>Downward Pipe</A><BR>
	<b>Fuel pipes:</b><BR>
	<A href='?src=\ref[src];make=45;dir=1'>Pipe</A><BR>
	<A href='?src=\ref[src];make=46;dir=5'>Bent Pipe</A><BR>
	<A href='?src=\ref[src];make=47;dir=1'>Manifold</A><BR>
	<A href='?src=\ref[src];make=51;dir=1'>Pipe Cap</A><BR>
	<A href='?src=\ref[src];make=48;dir=1'>4-Way Manifold</A><BR>
	<A href='?src=\ref[src];make=49;dir=1'>Upward Pipe</A><BR>
	<A href='?src=\ref[src];make=50;dir=1'>Downward Pipe</A><BR>
	<b>Devices:</b><BR>
	<A href='?src=\ref[src];make=28;dir=1'>Universal pipe adapter</A><BR>
	<A href='?src=\ref[src];make=4;dir=1'>Connector</A><BR>
	<A href='?src=\ref[src];make=7;dir=1'>Unary Vent</A><BR>
	<A href='?src=\ref[src];make=10;dir=1'>Gas Pump</A><BR>
	<A href='?src=\ref[src];make=15;dir=1'>Pressure Regulator</A><BR>
	<A href='?src=\ref[src];make=16;dir=1'>High Power Gas Pump</A><BR>
	<A href='?src=\ref[src];make=11;dir=1'>Scrubber</A><BR>
	<A href='?src=\ref[src];makemeter=1'>Meter</A><BR>
	<A href='?src=\ref[src];make=13;dir=1'>Gas Filter</A><BR>
	<A href='?src=\ref[src];make=23;dir=1'>Gas Filter - Mirrored</A><BR>
	<A href='?src=\ref[src];make=14;dir=1'>Gas Mixer</A><BR>
	<A href='?src=\ref[src];make=25;dir=1'>Gas Mixer - Mirrored</A><BR>
	<A href='?src=\ref[src];make=24;dir=1'>Gas Mixer - T</A><BR>
	<A href='?src=\ref[src];make=26;dir=1'>Omni Gas Mixer</A><BR>
	<A href='?src=\ref[src];make=27;dir=1'>Omni Gas Filter</A><BR>
	<b>Heat exchange:</b><BR>
	<A href='?src=\ref[src];make=2;dir=1'>Pipe</A><BR>
	<A href='?src=\ref[src];make=3;dir=5'>Bent Pipe</A><BR>
	<A href='?src=\ref[src];make=6;dir=1'>Junction</A><BR>
	<A href='?src=\ref[src];make=17;dir=1'>Heat Exchanger</A><BR>
	"}
	user << browse("<HEAD><TITLE>[src]</TITLE></HEAD><TT>[dat]</TT>", "window=pipedispenser")
	onclose(user, "pipedispenser")
	return

/obj/item/weapon/rpd/Topic(href, href_list, state = GLOB.physical_state)
	if((. = ..()))
		usr << browse(null, "window=pipedispenser")
		return

	if(href_list["make"])
		if(!wait)
			var/p_type = text2num(href_list["make"])
			var/p_dir = text2num(href_list["dir"])
			var/obj/item/pipe/P = new (usr.loc, pipe_type=p_type, dir=p_dir)
			P.update()
			wait = 1
			spawn(10)
				wait = 0
	if(href_list["makemeter"])
		if(!wait)
			new /obj/item/pipe_meter(usr.loc)
			wait = 1
			spawn(15)
				wait = 0

/obj/item/weapon/rpd/attackby(var/obj/item/W as obj, var/mob/user as mob)
	if (istype(W, /obj/item/pipe) || istype(W, /obj/item/pipe_meter))
		to_chat(usr, "<span class='notice'>You put \the [W] back into \the [src].</span>")
		user.drop_item()
		add_fingerprint(usr)
		qdel(W)
		return
	else
		return ..()
