/mob/living/ancient_being/space_whale
	name = "An Ancient Space Whale"
	desc = "A colossal creature from myths and legends lost in time. Some say they live for several thousand years, can manipulate time and space and use psychic abilities. Respect these creatures if you are lucky enough to see them or they will make you."

	icon = 'icons/mob/space_whale.dmi'
	icon_state = "whale0"

	var/can_space_walk = 1

	pixel_x = -320
	pixel_y = -96

/mob/living/ancient_being/space_whale/Life()
	..()
	set_view()

/mob/living/ancient_being/space_whale/proc/set_view()
	src.client.view = 15
	return
