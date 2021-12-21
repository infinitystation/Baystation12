GLOBAL_DATUM_INIT(renegades, /datum/antagonist/renegade, new)

/datum/antagonist/renegade
	role_text = "Renegade"
	role_text_plural = "Renegades"
	blacklisted_jobs = list(/datum/job/ai, /datum/job/submap, /datum/job/cyborg)
	restricted_jobs = list(/datum/job/officer, /datum/job/warden, /datum/job/captain, /datum/job/hop, /datum/job/hos, /datum/job/chief_engineer, /datum/job/rd, /datum/job/cmo)
	welcome_text = "Сегодня что-то пойдет не так, ты чувствуешь это. Ты параноик, у тебя есть оружие, и ты собираешься выжить."
	antag_text = "Ты <b>небольшой</b> антагонист! В рамках правил, \
	постарайся защитить себя и то, что для тебя важно. Ты здесь <i>не для того,</i> чтобы создавать неприятности, \
		ты просто готов (и снаряжен) пойти на крайности, чтобы <b>остановить</b> их. \
		Ваша задача - противостоять другим антагонистам, если они будут угрожать вам, не совсем законными способами. \
		Постарайтесь убедиться, что <i>другие игроки наслаждаются игрой</i>! Если вы запутались или растерялись, всегда пишите в adminhelp, \
		и прежде чем предпринимать крайние меры, пожалуйста, постарайтесь также связаться с администрацией! \
		Продумайте свои действия и сделайте ролевую игру захватывающей! <b>Пожалуйста помните, что \
		все правила, кроме тех, которые содержат явные исключения, применяются к антагонистам.</b>"

	id = MODE_RENEGADE
	flags = ANTAG_SUSPICIOUS | ANTAG_IMPLANT_IMMUNE | ANTAG_RANDSPAWN | ANTAG_VOTABLE
	hard_cap = 3
	hard_cap_round = 5

	initial_spawn_req = 1
	initial_spawn_target = 3
	antaghud_indicator = "hud_renegade"
	skill_setter = /datum/antag_skill_setter/station

	var/list/spawn_guns = list(
		/obj/item/gun/energy/retro,
		/obj/item/gun/energy/gun,
		/obj/item/gun/energy/crossbow,
		/obj/item/gun/energy/pulse_rifle/pistol,
		/obj/item/gun/projectile/automatic,
		/obj/item/gun/projectile/automatic/machine_pistol,
		/obj/item/gun/projectile/automatic/sec_smg,
		/obj/item/gun/projectile/pistol/magnum_pistol,
		/obj/item/gun/projectile/pistol/military,
		/obj/item/gun/projectile/pistol/military/alt,
		/obj/item/gun/projectile/pistol/sec/lethal,
		/obj/item/gun/projectile/pistol/holdout,
		/obj/item/gun/projectile/revolver,
		/obj/item/gun/projectile/revolver/medium,
		/obj/item/gun/projectile/shotgun/doublebarrel/sawn,
		/obj/item/gun/projectile/pistol/magnum_pistol,
		/obj/item/gun/projectile/revolver/holdout,
		/obj/item/gun/projectile/pistol/throwback,
		/obj/item/gun/energy/xray/pistol,
		/obj/item/gun/energy/toxgun,
		/obj/item/gun/energy/incendiary_laser,
		/obj/item/gun/projectile/pistol/magnum_pistol
		)
	ambitious = 0 //INF

/datum/antagonist/renegade/create_objectives(var/datum/mind/player)

	if(!..())
		return

	var/datum/objective/survive/survive = new
	survive.owner = player
	player.objectives |= survive

/datum/antagonist/renegade/equip(var/mob/living/carbon/human/player)

	if(!..())
		return

	var/gun_type = pick(spawn_guns)
	if(islist(gun_type))
		gun_type = pick(gun_type)
	var/obj/item/gun = new gun_type(get_turf(player))

	// Attempt to put into a container.
	if(player.equip_to_storage(gun))
		return

	// If that failed, attempt to put into any valid non-handslot
	if(player.equip_to_appropriate_slot(gun))
		return

	// If that failed, then finally attempt to at least let the player carry the weapon
	player.put_in_hands(gun)


/proc/rightandwrong()
	to_chat(usr, "<B>You summoned guns!</B>")
	message_admins("[key_name_admin(usr, 1)] summoned guns!")
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H.stat == 2 || !(H.client)) continue
		if(is_special_character(H)) continue
		GLOB.renegades.add_antagonist(H.mind)
