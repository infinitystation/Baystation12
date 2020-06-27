/obj/item/weapon/reagent_containers/food/drinks
	var/open_sound = 'sound/effects/canopen.ogg'

//ГЊГҐГµГ Г­ГЁГЄГ  ГЇГЁГІГјГї Г§Г Г«ГЇГ®Г¬
/obj/item/weapon/reagent_containers/food/drinks/Initialize()
	. = ..()
	if(is_open_container())
		verbs += /obj/item/weapon/reagent_containers/food/drinks/proc/gulp_whole

/obj/item/weapon/reagent_containers/food/drinks/proc/gulp_whole()
	set category = "Object"
	set name = "Gulp Down"
	set src in view(1)

	if(!istype(usr.get_active_hand(), src))
		to_chat(usr, SPAN_WARNING("You need to hold \the [src] in hands!"))
		return

	if(is_open_container())
		if(!reagents || reagents.total_volume == 0)
			to_chat(usr, "<span class='notice'>\The [src] is empty!</span>")
		else
			if(ishuman(usr))
				var/mob/living/carbon/human/H = usr
				if(!H.check_has_mouth())
					to_chat(H, "Where do you intend to put \the [src]? You don't have a mouth!")
					return
				var/obj/item/blocked = H.check_mouth_coverage()
				if(blocked)
					to_chat(H, SPAN_WARNING("\The [blocked] is in the way!"))
					return
			if(reagents.total_volume > 30) // 30 equates to 3 SECONDS.
				usr.visible_message(SPAN_NOTICE("[usr] prepares to gulp down [src]."), SPAN_NOTICE("You prepare to gulp down [src]."))
			playsound(usr, 'infinity/sound/items/drinking.ogg', reagents.total_volume, 1)
			if(!do_after(usr, reagents.total_volume))
				if(!Adjacent(usr))
					return
				standard_splash_mob(src, src)
			if(!Adjacent(usr))
				return
			usr.visible_message(SPAN_NOTICE("[usr] gulped down the whole [src]!"),SPAN_NOTICE("You gulped down the whole [src]!"))
			playsound(usr, 'infinity/sound/items/drinking_after.ogg', reagents.total_volume, 1)
			reagents.trans_to_mob(usr, reagents.total_volume, CHEM_INGEST)
	else
		to_chat(usr, SPAN_NOTICE("You need to open \the [src] first!"))

obj/item/weapon/reagent_containers/food/drinks/sillycup/mob_can_equip(M as mob)
	if(reagents.total_volume > 0)
		to_chat(M, "<span class='warning'>You cannot put [src] on your ears, there is something in it.</span>")
		return 0
	. = ..()

obj/item/weapon/reagent_containers/food/drinks/sillycup
	possible_transfer_amounts = null
	layer = ABOVE_OBJ_LAYER
	slot_flags = SLOT_EARS
	w_class = ITEM_SIZE_TINY
	body_parts_covered = HEAD
	sprite_sheets = list(
		SPECIES_RESOMI = 'infinity/icons/mob/human_races/species/resomi/ears.dmi',
		SPECIES_TAJARA = 'infinity/icons/mob/human_races/species/tajara/ears.dmi',
		SPECIES_HUMAN ='infinity/icons/mob/onmob/onmob_ears.dmi',
		SPECIES_IPC = 'infinity/icons/mob/onmob/onmob_ears.dmi'
		)

obj/item/weapon/reagent_containers/food/drinks/sillycup/equipped(var/M, var/slot)
	..()
	if(slot == slot_l_ear)
		item_state = "watercup_l"
	else if(slot == slot_r_ear)
		item_state = "watercup_r"
	else
		item_state = initial(item_state)

/obj/item/weapon/reagent_containers/glass/beaker/large/mitoll
	name = "iron beaker"
	desc = "Large steel capacity made by own hands."
	icon = 'infinity/icons/obj/items.dmi'
	icon_state = "mbeaker"
	matter = list(MATERIAL_GLASS = 6000)
	volume = 150
