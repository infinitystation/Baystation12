#define GRAIN_FULLSCREEN_CATEGORY "noise grain"
#define GRAIN_FULLSCREEN_ANIMATION 5
#define GRAIN_DEFAULT_ALPHA 12

/obj/screen/fullscreen/grain
	icon = 'infinity/icons/obj/screen/fullscreen/noise_grains.dmi'
	screen_loc = ui_entire_screen
	layer = FULLSCREEN_LAYER
	alpha = 0
	allstate = 1

/obj/item/organ/internal/eyes
	var/obj/screen/fullscreen/grain// /obj/screen/fullscreen/grain
	var/max_grain_alpha = 0

/obj/item/organ/internal/eyes/proc/UpdateGrain()
	if(istype(owner))
		if(!grain)
			grain = owner.overlay_fullscreen(GRAIN_FULLSCREEN_CATEGORY, /obj/screen/fullscreen/grain)
		if(istype(grain) && list_find(owner.screens, GRAIN_FULLSCREEN_CATEGORY))
			//grain.alpha = max_grain_alpha + (max_damage * log(5, clamp(damage, 1, max_damage)))
			grain.alpha = max_grain_alpha + max_grain_alpha * (damage / max_damage)
		else
			owner.clear_fullscreen(GRAIN_FULLSCREEN_CATEGORY, GRAIN_FULLSCREEN_ANIMATION)
			grain = null

/obj/item/organ/internal/eyes/removed(var/mob/living/user, var/drop_organ=1, var/detach=1)
	if(drop_organ || detach)
		owner.clear_fullscreen(GRAIN_FULLSCREEN_CATEGORY, GRAIN_FULLSCREEN_ANIMATION)
	. = ..()

/obj/item/organ/internal/eyes/replaced(var/mob/living/carbon/human/target)
	. = ..()
	UpdateGrain()

/obj/item/organ/internal/eyes/die()
	. = ..()
	UpdateGrain()

/obj/item/organ/internal/eyes/robot
	max_grain_alpha = GRAIN_DEFAULT_ALPHA

/obj/item/organ/internal/eyes/robotize()
	. = ..()
	max_grain_alpha = GRAIN_DEFAULT_ALPHA
	if(owner)
		UpdateGrain()

/obj/item/organ/internal/eyes/Destroy()
	. = ..()
	if(owner)
		owner.clear_fullscreen(GRAIN_FULLSCREEN_CATEGORY, GRAIN_FULLSCREEN_ANIMATION)
	if(grain)
		qdel(grain)

/obj/item/organ/internal/eyes/handle_regeneration()
	. = ..()
	UpdateGrain()
