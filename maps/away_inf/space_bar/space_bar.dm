#include "space_bar_areas.dm"

/obj/effect/overmap/ship/space_bar
	name = "space bar"
	desc = "Sensors detect an undamaged vessel."
	color = "#bd6100"
	vessel_mass = 5000
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECOND
	initial_generic_waypoints = list(
		"nav_space_bar_1",
		"nav_space_bar_2",
		"nav_space_bar_3",
		"nav_space_bar_4",
		"nav_space_bar_antag",
		"nav_space_bar_hangar",
	)
	initial_restricted_waypoints = list(
		"Space Bar" = list("nav_space_bar_hangar"),
	)

/obj/effect/overmap/ship/space_bar
	name = "Space Bar"


/obj/effect/shuttle_landmark/nav_space_bar/nav1
	name = "Space Bar Navpoint #1"
	landmark_tag = "nav_space_bar_1"

/obj/effect/shuttle_landmark/nav_space_bar/nav2
	name = "Space Bar Navpoint #2"
	landmark_tag = "nav_space_bar_2"

/obj/effect/shuttle_landmark/nav_space_bar/nav3
	name = "Space Bar Navpoint #3"
	landmark_tag = "nav_space_bar_3"

/obj/effect/shuttle_landmark/nav_space_bar/nav1
	name = "Space Bar Navpoint #1"
	landmark_tag = "nav_space_bar_1"

/obj/effect/shuttle_landmark/nav_space_bar/nav5
	name = "Space Bar Navpoint #5"
	landmark_tag = "nav_space_bar_antag"

/datum/shuttle/autodock/overmap/space_bar_cutter
	name = "Space Bar Cutter"
	warmup_time = 15
	move_time = 60
	shuttle_area = /area/space_bar/space_bar_cutter
	current_location = "nav_space_bar_hangar"
	landmark_transition = "nav_space_bar_transit"
	fuel_consumption = 0.5//it's small
	range = 1
	defer_initialisation = TRUE

/obj/effect/shuttle_landmark/nav_space_bar/cutter_hangar
	name = "Space Bar Hangar"
	landmark_tag = "nav_space_bar_hangar"
	base_area = /area/space_bar/space_bar_hangar
	base_turf = /turf/simulated/floor/plating

/obj/effect/shuttle_landmark/nav_space_bar/cutter_transit
	name = "In transit"
	landmark_tag = "nav_space_bar_transit"

/obj/machinery/computer/shuttle_control/explore/space_bar_cutter
	name = "cutter control console"
	shuttle_tag = "Space Bar Cutter"

/obj/structure/space_bar/roulette
	name = "roulette"
	desc = "Spin the roulette to try your luck."
	icon = 'maps/away/casino/casino_sprites.dmi'
	icon_state = "roulette_r"
	density = 0
	anchored = 1
	var/busy=0

/obj/structure/space_bar/roulette/attack_hand(mob/user as mob)
	if (busy)
		to_chat(user,"<span class='notice'>You cannot spin now! \The [src] is already spinning.</span> ")
		return
	visible_message("<span class='notice'>\ [user]  spins the roulette and throws inside little ball.</span>")
	busy = 1
	var/n = rand(0,36)
	var/color = "green"
	add_fingerprint(user)
	if ((n>0 && n<11) || (n>18 && n<29))
		if (n%2)
			color="red"
	else
		color="black"
	if ( (n>10 && n<19) || (n>28) )
		if (n%2)
			color="black"
	else
		color="red"
	spawn(5 SECONDS)
		visible_message("<span class='notice'>\The [src] stops spinning, the ball landing on [n], [color].</span>")
		busy=0

/obj/structure/space_bar/roulette_chart
	name = "roulette chart"
	desc = "Roulette chart. Place your bets! "
	icon = 'maps/away/casino/casino_sprites.dmi'
	icon_state = "roulette_l"
	density = 0
	anchored = 1

/obj/structure/space_bar/bj_table
	name = "blackjack table"
	desc = "This is a blackjack table. "
	icon = 'maps/away/casino/casino_sprites.dmi'
	icon_state = "bj_left"
	density = 0
	anchored = 1

/obj/structure/space_bar/bj_table/bj_right
	icon_state = "bj_right"

/obj/structure/space_bar/oh_bandit
	name = "one armed bandit"
	desc = "Turned off slot machine. "
	icon = 'maps/away/casino/casino_sprites.dmi'
	icon_state = "slot_machine"
	density = 0
	anchored = 1

/obj/structure/space_bar/craps
	name = "craps table"
	desc = "Craps table: roll dice!"
	icon = 'maps/away/casino/casino_sprites.dmi'
	icon_state = "craps_top"
	density = 0
	anchored = 1

/obj/structure/space_bar/craps/craps_down
	icon_state = "craps_down"

//========================used bullet casings=======================
/obj/item/ammo_casing/rifle/used/Initialize()
	. = ..()
	expend()
	pixel_x = rand(-10, 10)
	pixel_y = rand(-10, 10)


/obj/item/ammo_casing/pistol/used/Initialize()
	. = ..()
	expend()
	pixel_x = rand(-10, 10)
	pixel_y = rand(-10, 10)

/obj/item/ammo_casing/pistol/magnum/used/Initialize()
	. = ..()
	expend()
	pixel_x = rand(-10, 10)
	pixel_y = rand(-10, 10)
