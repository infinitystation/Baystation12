/obj/item/device/scanner/health/syndie
	name = "health analyzer"
	desc = "A hand-held body scanner able to distinguish vital signs of the subject."
	icon_state = "health"
	item_state = "analyzer"
	item_flags = ITEM_FLAG_NO_BLUDGEON
	matter = list(MATERIAL_ALUMINIUM = 200)
	origin_tech = list(TECH_MAGNET = 3, TECH_BIO = 2, TECH_ESOTERIC = 2)

/obj/item/device/scanner/health/syndie/scan(mob/living/carbon/human/A, mob/user)
	playsound(src, 'sound/effects/fastbeep.ogg', 20)
	if(!istype(A))
		return

	A.apply_damage(30, IRRADIATE, damage_flags = DAM_DISPERSED)
