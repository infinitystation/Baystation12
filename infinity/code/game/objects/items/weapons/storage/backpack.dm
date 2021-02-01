/obj/item/weapon/storage/backpack/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(!worn_check(user, 1)) return
	..(W, user)

/obj/item/weapon/storage/backpack/open(mob/user)
	if(!worn_check(user)) return
	..(user)

/obj/item/weapon/storage/backpack/equipped(var/mob/user, var/slot)
	close(user)
	..(user, slot)

/obj/item/weapon/storage/backpack/proc/worn_check(var/mob/living/carbon/human/user, var/put = 0)
	if(!canremove)
		return
	if(!worn_access && user.get_equipped_item(slot_back) == src)
		if(put)
			to_chat(user, "Take off [src] first!")
			return FALSE
		if(user.unEquip(src))
			user.put_in_hands(src)
			user.swap_hand()
//			open(L)
	return TRUE

/obj/item/weapon/storage/backpack
	max_w_class = ITEM_SIZE_NORMAL
	sprite_sheets = list(
		SPECIES_UNATHI = 'icons/mob/onmob/Unathi/back.dmi'
		)

	var/worn_access = TRUE // temporary buff due to player reviews

/obj/item/weapon/storage/backpack/holding
	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
		)

/obj/item/weapon/storage/backpack/industrial
	max_storage_space = DEFAULT_BACKPACK_STORAGE + 8
	max_w_class = ITEM_SIZE_LARGE

/obj/item/weapon/storage/backpack/rucksack
	max_storage_space = DEFAULT_BACKPACK_STORAGE + 8

/obj/item/weapon/storage/backpack/dufflebag
	max_w_class = ITEM_SIZE_LARGE
	max_storage_space = DEFAULT_BACKPACK_STORAGE + 14

/obj/item/weapon/storage/backpack/dufflebag/New()
	..()
	slowdown_per_slot[slot_back] = 2.5

/obj/item/weapon/storage/backpack/satchel
	worn_access = TRUE

	max_w_class = ITEM_SIZE_NORMAL
	w_class = ITEM_SIZE_HUGE

/obj/item/weapon/storage/backpack/messenger
	max_w_class = ITEM_SIZE_NORMAL

/obj/item/weapon/storage/backpack/satchel/pocketbook/navy
	name = "navy pocketbook"
	color = "#1c2133"

/obj/item/weapon/storage/backpack/satchel/pocketbook/khaki
	name = "khaki pocketbook"
	color = "#baa481"
