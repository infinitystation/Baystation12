/obj/item/weapon/storage/backpack/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(!worn_check(user)) return
	..(W, user)

/obj/item/weapon/storage/backpack/attack_hand(mob/user as mob)
	if(!worn_check(user)) return
	..(user)

/obj/item/weapon/storage/backpack/open(mob/user)
	if(!worn_check(user)) return
	..(user)

/obj/item/weapon/storage/backpack/equipped(var/mob/user, var/slot)
	if(!worn_check(user, show_warning = FALSE)) close(user)
	..(user, slot)

/obj/item/weapon/storage/backpack/proc/worn_check(var/mob/L, var/show_warning = TRUE)
	if(!worn_access && L.get_equipped_item(slot_back) == src)
		if(show_warning)
			to_chat(L, SPAN_WARNING("You need take off \the [src] before you can use it!"))
		return FALSE
	return TRUE

/obj/item/weapon/storage/backpack
	max_w_class = ITEM_SIZE_NORMAL
	sprite_sheets = list(
		SPECIES_RESOMI = 'infinity/icons/mob/species/resomi/back.dmi',
		SPECIES_UNATHI = 'icons/mob/onmob/Unathi/back.dmi'
		)

	var/worn_access = FALSE

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
	sprite_sheets = list(
		SPECIES_RESOMI = 'infinity/icons/mob/species/resomi/back.dmi'
		)

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

/obj/item/weapon/storage/backpack/explorer_resomi
	name = "exploratory backpack"
	desc = "A large backpack in which there are a lot of pockets. Too small for tall humanoids."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_back_str = CUSTOM_ITEM_MOB)
	icon_state = "explorer_backpack"
	item_state = "explorer_backpack"
	sprite_sheets = list(SPECIES_RESOMI = CUSTOM_ITEM_MOB)

/obj/item/weapon/storage/backpack/satchel/pocketbook/navy
	name = "navy pocketbook"
	color = "#1c2133"

/obj/item/weapon/storage/backpack/satchel/pocketbook/khaki
	name = "khaki pocketbook"
	color = "#baa481"
