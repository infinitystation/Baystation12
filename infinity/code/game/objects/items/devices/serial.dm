//WARNING: SHITCODE AHEAD

/obj/item/device/serial
	name = "serial number scanner"
	desc = "Special device issued to security that allows to recognize weapons serial numbers."
	icon = 'icons/obj/device.dmi'
	icon_state = "forensic0-old"
	var/istate_idle = "forensic0-old"
	var/istate_scan = "forensic1-old"

/obj/item/device/serial/resolve_attackby(var/obj/item/gun/G, var/mob/living/user)
	..() //my fault, now it should work
	if(G.serial)
		to_chat(user, "<span class='notice'>[G]'s serial number: [G.serial]</span>")
		icon_state = istate_scan
		sleep(5)
		icon_state = istate_idle
		playsound(src.loc, 'sound/effects/scanbeep.ogg', 100, 1)
	else
		to_chat(user, "<span class='notice'>[G] doesn't has any serial number!</span>")
