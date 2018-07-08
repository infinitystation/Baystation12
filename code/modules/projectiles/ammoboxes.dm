/obj/item/ammobox
	name = "ammobox"
	desc = "Just big box... with ammo casings."
	icon = 'icons/obj/ammoboxes.dmi'
	icon_state = "ammobox"

	var/caliber = "357"
	var/ammo_type = /obj/item/ammo_casing/a357
	var/max_ammo = 50
	var/uses = 50
	var/status = 0
	var/is_process = 0

/obj/item/ammobox/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (is_process)
		to_chat(user, "<span class='warning'>[src] is busy.</span>")
		return
	if(istype(W, /obj/item/ammo_magazine))
		is_process = 1
		var/obj/item/ammo_magazine/M = W
		if (status == 0)
			if(M.caliber != caliber)
				to_chat(user, "<span class='warning'>Invalid caliber.</span>")
				is_process = 0
				return
			if (uses == 0)
				to_chat(user, "<span class='warning'>Box is empty.</span>")
				is_process = 0
				return
			if(M.stored_ammo.len >= M.max_ammo)
				to_chat(user, "<span class='warning'>[M] is full.</span>")
				is_process = 0
				return
			while ((M.max_ammo - M.stored_ammo.len > 0) && (uses != 0))
				if (do_after(user, 3, src))
					playsound(get_turf(user), 'sound/weapons/guns/interaction/bullet_insert.ogg', 50, 1)
					M.stored_ammo.Add(new ammo_type)
					M.update_icon()
					uses -= 1
				else 
					is_process = 0
					return
			if (uses == 0)
				to_chat(user, "<span class='warning'>[src] is empty now!</span>")
			is_process = 0
			return
		else
			var/total_amount = max(max_ammo - uses, M.stored_ammo.len)
			while (total_amount != 0 && uses < max_ammo)
				if (do_after(user, 3, src))
					playsound(get_turf(user), 'sound/weapons/guns/interaction/bullet_insert.ogg', 50, 1)
					var/obj/item/ammo_casing/C = M.stored_ammo[M.stored_ammo.len]
					M.stored_ammo -= C
					qdel(C)
					total_amount -= 1
					uses += 1
					M.update_icon()
				else
					is_process = 0
					return		
			is_process = 0
			return

	if(istype(W, /obj/item/ammo_casing))
		var/obj/item/ammo_casing/C = W
		if(C.caliber != caliber)
			to_chat(user, "<span class='warning'>[C] does not fit into [src].</span>")
			return
		if(uses >= max_ammo)
			to_chat(user, "<span class='warning'>[src] is full!</span>")
			return
		playsound(get_turf(user), 'sound/weapons/guns/interaction/bullet_insert.ogg', 50, 1)
		user.remove_from_mob(C)
		qdel(C)
		uses += 1

/obj/item/ammobox/attack_hand(mob/user)
	if(user.get_inactive_hand() == src)
		if (uses != 0)
			playsound(get_turf(user), 'sound/weapons/guns/interaction/bullet_insert.ogg', 50, 1)
			user.put_in_hands(new ammo_type)
			uses -= 1
		else
			to_chat(user, "<span class='warning'>Box is empty.</span>")
	else
		..()

/obj/item/ammobox/attack_self(mob/user)
	if (!is_process)
		status = !status
	else
		to_chat(user, "<span class='warning'>[src] is busy.</span>")
