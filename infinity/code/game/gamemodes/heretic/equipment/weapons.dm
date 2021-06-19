/obj/item/melee/cult_spear
	name = "blood halberd"
	desc = "A sickening spear composed entirely of crystallized blood."
	icon_state = "bloodspear0"
	item_state = "bloodspear0"
	icon = 'infinity/icons/obj/cult.dmi'
	slot_flags = SLOT_BACK
	force = 17
	throwforce = 40
	throw_speed = 2
	armor_penetration = 30
	attack_verb = list("attacked", "impaled", "stabbed", "torn")

	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/items/lefthand.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/items/righthand.dmi',
		)

	hitsound = 'sound/weapons/bladeslice.ogg'

	sharp = 1
	edge = 1

	var/mob/living/owner

/obj/item/melee/cult_spear/proc/recall()
	if(owner == src.loc)
		return
	var/ST = get_turf(src)
	var/OT = get_turf(owner)
	if(get_dist(OT, ST) > 10)
		to_chat(owner,"<span class='cult'>The spear is too far away for it to return back to you!</span>")
	else
		if(isliving(src.loc))
			var/mob/living/L = src.loc
			L.unEquip(src)
			L.visible_message("<span class='warning'>An unseen force pulls [src] from [L]'s hands!</span>")
		src.throw_at(owner, 10, 2, owner)

/obj/item/melee/cult_spear/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	var/turf/T = get_turf(hit_atom)
	if(isliving(hit_atom))
		var/mob/living/L = hit_atom
		if(iscultist(L))
			playsound(src, 'sound/weapons/throwtap.ogg', 50)
			if(L.put_in_active_hand(src))
				L.visible_message("<span class='warning'>[L] catches [src] out of the air!</span>")
			else
				L.visible_message("<span class='warning'>[src] bounces off of [L], as if repelled by an unseen force!</span>")
		else if(!..())
			L.Weaken(5)
			break_spear(T)
	else
		recall()
		. = ..()

/obj/item/melee/cult_spear/proc/break_spear(turf/T)
	if(src)
		if(!T)
			T = get_turf(src)
		if(T)
			T.visible_message("<span class='warning'>[src] shatters and melts back into blood!</span>")
			new /obj/effect/decal/cleanable/blood/splatter(T)
			playsound(T, 'sound/effects/glassbr3.ogg', 100)
	qdel(src)

/obj/item/melee/cult_spear/update_twohanding()
	var/mob/living/M = loc
	if(istype(M) && is_held_twohanded(M))
		icon_state = "bloodspear1"
		item_state = "bloodspear1"
		if(owner != M)
			force = 18
			throwforce = 25
		else
			force = 24
			throwforce = 40
	else
		icon_state = "bloodspear0"
		item_state = "bloodspear0"
		if(owner != M)
			force = 10
			throwforce = 25
		else
			force = 17
			throwforce = 40

	update_icon()

/obj/item/melee/cult_spear/dropped()
	force = 17
	throwforce = 40

/obj/item/melee/cult_spear/pickup(mob/living/user as mob)
	if(iscultist(user))
		if(!owner)
			owner = user
		if(owner != user)
			to_chat(user,"<span class='cult'>You can hold the spear, but you feel how it weakens without being nearby it's real owner...</span>")
			force = 10 //Becomes really weak, you should not use other's spears
			throwforce = 25
		else
			force = 17
			throwforce = 40
		update_twohanding()
	else
		user.unEquip(src)
		recall()
		to_chat(user, SPAN_WARNING("An unseen force suddenly rips [src] out of your hands!"))

/obj/item/shield/mirror
	name = "mirror shield"
	desc = "An infamous shield used by Nar'Sien sects to confuse and disorient their enemies. Its edges are weighted for use as a throwing weapon - capable of disabling multiple foes with preternatural accuracy."
	icon_state = "mirror_shield"
	icon = 'infinity/icons/obj/cult.dmi'
	slot_flags = SLOT_BACK
	force = 5
	throwforce = 15
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_HUGE
	attack_verb = list("bumped", "prodded")

	item_icons = list(
		slot_l_hand_str = 'infinity/icons/mob/onmob/items/lefthand.dmi',
		slot_r_hand_str = 'infinity/icons/mob/onmob/items/righthand.dmi',
		)

	hitsound = 'sound/weapons/smash.ogg'

	var/illusions = 3

/obj/item/shield/mirror/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack") //Nar'Sien shield is special and magic, you can block while lying on the ground
	if(iscultist(user) || (user.mind in GLOB.godcult.current_antagonists))
		if(istype(damage_source, /obj/item/projectile))
			var/obj/item/projectile/P = damage_source
			if(P.damage_type == BRUTE || P.damage_type == BURN)
				if(P.damage >= 60) //Slugs and very heavy weaponery will just stun cultist
					var/turf/T = get_turf(user)
					T.visible_message("<span class='warning'>The sheer force from [P] shatters the mirror shield!</span>")
					playsound(T, 'sound/effects/glassbr3.ogg', 100)
					user.Weaken(2.5)
					qdel(src)
					return FALSE
		. = ..()
		if(.)
			playsound(src, 'sound/weapons/punchmiss.ogg', 100, TRUE)
			if(illusions > 0)
				illusions--
				addtimer(CALLBACK(src, .proc/readd), 450)
				if(prob(60))
					var/mob/living/simple_animal/hostile/illusion/M = new(user.loc)
					M.faction = list("cult")
					M.Copy_Parent(user, 70, 10, 5)
				else
					var/mob/living/simple_animal/hostile/illusion/escape/E = new(user.loc)
					E.Copy_Parent(user, 70, 10)
					E.target_mob = user
			return TRUE
	else
		if(prob(50))
			var/mob/living/simple_animal/hostile/illusion/H = new(user.loc)
			H.Copy_Parent(user, 100, 20, 5)
			H.faction = list("cult")
			H.target_mob = user
			to_chat(user, "<span class='danger'><b>[src] betrays you!</b></span>")
		return FALSE

/obj/item/shield/mirror/proc/readd()
	illusions++
	if(illusions == initial(illusions) && isliving(loc))
		var/mob/living/holder = loc
		to_chat(holder, "<span class='cult italic'>The shield's illusions are back at full strength!</span>")


/obj/item/shield/mirror/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	var/turf/T = get_turf(hit_atom)
	var/datum/thrownthing/D = throwingdatum
	if(isliving(hit_atom))
		var/mob/living/L = hit_atom
		if(iscultist(L) || (L.mind in GLOB.godcult.current_antagonists))
			playsound(src, 'sound/weapons/throwtap.ogg', 50)
			if(L.put_in_active_hand(src))
				L.visible_message("<span class='warning'>[L] catches [src] out of the air!</span>")
			else
				L.visible_message("<span class='warning'>[src] bounces off of [L], as if repelled by an unseen force!</span>")
		else if(!..())
			L.Weaken(3)
			if(D?.thrower)
				for(var/mob/living/Next in orange(2, T))
					if(!Next.density || iscultist(Next))
						continue
					throw_at(Next, 3, 1, D.thrower)
					return
				throw_at(D.thrower, 7, 1, null)
	else
		..()

/obj/item/melee/cultblade
	name = "cult blade"
	desc = "An arcane weapon wielded by the followers of Nar-Sie."
	icon = 'infinity/icons/obj/cult.dmi'
	icon_state = "cultblade"
	item_state = "cultblade"
	edge = 1
	sharp = 1
	w_class = ITEM_SIZE_LARGE
	force = 30
	throwforce = 10
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/melee/cultblade/ghost
	name = "eldritch longsword"
	force = 19
	anchored = TRUE
	canremove = 0

/obj/item/melee/cultblade/ghost/dropped(mob/user)
	. = ..()
	qdel(src)

/obj/item/melee/cultblade/attack(mob/living/M, mob/living/user, var/target_zone)
	if(iscultist(user) || (user.mind in GLOB.godcult.current_antagonists))
		return ..()

	var/zone = (user.hand ? BP_L_ARM : BP_R_ARM)

	var/obj/item/organ/external/affecting = null
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		affecting = H.get_organ(zone)

	if(affecting)
		to_chat(user, "<span class='danger'>An unexplicable force rips through your [affecting.name], tearing the sword from your grasp!</span>")
	else
		to_chat(user, "<span class='danger'>An unexplicable force rips through you, tearing the sword from your grasp!</span>")

	//random amount of damage between half of the blade's force and the full force of the blade.
	user.apply_damage(rand(force/2, force), BRUTE, zone, (DAM_SHARP|DAM_EDGE), armor_pen = 100)
	user.Weaken(5)

	if(user.unEquip(src))
		throw_at(get_edge_target_turf(src, pick(GLOB.alldirs)), rand(1,3), throw_speed)

	var/spooky = pick('sound/hallucinations/growl1.ogg', 'sound/hallucinations/growl2.ogg', 'sound/hallucinations/growl3.ogg', 'sound/hallucinations/wail.ogg')
	playsound(loc, spooky, 50, 1)

	return 1

/obj/item/melee/cultblade/pickup(mob/living/user as mob)
	if(!iscultist(user))
		to_chat(user, "<span class='warning'>An overwhelming feeling of dread comes over you as you pick up the cultist's sword. It would be wise to be rid of this blade quickly.</span>")
		user.make_dizzy(120)

/obj/item/melee/cultblade/dagger
	name = "ritual dagger"
	desc = "A strange dagger said to be used by sinister groups for \"preparing\" a corpse before sacrificing it to their dark gods."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "render"
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	force = 15
	throwforce = 10
	armor_penetration = 35

/obj/item/melee/cultblade/dagger/afterattack(var/mob/living/carbon/human/M, var/mob/living/carbon/human/user)
	if(!istype(M) || !istype(user))
		return
	for(var/datum/active_effect/cult_tattoo/tattoo in user.active_effects)
		if(istype(tattoo, /datum/active_effect/cult_tattoo/dagger))
			if(M.should_have_organ(BP_HEART) && M.vessel && M.vessel.has_reagent(/datum/reagent/blood, 15) && user.should_have_organ(BP_HEART) && user.vessel)
				M.vessel.remove_reagent(/datum/reagent/blood, 15)
				user.vessel.add_reagent(/datum/reagent/blood, 15)
			break

/obj/item/melee/cultbastard
	name = "bloody bastard sword"
	desc = "An eldritch sword used by Nar'Sien cultists to rapidly harvest the souls of non-believers. Use it on construct shells to put souls incide."
	icon = 'infinity/icons/obj/cult.dmi'
	icon_state = "cultbastard"
	item_state = "cultbastard"
	edge = 1
	sharp = 1
	w_class = ITEM_SIZE_LARGE
	force = 23 //Weaker since balance. It allows you to suck bodies and teleport
	throwforce = 20
	throw_speed = 1
	throw_range = 3
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("cleaved", "slashed", "tore", "lacerated", "hacked", "ripped", "diced", "carved")

	var/dash_toggled = TRUE
	var/dashcooldown = 0

/obj/item/melee/cultbastard/examine(mob/user)
	. = ..()
	if(contents.len)
		. += "<b>There are [contents.len] souls trapped within the sword's core.</b>"
	else
		. += "The sword appears to be quite lifeless."

/obj/item/melee/cultbastard/pickup(mob/living/user)
	. = ..()
	if(!iscultist(user))
		to_chat(user, FONT_LARGE("<span class='cult italic'>\"I wouldn't advise that.\"</span>"))
		force = 5
		return
	force = initial(force)

/obj/item/melee/cultbastard/afterattack(var/atom/A, var/mob/user, var/proximity)
	if(!iscultist(user))
		return

	if(dash_toggled && !proximity)
		if(dashcooldown > world.time)
			return
		dashcooldown = world.time + 10 SECONDS //Pretty long cooldown

		var/obj/effect/temporary/effect = new(get_turf(user), 8, 'infinity/icons/effects/effects.dmi', "cultout")
		effect.dir = user.dir

		user.forceMove(get_turf(A))

		var/obj/effect/temporary/effect2 = new(get_turf(user), 8, 'infinity/icons/effects/effects.dmi', "cultin")
		effect2.dir = user.dir
		playsound(get_turf(user), 'sound/effects/phasein.ogg', 25, TRUE)
		playsound(get_turf(user), "sparks", 50, TRUE)
		return

	if(proximity)
		if(ishuman(A))
			var/mob/living/carbon/human/H = A
			if(H.stat != CONSCIOUS)
				var/obj/item/device/soulstone/heretic/SS = new(src)
				SS.attack(H, user)
				if(!SS.full)
					qdel(SS)
				user.visible_message(SPAN_WARNING("[user] attacks [H] with [src], and it suddenly sucks the [H]'s soul incide!"))
				return
		if(istype(A, /obj/structure/constructshell) && contents.len)
			var/obj/item/device/soulstone/SS = contents[1]
			if(istype(SS))
				SS.attack(A, user)
	. = ..()

/obj/item/melee/cultbastard/attack_self(mob/user)
	dash_toggled = !dash_toggled
	if(dash_toggled)
		to_chat(loc, "<span class='notice'>You raise [src] and prepare to jaunt with it.</span>")
	else
		to_chat(loc, "<span class='notice'>You lower [src] and prepare to swing it normally.</span>")
