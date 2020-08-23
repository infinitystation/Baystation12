/obj/item/weapon/book/tome
	name = "arcane tome"
	icon = 'infinity/icons/obj/cult.dmi'
	icon_state = "tome"
	throw_speed = 1
	throw_range = 5
	w_class = 2
	unique = 1
	carved = 2 // Don't carve it

	var/opened = FALSE

/obj/item/weapon/book/tome/Initialize()
	. = ..()
	flick("tome_spawn", src)

/obj/item/weapon/book/tome/examine(mob/user)
	. = ..()
	if(!opened)
		if(!iscultist(user))
			to_chat(user, "An old, dusty tome with frayed edges and a sinister looking cover.")
		else
			to_chat(user, "<span class='cult italic'>The scriptures of Nar-Sie, The One Who Sees, The Geometer of Blood. Contains the details of every ritual his followers could think of. Most of these are useless, though. You can use it in-hand to search in it for some spells</span>")
	else
		if(!iscultist(user))
			to_chat(user, "\The [src] seems full of illegible scribbles. Is this a joke?")
			to_chat(user, SPAN_DANGER("\The [src] suddenly closes on your fingers as it starts to glow in sinister-red!"))
			user.Weaken(2)
			user.Stun(1)
			flick("tome_stun[opened]", src)
			user.unEquip(src)
			opened = FALSE
			icon_state = "tome"
			return
		show_guide(user)



/obj/item/weapon/book/tome/afterattack(var/atom/A, var/mob/user, var/proximity)
	if(!proximity || !iscultist(user))
		return

	if(isliving(A))
		var/mob/living/L = A
		if(!iscultist(L))
			L.Weaken(2)
			L.Stun(1)
			flick("tome_stun[opened]", src)
			opened = FALSE
			icon_state = "tome"

	if(A.reagents && A.reagents.has_reagent(/datum/reagent/water/holywater))
		to_chat(user, "<span class='notice'>You unbless \the [A].</span>")
		var/holy2water = A.reagents.get_reagent_amount(/datum/reagent/water/holywater)
		A.reagents.del_reagent(/datum/reagent/water/holywater)
		A.reagents.add_reagent(/datum/reagent/water, holy2water)

	if(istype(A, /obj/structure/cult))
		var/obj/structure/cult/C = A
		C.anchored = !C.anchored
		to_chat(user, "<span class='notice'>You [C.anchored ? "" : "un"]secured [C] from the floor.</span>")

/obj/item/weapon/book/tome/attack_self(var/mob/user)
	if(!iscultist(user))
		to_chat(user, SPAN_DANGER("\The [src] suddenly heats up in your hands as it starts to glow in sinister-red!"))
		user.Weaken(2)
		user.Stun(1)
		flick("tome_stun[opened]", src)
		user.unEquip(src)
		opened = FALSE
		icon_state = "tome"
		return

	flick("tome_flick[opened]", src)
	if(opened)
		icon_state = "tome"
	else
		icon_state = "tome_open"
	opened = !opened

/obj/item/weapon/book/tome/proc/show_guide(var/mob/user)
	if(!iscultist(user))
		to_chat(user, "\The [src] seems full of illegible scribbles. Is this a joke?")
		return

	to_chat(user, "<span class='warning'>You start reading [src] and looking for any ancient words...</span>")

	icon_state = "tome_flick"
	if(!do_after(user, 27))
		icon_state = "tome"
		flick("tome_stun[opened]", src)
		opened = FALSE
		return
	icon_state = "tome_open"

	/*to_chat(user, "<span class='cult italic'>Looks like you can make some spells by carving ancient words on your flesh.\n\
											 The spell must be composed of 3 parts: \[Element\] \[Method\] \[Words Of Power\].\n\
											 You can have only one Element and Method, but unlimited amount of Words Of Power.\n\
											 For example, \"Stun Hand Mute\" carved in runic language will allow you to stun and mute an enemy with your hand.\n\
											 Every added Word Of Power will decrease the potency and the span of the spell if Element's type(Positive or negative) is the same as the Word.\n\
											 \"Mute Hand Stun\" will have much less longer stun, but mute effect will be more powerful.\n\
											 This way you can add negative Words to helpful spells to make them more powerful, but with a drawback.<span>")*/ //NOPE FUCKERS

	to_chat(user, "<span class='warning'>You have found some ancient words, but there is no translation! Probably you should try and test them...</span>")

	for(var/word_type in subtypesof(/datum/heretic_word))
		var/datum/heretic_word/word = new word_type
		to_chat(user, "<span class='cult italic'>[word.word]</span>")

	to_chat(user, "<span class='warning'>Also, you found some spells, that you can use. You need to cut them on your wrist with a ritual dagger(Use it in-hand)  and then activate.</span>")

	to_chat(user, "<span class='cult italic'>Wa'hag ra Ger'be'rah Nar'ene - your hand will stun and mute opponents</span>")
	to_chat(user, "<span class='cult italic'>Ya'za'nere Ger'be'rah - your hand will teleport everything you touch to one of the runes</span>")
	to_chat(user, "<span class='cult italic'>Khari'd Ger'be'rah - your hand will convert objects(This includes doors and cyborgs!)</span>")
	to_chat(user, "<span class='cult italic'>Khari'd De'erah Il'tarat - you will convert objects around you.</span>")
	to_chat(user, "<span class='cult italic'>Jab'a'rate Uba'rate - creates an EMP</span>")
	to_chat(user, "<span class='cult italic'>Tag'nerea Ger'be'rah - handcuffs whoever you touch</span>")
