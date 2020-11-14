/obj/item/organ/internal/brain/xeno
	name = "thinkpan"
	desc = "It looks kind of like an enormous wad of purple bubblegum."
	icon = 'infinity/icons/mob/alien.dmi'
	icon_state = "chitin"
	damage_reduction = 0 //they cannot take damage. F to species mechanic
	max_damage = 120

/obj/item/organ/internal/brain/xeno/take_internal_damage(var/damage, var/silent)
	set waitfor = 0
	..()
/*	if(damage >= 50) //This probably won't be triggered by oxyloss or mercury. Probably.
		var/damage_secondary = damage * 0.10
		owner.flash_eyes()
		owner.eye_blurry += damage_secondary
		owner.Paralyse(damage_secondary)
*/
//XENOMORPH ORGANS
/obj/item/organ/internal/xeno
	name = "xeno organ"
	desc = "It smells like an accident in a chemical factory."
	icon = 'icons/effects/blood.dmi'
	var/associated_power = /mob/living/carbon/human/proc/resin
	damage_reduction = 0
	max_damage = 120

/obj/item/organ/internal/xeno/replaced(var/mob/living/carbon/human/target,var/obj/item/organ/external/affected)
	. = ..()
	if(ishuman(owner) && associated_power)
		owner.verbs |= associated_power

/obj/item/organ/internal/xeno/removed(var/mob/living/user)
	. = ..()
	if(ishuman(owner) && associated_power && !(associated_power in owner.species.inherent_verbs))
		owner.verbs -= associated_power

/obj/item/organ/internal/xeno/eggsac
	name = "egg sac"
	parent_organ = BP_GROIN
	icon_state = "xgibmid1"
	organ_tag = BP_EGG
	associated_power = /mob/living/carbon/human/proc/lay_egg

/obj/item/organ/internal/xeno/resinspinner
	name = "resin spinner"
	parent_organ = BP_HEAD
	icon_state = "xgibmid2"
	organ_tag = BP_RESIN
	associated_power = /mob/living/carbon/human/proc/resin

/obj/item/organ/internal/xeno/acidgland
	name = "acid gland"
	parent_organ = BP_HEAD
	icon_state = "xgibtorso"
	organ_tag = BP_ACID
	associated_power = /mob/living/carbon/human/proc/corrosive_acid

/obj/item/organ/internal/xeno/acidgland/strong
	name = "strong acid gland"
	associated_power = /mob/living/carbon/human/proc/strong_corrosive_acid

/obj/item/organ/internal/xeno/acidgland/moderate
	name = "moderate acid gland"
	associated_power = /mob/living/carbon/human/proc/moderate_corrosive_acid

/obj/item/organ/internal/xeno/plasmavessel
	name = "plasma vessel"
	parent_organ = BP_CHEST
	icon_state = "xgibdown1"
	organ_tag = BP_PLASMA
	var/stored_plasma = 350
	var/max_plasma = 500

/obj/item/organ/internal/xeno/plasmavessel/queen
	name = "bloated plasma vessel"
	stored_plasma = 350
	max_plasma = 1200
	associated_power = /mob/living/carbon/human/proc/neurotoxin

/obj/item/organ/internal/xeno/plasmavessel/sentinel
	stored_plasma = 100
	max_plasma = 450
	associated_power = /mob/living/carbon/human/proc/neurotoxin

/obj/item/organ/internal/xeno/plasmavessel/hunter
	name = "tiny plasma vessel"
	stored_plasma = 100
	max_plasma = 300

/obj/item/organ/internal/xeno/hivenode
	name = "hive node"
	parent_organ = BP_CHEST
	icon_state = "xgibmid2"
	organ_tag = BP_HIVE
	var/painkiller = 500 //added bcause fuckers with it will need it

/obj/item/organ/internal/xeno/hivenode/Process() //hivemind makes you powerful. And dumb.
	if(owner)
		var/profit = painkiller
		if(is_broken())
			profit *= 0.4
		else if(is_bruised())
			profit *= 0.7
		owner.add_chemical_effect(CE_PAINKILLER, profit)
	..()
/obj/item/organ/internal/xeno/hivenode/removed(var/mob/living/user)
	if(owner && ishuman(owner))
		var/mob/living/carbon/human/H = owner
		to_chat(H, "<span class='alium'>You feel your connection to the hivemind fray and fade away...</span>")
		H.remove_language("Hivemind")
		if(H.mind && H.species.get_bodytype(H) != "Xenophage")
			GLOB.xenomorphs.remove_antagonist(H.mind)
	..(user)

/obj/item/organ/internal/xeno/hivenode/replaced(var/mob/living/carbon/human/target,var/obj/item/organ/external/affected)
	if(!..()) return 0

	if(owner && ishuman(owner))
		var/mob/living/carbon/human/H = owner
		H.add_language("Hivemind")
		if(H.mind && H.species.get_bodytype(H) != "Xenophage")
			to_chat(H, "<span class='alium'>You feel a sense of pressure as a vast intelligence meshes with your thoughts...</span>")
			GLOB.xenomorphs.add_antagonist_mind(H.mind,1, GLOB.xenomorphs.faction_role_text, GLOB.xenomorphs.faction_welcome)
	return 1

/obj/item/organ/internal/eyes/xeno
	phoron_guard = 1
	innate_flash_protection = FLASH_PROTECTION_MODERATE
	eye_icon = 'infinity/icons/mob/human_races/species/xenophage/eyes.dmi'
	damage_reduction = 0

/obj/item/organ/internal/eyes/xeno/update_colour()
	if(!owner)
		return
	owner.r_eyes = 153
	owner.g_eyes = 0
	owner.b_eyes = 153
	..()

/obj/item/organ/internal/xeno/larva
	name = "alien larva"
	parent_organ = BP_CHEST
	icon_state = "xgibmid2"
	organ_tag = BP_LARVA
	var/progress = 0
	var/max_progress = 250
	var/mob/living/carbon/human/H
	var/obj/item/organ/external/location

/obj/item/organ/internal/xeno/larva/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/organ/internal/xeno/larva/replaced(var/mob/living/carbon/human/target, var/obj/item/organ/external/affected)
	if(!..()) return 0

	if(owner && ishuman(owner))
		H = owner
		location = affected
		to_chat(H, SPAN_DANGER("You feel like something enters your throat and travels to your chest, causing strong pain!"))


/obj/item/organ/internal/xeno/larva/removed(var/mob/living/user)
	H = null

/obj/item/organ/internal/xeno/larva/Process()
	if(H)
		if(progress < max_progress)
			progress++
		else
			to_chat(H, SPAN_DANGER("Something in your chest is moving, trying to get out and causing sharp pain!"))
			H.apply_damage(200, BRUTE, location)
			sleep(5)
			var/mob/living/carbon/alien/larva/larva = new(get_turf(H))
			GLOB.xenomorphs.add_antagonist(larva.mind, 1)
			qdel(src)
	. = ..()

/obj/item/organ/internal/xeno/mimicsac
	name = "mimic sac"
	parent_organ = BP_CHEST
	icon_state = "xgibmid2"
	organ_tag = BP_MIMIC
	associated_power = /mob/living/carbon/human/proc/mimic

/obj/item/organ/internal/xeno/mimicsac/Process()
	if(owner.alpha == 255)
		return

	if(owner.internal_organs_by_name[BP_PLASMA])
		var/obj/item/organ/internal/xeno/plasmavessel/I = owner.internal_organs_by_name[BP_PLASMA]
		if(istype(I))
			if(I.stored_plasma < 5)
				owner.alpha = 255
				return
			else
				I.stored_plasma -= 5
