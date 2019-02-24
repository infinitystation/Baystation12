//////BONE MENDER/////////
/datum/surgery_step/bone_mender
	allowed_tools = list(
		/obj/item/weapon/bonesetter/bone_mender = 100,
		)

	can_infect = 1
	blood_level = 1

	min_duration = 80
	max_duration = 90
	shock_level = 20

/datum/surgery_step/bone_mender/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return 0
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	return affected && !BP_IS_ROBOTIC(affected) && !BP_IS_CRYSTAL(affected) && affected.how_open() >= 2 && (BP_IS_BRITTLE(affected) || affected.stage == 0 && affected.status & ORGAN_BROKEN)

/datum/surgery_step/bone_mender/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if (affected.stage <= 5)
		user.visible_message("[user] starts grasping the damaged bone edges in [target]'s [affected.name] with \the [tool]." , \
		"You start grasping the bone edges and fusing them in [target]'s [affected.name] with \the [tool].")
	target.custom_pain("Something in your [affected.name] is causing you a lot of pain!", 50, affecting = affected)
	..()

/datum/surgery_step/bone_mender/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	affected.status &= ~ORGAN_BROKEN
	affected.stage = 0

/datum/surgery_step/bone_mender/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("<span class='warning'>\The [tool] in [user]'s hand skips, jabbing the bone edges into the sides of [target]'s [affected.name]!</span>" , \
	"<span class='warning'>Your hand jolts and \the [tool] skips, jabbing the bone edges into [target]'s [affected.name] with \the [tool]!</span>")
