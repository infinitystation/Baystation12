/obj/item/weapon/storage/backpack/wd_sack
	name = "witch doctor\'s sack"
	desc = "A sack of dense fabric with a large number of engraved runes."

	icon = 'icons/obj/infinity_items/wd_sack.dmi'
	icon_state = "wd_sack"

	use_to_pickup = 1
	allow_quick_empty = 1	
	allow_quick_gather = 1

	can_gather = list(/obj/item/weapon/reagent_containers/food/snacks/grown,/obj/item/seeds,/obj/item/weapon/grown)

	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_backpacks.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_backpacks.dmi',
		slot_back_str = 'icons/mob/infinity/backs.dmi'
		)

	item_state_slots = list(
		slot_l_hand_str = "backpack",
		slot_r_hand_str = "backpack",
		slot_back_str = "wd_sack"
		)


