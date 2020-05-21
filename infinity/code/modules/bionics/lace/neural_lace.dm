/obj/item/bionics/lace
	name = "neural lace"
	desc = "A complex implant, purposed for installation into human's brain. It will work as adapter between man and machinery."
	icon = 'infinity/icons/obj/surgery.dmi'
	icon_state = "neural_lace"
	var/color_state = ""
	var/mob/living/carbon/human/owner

	var/list/software = list()

/obj/item/bionics/lace/Initialize()
	. = ..()
	if(color_state != "")
		icon_state = "[initial(icon_state)]_[color_state]"
	START_PROCESSING(SSobj, src)

/obj/item/bionics/lace/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/bionics/lace/afterattack(var/mob/living/carbon/human/target, var/mob/living/user , proximity)
	if(!proximity)
		return
	if(!target)
		return

	visible_message(SPAN_WARNING("[src] slowly burrows into [target]'s head as it was placed!"))
	user.drop_from_inventory(src)
	forceMove(target.get_organ(BP_HEAD))
	owner = target