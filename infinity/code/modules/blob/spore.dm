/mob/living/simple_animal/hostile/blobspore
	name = "blob spore"
	desc = "A giant flying spore."
	icon = 'infinity/icons/mob/blob.dmi'
	speak_emote = list("gibbers")
	icon_state = "blobpod"
	icon_living = "blobpod"
	icon_dead = "blobpod"
	health = 15
	maxHealth = 15
	melee_damage_lower = 8
	melee_damage_upper = 8
	attacktext = "glomped"
	attack_sound = 'sound/weapons/bite.ogg'
	faction = "blob"
	speed = 4

	var/obj/effect/biomass/core/core

/mob/living/simple_animal/hostile/blobspore/death()
	. = ..()
	qdel(src)

/mob/living/simple_animal/hostile/blobspore/fragile
	name = "fragile blob spore"
	desc = "A giant flying spore. This one look pretty fragile!"
	health = 5
	maxHealth = 5
	melee_damage_lower = 5
	melee_damage_upper = 5
	speed = 6