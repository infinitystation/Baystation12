/obj/item/device/multitool/hacktool/unhidden
	name = "hacktool"
	desc = "An advanced hacking tool - you may saw one in movies about spies and corporative espionage, \
	or in hands of government special teams, which often use them for breaching in bad guys dens... \
	Or in hands of bad guys."
	icon = 'icons/obj/hacktool.dmi'
	icon_state = "hacktool"
	min_hack_time = 4 SECONDS //because it doesn't hidden in multitool
	rand_hack_time = 3 SECONDS
	in_hack_mode = 1

// We aren't adding this to hidden version of device,
// because it would be useless - no one traitor would waste points on hacking for it.

/obj/item/device/multitool/hacktool/unhidden/attempt_hack(var/mob/user, var/atom/target)
	if(!user.skill_check(SKILL_ELECTRICAL, SKILL_ADEPT))
		to_chat(user, SPAN_WARNING("You don't know how to handle with \a [src]."))
		return 0
	. = ..()

/obj/item/device/multitool/hacktool/unhidden/budget
	desc = "An advanced hacking tool - you may saw one in movies about spies and corporative espionage, \
	or in hands of government special teams, which often use them for breaching in bad guys dens... \
	Or in hands of bad guys. Looks like this one is worn - old fingerprints, some scratches..."
	icon = 'icons/obj/hacktool.dmi'
	icon_state = "hacktool-g" //green color looks safer and less antagonistic
	min_hack_time = 8 SECONDS
	rand_hack_time = 4 SECONDS
