/mob/living
	var/lisp = 0

/mob/living/proc/handle_lisp()
	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		var/obj/item/organ/external/head/O = H.get_organ(BP_HEAD)
		if(O)
			if(!O.teeth_list.len || O.get_teeth() <= 0)
				lisp = 100 //No teeth = full lisp power
			else
				lisp = (1 - (O.get_teeth()/O.max_teeth)) * 100 //Less teeth = more lisp
		else
			lisp = 0 //No head = no lisp.
	return lisp

/proc/lisp(phrase, intensity = 100) //Intensity = how hard will the dude be lisped
	phrase = html_decode(phrase)
	if(prob(intensity)) phrase = replacetext(phrase, "ï", "ô-ô")
	if(prob(intensity)) phrase = replacetext(phrase, "Ï", "Ô-ô")

	if(prob(intensity)) phrase = replacetext(phrase, "ç", "ñ-õ")
	if(prob(intensity)) phrase = replacetext(phrase, "Ç", "Ñ-õ")

	if(prob(intensity)) phrase = replacetext(phrase, "ê","ã-õ")
	if(prob(intensity)) phrase = replacetext(phrase, "Ê","Ã-õ")

	if(prob(intensity)) phrase = replacetext(phrase, "÷", "ù-ù")
	if(prob(intensity)) phrase = replacetext(phrase, "×", "Ù-ù")

	if(prob(intensity)) phrase = replacetext(phrase, "æ", "ø-ø")
	if(prob(intensity)) phrase = replacetext(phrase, "Æ", "Ø-ø")

	return sanitize_a0(phrase)

/obj/item/organ/external/head
	var/list/teeth_list = list()
	var/max_teeth = 32

/mob/living/carbon/human/proc/add_teeth()
	var/obj/item/organ/external/head/U = get_organ(BP_HEAD)
	if(istype(U))
		U.teeth_list.Cut() //Clear out their mouth of teeth
		var/obj/item/stack/teeth/T = new species.teeth_type(U)
		U.max_teeth = T.max_amount //Set max teeth for the head based on teeth spawntype
		T.amount = T.max_amount
		U.teeth_list += T

/obj/item/organ/external/head/proc/get_teeth() //returns collective amount of teeth
	var/amt = 0
	if(!teeth_list) teeth_list = list()
	for(var/obj/item/stack/teeth in teeth_list)
		amt += teeth.amount
	return amt

/obj/item/organ/external/head/proc/knock_out_teeth(throw_dir, num = 32) //Won't support knocking teeth out of a dismembered head or anything like that yet.
	num = Clamp(num, 1, 32)
	var/done = 0
	if(teeth_list && teeth_list.len) //We still have teeth
		var/stacks = rand(1,3)
		for(var/curr = 1 to stacks) //Random amount of teeth stacks
			var/obj/item/stack/teeth/teeth = pick(teeth_list)
			if(!teeth || teeth.zero_amount()) return //No teeth left, abort!
			var/drop = round(min(teeth.amount, num)/stacks) //Calculate the amount of teeth in the stack
			var/obj/item/stack/teeth/T = new teeth.type(owner.loc, drop)
			teeth.use(drop)
			T.add_blood(owner)
			playsound(owner, GLOB.trauma_sound, 75, 0, -2)
			var/turf/target = get_turf(owner.loc)
			var/range = rand(1, 3)
			for(var/i = 1; i < range; i++)
				var/turf/new_turf = get_step(target, throw_dir)
				target = new_turf
				if(new_turf.density)
					break
			T.throw_at(get_edge_target_turf(T,pick(GLOB.alldirs)),rand(1,3),30)
			T.loc:add_blood(owner)

			teeth.zero_amount() //Try to delete the teeth
			done = 1
	return done

/obj/item/stack/teeth
	name = "teeth"
	singular_name = "tooth"
	w_class = 1
	force = 0
	throwforce = 0
	max_amount = 32
	gender = PLURAL
	desc = "Welp. Someone had their teeth knocked out."
	icon = 'infinity/icons/obj/surgery.dmi'
	icon_state = "tooth1"

/obj/item/stack/teeth/Initialize()
	. = ..()
	icon_state = "tooth[rand(1,3)]"

/obj/item/stack/teeth/human
	name = "human teeth"
	singular_name = "human tooth"

/obj/item/stack/teeth/generic //Used for species without unique teeth defined yet
	name = "teeth"

/obj/item/stack/proc/zero_amount()
	if(amount < 1)
		qdel(src)
		return 1
	return 0
