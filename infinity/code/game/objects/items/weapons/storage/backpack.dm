/obj/item/storage/backpack/attackby(obj/item/W as obj, mob/user as mob)
	if(!worn_check(user, 1)) return
	..(W, user)

/obj/item/storage/backpack/open(mob/user)
	if(!worn_check(user)) return
	..(user)

/obj/item/storage/backpack/equipped(var/mob/user, var/slot)
	close(user)
	..(user, slot)

/obj/item/storage/backpack/proc/worn_check(var/mob/living/carbon/human/user, var/put = 0)
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

/obj/item/storage/backpack
	max_w_class = ITEM_SIZE_NORMAL
	sprite_sheets = list(
		SPECIES_RESOMI = 'infinity/icons/mob/species/resomi/onmob_back_resomi.dmi',
		SPECIES_UNATHI = 'icons/mob/onmob/Unathi/back.dmi'
		)

	var/worn_access = TRUE // temporary buff due to player reviews

/obj/item/storage/backpack/holding
	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/lefthand.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/righthand.dmi',
		)

/obj/item/storage/backpack/industrial
	max_storage_space = DEFAULT_BACKPACK_STORAGE + 8
	max_w_class = ITEM_SIZE_LARGE

/obj/item/storage/backpack/rucksack
	max_storage_space = DEFAULT_BACKPACK_STORAGE + 8
	sprite_sheets = list(
		SPECIES_RESOMI = 'infinity/icons/mob/species/resomi/onmob_back_resomi.dmi'
		)

/obj/item/storage/backpack/dufflebag
	max_w_class = ITEM_SIZE_LARGE
	max_storage_space = DEFAULT_BACKPACK_STORAGE + 14

/obj/item/storage/backpack/dufflebag/New()
	..()
	slowdown_per_slot[slot_back] = 2.5

/obj/item/storage/backpack/satchel
	worn_access = TRUE

	max_w_class = ITEM_SIZE_NORMAL
	w_class = ITEM_SIZE_HUGE

/obj/item/storage/backpack/messenger
	max_w_class = ITEM_SIZE_NORMAL

/obj/item/storage/backpack/explorer_resomi
	name = "exploratory backpack"
	desc = "A large backpack in which there are a lot of pockets. Too small for tall humanoids."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_back_str = CUSTOM_ITEM_MOB)
	icon_state = "explorer_backpack"
	item_state = "explorer_backpack"
	sprite_sheets = list(SPECIES_RESOMI = CUSTOM_ITEM_MOB)

/obj/item/storage/backpack/satchel/pocketbook/navy
	name = "navy pocketbook"
	color = "#1c2133"

/obj/item/storage/backpack/satchel/pocketbook/khaki
	name = "khaki pocketbook"
	color = "#baa481"
