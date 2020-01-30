/obj/item/weapon/grenade/empgrenade
	name = "classic emp grenade"
	icon_state = "emp"
	item_state = "empgrenade"
	origin_tech = list(TECH_MATERIAL = 2, TECH_MAGNET = 3)

	detonate()
		..()
		if(empulse(src, 3, 6))
			qdel(src)
		return

/obj/item/weapon/grenade/empgrenade/low_yield
	name = "low yield emp grenade"
	desc = "A weaker variant of the classic emp grenade."
	icon_state = "lyemp"
	item_state = "lyempgrenade"
	origin_tech = list(TECH_MATERIAL = 2, TECH_MAGNET = 3)

	detonate()
		..()
		if(empulse(src, 2, 4))
			qdel(src)
		return
