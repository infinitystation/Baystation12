//////////////////////////////////////////////////////////////////
//                       Plastic Surgery                        //
//////////////////////////////////////////////////////////////////

/datum/surgery_step/generic/prepare_face
	allowed_tools = list(
	/obj/item/weapon/retractor = 100,
	/obj/item/weapon/material/hatchet/tacknife = 75
	)

	min_duration = 90
	max_duration = 110

/datum/surgery_step/generic/prepare_face/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/head/head = target.get_organ(target_zone)
	return ..() && target_zone == "mouth" && target.op_stage.face == 1 && !(head.status & ORGAN_DISFIGURED)

/datum/surgery_step/generic/prepare_face/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("[user] starts to retract [target]'s face with \the [tool].", \
	"You start to retract [target]'s face with \the [tool].")
	..()

/datum/surgery_step/generic/prepare_face/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='notice'>[user] has retracted [target]'s face with \the [tool] for his facial alteration.</span>" , \
	"<span class='notice'>You have retracted [target]'s face and neck with \the [tool] for plastic surgery.</span>",)
	target.op_stage.face = 4

/datum/surgery_step/generic/prepare_face/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("<span class='warning'>[user]'s hand slips, slicing [target]'s throat wth \the [tool]!</span>" , \
	"<span class='warning'>Your hand slips, slicing [target]'s throat wth \the [tool]!</span>" )
	affected.createwound(CUT, affected.min_broken_damage/2)
	target.losebreath += 10


/datum/surgery_step/generic/alter_face
	allowed_tools = list(
	/obj/item/stack/medical/advanced/bruise_pack = 100,
	/obj/item/weapon/material/hatchet/tacknife = 75
	)

	min_duration = 40
	max_duration = 90

/datum/surgery_step/generic/alter_face/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	return ..() && target_zone == "mouth" && target.op_stage.face == 4

/datum/surgery_step/generic/alter_face/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("<span class='notice'>[user] starts to alter [target]'s face with \the [tool].</span>", \
	"<span class='notice'>You start to alter [target]'s face and neck with \the [tool].</span>")
	..()

/datum/surgery_step/generic/alter_face/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/getName = sanitize(input(user, "What is your patient's new identity?", "Name change") as null|text, MAX_NAME_LEN)
	if(getName)
		if(!user.skill_check(SKILL_ANATOMY, SKILL_PROF))
			getName = corrupt_name(getName, user.get_skill_value(SKILL_ANATOMY))
		log_and_message_admins("changed the [key_name_admin(target)]'s appearance to [getName].")
		target.real_name = getName
		target.name = getName
		target.dna.real_name = getName
		if(target.mind)
			target.mind.name = target.name
		target.op_stage.face = 0
		if(istype(tool, /obj/item/stack/medical/advanced/bruise_pack))
			var/obj/item/stack/M = tool
			M.use(1)

/datum/surgery_step/generic/alter_face/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("<span class='warning'>[user]'s hand slips, slicing [target]'s throat wth \the [tool]!</span>" , \
	"<span class='warning'>Your hand slips, slicing [target]'s throat wth \the [tool]!</span>" )
	affected.createwound(CUT, affected.min_broken_damage/2)
	target.losebreath += 10
