/obj/docking_port/proc/repair(var/mob/user, var/obj/item/I)
	if(!broke)
		return TRUE
	if(issilicon(user))
		if(!Adjacent(user))
			return
	if(!user.skill_check(SKILL_CONSTRUCTION, SKILL_EXPERT))
		to_chat(user, SPAN_NOTICE("The dock looks too complicated. The damage is too high to be repaired with your construction skills."))
		return
	if(repair_busy)
		return
	switch(repair_step)
		if(0)
			if(isWrench(I))
				repair_busy = TRUE
				user.visible_message("[user] untightens \the [src]'s fixating bolts.", "You untighten \the [src]'s fixating bolts.")
				playsound(src.loc, 'sound/items/Ratchet.ogg', 75, 1)
				if(!do_after(user, 7 SECONDS, src))
					repair_busy = FALSE
					return
				repair_busy = FALSE
				repair_step++
				to_chat(user, "You have finished untighting fixating bolts. Messed up interior shows up to you. Better remove all big broken parts with crowbar before continue.")
				return
		if(1)
			if(!user.get_active_hand())
				repair_busy = TRUE
				user.visible_message("[user] cautiously removes \the [src]'s hatch.", "You are removing \the [src]'s hatch.")
				playsound(src.loc, 'sound/effects/metalscrape3.ogg', 50, 1)
				if(!do_after(user, 4 SECONDS, src))
					repair_busy = FALSE
					return
				playsound(src.loc, 'sound/effects/bang.ogg', 80, 1)
				repair_busy = FALSE
				repair_step++
				to_chat(user, "You have removed \the [src]'s hatch.")
				remove_extension(src, /datum/extension/scent)
				set_extension(src, /datum/extension/scent/burned_wiring/strong)
				return
		if(2)
			if(!user.get_active_hand())
				repair_busy = TRUE
				user.visible_message("[user] removes some trash from \the [src] open panel", "You remove some trash from \the [src]'s interior.")
				playsound(src.loc, 'sound/effects/metalscrape2.ogg', 60, 1)
				if(!do_after(user, 12 SECONDS, src))
					repair_busy = FALSE
					return
				playsound(src.loc, 'sound/effects/metalhit.ogg', 80, 1)
				repair_busy = FALSE
				repair_step++
				to_chat(user, "You have removed pieces of metal, burned cables and cracked plastic from [src].")
				new /obj/item/weapon/material/shard/shrapnel(user.loc)
				new /obj/effect/decal/cleanable/molten_item(user.loc)
/* todo
				if(!ishuman(user))
					return
				var/mob/living/carbon/human/H = user
				var/sharp = 1
				if(istype(H.gloves, /obj/item/clothing/gloves))
					var/obj/item/clothing/gloves/GL = H.gloves
					if(GL.permeability_coefficient > 0.05)
						sharp = 0
				if(sharp && prob(50))
					if(ishuman(user))
						var/obj/item/organ/external/target_organ= pick(BP_L_HAND, BP_R_HAND)
						target_organ.take_external_damage(9, 0, DAM_SHARP, "shard")
						user.visible_message("[user] cuts \his hand with the trash!", "OUCH! You cut your hand! Wear gloves next time!")
*/
				return
		if(3)
			if(isWirecutter(I))
				repair_busy = TRUE
				user.visible_message("[user] cuts off burned out power cables from \the [src].", "You cut off burned out wiring in \the [src].")
				playsound(src.loc, 'sound/items/Wirecutter.ogg', 75, 1)
				if(!do_after(user, 3 SECONDS, src))
					repair_busy = FALSE
					return
				playsound(src.loc, 'sound/items/Deconstruct.ogg', 75, 1)
				repair_busy = FALSE
				repair_step++
				to_chat(user, "You have cut scorched power lines.")
				new /obj/item/stack/cable_coil/cut(user.loc)
				remove_extension(src, /datum/extension/scent)
				return
		if(4)
			if(isCoil(I))
				var/obj/item/stack/cable_coil/C = I
				repair_busy = TRUE
				user.visible_message("[user] replaced power lines in \the [src].", "You replace cables in \the [src].")
				if(C.get_amount() < 15)
					to_chat(user, "You need at least 15 cables to fix it.")
					return
//				shock(user, 66, 0.7) it's not machinery, the proc doesn't works :(
				playsound(src.loc, 'sound/effects/extin.ogg', 80, 1)
				if(!do_after(user, 9 SECONDS, src))
					repair_busy = FALSE
					return
				repair_busy = FALSE
				if(C.use(15))
					repair_step++
					to_chat(user, "You have replaced wiring.")
					playsound(src.loc, 'sound/items/Deconstruct.ogg', 75, 1)
				else
					to_chat(user, "You need at least 15 cables to fix it.")
				return
		if(5)
			if(istype(I, /obj/item/stack/material/steel))
				var/obj/item/stack/material/steel/S = I
				if(S.get_amount() < 8)
					to_chat(user, "You need at least 8 metal sheets to fix the dock.")
					return
				repair_busy = TRUE
				user.visible_message("[user] replaces broken metal platings in \the [src]'s interior.", "You replace broken metal plating in \the [src]'s interior.")
//				playsound(src.loc, 'sound/items/Welder.ogg', 60, 1)
				playsound(src.loc, 'sound/items/Deconstruct.ogg', 75, 1)
				if(!do_after(user, 12 SECONDS, src))
					repair_busy = FALSE
					return
				repair_busy = FALSE
				if(S.use(8))
					repair_step++
					to_chat(user, "You have replaced plating.")
					playsound(src.loc, 'sound/effects/metalhit.ogg', 80, 1)
				else
					to_chat(user, "You need at least 8 metal sheets to fix the dock.")
				return
		if(6 to 8)
			if(isWelder(I))
				var/obj/item/weapon/weldingtool/WT = I
				if(!WT.remove_fuel(4, user))
					to_chat(user, SPAN_WARNING("\The [src] must be on to complete this task."))
					return
				repair_busy = TRUE
				user.visible_message("[user] welds something in \the [src]'s interior.", "You are fixing \the [src]'s interior metal components.")
				playsound(src.loc, 'sound/items/Welder.ogg', 60, 1)
				if(!do_after(user, 6 SECONDS, src))
					repair_busy = FALSE
					return
				repair_busy = FALSE
				if(repair_step == 8)
					to_chat(user, "You have repaired all broken metal components.")
				else
					to_chat(user, "You have fixed some damage. Continue fixing.")
				repair_step++
				return
		if(9)
			if(!user.get_active_hand())
				repair_busy = TRUE
				user.visible_message("[user] puts back \the [src]'s hatch.", "You put back \the [src]'s hatch.")
				if(!do_after(user, 4 SECONDS, src))
					repair_busy = FALSE
					return
				playsound(src.loc, 'sound/effects/metalscrape3.ogg', 50, 1)
				repair_busy = FALSE
				repair_step++
				to_chat(user, "You have resecured \the [src]'s hatch in place.")
				return
		if(10)
			if(isWrench(I))
				repair_busy = TRUE
				user.visible_message("[user] tightens \the [src]'s bolts.", "You tighten \the [src]'s bolts.")
				playsound(src.loc, 'sound/items/Ratchet.ogg', 75, 1)
				if(!do_after(user, 7 SECONDS, src))
					repair_busy = FALSE
					return
				repair_busy = FALSE
				repair_step = 0
				user.visible_message("[user] resecured \the [src]'s bolts. The docking port was repaired.", "You secured \the [src]'s bolts. The docking port was repaired.")
				broke = FALSE
				icon_state = "dock_contracted"
				return
