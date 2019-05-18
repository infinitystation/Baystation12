
//########################## CONTRABAND ;3333333333333333333 -Agouri ###################################################

/obj/item/weapon/contraband
	name = "contraband item"
	desc = "You probably shouldn't be holding this."
	icon = 'icons/obj/contraband.dmi'
	force = 0


/obj/item/weapon/contraband/poster
	name = "rolled-up poster"
	desc = "The poster comes with its own automatic adhesive mechanism, for easy pinning to any vertical surface."
	icon_state = "rolled_poster"
	var/poster_type

/obj/item/weapon/contraband/poster/New(var/maploading, var/given_poster_type)
	if(given_poster_type && !ispath(given_poster_type, /decl/poster))
		CRASH("Invalid poster type: [log_info_line(given_poster_type)]")

	poster_type = given_poster_type || poster_type
	if(!poster_type)
		poster_type = pick(subtypesof(/decl/poster))
	..()

/obj/item/weapon/contraband/poster/Initialize()
	var/list/posters = subtypesof(/decl/poster)
	var/serial_number = posters.Find(poster_type)
	name += " - No. [serial_number]"

	return ..()

//Places the poster on a wall
/obj/item/weapon/contraband/poster/afterattack(var/atom/A, var/mob/user, var/adjacent, var/clickparams)
	if (!adjacent)
		return

	//must place on a wall and user must not be inside a closet/mecha/whatever
	var/turf/W = A
	if (!iswall(W) || !isturf(user.loc))
		to_chat(user, "<span class='warning'>You can't place this here!</span>")
		return

	var/placement_dir = get_dir(user, W)
	if (!(placement_dir in GLOB.cardinal))
		to_chat(user, "<span class='warning'>You must stand directly in front of the wall you wish to place that on.</span>")
		return

	if (ArePostersOnWall(W))
		to_chat(user, "<span class='notice'>There is already a poster there!</span>")
		return

	user.visible_message("<span class='notice'>\The [user] starts placing a poster on \the [W].</span>","<span class='notice'>You start placing the poster on \the [W].</span>")

	var/obj/structure/sign/poster/P = new (user.loc, placement_dir, poster_type)
	qdel(src)
	flick("poster_being_set", P)
	// Time to place is equal to the time needed to play the flick animation
	if(do_after(user, 28, W) && iswall(W) && !ArePostersOnWall(W, P))
		user.visible_message("<span class='notice'>\The [user] has placed a poster on \the [W].</span>","<span class='notice'>You have placed the poster on \the [W].</span>")
	else
		// We cannot rely on user being on the appropriate turf when placement fails
		P.roll_and_drop(get_step(W, turn(placement_dir, 180)))

/obj/item/weapon/contraband/poster/proc/ArePostersOnWall(var/turf/W, var/placed_poster)
	//just check if there is a poster on or adjacent to the wall
	if (locate(/obj/structure/sign/poster) in W)
		return TRUE

	//crude, but will cover most cases. We could do stuff like check pixel_x/y but it's not really worth it.
	for (var/dir in GLOB.cardinal)
		var/turf/T = get_step(W, dir)
		var/poster = locate(/obj/structure/sign/poster) in T
		if (poster && placed_poster != poster)
			return TRUE

	return FALSE

//############################## THE ACTUAL DECALS ###########################

/obj/structure/sign/poster
	name = "poster"
	desc = "A large piece of space-resistant printed paper."
	icon = 'icons/obj/contraband.dmi'
	anchored = 1
	var/poster_type
	var/ruined = 0

/obj/structure/sign/poster/bay_9
	poster_type = /decl/poster/bay_9

/obj/structure/sign/poster/bay_50
	poster_type = /decl/poster/bay_50

/obj/structure/sign/poster/New(var/newloc, var/placement_dir = null, var/give_poster_type = null)
	..(newloc)

	if(!poster_type)
		if(give_poster_type)
			poster_type = give_poster_type
		else
			poster_type = pick(subtypesof(/decl/poster))
	set_poster(poster_type)

	switch (placement_dir)
		if (NORTH)
			pixel_x = 0
			pixel_y = 32
		if (SOUTH)
			pixel_x = 0
			pixel_y = -32
		if (EAST)
			pixel_x = 32
			pixel_y = 0
		if (WEST)
			pixel_x = -32
			pixel_y = 0

/obj/structure/sign/poster/proc/set_poster(var/poster_type)
	var/decl/poster/design = decls_repository.get_decl(poster_type)
	SetName("[initial(name)] - [design.name]")
	desc = "[initial(desc)] [design.desc]"
	icon_state = design.icon_state

/obj/structure/sign/poster/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(isWirecutter(W))
		playsound(loc, 'sound/items/Wirecutter.ogg', 100, 1)
		if(ruined)
			to_chat(user, "<span class='notice'>You remove the remnants of the poster.</span>")
			qdel(src)
		else
			to_chat(user, "<span class='notice'>You carefully remove the poster from the wall.</span>")
			roll_and_drop(user.loc)
		return


/obj/structure/sign/poster/attack_hand(mob/user as mob)

	if(ruined)
		return

	if(alert("Do I want to rip the poster from the wall?","You think...","Yes","No") == "Yes")

		if(ruined || !user.Adjacent(src))
			return

		visible_message("<span class='warning'>\The [user] rips \the [src] in a single, decisive motion!</span>" )
		playsound(src.loc, 'sound/items/poster_ripped.ogg', 100, 1)
		ruined = 1
		icon_state = "poster_ripped"
		SetName("ripped poster")
		desc = "You can't make out anything from the poster's original print. It's ruined."
		add_fingerprint(user)

/obj/structure/sign/poster/proc/roll_and_drop(turf/newloc)
	new/obj/item/weapon/contraband/poster(newloc, poster_type)
	qdel(src)

/decl/poster
	// Name suffix. Poster - [name]
	var/name=""
	// Description suffix
	var/desc=""
	var/icon_state=""

/decl/poster/tjpost/New()
   ..()
   .=pick(subtypesof(/decl/poster/tjpost))

/obj/structure/sign/poster/tjpost
	name = "poster"
	desc = "A large piece of space-resistant printed paper with emblem of CCA"
	icon = 'icons/obj/contraband.dmi'
	icon_state= "tposter"

/obj/structure/sign/poster/tjpost/tj_1
	poster_type = /decl/poster/tjpost/tj_1

/obj/structure/sign/poster/tjpost/tj_2
	poster_type = /decl/poster/tjpost/tj_2

/obj/structure/sign/poster/tjpost/tj_3
	poster_type = /decl/poster/tjpost/tj_3

/obj/structure/sign/poster/tjpost/tj_4
	poster_type = /decl/poster/tjpost/tj_4

/obj/structure/sign/poster/tjpost/tj_5
	poster_type = /decl/poster/tjpost/tj_5

/obj/structure/sign/poster/tjpost/tj_6
	poster_type = /decl/poster/tjpost/tj_6

/obj/structure/sign/poster/tjpost/tj_7
	poster_type = /decl/poster/tjpost/tj_7

/obj/structure/sign/poster/tjpost/tj_8
	poster_type = /decl/poster/tjpost/tj_8

/obj/structure/sign/poster/tjpost/tj_9
	poster_type = /decl/poster/tjpost/tj_9

/obj/structure/sign/poster/tjpost/tj_10
	poster_type = /decl/poster/tjpost/tj_10

/obj/structure/sign/poster/tjpost/tj_11
	poster_type = /decl/poster/tjpost/tj_11

/obj/structure/sign/poster/tjpost/tj_12
	poster_type = /decl/poster/tjpost/tj_12

/obj/structure/sign/poster/tjpost/tj_13
	poster_type = /decl/poster/tjpost/tj_13

/obj/structure/sign/poster/tjpost/tj_14
	poster_type = /decl/poster/tjpost/tj_14

/obj/structure/sign/poster/tjpost/tj_15
	poster_type = /decl/poster/tjpost/tj_15

/obj/structure/sign/poster/tjpost/tj_16
	poster_type = /decl/poster/tjpost/tj_16

/obj/structure/sign/poster/tjpost/tj_17
	poster_type = /decl/poster/tjpost/tj_17

/obj/structure/sign/poster/tjpost/tj_18
	poster_type = /decl/poster/tjpost/tj_18

/obj/structure/sign/poster/tjpost/tj_19
	poster_type = /decl/poster/tjpost/tj_19

/obj/structure/sign/poster/tjpost/tj_20
	poster_type = /decl/poster/tjpost/tj_20

/obj/structure/sign/poster/tjpost/tj_21
	poster_type = /decl/poster/tjpost/tj_21

/obj/structure/sign/poster/tjpost/tj_22
	poster_type = /decl/poster/tjpost/tj_22

/obj/structure/sign/poster/guide_to_pee
	poster_type = /decl/poster/guide_to_pee

/decl/poster/tjpost/tj_1
	icon_state="tposter_1"
	name = "Liberation day"
	desc = "A memorable photo, which depicted how the soldiers of the Kaytam clan  raise their flag over the overseer citadel  in Naliar"

/decl/poster/tjpost/tj_2
	icon_state="tposter_2"
	name = "Patriotic poster"
	desc = "This is a poster that reminds you that the galaxy around is not very friendly, and you should watch your safety yourself."

/decl/poster/tjpost/tj_3
	icon_state="tposter_3"
	name = "Technical poster"
	desc = "This poster is a guide on how to use the carabiner TV-3C, there is detailed information about assembly, disassembly, and maintenance, but one of the written dialects of Ahdomai."

/decl/poster/tjpost/tj_4
	icon_state="tposter_4"
	name = "Jet poster"
	desc = "This poster shows one of the most common fighter-interceptor FLA."

/decl/poster/tjpost/tj_5
	icon_state="tposter_5"
	name = "Heli-poster"
	desc = "This poster shows transport helicopters flying over the ruins of the suburbs of Naliar. The photo on the poster is made shortly before the final assault, and saw him every tajaran."

/decl/poster/tjpost/tj_6
	icon_state="tposter_6"
	name = "FLA MBT-86"
	desc = "This poster shows one of the FLA MBT used by the eastern forces at the end of the conflict."

/decl/poster/tjpost/tj_7
	icon_state="tposter_7"
	name = "Sa'a poster"
	desc = "This poster offers views of the mountains of Sa'a"

/decl/poster/tjpost/tj_8
	icon_state="tposter_8"
	name = "First mech poster"
	desc = "This poster shows the first combat mech created by the Kaytam clan used in urban combat in Naliar."

/decl/poster/tjpost/tj_9
	icon_state="tposter_9"
	name = "CCA Army"
	desc = "This poster shows one of the tanks of Zhan-Hazan, and behind him you can see the attack helicopter."

/decl/poster/tjpost/tj_10
	icon_state="tposter_10"
	name = "Assault Drones"
	desc = "This poster depicts the flying combat drones times of Ahdomai Conflict."

/decl/poster/tjpost/tj_11
	icon_state="tposter_11"
	name = "Sunrise on S'Randjiir"
	desc = "Sunrise on S'Randjiir, the picture is made from the dome of one of the gas producing factories on it."

/decl/poster/tjpost/tj_12
	icon_state="tposter_12"
	name = "Ir-Shira class station"
	desc = "One of the mobile station class of Ir-Shira, descended from the shipyards over Adamem to gateway in the neighboring system."

/decl/poster/tjpost/tj_13
	icon_state="tposter_13"
	name = "109 year"
	desc = "Each tajaran knows what happened in the 109 year. The first satellite was launched into Ahdomai orbit."

/decl/poster/tjpost/tj_14
	icon_state="tposter_14"
	name = "298 year"
	desc = "TFirst crew change in orbit of the first space station of Ahdomai."

/decl/poster/tjpost/tj_15
	icon_state="tposter_15"
	name = "Winter night"
	desc = "You see one of the quiet winter nights of Ahdomai, it becomes easier from the memories of the beauty of your home."

/decl/poster/tjpost/tj_16
	icon_state="tposter_16"
	name = "Ta'Apa Charka"
	desc = "One of the icebergs on the holy land for tajara."

/decl/poster/tjpost/tj_17
	icon_state="tposter_17"
	name = "Maya'Thcha mountaints"
	desc = "Mountains Maya'Thcha in its beauty."

/decl/poster/tjpost/tj_18
	icon_state="tposter_18"
	name = "Sunrise in the forest"
	desc = "Sunrise in one of the forests. Nice and simple. Naturally."

/decl/poster/tjpost/tj_19
	icon_state="tposter_19"
	name = "Bayan"
	desc = "The Bayan village in the winter."

/decl/poster/tjpost/tj_20
	icon_state="tposter_20"
	name = "Mirr-Shorrkra"
	desc = "View of Mirr-Shorrkra from the Naff'Yark."

/decl/poster/tjpost/tj_21
	icon_state="tposter_21"
	name = "Unknown liberator"
	desc = "You can see the beautiful spokeswoman of tajara that fought for the liberation of Ahdomai during a long war."

/decl/poster/tjpost/tj_22
	icon_state="tposter_22"
	name = "Mryarov Mraporting"
	desc = "There is a drone blimp-bomber of the Kaytam clan."

/decl/poster/guide_to_pee
	icon_state="guide_to_pee"
	name = "Guide to use toilet"
	desc = "If you want to avoid obossaniy pol and unitaz, then follow a couple of simple rules that will help you in this: For starters, get a hold of your gun. Make sure you get your sights right. Didn't take it too high, or too low. Also, make sure your weapon is not placed in the holster. If you follow these simple rules and do not blunt, the floor in the toilet will not be obossan."