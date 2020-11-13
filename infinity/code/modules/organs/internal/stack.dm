#define BP_NSTACK "neural stack"

//Species-related stuff.

//Defines if specimen can have stack at roundstart, and backup/restore mind from one's
/datum/species/var/can_stack = TRUE

/datum/species/adherent/can_stack = FALSE
/datum/species/machine/can_stack = FALSE
/datum/species/vox/can_stack = FALSE
/datum/species/nabber/can_stack = FALSE
/datum/species/diona/can_stack = FALSE

//Entire thing. Basically most of the code was taken from stack.dm which lies in bay directory.
/obj/item/organ/internal/stack
	name = "neural stack"
	desc = "Device capable of storing a one's mind. You're pretty sure this can make you immortal."

	icon = 'infinity/icons/obj/surgery.dmi'
	icon_state = "neural-stack-adv"

	parent_organ = BP_HEAD
	organ_tag = BP_NSTACK
	status = ORGAN_ROBOTIC
	relative_size = 10
	vital = TRUE

	origin_tech = list(TECH_BIO = 4, TECH_MATERIAL = 4, TECH_MAGNET = 2, TECH_DATA = 4)

	var/ownerckey

	var/default_language
	var/list/languages = list()
	var/datum/mind/backup
	var/prompting = FALSE //Are we waiting for a user prompt?

/obj/item/organ/internal/stack/examine(var/mob/user)
	. = ..()
	if(istype(backup))
		if(user.skill_check(SKILL_DEVICES, SKILL_ADEPT))
			if(find_dead_player(ownerckey, 1)) //So if owner of stack is still here..
				to_chat(user, SPAN_NOTICE("The light on [src] is glowing green."))
			else
				to_chat(user, SPAN_WARNING("The light on [src] is blinking yellow."))
		else
			to_chat(user, "The light on [src] is glowing green.")
	else
		to_chat(user, SPAN_DANGER("The light on [src] is off."))

/obj/item/organ/internal/stack/listen()
	return "gentle hum of neural stack"

/obj/item/organ/internal/stack/emp_act()
	return

/obj/item/organ/internal/stack/getToxLoss()
	return 0

//Just in case.. It's called after rejuvenation if organ is robotic, and without override will add this nasty "robotic" into name
/obj/item/organ/internal/stack/robotize()
	return

/obj/item/organ/internal/stack/New()
	..()
	do_backup()

/obj/item/organ/internal/stack/proc/do_backup()
	if(owner && owner.stat != DEAD && !is_broken() && owner.mind && owner.species.can_stack)
		languages = owner.languages.Copy()
		backup = owner.mind
		default_language = owner.default_language
		if(owner.ckey)
			ownerckey = owner.ckey

/obj/item/organ/internal/stack/proc/backup_inviable()
	return (!istype(backup) || backup == owner.mind || (backup.current && backup.current.stat != DEAD) || !owner.species.can_stack)

/obj/item/organ/internal/stack/proc/prompt()
	var/mob/dead = find_dead_player(ownerckey, 1)
	var/current_owner = owner
	if(!dead || prompting) return
	prompting = TRUE
	var/response = alert(dead, "Your neural backup has been placed into a new body. Do you wish to return to life as the mind of [backup.name]?", "Second Chance", "Yes", "No")
	prompting = FALSE
	if(response == "Yes" && current_owner == owner) //Are we still here?
		return 1

/obj/item/organ/internal/stack/replaced()
	if(!..()) return 0
	if(owner && !backup_inviable() && prompt())
		overwrite()
	sleep(-1)
	do_backup()
	return 1

/obj/item/organ/internal/stack/removed()
	do_backup()
	..()

/obj/item/organ/internal/stack/proc/overwrite()
	if(owner.mind && owner.ckey)
		if(owner.mind == backup)
			return
		owner.visible_message(SPAN_DANGER("\The [owner] spasms violently!"))
		owner.ghostize() //Remove previous host :(
	backup.active = 1
	backup.transfer_to(owner)
	if(default_language) owner.default_language = default_language
	owner.languages = languages.Copy()
	to_chat(owner, SPAN_NOTICE("Âàøå ñîçíàíèå ìåäëåííî âîçâðàùàåòñÿ ê âàì.."))

//Preferences

/datum/category_group/player_setup_category/lace
	name = "Íåéðîóçåë"
	sort_order = 9
	category_item_type = /datum/category_item/player_setup_item/lace

/datum/category_item/player_setup_item/lace
	name = "Íåéðîííûé óçåë (Neural Stack)"
	sort_order = 1

/datum/preferences
	var/laced = FALSE

/datum/category_item/player_setup_item/lace/load_character(var/savefile/S)
	from_file(S["laced"], pref.laced)

/datum/category_item/player_setup_item/lace/save_character(var/savefile/S)
	to_file(S["laced"], pref.laced)

/datum/category_item/player_setup_item/lace/content()
	. = list()
	. += "<b>Íàëè÷èå íåéðîóçëà: </b>"

	if(!pref.laced)
		. += "<span class='linkOn'>Îòñóòñòâóåò</span>"
		. += "<a href='?src=\ref[src];toggle_lace=1'>Ïðèñóòñòâóåò</a>"
		. += "<br>Âàø ïåðñîíàæ íå èìååò íåéðîóçëà."
		. += "<hr>"
	else
		. += "<a href='?src=\ref[src];toggle_lace=1'>Îòñóòñòâóåò</a>"
		. += "<span class='linkOn'>Ïðèñóòñòâóåò</span>"
		. += "<br>Âàø ïåðñîíàæ èìååò àêòèâíûé íåéðîóçåë."
		. += "<hr>"

	. = jointext(.,null)

/datum/category_item/player_setup_item/lace/OnTopic(href, href_list, user)
	if(href_list["toggle_lace"])
		pref.laced = !pref.laced
		return TOPIC_REFRESH

//Stack creation

/mob/living/carbon/human/proc/create_stack()
	internal_organs_by_name[BP_NSTACK] = new /obj/item/organ/internal/stack(src, 1)
	to_chat(src, SPAN_NOTICE("Âû ÷óâñòâóåòå íåáîëüøîå ãîëîâîêðóæåíèå îò îùóùåíèÿ òîãî, êàê íåéðîóçåë îáëåãàåò âàø ìîçã."))

/mob/new_player/create_character()
	. = ..()
	if(.)
		var/mob/living/carbon/human/new_character = .
		if(new_character.client.prefs.laced && new_character.species.can_stack) new_character.create_stack()
