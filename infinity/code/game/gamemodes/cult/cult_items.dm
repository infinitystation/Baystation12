/obj/item/weapon/paper/talisman/wrath/attack_self(var/mob/living/user)
	if(iscultist(user))
		to_chat(user, "This is an wrathburning talisman.")
	..()

/obj/item/weapon/paper/talisman/wrath/afterattack(var/mob/living/M, var/mob/living/user)
	if(!iscultist(user))
		return
	user.say("Ощути гнев моего Бога!")
	var/obj/item/weapon/nullrod/nrod = locate() in M
	if(nrod)
		user.visible_message("<span class='danger'>\The [user] invokes \the [src] at [M], but they are unaffected.</span>", "<span class='danger'>You invoke \the [src] at [M], but they are unaffected.</span>")
		return
	else
		user.visible_message("<span class='danger'>\The [user] invokes \the [src] at [M].</span>", "<span class='danger'>You invoke \the [src] at [M].</span>")

	if(issilicon(M))
		M.apply_damage(30, BRUTE)
		M.apply_damage(30, BURN)
	else if(iscarbon(M))
		var/mob/living/carbon/C = M
		C.apply_damage(25, BRUTE)
		C.apply_damage(25, ELECTROCUTE)
	admin_attack_log(user, M, "Used a wrathburning talisman.", "Was victim of a wrathburning talisman.", "used a wrathburning talisman on")
	user.unEquip(src)
	qdel(src)

/obj/item/weapon/paper/talisman/burn/attack_self(var/mob/living/user)
	if(iscultist(user))
		to_chat(user, "This is an burning talisman.")
	..()

/obj/item/weapon/paper/talisman/burn/afterattack(var/mob/living/M, var/mob/living/user)
	if(!iscultist(user))
		return
	var/obj/item/weapon/nullrod/nrod = locate() in M
	if(nrod)
		return
	else
		if(issilicon(M))
			M.apply_damage(50, BURN)
		else if(iscarbon(M))
			var/mob/living/carbon/C = M
			C.adjust_fire_stacks(rand(1,3))
			C.IgniteMob()
		user.unEquip(src)
		qdel(src)

/obj/item/weapon/reagent_containers/glass/bucket/wood/cult/New()
	..()
	reagents.add_reagent(/datum/reagent/hell_water, 120)
	update_icon()

/obj/item/device/flashlight/flashdark/stone
	name = "hellstone shard"
	desc = "The stone is blacker than the night itself, it seems to dim all the light around."
	icon = 'infinity/icons/obj/objects.dmi'
	icon_state = "hellstone"
	item_state = "electronic"

/obj/item/clothing/glasses/tacgoggles/cult
	name = "hell goggles"
	desc = "Its look equally funny and frightening."
	item_icons = list(slot_glasses_str = 'infinity/icons/mob/onmob/onmob_eyes.dmi')
	icon = 'infinity/icons/obj/clothing/obj_eyes.dmi'
	icon_state = "hg"
	item_state = "hg"
	off_state = "hg_off"
	darkness_view = 5

/obj/item/clothing/glasses/tacgoggles/cult/Initialize()
	. = ..()
	overlay = GLOB.global_hud.thermal

/obj/item/weapon/melee/cultblade/dagger
	name = "shadow dagger"
	desc = "A strange dagger, the blade of which is always covered with a thick dark haze."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "render"
	force = 6
	armor_penetration = 100
	throwforce = 13
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
