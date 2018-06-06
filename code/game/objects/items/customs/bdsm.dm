/obj/item/bdsm_toy
	name="toy"
	desc="Looks like a bullet. But rubber. Rubber bullet."
	icon = 'icons/obj/toy.dmi'
	icon_state = "toy_off"
	var/icon_off = "toy_off"
	var/icon_on = "toy_on"

/obj/item/bdsm_toy/attack_self(usr/user)
	if (icon_off == icon_state)
		icon_state = icon_on
	else
		icon_state = icon_off

/obj/item/clothing/mask/muzzle/gag
	name = "gag"
	desc = "Just small red gag."
	icon_state = "gag"
	item_state = "gag"

/obj/item/weapon/handcuffs/erp
	name = "Fluffy handcuffs"
	desc = "Pink fluffy handcuffs for resomi. How cute, owww...."
	icon = 'icons/obj/items.dmi'
	icon_state = "erpcuff"
	throwforce = 0

/obj/item/weapon/reagent_containers/spray/lube
	name = "spray bottle"
	desc = "A spray bottle, with an unscrewable top."
	icon = 'icons/obj/janitor.dmi'
	icon_state = "spray_lube"
	item_state = null
	throwforce = 0
	throw_speed = 2
	amount_per_transfer_from_this = 5
	possible_transfer_amounts = "1;5" //Set to null instead of list, if there is only one.
	spray_size = 1
	spray_sizes = list(1,1)
	step_delay = 15 // lower is faster
	volume = 15

/obj/item/bdsm_balls
	name="balls"
	desc="Just balls on the string. Happy new year, eh?"
	icon = 'icons/obj/toy.dmi'
	icon_state = "bdsm_balls"

/obj/item/clothing/under/resomi/latexmaid
	name = "latexsuit"
	icon_state = "latexmaid"
	worn_state = "latexmaid"

/obj/item/weapon/melee/stack
	name = "stack"
	desc = "Rubber fly swatter. Yes, i hope it`s fly swatter"
	icon = 'icons/obj/items.dmi'
	icon_state = "stack"

/obj/item/weapon/melee/stack/attack(mob/M, mob/user)
	..()

/obj/item/weapon/melee/stack/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(isrobot(target))
		return ..()
	if(ishuman(target))
		target.stun_effect_act(0, 15, hit_zone, src)

/obj/item/clothing/under/resomi/dildo
	name = "Strap-on"
	desc = "Errr..."
	icon_state = "dildo"
	worn_state = "dildo"

/obj/item/weapon/storage/secure/briefcase/pink
	..()
	name = "pink brifcase"
	desc = "Just pink edition."
	icon = 'icons/obj/storage.dmi'
	icon_state = "secure_pink"
	New()
		..()
		new /obj/item/bdsm_toy(src)
		new /obj/item/clothing/mask/muzzle/gag(src)
		new /obj/item/weapon/handcuffs/erp(src)
		new /obj/item/weapon/reagent_containers/spray/lube(src)
		new /obj/item/bdsm_balls(src)
		new /obj/item/clothing/under/resomi/latexmaid(src)
		new /obj/item/weapon/melee/stack(src)
		new /obj/item/clothing/under/resomi/dildo(src)