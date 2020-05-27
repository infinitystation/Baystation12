//There will be 3 versions: Robotic(Cheap and bad), Cybernetic(As good as original)(Some may be missing) and an Upgraded Cybernetic(Better and have a cool feature)

//-----HEARTS-----

/obj/item/organ/internal/heart/robotic
	name = "robotic heart"
	icon_state = "heart-c-on"
	icon = 'infinity/icons/obj/surgery.dmi'
	dead_icon = "heart-c"
	status = ORGAN_ROBOTIC
	max_damage = 30
	var/emp_vulnerability = 80
	var/severe_cooldown = 10 SECONDS

/obj/item/organ/internal/heart/robotic/cybernetic
	name = "cybernetic heart"
	icon_state = "heart-c-u-on"
	dead_icon = "heart-c-u"
	max_damage = 60
	emp_vulnerability = 40

/obj/item/organ/internal/heart/robotic/upgraded
	name = " upgraded cybernetic heart"
	icon_state = "heart-c-u2-on"
	dead_icon = "heart-c-u2"
	max_damage = 90
	emp_vulnerability = 20

	var/cooldown = 0

/obj/item/organ/internal/heart/robotic/upgraded/Process()
	. = ..()
	if(owner && istype(owner))
		if(!canFindLace())
			return
		if(cooldown > world.time)
			return

		if(owner.incapacitated(INCAPACITATION_KNOCKOUT))
			cooldown = world.time + 3 MINUTES
			owner.reagents.add_reagent(/datum/reagent/inaprovaline, 10)

/obj/item/organ/internal/heart/robotic/emp_act(severity)
	. = ..()
	if(!(owner && istype(owner)))
		return
	if(world.time > severe_cooldown)
		owner.make_dizzy(10)
		owner.losebreath += 10
		severe_cooldown = world.time + 20 SECONDS
	if(prob(emp_vulnerability/severity))
		status |= ORGAN_BRITTLE
		owner.visible_message(SPAN_WARNING("[owner] reels in pain!"), FONT_HUGE(SPAN_DANGER("You feel unbearable pain in your chest as your [src] malfunctions!")))

//-----KIDNEYS-----

/obj/item/organ/internal/kidneys/robotic
	name = "robotic kidneys"
	icon_state = "kidneys-c"
	icon = 'infinity/icons/obj/surgery.dmi'
	status = ORGAN_ROBOTIC
	min_bruised_damage = 20
	min_broken_damage = 35
	max_damage = 55

	var/emp_vulnerability = 80
	var/severe_cooldown = 10 SECONDS

/obj/item/organ/internal/kidneys/robotic/upgraded
	name = "upgraded cybernetic kidneys"
	icon_state = "kidneys-c-u2"
	min_bruised_damage = 40
	min_broken_damage = 60
	max_damage = 110

	emp_vulnerability = 20

/obj/item/organ/internal/kidneys/robotic/upgraded/Process()
	. = ..()
	if(owner && istype(owner))
		if(!canFindLace())
			return
		owner.adjustToxLoss(-0.2) //Even if it is fucked up, it still will heal toxin damage a bit

/obj/item/organ/internal/kidneys/robotic/emp_act(severity)
	. = ..()
	if(!(owner && istype(owner)))
		return
	if(world.time > severe_cooldown)
		owner.druggy += 15
		owner.adjustToxLoss(12)
	if(prob(emp_vulnerability/severity))
		status |= ORGAN_BRITTLE
		owner.visible_message(SPAN_WARNING("[owner] reels in pain!"), FONT_HUGE(SPAN_DANGER("You feel incredible pain in your lower body as your [src] malfunctions!")))

//-----LIVERS-----

/obj/item/organ/internal/liver/robotic
	name = "robotic liver"
	icon_state = "liver-c"
	icon = 'infinity/icons/obj/surgery.dmi'
	status = ORGAN_ROBOTIC
	min_bruised_damage = 25
	min_broken_damage = 45
	max_damage = 70
	basic_filter = 0.75

	var/emp_vulnerability = 80
	var/severe_cooldown = 10 SECONDS

/obj/item/organ/internal/liver/robotic/cybernetic
	name = "cybernetic liver"
	icon_state = "liver-c-u"

	min_bruised_damage = 35
	min_broken_damage = 60
	max_damage = 90
	basic_filter = 1.25

	emp_vulnerability = 40

/obj/item/organ/internal/liver/robotic/upgraded
	name = "upgraded cybernetic liver"
	icon_state = "liver-c-u2"

	min_bruised_damage = 45
	min_broken_damage = 70
	max_damage = 120
	basic_filter = 1.5

	emp_vulnerability = 20

/obj/item/organ/internal/liver/robotic/emp_act(severity)
	. = ..()
	if(!(owner && istype(owner)))
		return
	if(world.time > severe_cooldown)
		owner.adjustToxLoss(18)
	if(prob(emp_vulnerability/severity))
		status |= ORGAN_BRITTLE
		owner.visible_message(SPAN_WARNING("[owner] reels in pain!"), FONT_HUGE(SPAN_DANGER("You feel incredible pain in your lower body as your [src] malfunctions!")))

//----LUNGS----

/obj/item/organ/internal/lungs/robotic
	name = "robotic lungs"
	icon_state = "lungs-c"
	icon = 'infinity/icons/obj/surgery.dmi'
	status = ORGAN_ROBOTIC

	min_bruised_damage = 20
	min_broken_damage = 35
	max_damage = 55

	max_pressure_diff = 40

	safe_exhaled_max = 4.5
	safe_toxins_max = 0.15

/obj/item/organ/internal/lungs/robotic/cybernetic
	name = "cybernetic lungs"
	icon_state = "lungs-c-u"

	min_bruised_damage = 35
	min_broken_damage = 60
	max_damage = 90

	max_pressure_diff = 80

	oxygen_deprivation = 0
	safe_exhaled_max = 6
	safe_toxins_max = 0.2
	SA_para_min = 1
	SA_sleep_min = 5

/obj/item/organ/internal/lungs/robotic/upgraded
	name = "upgraded cybernetic lungs"				//No special ability, but THIS shit allows you literraly BREATH toxins and don't break in space, soooo
	icon_state = "lungs-c-u"

	min_bruised_damage = 70
	min_broken_damage = 90
	max_damage = 120

	max_pressure_diff = 100

	safe_exhaled_max = 18
	safe_toxins_max = 12

/obj/item/organ/internal/lungs/robotic/set_dna(var/datum/dna/new_dna)
	..()
	sync_breath_types()
	max_pressure_diff = initial(max_pressure_diff)

//-----EARS-----

/obj/item/organ/internal/ears/robotic
	name = "robotic ears"
	icon_state = "ears-c"
	status = ORGAN_ROBOTIC
	damage_mod = 1.2

/obj/item/organ/internal/ears/robotic/cybernetic
	name = "cybernetic ears"
	icon_state = "ears-c-u"
	status = ORGAN_ROBOTIC
	damage_mod = 0.5 //Basically flashbang-proof