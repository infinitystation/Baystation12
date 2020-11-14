/mob/proc/wrath_imbue()
	set category = "Cult Magic"
	set name = "Imbue: Wrath Burning"

	make_rune(/obj/effect/rune/imbue/wrath, cost = 15)

/obj/effect/rune/imbue/wrath
	cultname = "wrath burning imbue"
	papertype = /obj/item/weapon/paper/talisman/wrath

/mob/proc/burn_imbue()
	set category = "Cult Magic"
	set name = "Imbue: Burning"

	make_rune(/obj/effect/rune/imbue/burn)

/obj/effect/rune/imbue/burn
	cultname = "burning imbue"
	papertype = /obj/item/weapon/paper/talisman/burn

/mob/proc/hellbucket_rune()
	set category = "Cult Magic"
	set name = "Rune: Summon HellWater"

	make_rune(/obj/effect/rune/hellbucket, cost = 15)

/obj/effect/rune/hellbucket
	cultname = "summon hellwater"

/obj/effect/rune/hellbucket/cast(var/mob/living/user)
	new /obj/item/weapon/reagent_containers/glass/bucket/wood/cult(get_turf(src))
	speak_incantation(user, "N[pick("'","`")]ath chsz'rchesh tza'jink'tumakes!")
	visible_message("<span class='notice'>\The [src] disappears with a flash of red light.</span>", "You hear a pop.")
	qdel(src)

/mob/proc/hellhunter_rune()
	set category = "Cult Magic"
	set name = "Rune: Summon HellHunter equip"

	make_rune(/obj/effect/rune/hellhunter, cost = 15, tome_required = 1)

/obj/effect/rune/hellhunter
	cultname = "summon hellhunter equip"

/obj/effect/rune/hellhunter/cast(var/mob/living/user)
	new /obj/item/device/flashlight/flashdark/stone(get_turf(src))
	new /obj/item/clothing/glasses/tacgoggles/cult(get_turf(src))
	new /obj/item/weapon/melee/cultblade/dagger(get_turf(src))
	speak_incantation(user, "N[pick("'","`")]ath chip'ayiayan auyana!")
	visible_message("<span class='notice'>\The [src] disappears with a flash of red light.</span>", "You hear a pop.")
	qdel(src)

/mob/proc/hellstone_rune()
	set category = "Cult Magic"
	set name = "Rune: HellStone"

	make_rune(/obj/effect/rune/hellstone, cost = 15, tome_required = 1)

/obj/effect/rune/hellstone
	cultname = "summon hellstone"

/obj/effect/rune/hellstone/cast(var/mob/living/user)
	new /obj/item/device/flashlight/flashdark/stone(get_turf(src))
	speak_incantation(user, "N[pick("'","`")]akkakkaya'iyakaiya!")
	visible_message("<span class='notice'>\The [src] disappears with a flash of red light.</span>", "You hear a pop.")
	qdel(src)
