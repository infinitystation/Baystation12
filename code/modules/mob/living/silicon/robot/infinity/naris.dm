/mob/living/silicon/robot/custom/naris
	name = "E.P.D #NARIS"
	real_name = "E.P.D #NARIS"
	custom_name = "E.P.D #NARIS"

	icon_state = "naris"

	lawupdate = 0
	scrambledcodes = 1

	laws = /datum/ai_laws/empty
	module = /obj/item/weapon/robot_module/naris
	idcard = /obj/item/weapon/card/id/engineering
	silicon_radio = /obj/item/device/radio/borg/naris

	var/obj/item/device/pmp/mounted/player
	var/last_sound_time = -1

	var/list/cust_sounds = list(
			"Sirene" = "sirene",
			"Scan1" = "scan1",
			"Scan2" = "scan2",
			"Scan3" = "scan3",
			"Blip" = "blip",
			"Chatter" = "chatter",
			"Call" = "call")

/mob/living/silicon/robot/custom/naris/New()
	..()
	player = new /obj/item/device/pmp/mounted(src)
		player.Initialize()
		
/mob/living/silicon/robot/custom/naris/proc/check_cassette()
	if (player != null)
		return (player.cassette != null)

/mob/living/silicon/robot/custom/naris/attackby(obj/item/W, mob/user)
	if (istype(W,/obj/item/device/cassette))
		if (check_cassette())
			to_chat(user, "<span class='notice'>Cassete already installed.</span>")
		else
			user.unEquip(W)
			W.forceMove(player)
			player.cassette = W
			to_chat(user, "<span class='notice'>You insert cassete to [name].</span>")
			to_chat(src, "<span class='notice'>[user] puts something in your slot.</span>")
	else 
		..()
		
/mob/living/silicon/robot/custom/naris/verb/toggle_playing()
	set category = "Sound"
	set name = "Toggle mediatronic"
	player.attack_self()

/mob/living/silicon/robot/custom/naris/verb/eject_cassette()
	set category = "Sound"
	set name = "Eject cassette"
	if (check_cassette())
		player.eject()
	else
		to_chat(src, "<span class='warning'>You dont have cassette.</span>")

/mob/living/silicon/robot/custom/naris/verb/play_custom_sound()
	set category = "Sound"
	set name = "Play Custom Sound"

	if (last_sound_time != -1 && world.time < last_sound_time + 1 SECONDS)
		return
	last_sound_time = world.time
	var/snd =  input("Sound", "Sound", null, null) as null|anything in cust_sounds
	if (snd != null)
		playsound(get_turf(src), "sound/voice/naris_" + cust_sounds[snd] + ".ogg", 30, 1)

/obj/item/device/radio/borg/naris
	keyslot = /obj/item/device/encryptionkey/headset_eng

/obj/item/device/pmp/mounted
	name = "mounted media player"
	desc = "..."

/obj/item/device/pmp/mounted/New(mob/living/silicon/robot/custom/master)
	cell = master.cell
