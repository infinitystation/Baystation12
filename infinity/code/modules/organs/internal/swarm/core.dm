/obj/item/organ/internal/swarm/core
	name = "core"
	desc = "Ball with several lights, presumably sensors"
	icon = 'infinity/icons/swarm/obj/organ/internal.dmi'
	icon_state = "core"
	organ_tag = BP_CORE
	parent_organ = BP_SHELL
	vital = 0
	force = 1.0
	w_class = ITEM_SIZE_NORMAL
	throwforce = 1.0
	throw_speed = 5
	throw_range = 2
	origin_tech = list()
	attack_verb = list("attacked", "slapped","kick")

	relative_size = 60

	var/mob/living/swarm/core/brainmob = null

/obj/item/organ/internal/swarm/core/New(var/mob/living/carbon/H)
	..()
	if(!brainmob && H)
		brainmob_core_create(H)

/obj/item/organ/internal/swarm/core/proc/brainmob_core_create(var/mob/living/carbon/H)
	brainmob = new(src)
	brainmob.SetName(H.real_name)
	brainmob.real_name = H.real_name
	brainmob.dna = H.dna.Clone()

/obj/item/organ/internal/swarm/core/Destroy()
	QDEL_NULL(brainmob)
	return ..()
