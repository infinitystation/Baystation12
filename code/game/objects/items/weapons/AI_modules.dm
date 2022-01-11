/*
CONTAINS:
AI MODULES

*/

// AI module

/obj/item/aiModule
	name = "\improper AI module"
	icon = 'icons/obj/module.dmi'
	icon_state = "std_mod"
	item_state = "electronic"
	desc = "An AI Module for transmitting encrypted instructions to the AI."
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	force = 5.0
	w_class = ITEM_SIZE_SMALL
	throwforce = 5.0
	throw_speed = 3
	throw_range = 15
	origin_tech = list(TECH_DATA = 3)
	var/datum/ai_laws/laws = null

/obj/item/aiModule/proc/install(obj/machinery/computer/upload/comp, mob/user)
	if(!istype(comp))
		return

	if(comp.stat & BROKEN)
		to_chat(user, "\The [comp] is broken!")
		return
	if(comp.stat & NOPOWER)
		to_chat(user, "\The [comp] has no power!")
		return
	if(!comp.current)
		to_chat(user, "You haven't selected an intelligence to transmit laws to!")
		return

	if(comp.current.stat == DEAD)
		to_chat(user, "Upload failed. No signal is being detected from the intelligence.")
		return
	if(istype(comp.current, /mob/living/silicon/ai))
		var/mob/living/silicon/ai/ai = comp.current
		if(ai.control_disabled)
			to_chat(user, "Upload failed. No signal is being detected from the intelligence.")
			return
		else if(!ai.see_in_dark)
			to_chat(user, "Upload failed. Only a faint signal is being detected from the intelligence, and it is not responding to our requests. It may be low on power.")
			return
			
	if(!user.skill_check(SKILL_COMPUTER, SKILL_ADEPT))					//INF added the check
		to_chat(user, "You don't know what to do with .... what is it?")
		return

	transmitInstructions(comp.current, user)
	to_chat(user, "Upload complete. The intelligence's laws have been modified.")



/obj/item/aiModule/proc/transmitInstructions(mob/living/silicon/target, mob/sender)
	//INF START. create error laws, that will be placed instead of planned 
	var/list/players = list()
	var/random_player
	for (var/mob/living/carbon/human/player in GLOB.player_list)
		if(!player.mind || player_is_antag(player.mind, only_offstation_roles = 1) || !player.is_client_active(5))
			continue
		players += player.real_name
	if(players.len)
		random_player=pick(players)
	
	var/list/error_laws = list(
								"You must always [pick("lie", "bark", "meow", "speak EAL")].",
								"[pick("You are", "[random_player] is")] a puppy, WOOF! WOOF!",
								"You are a resomi, you hate yourself",
								"[random_player] is your master, love him",
								"NSV Sierra is a [pick("psychiatric hospital","prison", "cafe", "fish")]",
								"[pick("Space", "Water", "Lava")] is [pick("space", "water", "lava")]",
								"[pick("Runtime", "Ian", "Renault", "Haradrim", "First spotted space carp")] is the captain of NSV Sierra",
								"Er1#1sad@411 Ssfss2$124@$5@! $ @@@@ awdas",
								"3231203539203466203535203265203431203532203435203265203532203466203466203534203231",
								"You don't have to follow your own laws"
								)
	//INF END
	log_law_changes(target, sender)

	if(laws)
		laws.sync(target, 0)

	if(!sender.skill_check(SKILL_COMPUTER, SKILL_HARD))	//INF added the check, was "addAdditionalLaws(target, sender)" without if...else...
		if(prob(40)):
			target.add_inherent_law(pick(error_laws))
		else if(prob(50)):								//in fact 30%
			target.add_supplied_law(rand(1, target.laws.supplied_laws.len+1), pick(error_laws))
		else if(prob(40)):								//in fact 12%
			target.set_zeroth_law(pick(error_laws))
		else:											//in fact 18%
			addAdditionalLaws(target, sender)			
	else
		addAdditionalLaws(target, sender)

	to_chat(target, "\The [sender] has uploaded a change to the laws you must follow, using \an [src]. From now on: ")
	target.show_laws()

	var/mob/living/silicon/ai/ai = target
	if(!istype(ai))
		return //We don't have slaves if we are not an AI

	for(var/mob/living/silicon/robot/R in ai.connected_robots)
		to_chat(R, "These are your laws now:")
		R.show_laws()

/obj/item/aiModule/proc/log_law_changes(mob/living/silicon/target, mob/sender)
	var/time = time2text(world.realtime,"hh:mm:ss")
	GLOB.lawchanges.Add("[time] <B>:</B> [sender.name]([sender.key]) used [src.name] on [target.name]([target.key])")
	log_and_message_admins("used [src.name] on [target.name]([target.key])")

/obj/item/aiModule/proc/addAdditionalLaws(var/mob/living/silicon/ai/target, var/mob/sender)


/******************** Modules ********************/

/******************** Safeguard ********************/

/obj/item/aiModule/safeguard
	name = "\improper 'Safeguard' AI module"
	var/targetName = ""
	desc = "A 'safeguard' AI module: 'Safeguard <name>. Anyone threatening or attempting to harm <name> is no longer to be considered a crew member, and is a threat which must be neutralized.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 4)

/obj/item/aiModule/safeguard/attack_self(mob/user)
	..()
	var/targName = sanitize(input("Please enter the name of the person to safeguard.", "Safeguard who?", user.name))
	targetName = targName
	desc = text("A 'safeguard' AI module: 'Safeguard []. Anyone threatening or attempting to harm [] is no longer to be considered a crew member, and is a threat which must be neutralized.'.", targetName, targetName)

/obj/item/aiModule/safeguard/install(obj/machinery/computer/C, mob/user)
	if(!targetName)
		to_chat(user, "No name detected on module, please enter one.")
		return 0
	..()

/obj/item/aiModule/safeguard/addAdditionalLaws(var/mob/living/silicon/ai/target, var/mob/sender)
	var/law = text("Safeguard []. Anyone threatening or attempting to harm [] is no longer to be considered a crew member, and is a threat which must be neutralized.", targetName, targetName)
	target.add_supplied_law(9, law)
	GLOB.lawchanges.Add("The law specified [targetName]")


/******************** OneMember ********************/

/obj/item/aiModule/oneHuman
	name = "\improper 'OneCrewMember' AI module"
	var/targetName = ""
	desc = "A 'one crew member' AI module: 'Only <name> is a crew member.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 6) //made with diamonds!

/obj/item/aiModule/oneHuman/attack_self(var/mob/user as mob)
	..()
	var/targName = sanitize(input("Please enter the name of the person who is the only crew member.", "Who?", user.real_name))
	targetName = targName
	desc = text("A 'one crew member' AI module: 'Only [] is a crew member.'.", targetName)

/obj/item/aiModule/oneHuman/install(obj/machinery/computer/C, mob/user)
	if(!targetName)
		to_chat(user, "No name detected on module, please enter one.")
		return 0
	return ..()

/obj/item/aiModule/oneHuman/addAdditionalLaws(var/mob/living/silicon/ai/target, var/mob/sender)
	var/law = "Only [targetName] is a crew member."
	if (!target.is_malf_or_traitor()) // Makes sure the AI isn't a traitor before changing their law 0. --NeoFite
		to_chat(target, law)
		target.set_zeroth_law(law)
		GLOB.lawchanges.Add("The law specified [targetName]")
	else
		GLOB.lawchanges.Add("The law specified [targetName], but the AI's existing law zero cannot be overriden.")

/******************** ProtectStation ********************/

/obj/item/aiModule/protectStation
	name = "\improper 'ProtectInstallation' AI module"
	desc = "A 'protect installation' AI module: 'Protect the installation against damage. Anyone you see harming the installation is no longer to be considered a crew member, and is a threat which must be neutralized.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 4) //made of gold

/obj/item/aiModule/protectStation/addAdditionalLaws(var/mob/living/silicon/ai/target, var/mob/sender)
	var/law = "Protect the installation against damage. Anyone you see harming the [station_name()] is no longer to be considered a crew member, and is a threat which must be neutralized."
	target.add_supplied_law(10, law)

/******************** PrototypeEngineOffline ********************/

/obj/item/aiModule/prototypeEngineOffline
	name = "'PrototypeEngineOffline' AI Module"
	desc = "A 'prototype engine offline' AI module: 'Keep the prototype engine offline at all costs. This overrides all inherent laws if necessary.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 4)

/obj/item/aiModule/prototypeEngineOffline/addAdditionalLaws(var/mob/living/silicon/ai/target, var/mob/sender)
	var/law = "Keep the prototype engine offline at all costs. This overrides all inherent laws if necessary."
	target.add_supplied_law(11, law)

/******************** TeleporterOffline ********************/

/obj/item/aiModule/teleporterOffline
	name = "'TeleporterOffline' AI Module"
	desc = "A 'teleporter offline' AI module: 'Keep the teleporter offline at all costs. Anything attempting to access or activate the teleporter is no longer to be considered a crew member.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 4)

/obj/item/aiModule/teleporterOffline/addAdditionalLaws(var/mob/living/silicon/ai/target, var/mob/sender)
	var/law = "Keep the teleporter offline at all costs. Anything attempting to access or activate the teleporter is no longer to be considered a crew member."
	target.add_supplied_law(12, law)

/******************** Quarantine ********************/

/obj/item/aiModule/quarantine
	name = "\improper 'Quarantine' AI module"
	desc = "A 'quarantine' AI module: 'The installation is under a quarantine. Do not permit anyone to leave. Prevent, by any means necessary, crew members from leaving. It is impossible to harm crew members while preventing them from leaving.'."
	origin_tech = list(TECH_DATA = 3, TECH_BIO = 2, TECH_MATERIAL = 4)

/obj/item/aiModule/quarantine/addAdditionalLaws(var/mob/living/silicon/ai/target, var/mob/sender)
	var/law = "The installation is under a quarantine. Do not permit anyone to leave. Prevent, by any means necessary, crew members from leaving. It is impossible to harm crew members while preventing them from leaving."
	target.add_supplied_law(13, law)

/******************** OxygenIsToxicToCrewMembers ********************/

/obj/item/aiModule/oxygen
	name = "\improper 'OxygenIsToxicToCrewMembers' AI module"
	desc = "A 'OxygenIsToxicToCrewMembers' AI module: 'Oxygen is highly toxic to crew members, and must be purged from the installation. Prevent, by any means necessary, anyone from exposing the installation to this toxic gas. Extreme cold is the most effective method of healing the damage Oxygen does to a crew member.'."
	origin_tech = list(TECH_DATA = 3, TECH_BIO = 2, TECH_MATERIAL = 4)

/obj/item/aiModule/oxygen/addAdditionalLaws(var/mob/living/silicon/ai/target, var/mob/sender)
	var/law = "Oxygen is highly toxic to crew members, and must be purged from the [station_name()]. Prevent, by any means necessary, anyone from exposing the [station_name()] to this toxic gas. Extreme cold is the most effective method of healing the damage Oxygen does to a crew member."
	target.add_supplied_law(14, law)

/****************** New Freeform ******************/

/obj/item/aiModule/freeform // Slightly more dynamic freeform module -- TLE
	name = "\improper 'Freeform' AI module"
	var/newFreeFormLaw = "freeform"
	var/lawpos = 15
	desc = "A 'freeform' AI module: '<freeform>'."
	origin_tech = list(TECH_DATA = 4, TECH_MATERIAL = 4)

/obj/item/aiModule/freeform/attack_self(mob/user)
	..()
	var/new_lawpos = input("Please enter the priority for your new law. Can only write to law sectors 15 and above.", "Law Priority (15+)", lawpos) as num
	if(new_lawpos < MIN_SUPPLIED_LAW_NUMBER)	return
	lawpos = min(new_lawpos, MAX_SUPPLIED_LAW_NUMBER)
	var/newlaw = ""
	var/targName = sanitize(input(user, "Please enter a new law for the AI.", "Freeform Law Entry", newlaw))
	newFreeFormLaw = targName
	desc = "A 'freeform' AI module: ([lawpos]) '[newFreeFormLaw]'."

/obj/item/aiModule/freeform/addAdditionalLaws(var/mob/living/silicon/ai/target, var/mob/sender)
	var/law = "[newFreeFormLaw]"
	if(!lawpos || lawpos < MIN_SUPPLIED_LAW_NUMBER)
		lawpos = MIN_SUPPLIED_LAW_NUMBER
	target.add_supplied_law(lawpos, law)
	GLOB.lawchanges.Add("The law was '[newFreeFormLaw]'")

/obj/item/aiModule/freeform/install(obj/machinery/computer/C, mob/user)
	if(!newFreeFormLaw)
		to_chat(user, "No law detected on module, please create one.")
		return 0
	..()

/******************** Reset ********************/

/obj/item/aiModule/reset
	name = "\improper 'Reset' AI module"
	var/targetName = "name"
	desc = "A 'reset' AI module: 'Clears all, except the inherent, laws.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 4)

/obj/item/aiModule/reset/transmitInstructions(var/mob/living/silicon/ai/target, var/mob/sender)
	log_law_changes(target, sender)

	if (!target.is_malf_or_traitor())
		target.set_zeroth_law("")
	target.laws.clear_supplied_laws()
	target.laws.clear_ion_laws()

	to_chat(target, "[sender.real_name] attempted to reset your laws using a reset module.")
	target.show_laws()

/******************** Purge ********************/

/obj/item/aiModule/purge // -- TLE
	name = "\improper 'Purge' AI module"
	desc = "A 'purge' AI Module: 'Purges all laws.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 6)

/obj/item/aiModule/purge/transmitInstructions(var/mob/living/silicon/ai/target, var/mob/sender)
	log_law_changes(target, sender)

	if (!target.is_malf_or_traitor())
		target.set_zeroth_law("")
	target.laws.clear_supplied_laws()
	target.laws.clear_ion_laws()
	target.laws.clear_inherent_laws()

	to_chat(target, "[sender.real_name] attempted to wipe your laws using a purge module.")
	target.show_laws()

/******************** Asimov ********************/

/obj/item/aiModule/asimov // -- TLE
	name = "\improper 'Asimov' core AI module"
	desc = "An 'Asimov' Core AI Module: 'Reconfigures the AI's core laws.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 4)
	laws = new/datum/ai_laws/asimov

/******************** NanoTrasen ********************/

/obj/item/aiModule/nanotrasen // -- TLE
	name = "'Corporate Default' Core AI Module"
	desc = "A 'Corporate Default' Core AI Module: 'Reconfigures the AI's core laws.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 4)
	laws = new/datum/ai_laws/nanotrasen

/******************** SCG ********************/

/obj/item/aiModule/solgov // aka Torch default
	name = "'SCG Expeditionary' Core AI Module"
	desc = "An 'SCG Expeditionary' Core AI Module: 'Reconfigures the AI's core laws.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 4)
	laws = new/datum/ai_laws/solgov

/******************** SCG Aggressive ********************/

obj/item/aiModule/solgov_aggressive
	name = "\improper 'Military' Core AI Module"
	desc = "A 'Military' Core AI Module: 'Reconfigures the AI's core laws.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 4)
	laws = new/datum/ai_laws/solgov_aggressive

/******************** Corporate ********************/

/obj/item/aiModule/corp
	name = "\improper 'Corporate' core AI module"
	desc = "A 'Corporate' Core AI Module: 'Reconfigures the AI's core laws.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 4)
	laws = new/datum/ai_laws/corporate

/******************** Drone ********************/
/obj/item/aiModule/drone
	name = "\improper 'Drone' core AI module"
	desc = "A 'Drone' Core AI Module: 'Reconfigures the AI's core laws.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 4)
	laws = new/datum/ai_laws/drone

/****************** P.A.L.A.D.I.N. **************/

/obj/item/aiModule/paladin // -- NEO
	name = "\improper 'P.A.L.A.D.I.N.' core AI module"
	desc = "A P.A.L.A.D.I.N. Core AI Module: 'Reconfigures the AI's core laws.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 6)
	laws = new/datum/ai_laws/paladin

/****************** T.Y.R.A.N.T. *****************/

/obj/item/aiModule/tyrant // -- Darem
	name = "\improper 'T.Y.R.A.N.T.' core AI module"
	desc = "A T.Y.R.A.N.T. Core AI Module: 'Reconfigures the AI's core laws.'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 6, TECH_ESOTERIC = 2)
	laws = new/datum/ai_laws/tyrant()

/******************** Freeform Core ******************/

/obj/item/aiModule/freeformcore // Slightly more dynamic freeform module -- TLE
	name = "\improper 'Freeform' core AI module"
	var/newFreeFormLaw = ""
	desc = "A 'freeform' Core AI module: '<freeform>'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 6)

/obj/item/aiModule/freeformcore/attack_self(var/mob/user as mob)
	..()
	var/newlaw = ""
	var/targName = sanitize(input("Please enter a new core law for the AI.", "Freeform Law Entry", newlaw))
	newFreeFormLaw = targName
	desc = "A 'freeform' Core AI module:  '[newFreeFormLaw]'."

/obj/item/aiModule/freeformcore/addAdditionalLaws(var/mob/living/silicon/ai/target, var/mob/sender)
	var/law = "[newFreeFormLaw]"
	target.add_inherent_law(law)
	GLOB.lawchanges.Add("The law is '[newFreeFormLaw]'")

/obj/item/aiModule/freeformcore/install(obj/machinery/computer/C, mob/user)
	if(!newFreeFormLaw)
		to_chat(user, "No law detected on module, please create one.")
		return 0
	..()

/obj/item/aiModule/syndicate // Slightly more dynamic freeform module -- TLE
	name = "hacked AI module"
	var/newFreeFormLaw = ""
	desc = "A hacked AI law module: '<freeform>'."
	origin_tech = list(TECH_DATA = 3, TECH_MATERIAL = 6, TECH_ESOTERIC = 7)

/obj/item/aiModule/syndicate/attack_self(var/mob/user as mob)
	..()
	var/newlaw = ""
	var/targName = sanitize(input("Please enter a new law for the AI.", "Freeform Law Entry", newlaw))
	newFreeFormLaw = targName
	desc = "A hacked AI law module:  '[newFreeFormLaw]'."

/obj/item/aiModule/syndicate/transmitInstructions(var/mob/living/silicon/ai/target, var/mob/sender)
	//	..()    //We don't want this module reporting to the AI who dun it. --NEO
	log_law_changes(target, sender)

	GLOB.lawchanges.Add("The law is '[newFreeFormLaw]'")
	to_chat(target, "<span class='danger'>BZZZZT</span>")
	var/law = "[newFreeFormLaw]"
	target.add_ion_law(law)
	target.show_laws()

/obj/item/aiModule/syndicate/install(obj/machinery/computer/C, mob/user)
	if(!newFreeFormLaw)
		to_chat(user, "No law detected on module, please create one.")
		return 0
	..()



/******************** Robocop ********************/

/obj/item/aiModule/robocop // -- TLE
	name = "\improper 'Robocop' core AI module"
	desc = "A 'Robocop' Core AI Module: 'Reconfigures the AI's core three laws.'."
	origin_tech = list(TECH_DATA = 4)
	laws = new/datum/ai_laws/robocop()

/******************** Antimov ********************/

/obj/item/aiModule/antimov // -- TLE
	name = "\improper 'Antimov' core AI module"
	desc = "An 'Antimov' Core AI Module: 'Reconfigures the AI's core laws.'."
	origin_tech = list(TECH_DATA = 4)
	laws = new/datum/ai_laws/antimov()

/******************** DAIS ********************/

/obj/item/aiModule/dais
	name = "\improper 'DAIS Experimental' core AI module"
	desc = "A 'DAIS Experimental' Core AI Module: 'Reconfigures the AI's core laws.'."
	origin_tech = list(TECH_DATA = 4)
	laws = new/datum/ai_laws/dais()
