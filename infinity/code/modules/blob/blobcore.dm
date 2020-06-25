/obj/item/blob_core
	name = "blob core"
	desc = "A strange, glowing piece of blob from it's core."
	icon = 'infinity/icons/mob/blob.dmi'
	icon_state = "core_sample"

	var/datum/blob_strain/strain

/obj/item/blob_core/attack_self(var/mob/user)
	to_chat(user, "You squash [src] in your hand.")
	if(strain)
		strain.core_squash(src, user)
