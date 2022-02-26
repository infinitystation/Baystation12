
/datum/stack_recipe/furniture
	one_per_turf = 1
	on_floor = 1
	difficulty = 2
	send_material_data = 1
	time = 5

/datum/stack_recipe/furniture/chair
	title = "chair"
	result_type = /obj/structure/bed/chair
	time = 10
	var/list/modifiers

/datum/stack_recipe/furniture/chair/display_name()
	return modifiers ? jointext(modifiers + ..(), " ") : ..()

/datum/stack_recipe/furniture/chair/padded
	req_amount = 2

#define PADDED_CHAIR(color) /datum/stack_recipe/furniture/chair/padded/##color{\
	result_type = /obj/structure/bed/chair/padded/##color;\
	modifiers = list("padded", #color)\
	}
PADDED_CHAIR(beige)
PADDED_CHAIR(black)
PADDED_CHAIR(brown)
PADDED_CHAIR(lime)
PADDED_CHAIR(teal)
PADDED_CHAIR(red)
PADDED_CHAIR(purple)
PADDED_CHAIR(green)
PADDED_CHAIR(yellow)
#undef PADDED_CHAIR

/datum/stack_recipe/furniture/chair/office
	title = "office chair"
	req_amount = 5

/datum/stack_recipe/furniture/chair/office/display_name()
	return modifiers ? jointext(modifiers + title, " ") : title // Bypass material

/datum/stack_recipe/furniture/chair/office/light
	result_type = /obj/structure/bed/chair/office/light
	modifiers = list("light")

/datum/stack_recipe/furniture/chair/office/dark
	result_type = /obj/structure/bed/chair/office/dark
	modifiers = list("dark")

/datum/stack_recipe/furniture/chair/office/comfy
	req_amount = 7

#define COMFY_OFFICE_CHAIR(color) /datum/stack_recipe/furniture/chair/office/comfy/##color{\
	result_type = /obj/structure/bed/chair/office/comfy/##color;\
	modifiers = list(#color, "comfy")\
	}
COMFY_OFFICE_CHAIR(beige)
COMFY_OFFICE_CHAIR(black)
COMFY_OFFICE_CHAIR(brown)
COMFY_OFFICE_CHAIR(lime)
COMFY_OFFICE_CHAIR(teal)
COMFY_OFFICE_CHAIR(red)
COMFY_OFFICE_CHAIR(purple)
COMFY_OFFICE_CHAIR(green)
COMFY_OFFICE_CHAIR(yellow)
#undef COMFY_OFFICE_CHAIR

/datum/stack_recipe/furniture/chair/comfy
	title = "comfy chair"
	req_amount = 3

#define COMFY_CHAIR(color) /datum/stack_recipe/furniture/chair/comfy/##color{\
	result_type = /obj/structure/bed/chair/comfy/##color;\
	modifiers = list(#color)\
	}
COMFY_CHAIR(beige)
COMFY_CHAIR(black)
COMFY_CHAIR(brown)
COMFY_CHAIR(lime)
COMFY_CHAIR(teal)
COMFY_CHAIR(red)
COMFY_CHAIR(purple)
COMFY_CHAIR(green)
COMFY_CHAIR(yellow)
#undef COMFY_CHAIR

/datum/stack_recipe/furniture/chair/rounded
	title = "rounded chair"
	req_amount = 3

#define ROUNDED_CHAIR(color) /datum/stack_recipe/furniture/chair/rounded/##color{\
	result_type = /obj/structure/bed/chair/rounded/##color;\
	modifiers = list(#color, "rounded")\
	}
ROUNDED_CHAIR(beige)
ROUNDED_CHAIR(black)
ROUNDED_CHAIR(brown)
ROUNDED_CHAIR(blue)
ROUNDED_CHAIR(lime)
ROUNDED_CHAIR(teal)
ROUNDED_CHAIR(red)
ROUNDED_CHAIR(purple)
ROUNDED_CHAIR(green)
ROUNDED_CHAIR(yellow)
ROUNDED_CHAIR(light)
#undef ROUNDED_CHAIR

/datum/stack_recipe/furniture/chair/arm
	title = "armchair"
	req_amount = 4

#define ARMCHAIR(color) /datum/stack_recipe/furniture/chair/arm/##color{\
	result_type = /obj/structure/bed/chair/armchair/##color;\
	modifiers = list(#color)\
	}
ARMCHAIR(beige)
ARMCHAIR(black)
ARMCHAIR(brown)
ARMCHAIR(blue)
ARMCHAIR(lime)
ARMCHAIR(teal)
ARMCHAIR(red)
ARMCHAIR(purple)
ARMCHAIR(green)
ARMCHAIR(yellow)
ARMCHAIR(light)
#undef ARMCHAIR

//SOFA
/datum/stack_recipe/furniture/sofa
	title = "sofa"
	result_type = /obj/structure/bed/sofa
	time = 10
	var/list/modifiers

/datum/stack_recipe/furniture/sofa/display_name()
	return modifiers ? jointext(modifiers + ..(), " ") : ..()

/datum/stack_recipe/furniture/sofa/m
	title = "middle sofa"
	req_amount = 3

#define MIDDLE_SOFA(color) /datum/stack_recipe/furniture/sofa/m/##color{\
	result_type = /obj/structure/bed/sofa/m/##color;\
	modifiers = list(#color, "middle")\
	}
MIDDLE_SOFA(beige)
MIDDLE_SOFA(black)
MIDDLE_SOFA(brown)
MIDDLE_SOFA(blue)
MIDDLE_SOFA(lime)
MIDDLE_SOFA(teal)
MIDDLE_SOFA(red)
MIDDLE_SOFA(purple)
MIDDLE_SOFA(green)
MIDDLE_SOFA(yellow)
MIDDLE_SOFA(light)
#undef MIDDLE_SOFA

/datum/stack_recipe/furniture/sofa/l
	title = "left sofa"
	req_amount = 3

#define LEFT_SOFA(color) /datum/stack_recipe/furniture/sofa/l/##color{\
	result_type = /obj/structure/bed/sofa/l/##color;\
	modifiers = list(#color, "left")\
	}
LEFT_SOFA(beige)
LEFT_SOFA(black)
LEFT_SOFA(brown)
LEFT_SOFA(blue)
LEFT_SOFA(lime)
LEFT_SOFA(teal)
LEFT_SOFA(red)
LEFT_SOFA(purple)
LEFT_SOFA(green)
LEFT_SOFA(yellow)
LEFT_SOFA(light)
#undef LEFT_SOFA

/datum/stack_recipe/furniture/sofa/r
	title = "right sofa"
	req_amount = 3

#define RIGHT_SOFA(color) /datum/stack_recipe/furniture/sofa/r/##color{\
	result_type = /obj/structure/bed/sofa/r/##color;\
	modifiers = list(#color, "right")\
	}
RIGHT_SOFA(beige)
RIGHT_SOFA(black)
RIGHT_SOFA(brown)
RIGHT_SOFA(blue)
RIGHT_SOFA(lime)
RIGHT_SOFA(teal)
RIGHT_SOFA(red)
RIGHT_SOFA(purple)
RIGHT_SOFA(green)
RIGHT_SOFA(yellow)
RIGHT_SOFA(light)
#undef RIGHT_SOFA

//END SOFA
/datum/stack_recipe/furniture/chair/wood
	req_amount = 3

/datum/stack_recipe/furniture/chair/wood/normal
	result_type = /obj/structure/bed/chair/wood

/datum/stack_recipe/furniture/chair/wood/fancy
	result_type = /obj/structure/bed/chair/wood/wings
	modifiers = list("fancy")

/datum/stack_recipe/furniture/door
	title = "door"
	result_type = /obj/machinery/door/unpowered/simple
	req_amount = 10
	time = 50

/datum/stack_recipe/furniture/barricade
	title = "barricade"
	result_type = /obj/structure/barricade
	req_amount = 5
	time = 50

/datum/stack_recipe/furniture/stool
	title = "stool"
	result_type = /obj/item/stool

/datum/stack_recipe/furniture/bar_stool
	title = "bar stool"
	result_type = /obj/item/stool/bar

/datum/stack_recipe/furniture/bed
	title = "bed"
	result_type = /obj/structure/bed
	req_amount = 2

/datum/stack_recipe/furniture/pew
	title = "pew, right"
	result_type = /obj/structure/bed/chair/pew
	req_amount = 4

/datum/stack_recipe/furniture/pew_left
	title = "pew, left"
	result_type = /obj/structure/bed/chair/pew/left
	req_amount = 4

/datum/stack_recipe/furniture/table_frame
	title = "table frame"
	result_type = /obj/structure/table
	time = 10

/datum/stack_recipe/furniture/rack
	title = "rack"
	result_type = /obj/structure/table/rack

/datum/stack_recipe/furniture/closet
	title = "closet"
	result_type = /obj/structure/closet
	req_amount = 2
	time = 15

/datum/stack_recipe/furniture/canister
	title = "canister"
	result_type = /obj/machinery/portable_atmospherics/canister
	req_amount = 10
	time = 10
	send_material_data = 0

/datum/stack_recipe/furniture/tank
	title = "Pressure Tank"
	result_type = /obj/item/pipe/tank
	req_amount = 30
	time = 20
	send_material_data = 0

/datum/stack_recipe/furniture/computerframe
	title = "computer frame"
	result_type = /obj/machinery/constructable_frame/computerframe
	req_amount = 5
	time = 25

/datum/stack_recipe/furniture/girder
	title = "wall girders"
	result_type = /obj/structure/girder
	req_amount = 2
	time = 50

/datum/stack_recipe/furniture/wall_frame
	title = "low wall frame"
	result_type = /obj/structure/wall_frame
	req_amount = 3
	time = 50

/datum/stack_recipe/furniture/machine
	title = "machine frame"
	result_type = /obj/machinery/constructable_frame/machine_frame
	req_amount = 5
	time = 25
	send_material_data = 0

/datum/stack_recipe/furniture/turret
	title = "turret frame"
	result_type = /obj/machinery/porta_turret_construct
	req_amount = 5
	time = 25
	send_material_data = 0

/datum/stack_recipe/furniture/door_assembly
	req_amount = 4
	time = 50

/datum/stack_recipe/furniture/door_assembly/standard
	title = "standard airlock assembly"
	result_type = /obj/structure/door_assembly

/datum/stack_recipe/furniture/door_assembly/airtight
	title = "airtight hatch assembly"
	result_type = /obj/structure/door_assembly/door_assembly_hatch

/datum/stack_recipe/furniture/door_assembly/highsec
	title = "high security airlock assembly"
	result_type = /obj/structure/door_assembly/door_assembly_highsecurity

/datum/stack_recipe/furniture/door_assembly/ext
	title = "exterior airlock assembly"
	result_type = /obj/structure/door_assembly/door_assembly_ext

/datum/stack_recipe/furniture/door_assembly/firedoor
	title = "emergency shutter"
	result_type = /obj/structure/firedoor_assembly

/datum/stack_recipe/furniture/door_assembly/firedoor/border_only
	title = "unidirectional emergency shutter"
	result_type = /obj/structure/firedoor_assembly/border_only
	req_amount = 2

/datum/stack_recipe/furniture/door_assembly/multi_tile
	title = "multi-tile airlock assembly"
	result_type = /obj/structure/door_assembly/multi_tile
	req_amount = 8
	time = 10 SECONDS

/datum/stack_recipe/furniture/crate
	title = "crate"
	result_type = /obj/structure/closet/crate
	req_amount = 10
	time = 50

/datum/stack_recipe/furniture/crate/plastic
	result_type = /obj/structure/closet/crate/plastic

/datum/stack_recipe/furniture/flaps
	title = "flaps"
	result_type = /obj/structure/plasticflaps
	req_amount = 30
	time = 50

/datum/stack_recipe/furniture/coffin
	title = "coffin"
	result_type = /obj/structure/closet/coffin
	req_amount = 5
	time = 15

/datum/stack_recipe/furniture/coffin/wooden
	title = "coffin"
	result_type = /obj/structure/closet/coffin/wooden
	req_amount = 5

/datum/stack_recipe/furniture/wooden_altar
	title = "wooden altar"
	result_type = /obj/structure/table/rack/wooden
	req_amount = 3
	time = 15

/datum/stack_recipe/furniture/bookcase
	title = "book shelf"
	result_type = /obj/structure/bookcase
	req_amount = 5
	time = 15

/datum/stack_recipe/furniture/planting_bed
	title = "planting bed"
	result_type = /obj/machinery/portable_atmospherics/hydroponics/soil
	req_amount = 3
	time = 10
	send_material_data = 0

/datum/stack_recipe/furniture/fullwindow
	title = "full-tile window"
	result_type = /obj/structure/window
	req_amount = 4
	time = 15
	one_per_turf = 0

/datum/stack_recipe/furniture/fullwindow/can_make(mob/user)
	. = ..()
	if(.)
		for(var/obj/structure/window/check_window in user.loc)
			if(check_window.is_fulltile())
				to_chat(user, "<span class='warning'>There is already a full-tile window here!</span>")
				return FALSE

/datum/stack_recipe/furniture/fullwindow/spawn_result(mob/user, location, amount)
	return new result_type(user.loc, SOUTHWEST, 1, use_material, use_reinf_material)

/datum/stack_recipe/furniture/borderwindow
	title = "border window"
	result_type = /obj/structure/window
	req_amount = 1
	time = 5
	one_per_turf = 0

/datum/stack_recipe/furniture/borderwindow/can_make(mob/user)
	. = ..()
	if(.)
		for(var/obj/structure/window/check_window in user.loc)
			if(check_window.dir == user.dir)
				to_chat(user, "<span class='warning'>There is already a window facing that direction here!</span>")
				return FALSE

/datum/stack_recipe/furniture/borderwindow/spawn_result(mob/user, location, amount)
	return new result_type(user.loc, user.dir, 1, use_material, use_reinf_material)

/datum/stack_recipe/furniture/windoor
	title = "windoor assembly"
	result_type = /obj/structure/windoor_assembly
	req_amount = 1
	time = 20
	one_per_turf = 1

/datum/stack_recipe/furniture/windoor/can_make(mob/user)
	. = ..()
	if(.)
		if(locate(/obj/machinery/door/window) in user.loc)
			to_chat(user, "<span class='warning'>There is already a windoor here!</span>")
			return FALSE

/datum/stack_recipe/furniture/windoor/spawn_result(mob/user, location, amount)
	return new result_type(user.loc, user.dir, 1, use_material, use_reinf_material)
