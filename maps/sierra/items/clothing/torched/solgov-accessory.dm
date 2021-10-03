/obj/item/clothing/accessory/badge/solgov/tags
	name = "dog tags"
	desc = "Plain identification tags made from a durable metal. They are stamped with a variety of informational details."
	gender = PLURAL
	icon_state = "tags"
	badge_string = "Sol Central Government"
	slot_flags = SLOT_MASK | SLOT_TIE
	icon = 'maps/torch/icons/obj/obj_accessories_solgov.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi', slot_wear_suit_str = 'maps/torch/icons/mob/onmob_accessories_solgov.dmi')
	var/owner_rank
	var/owner_name
	var/owner_branch

/obj/item/clothing/accessory/badge/solgov/tags/proc/loadout_setup(mob/M)
	set_name(M.real_name)
	set_desc(M)

/obj/item/clothing/accessory/badge/solgov/tags/set_desc(mob/living/carbon/human/H)
	if(!istype(H))
		return
	owner_rank = H.char_rank && H.char_rank.name
	owner_name = H.real_name
	owner_branch = H.char_branch && H.char_branch.name
	var/decl/cultural_info/culture = H.get_cultural_value(TAG_RELIGION)
	var/religion = culture ? culture.name : "Unset"
	desc = "[initial(desc)]\nИмя: [H.real_name] ([H.get_species()])[H.char_branch ? "\nНазначение: [H.char_branch.name]" : ""]\nРелигия: [religion]\nГруппа крови: [H.b_type]"

/**************
ranks - marines
**************/

/obj/item/clothing/accessory/solgov/rank/get_fibers()
	return null

/obj/item/clothing/accessory/solgov/rank/army
	name = "army ranks"
	desc = "Insignia denoting marine rank of some kind. These appear blank."
	icon_state = "armyrank_enlisted"
	var/check_codex_val = FACTION_FLEET

/obj/item/clothing/accessory/solgov/rank/army/get_codex_value()
	return check_codex_val || ..()

/obj/item/clothing/accessory/solgov/rank/army/enlisted
	name = "ranks (E-1 private)"
	desc = "Insignia denoting the rank of Private."
	icon_state = "armyrank_enlisted"

/obj/item/clothing/accessory/solgov/rank/army/enlisted/e2
	name = "ranks (E-2 private second class)"
	desc = "Insignia denoting the rank of Private Second Class."

/obj/item/clothing/accessory/solgov/rank/army/enlisted/e3
	name = "ranks (E-3 private first class)"
	desc = "Insignia denoting the rank of Private First Class."

/obj/item/clothing/accessory/solgov/rank/army/enlisted/e4
	name = "ranks (E-4 corporal)"
	desc = "Insignia denoting the rank of Corporal."

/obj/item/clothing/accessory/solgov/rank/army/enlisted/e5
	name = "ranks (E-5 sergeant)"
	desc = "Insignia denoting the rank of Sergeant."

///////////////////////////////////////////

/obj/item/clothing/accessory/solgov/rank/fleet/officer/wo1_monkey
	name = "makeshift ranks (WO-1 warrant officer 1)"
	desc = "Insignia denoting the mythical rank of Warrant Officer. Too bad it's obviously fake."
