/decl/hierarchy/mil_uniform
	name = "Master outfit hierarchy"
	hierarchy_type = /decl/hierarchy/mil_uniform
	var/branch = null
	var/departments = 0
	var/min_rank = 0

	var/pt_under = null
	var/pt_shoes = null

	var/utility_under = null
	var/utility_shoes = null
	var/utility_hat = null
	var/utility_extra = null

	var/service_under = null
	var/service_skirt = null
	var/service_over = null
	var/service_shoes = null
	var/service_hat = null
	var/service_gloves = null
	var/service_extra = null

	var/dress_under = null
	var/dress_skirt = null
	var/dress_over = null
	var/dress_shoes = null
	var/dress_hat = null
	var/dress_gloves = null
	var/dress_extra = null

decl/hierarchy/mil_uniform/civilian
	name = "Master civilian outfit"		//Basically just here for the rent-a-tux, ahem, I mean... dress uniform.
	hierarchy_type = /decl/hierarchy/mil_uniform/civilian
	branch = /datum/mil_branch/civilian

	dress_under = /obj/item/clothing/under/rank/internalaffairs/plain
	dress_over = /obj/item/clothing/suit/storage/toggle/suit/black
	dress_shoes = /obj/item/clothing/shoes/dress
	dress_extra = list(/obj/item/clothing/accessory/wcoat,\
	/obj/item/clothing/under/skirt_c/dress/black, /obj/item/clothing/under/skirt_c/dress/long/black,\
	/obj/item/clothing/under/skirt_c/dress/eggshell, /obj/item/clothing/under/skirt_c/dress/long/eggshell)

decl/hierarchy/mil_uniform/nt
	name = "Master NT outfit"
	hierarchy_type = /decl/hierarchy/mil_uniform/nt
	branch = /datum/mil_branch/employee

	dress_under = /obj/item/clothing/under/rank/internalaffairs/plain
	dress_over = /obj/item/clothing/suit/storage/toggle/suit/black
	dress_shoes = /obj/item/clothing/shoes/dress
	dress_extra = list(/obj/item/clothing/accessory/wcoat,\
	/obj/item/clothing/under/skirt_c/dress/black, /obj/item/clothing/under/skirt_c/dress/long/black,\
	/obj/item/clothing/under/skirt_c/dress/eggshell, /obj/item/clothing/under/skirt_c/dress/long/eggshell)

decl/hierarchy/mil_uniform/contract
	name = "Master contract outfit"
	hierarchy_type = /decl/hierarchy/mil_uniform/contract
	branch = /datum/mil_branch/contractor

	dress_under = /obj/item/clothing/under/rank/internalaffairs/plain
	dress_over = /obj/item/clothing/suit/storage/toggle/suit/black
	dress_shoes = /obj/item/clothing/shoes/dress
	dress_extra = list(/obj/item/clothing/accessory/wcoat,\
	/obj/item/clothing/under/skirt_c/dress/black, /obj/item/clothing/under/skirt_c/dress/long/black,\
	/obj/item/clothing/under/skirt_c/dress/eggshell, /obj/item/clothing/under/skirt_c/dress/long/eggshell)