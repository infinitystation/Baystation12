/obj/item/projectile/energy/alien_acid
	name = "acid"
	icon_state = "neurotoxin"
	damtype = BURN
	damage = 10
	agony = 5
	life_span = 6

/obj/item/projectile/energy/alien_acid/on_impact(var/atom/A)
	A.acid_melt()
	. = ..()
