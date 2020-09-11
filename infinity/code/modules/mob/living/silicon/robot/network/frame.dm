/obj/item/drone_frame
	name = "network drone frame"
	desc = "Used for centuries, this assembly has simple positronic matrix what decides what it will do using directive interpreter and sensor readings."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "migniter-d"
	matter = list(MATERIAL_STEEL = 1000)
	var/personal = 0 //This means it will have no access and have to be authorized manually (id swipe)
	var/done = 0 //Is access set?
	var/job_access = null // /datum/job/engineer //Access is used from this job datum
	var/list/access = list(access_engine_equip, access_maint_tunnels, access_external_airlocks,
					access_eva, access_tech_storage, access_construction, access_hangar, access_emergency_storage)
	var/drone_type = /mob/living/silicon/robot/network

/obj/item/drone_frame/Initialize()
	..()
	if(!personal && job_access)
		access = SSjobs.get_by_path(job_access).access

/obj/item/drone_frame/proc/deploy(var/turf/T)
	var/mob/living/silicon/robot/network/D = new drone_type(T)
	D.dismantle_type = type
	D.idcard.access = access.Copy()
	return D

/obj/item/drone_frame/attack_self(mob/user)
	var/turf/T = get_turf(user)
	var/mob/living/silicon/robot/network/N = deploy(T)
	to_chat(user,SPAN_NOTICE("You deploy [N] onto [T]."))
	if(user.skill_check(SKILL_COMPUTER, SKILL_ADEPT) && personal)
		spawn(5) to_chat(user,SPAN_NOTICE("As you deploy [src] you press debug button which briefly shows: NID - [N.get_nid()]; LOGIN - [N.get_pass(1)]; PASS - [N.get_pass()]"))
	qdel(src)

/obj/item/drone_frame/throw_impact(atom/hit_atom)
	..()
	if(isturf(hit_atom))
		visible_message("[src] deploys!")
		deploy(hit_atom)
		qdel(src)
		return

/obj/item/drone_frame/attackby(var/obj/item/weapon/C, var/mob/user)
	if(istype(C, /obj/item/weapon/card/id) && personal)
		var/obj/item/weapon/card/id/W = C
		if(done)
			access = list()
			user.visible_message(SPAN_NOTICE("[user] swipes his [W], reseting [src] access."), SPAN_NOTICE("You swipe [W] through [src] reader and reset its access."))
			done = 0
			return
		access = W.access.Copy()
		user.visible_message(SPAN_NOTICE("[user] swipes his [W], registering [src] access."), SPAN_NOTICE("You swipe [W] through [src] reader and register its access."))
		done = 1
		return
	..()

/obj/item/drone_frame/personal
	name = "personal drone frame"
	personal = 1

/obj/item/drone_frame/personal/Initialize()
	..()
	desc += " This one personal. You can update its access using your ID."

///****Loadout****///

/datum/gear/utility/drone
	display_name = "personal network drone"
	cost = 3 //Fair price
	path = /obj/item/drone_frame/personal

/////////////////////

/datum/design/item/mechfab/robot/network_drone
	name = "Network Drone assembly"
	id = "robot_network_drone"
	build_path = /obj/item/drone_frame
	time = 5
	materials = list(MATERIAL_STEEL = 1000) //HALF a sheet, this means roboticist can make 100 drones from fifty steel sheets

/datum/design/item/mechfab/robot/network_drone_personal
	name = "Network Drone assembly (Personal)"
	id = "robot_network_drone"
	build_path = /obj/item/drone_frame/personal
	time = 5
	materials = list(MATERIAL_STEEL = 1000)

//Autolathe recipe. I really don't sure about that.
/datum/fabricator_recipe/device_component/drone
	path = /obj/item/drone_frame/personal

//Codex entry
/datum/codex_entry/network_drone
	associated_paths = list(/obj/item/drone_frame)
	mechanics_text = {"Это - сетевой дрон. Для того, чтобы активировать его - кликните по нему в руке. <br>
Сетевые дроны - это крайне ограниченные роботы, которых можно настраивать используя терминал. Для этого вам понадобится как минимум EXPERIENCED уровень IT-навыка.<br>
Дроны бывают разных типов: стандартные и персональные. Законы у всех одинаковые: не трогать экипаж и чинить судно.<br>
Стандартные имеют инженерный доступ который нельзя изменить, а персональные - наоборот, но вы можете авторизовать дрону свой доступ используя ваш ID.<br>
Чтобы узнать идентификатор дрона в сети, логин и пароль вам нужен TRAINED IT-навыка - ПОСЛЕ активации вам выведет сообщение об этом. (При условии, что это персональный дрон.)<br>
Чтобы взломать дрона, нужно просто изучать сеть. Это не так трудно, как кажется: смотрите, как устроены различные команды и у вас обязательно все получится."}
//	lore_text = ""
