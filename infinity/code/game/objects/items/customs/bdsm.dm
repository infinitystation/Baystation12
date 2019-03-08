//Work tools

/obj/item/weapon/spectoys
	name = "beaded rod"
	desc = "Just balls on a hard string. Happy new year, eh?"
	icon = 'icons/obj/spectoys.dmi'
	icon_state = "beads"
	force = 0
	throwforce = 0

/obj/item/weapon/spectoys/vibrator
	name = "vibrator"
	desc = "Looks like a bullet. But rubber. Rubber bullet."
	icon_state = "toy_off"
	force = 3 //Hello SA
	throwforce = 2
	w_class = ITEM_SIZE_NORMAL
	var/on = 0
	var/icon_off = "toy_off"
	var/icon_on = "toy_on"
	var/obj/item/weapon/cell/vcell = null

/obj/item/weapon/spectoys/vibrator/New() //starts without a cell for rnd
	..()
	vcell = new /obj/item/weapon/cell/apc(src)
	update_icon()

/obj/item/weapon/spectoys/vibrator/Destroy()
	. = ..()
	QDEL_NULL(vcell)

/obj/item/weapon/spectoys/vibrator/on_update_icon()
	if(on)
		icon_state = icon_on
	else
		icon_state = icon_off

/obj/item/weapon/spectoys/vibrator/attack_self(mob/user as mob)
	if(!on)
		if(vcell && (vcell.charge > (20 * CELLRATE)))
			turn_on(1)
			to_chat(user, "You turn on the [src].")
		else
			to_chat(user, "Looks like the [src] is out of energy.")
	else if(vcell)
		turn_off(1)
		to_chat(user, "You turn off the [src].")
	else
		to_chat(user, "Looks like the [src] is out of... Cell.")

/obj/item/weapon/spectoys/vibrator/Process()
	if(!on)
		return
	if(!vcell || (vcell.charge < (20 * CELLRATE)))
		turn_off(1)
		return
	vcell.use(20*CELLRATE)

/obj/item/weapon/spectoys/vibrator/proc/turn_on()
	if(!vcell)
		return 0
	if(vcell.charge < (20 * CELLRATE))
		return 0
	on = 1
	update_icon()

/obj/item/weapon/spectoys/vibrator/proc/turn_off()
	on = 0
	update_icon()

/obj/item/weapon/spectoys/vibrator/attack_hand(mob/user as mob)
	if(user.get_inactive_hand() == src)
		if(vcell)
			if(ishuman(user))
				user.put_in_hands(vcell)
			vcell.add_fingerprint(user)
			vcell.update_icon()

			src.vcell = null
			on = 0
			to_chat(user, "You remove the power cell")
			update_icon()
			return
	..()

/obj/item/weapon/spectoys/vibrator/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/cell))
		if(vcell)
			to_chat(user, "There is a power cell already installed.")
		else
			user.drop_item()
			W.loc = src
			vcell = W
			to_chat(user, "You insert the power cell.")
	update_icon()

/obj/item/weapon/spectoys/stack
	name = "stack"
	desc = "Rubber fly swatter. Yes, you hope it`s fly swatter."
	icon_state = "stack"
	item_state = "nullrod" //we realy need some sprite here
	var/agonyforce = 1

/obj/item/weapon/spectoys/stack/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(isrobot(target))
		return ..()

	var/agony = agonyforce
	var/obj/item/organ/external/affecting = null
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		affecting = H.get_organ(hit_zone)
	var/abuser =  user ? "" : "by [user]"
	if(affecting)
		target.visible_message("<span class='danger'>[target] has been slaped in the [affecting.name] with [src]!</span>")
	else
		target.visible_message("<span class='danger'>[target] has been slaped with [src][abuser]!</span>")
		playsound(loc, 'sound/weapons/slap.ogg', 50, 1, -1)


	target.stun_effect_act(0, agony, hit_zone, src)

	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		H.forcesay(GLOB.hit_appends)

	return 0


/obj/item/weapon/reagent_containers/spray/lube
	name = "pink lube dispenser"
	desc = "A spray bottle, with an unscrewable top."
	icon = 'icons/obj/spectoys.dmi'
	icon_state = "spray_lube"
	amount_per_transfer_from_this = 5
	possible_transfer_amounts = "1;2"
	spray_size = 1
	spray_sizes = list(1,1)
	step_delay = 15
	volume = 15

//Work clothing

/obj/item/clothing/mask/muzzle/gag
	name = "gag"
	desc = "Just a small red gag."
	icon = 'icons/obj/clothing/infinity/masks.dmi'
	item_icons = list(slot_wear_mask_str = 'icons/mob/infinity/masks.dmi')
	icon_state = "gag"
	item_state = "gag"

/obj/item/clothing/under/resomi/maid
	name = "maid suit"
	desc = "Looks like it made with both latex and textile..."
	icon_state = "resomi_maid"
	item_state = "resomi_maid"

/obj/item/clothing/under/resomi/dildo
	name = "Strap-on"
	desc = "This one looks pretty... Small for common humanoid."
	icon_state = "dildo"
	item_state = "dildo"

//Work storage

/obj/item/weapon/storage/secure/briefcase/pink
	name = "pink brifcase"
	desc = "Just pink edition."
	icon = 'icons/infinity_custom_items_obj.dmi'
	icon_state = "pink_case"
	New()
		..()
		new /obj/item/weapon/spectoys(src)
		new /obj/item/weapon/spectoys/stack(src)
		new /obj/item/weapon/spectoys/vibrator(src)
		new /obj/item/weapon/handcuffs/plush(src)
		new /obj/item/weapon/reagent_containers/spray/lube(src)
		new /obj/item/clothing/mask/muzzle/gag(src)
		new /obj/item/clothing/under/resomi/maid(src)
		new /obj/item/clothing/under/resomi/dildo(src)
		new /obj/item/clothing/gloves/latex/modified(src)
