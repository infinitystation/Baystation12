/decl/hierarchy/mil_uniform
	name = "Master outfit hierarchy"
	hierarchy_type = /decl/hierarchy/mil_uniform
	var/branch = null
	var/departments = 0
	var/min_rank = 0

	var/hat = null
	var/under = null
	var/shoes = null
	var/extra = null

decl/hierarchy/mil_uniform/civilian
	name = "Master civilian outfit"
	hierarchy_type = /decl/hierarchy/mil_uniform/civilian
	branch = /datum/mil_branch/civilian

	under = /obj/item/clothing/under/rank/internalaffairs/plain
	shoes = list(\
		/obj/item/clothing/shoes/black, /obj/item/clothing/shoes/dress, /obj/item/clothing/shoes/dress/white, \
		/obj/item/clothing/shoes/laceup)
	extra = list(/obj/item/clothing/accessory/wcoat,\
	/obj/item/clothing/under/skirt_c/dress/black, /obj/item/clothing/under/skirt_c/dress/long/black,\
	/obj/item/clothing/under/skirt_c/dress/eggshell, /obj/item/clothing/under/skirt_c/dress/long/eggshell,\
	/obj/item/clothing/suit/storage/hooded/wintercoat)
/*
	utility_extra = list(/obj/item/clothing/head/beret/solgov/fleet/engineering,
						 /obj/item/clothing/head/ushanka/solgov/fleet,
						 /obj/item/clothing/suit/storage/hooded/wintercoat/solgov/fleet,
						 /obj/item/clothing/head/soft/solgov/fleet,
						 /obj/item/clothing/gloves/thick/duty/solgov/eng)
*/

decl/hierarchy/mil_uniform/nt
	name = "Master NT outfit"
	hierarchy_type = /decl/hierarchy/mil_uniform/nt
	branch = /datum/mil_branch/employee

	under = /obj/item/clothing/under/rank/internalaffairs/plain
	shoes = list(\
		/obj/item/clothing/shoes/black, /obj/item/clothing/shoes/dress, /obj/item/clothing/shoes/dress/white, \
		/obj/item/clothing/shoes/laceup)
	extra = list(/obj/item/clothing/accessory/wcoat,\
	/obj/item/clothing/under/skirt_c/dress/black, /obj/item/clothing/under/skirt_c/dress/long/black,\
	/obj/item/clothing/under/skirt_c/dress/eggshell, /obj/item/clothing/under/skirt_c/dress/long/eggshell)

decl/hierarchy/mil_uniform/contract
	name = "Master contract outfit"
	hierarchy_type = /decl/hierarchy/mil_uniform/contract
	branch = /datum/mil_branch/contractor

	under = /obj/item/clothing/under/rank/internalaffairs/plain
	shoes = list(\
		/obj/item/clothing/shoes/black, /obj/item/clothing/shoes/dress, /obj/item/clothing/shoes/dress/white, \
		/obj/item/clothing/shoes/laceup)
	extra = list(/obj/item/clothing/accessory/wcoat,\
	/obj/item/clothing/under/skirt_c/dress/black, /obj/item/clothing/under/skirt_c/dress/long/black,\
	/obj/item/clothing/under/skirt_c/dress/eggshell, /obj/item/clothing/under/skirt_c/dress/long/eggshell)
