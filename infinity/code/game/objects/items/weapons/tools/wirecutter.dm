/mob/living
	var/doing_something = 0 // Like pulling teeth?

/obj/item/weapon/wirecutters/attack(mob/living/carbon/C as mob, mob/living/user as mob)
	//Tearing out teeth
	if(ishuman(C) && user.zone_sel.selecting == BP_MOUTH)
		var/mob/living/carbon/human/H = C
		var/obj/item/organ/external/head/O = H.get_organ(BP_HEAD)
		if(!O || !O.get_teeth())
			to_chat(user, "<span class='notice'>[H] doesn't have any teeth left!</span>")
			return
		if(!user.doing_something)
			user.doing_something = 1
			H.visible_message("<span class='danger'>[user] tries to tear off [H]'s tooth with [src]!</span>",
								"<span class='danger'>[user] tries to tear off your tooth with [src]!</span>")
			if(do_after(user, 50))
				if(!O || !O.get_teeth()) return
				var/obj/item/stack/teeth/E = pick(O.teeth_list)
				if(!E || E.zero_amount()) return
				var/obj/item/stack/teeth/T = new E.type(H.loc, 1)
				E.use(1)
				T.add_blood(H)
				E.zero_amount() //Try to delete the teeth
				H.visible_message("<span class='danger'>[user] tears off [H]'s tooth with [src]!</span>",
								"<span class='danger'>[user] tears off your tooth with [src]!</span>")

				H.apply_damage(rand(1, 3), BRUTE, O)
				H.custom_pain("[pick("OH GOD YOUR MOUTH HURTS SO BAD!", "OH GOD WHY!", "OH GOD YOUR MOUTH!")]", 100, affecting = O)

				playsound(H, 'infinity/sound/effects/gore/trauma3.ogg', 40, 1, -1) //And out it goes.

				user.doing_something = 0
			else
				to_chat(user, "<span class='notice'>Your attempt to pull out a tooth fails...</span>")
				user.doing_something = 0
				return
		else
			to_chat(user, "<span class='notice'>You are already trying to pull out a tooth!</span>")
		return
	else
		..()

/obj/item/weapon/wirecutters/power
	name = "jaws of life"
	desc = "A set of jaws of life, compressed through the magic of science. It's fitted with a cutting head."
	icon = 'infinity/icons/obj/items.dmi'
	icon_state = "jaws_cutter"
	item_state = "jawsoflife"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BELT
	force = 15.0
	throwforce = 10.0
	throw_speed = 2.0
	throw_range = 2.0
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 2, TECH_ENGINEERING = 3)
	matter = list(DEFAULT_WALL_MATERIAL = 5000, "silver" = 2000)
	center_of_mass = "x=18;y=10"
	attack_verb = list("pinched", "nipped")
	sharp = 1
	edge = 1
	//usesound = 'sound/items/jaws_cut.ogg'

/obj/item/weapon/wirecutters/power/attack_self(mob/user)
	playsound(get_turf(user), 'infinity/sound/items/change_jaws.ogg', 50, 1)
	var/obj/item/weapon/crowbar/power/pryjaws = new /obj/item/weapon/crowbar/power
	to_chat(user, "<span class='notice'>You attach the pry jaws to [src].</span>")
	qdel(src)
	user.put_in_active_hand(pryjaws)

/obj/item/weapon/wirecutters/power/Initialize()
	. = ..()
	icon_state = "jaws_cutter"
	color = "#ffffff"
