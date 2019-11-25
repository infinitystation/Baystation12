/*
/turf/simulated/floor/Crossed(atom/movable/O)
	. = ..()
	if(isliving(O))
		var/area/A = get_area(O)
		var/mob/living/crosser = O
		var/soundplayed
		for(var/obj/item/lordvessel/BOWL in crosser.contents)
			if(!(A in BOWL.known_areas) && !BOWL.is_silent_teleporting)
				if(!soundplayed)
					to_chat(O, "<center><b><font size=4>New area:<br>[A]</font></b></center>")
					sound_to(O, 'infinity/sound/effects/lordvessel/ds-new-area.ogg')
					soundplayed = 1
				BOWL.known_areas += A
*/

/obj/item/lordvessel/Initialize()
	. = ..()
	GLOB.item_equipped_event.register(src, src, .proc/equiped)

/obj/item/lordvessel/proc/equiped(var/me, var/who)
	GLOB.item_equipped_event.unregister(me, me)
	GLOB.item_unequipped_event.register(me, me, .proc/unequiped)
	GLOB.moved_event.register(who, me, .proc/listening_mobs_moves)

/obj/item/lordvessel/proc/unequiped(var/me, var/who)
	GLOB.item_unequipped_event.unregister(me, me)
	GLOB.item_equipped_event.register(me, me, .proc/equiped)
	GLOB.moved_event.unregister(who, me)

/obj/item/lordvessel/proc/listening_mobs_moves(var/mob/who, var/old_loc, var/new_loc)
	if((who.get_active_hand() != src) && (who.get_inactive_hand() != src)) //lordvessel must be in hands to keep bell remember zones
		return
	var/area/A = get_area(who)
	if(!A)
		message_admins("Kharmaan lost in space and time... Help him! [admin_jump_link(who, src)]")
		return
	if(!(A in known_areas) && !is_silent_teleporting)
		to_chat(who, "<center><b><font size=4>New area:<br>[A]</font></b></center>")
		sound_to(who, 'infinity/sound/effects/lordvessel/ds-new-area.ogg')
		known_areas += A