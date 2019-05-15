/datum/reagent/ethanol/kotovino
	name = "Djurl'Ma-Tua"
	description = " One of the oldest tajaran drinks, the history of which stretches from unknown-distant epochs. Anywhere but on Ahdomai, this drink is not cooked. It tastes like wine, but combines a large number of different types of spices and spices. "
	taste_description = "exotic, sweet, hard and gentle at the same time"
	color = "#ba86e4"
	strength = 80
	adj_temp = 5
	glass_name = "Djurl'Ma-Tua"
	glass_desc = " Exotic drink native to Ahdomai. Its taste is similar to wine with a lot of different condiments and spices."

/datum/reagent/ethanol/kotovino/affect_ingest(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_TAJARA)
		M.adjustToxLoss(0.5 * removed)
	else
		M.apply_effect(4, PAIN, 0)
		if(prob(5))
			M.visible_message("<span class='warning'>[M] [pick("dry heaves!","coughs!","splutters!")]</span>", "<span class='danger'>You can feel LIQUID HELL running down your throat and into your stomach!</span>")
	if(istype(M, /mob/living/carbon/slime))
		M.bodytemperature += rand(15, 30)
	holder.remove_reagent(/datum/reagent/frostoil, 5)

/datum/reagent/juice/tajaran/sok
	name = "Selm juice"
	description = "Juice of one of the Ahdomai plants, which is taken to drink chilled"
	taste_description = "frightening sourness with spices"
	color = "#e486e3"
	glass_name = "Selm juice"
	glass_desc = " Juice of one of the Ahdomai plants, which is taken to drink chilled. "

/datum/reagent/drink/tajaran/milk
	name = "Milk"
	description = "An opaque white liquid produced by the mammary glands of mammals."
	taste_description = "milk... wait! Its not THAT MILK!"
	color = "#dfdfdf"
	glass_name = "milk"
	glass_desc = "White and nutritious goodness!"

/datum/reagent/juice/tajaran/chai
	name = "Herbal tincture"
	description = "Drink similar to tea, but from other herbs. If you brewed hundreds of medicinal herbs from pharmacies - could be something similar."
	taste_description = "hundreds of herbs"
	color = "#8f86e4"
	glass_name = "Herbal tincture"
	glass_desc = " Drink similar to tea, but from other herbs. If you brewed hundreds of medicinal herbs from pharmacies - could be something similar. "

/datum/reagent/juice/tajaran/chai/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		M.heal_organ_damage(5 * removed, 5 * removed)
		M.adjustToxLoss(-3 * removed)

/obj/item/weapon/reagent_containers/chem_disp_cartridge
	medium
		volume = CARTRIDGE_VOLUME_MEDIUM

	Djurl_Ma_Tua			spawn_reagent = /datum/reagent/ethanol/kotovino
	Selm_juice				spawn_reagent = /datum/reagent/juice/tajaran/sok
	Milkk					spawn_reagent = /datum/reagent/drink/tajaran/milk
	Herbal_tincture			spawn_reagent = /datum/reagent/juice/tajaran/chai

/obj/machinery/chemical_dispenser/bar_alc/kote
	name = "drinks dispenser"
	desc = "Dispener of a various drinks!"
	icon_state = "booze_dispenser"
	ui_title = "Booze Dispenser"
	accept_drinking = 1
	core_skill = SKILL_COOKING
	can_contaminate = FALSE //See above.

/obj/machinery/chemical_dispenser/bar_alc/kote/full
	spawn_cartridges = list(
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/water,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/ice,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/coffee,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/hot_coco,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/cream,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/tea,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/green_tea,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/cola,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/Djurl_Ma_Tua,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/Djurl_Ma_Tua,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/Herbal_tincture,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/Herbal_tincture,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/Selm_juice,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/Selm_juice,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/Milkk,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sodawater,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/lemon_lime,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/sugar,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/orange,
			/obj/item/weapon/reagent_containers/chem_disp_cartridge/lime,
		)

/obj/item/weapon/reagent_containers/food/drinks/bottle/Djurl_Ma_Tua
	name = "Djurl'Ma-Tua"
	desc = "One of the oldest tajaran drinks, the history of which stretches from unknown-distant epochs. Anywhere but on Ahdomai, this drink is not cooked. It tastes like wine, but combines a large number of different types of spices and spices."
	icon = 'maps/away_inf/tajsc/tajsciship.dmi'
	icon_state = "kotobuhlo"
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/kotovino, 120)

/obj/item/weapon/reagent_containers/food/drinks/bottle/Herbal_tincture
	name = "Herbal tincture"
	desc = "Drink similar to tea, but from other herbs. If you brewed hundreds of medicinal herbs from pharmacies - could be something similar."
	icon = 'maps/away_inf/tajsc/tajsciship.dmi'
	icon_state = "kotochai"
	center_of_mass = "x=17;y=3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/juice/tajaran/chai, 120)