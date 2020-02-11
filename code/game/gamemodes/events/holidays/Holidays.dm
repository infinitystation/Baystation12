//Uncommenting ALLOW_HOLIDAYS in config.txt will enable Holidays
var/global/Holiday = null

//Just thinking ahead! Here's the foundations to a more robust Holiday event system.
//It's easy as hell to add stuff. Just set Holiday to something using the switch (or something else)
//then use if(Holiday == "MyHoliday") to make stuff happen on that specific day only
//Please, Don't spam stuff up with easter eggs, I'd rather somebody just delete this than people cause
//the game to lag even more in the name of one-day content.

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//ALSO, MOST IMPORTANTLY: Don't add stupid stuff! Discuss bonus content with Project-Heads first please!//
//////////////////////////////////////////////////////////////////////////////////////////////////////////
//																							~Carn

/hook/startup/proc/updateHoliday()
	Get_Holiday()
	return 1

//sets up the Holiday global variable. Shouldbe called on game configuration or something.
/proc/Get_Holiday()
	if(!Holiday)	return		// Holiday stuff was not enabled in the config!

	Holiday = null				// reset our switch now so we can recycle it as our Holiday name

	var/YY	=	text2num(time2text(world.timeofday, "YY")) 	// get the current year
	var/MM	=	text2num(time2text(world.timeofday, "MM")) 	// get the current month
	var/DD	=	text2num(time2text(world.timeofday, "DD")) 	// get the current day

	//Main switch. If any of these are too dumb/inappropriate, or you have better ones, feel free to change whatever
	switch(MM)
		if(1)	//Jan
			switch(DD)
				if(1)							Holiday = "НОВЫМ ГОДОМ! А также, днём мира и днём освобождения Кубы"
				if(2)							Holiday = "днём научной фантастики... Куда я дел свой оптический квантовый генератор?"
				if(3)							Holiday = "днём рождения соломинки для коктелей! С днём рождения, соломинка"
				if(4)							Holiday = "днём азбуки Брайля и днём Ньютона! Не забудьте монтировку перед входом в активную зону, коллега"
				if(5)							Holiday = "днём посленовогоднего отдыха. А теперь, возвращайтесь к работе"
				if(7)							Holiday = "рождеством Христова у восточных христиан! Воистину ревайвнулся"
				if(10)							Holiday = "днём номера 110 в Японии"
				if(11)							Holiday = "международным днём \"Спасибо\"! Будьте вежливыми хотя бы сегодня"
				if(12)							Holiday = "днём похищений у славян! Опять ГККшники попытаются бухломат стащить"
				if(14)							Holiday = "старым Новым Годом! Уже забыли, небось"
				if(16)							Holiday = "днём ледовара и The Beatles"
				if(17)							Holiday = "днём детских изобретений! А сейчас, мы соеденим канистру с топливом и запальник"
				if(19)							Holiday = "крещения Господа и днём Спасателя в Беларуси"
				if(20)							Holiday = "днём религии! Днём снега и днём пингвинов"
				if(21)							Holiday = "днём обнимашек"
				if(23)							Holiday = "днём ручного Письма"
				if(24)							Holiday = "международным днём образования... И мороженного-эскимо"
				if(25)							Holiday = "днём студента"
				if(26)							Holiday = "днём таможенника! Таможенник, с праздником"
				if(27)							Holiday = "днём без интернета! Отмечать мы его, конечно же, не будем"
				if(28)							Holiday = "днём защиты перснальных данных! Берегите пароли, серьезно"
				if(29)							Holiday = "днём мобилизации против угрозы ядерной войны"
				if(30)							Holiday = "днём деда Мороза и Снегурочки"
				if(31)							Holiday = "мужденародным днём ювелира... И днём рождения русской водки. Кто это придумал?"

		if(2)	//Feb
			switch(DD)
				if(2)							Holiday = "Groundhog Day"
				if(14)							Holiday = "Valentine's Day"
				if(17)							Holiday = "Random Acts of Kindness Day"

		if(3)	//Mar
			switch(DD)
				if(14)							Holiday = "Pi Day"
				if(17)							Holiday = "St. Patrick's Day"
				if(27)
					if(YY == 16)
						Holiday = "Easter"
				if(31)
					if(YY == 13)
						Holiday = "Easter"

		if(4)	//Apr
			switch(DD)
				if(1)
					Holiday = "April Fool's Day"
					if(YY == 18 && prob(50)) 	Holiday = "Easter"
				if(5)
					if(YY == 15)				Holiday = "Easter"
				if(16)
					if(YY == 17)				Holiday = "Easter"
				if(20)
					Holiday = "Four-Twenty"
					if(YY == 14 && prob(50))	Holiday = "Easter"
				if(22)							Holiday = "Earth Day"

		if(5)	//May
			switch(DD)
				if(1)							Holiday = "Labour Day"
				if(4)							Holiday = "FireFighter's Day"
				if(9)							Holiday = "Р”РЅС‘Рј РџРѕР±РµРґС‹"
				if(12)							Holiday = "Owl and Pussycat Day"	//what a dumb day of observence...but we -do- have costumes already :3
				if(13)							Holiday = "Р”РЅС‘Рј Р§РµСЂРЅРѕРјРѕСЂСЃРєРѕРіРѕ С„Р»РѕС‚Р°"
				if(14)							Holiday = "Р”РЅС‘Рј Р¤СЂРёР»Р°РЅСЃРµСЂР°"
				if(15)							Holiday = "Р”РЅС‘Рј РЎРµРјСЊРё"
				if(17)							Holiday = "РґРЅС‘Рј СЌР»РµРєС‚СЂРѕСЃРІ&#255;Р·Рё Рё РёРЅС„РѕСЂРјР°С†РёРѕРЅРЅРѕРіРѕ РѕР±С‰РµСЃС‚РІР°"
				if(18)							Holiday = "Р”РЅС‘Рј РџРѕСЃР°РґРєРё Р›РµСЃР°"
				if(21)							Holiday = "Р”РЅС‘Рј РџРѕР»&#255;СЂРЅРёРєР°"
		if(6)	//Jun

		if(7)	//Jul
			switch(DD)
				if(1)							Holiday = "Р”РЅС‘Рј Р’СЂР°С‡Р°! РљСЂРµРїРєРёС… РЅРµСЂРІРѕРІ РёРј"
				if(2)							Holiday = "Р”РЅС‘Рј РќР›Рћ! РћРїСЏС‚СЊ СЃРєСЂРµР»Р»С‹ РїС€РµРЅРёС†Сѓ РІРѕСЂРѕРІР°Р»Рё"
				if(8)							Holiday = "Р”РЅС‘Рј РџРёСЃР°С‚РµР»СЏ! Р СѓР±РµСЂРёС‚Рµ СѓР¶Рµ Р’СѓРґРё РёР· Р±РёР±Р»РёРѕС‚РµРєРё"
				if(11)							Holiday = "Р”РЅС‘Рј РЁРѕРєРѕР»Р°РґР°! РЈР±РµРґРёС‚РµСЃСЊ, С‡С‚Рѕ РїРѕРІР°СЂ Р·Р°РЅСЏС‚ РґРµР»РѕРј"
				if(15)							Holiday = "Р”РЅС‘Рј Р РѕСЃСЃРёР№СЃРєРѕР№ РџРѕС‡С‚С‹, С‡С‚Рѕ Р±С‹Р» 14 С‡РёСЃР»Р°"
				if(17)							Holiday = "Р”РЅС‘Рј РџСЂР°РІРѕСЃСѓРґРёСЏ, РіСЂР°Р¶РґР°РЅРёРЅ"
				if(20)							Holiday = "Р”РЅС‘Рј РЁР°С…РјР°С‚РёСЃС‚Р°... Р РўРѕСЂС‚РёРєРѕРІ"
				if(21)							Holiday = "Р”РЅС‘Рј РњРµС‚Р°Р»Р»СѓСЂРіР°, СЃР»Р°РІСЏРЅРµ"
				if(22)							Holiday = "Р”РЅС‘Рј Р‘РѕРєСЃР°! РџРѕР·РґСЂР°РІРёРј РЅР°С€РёС… Р±Р°С‚С‚Р»С‚СЂР°РїРѕРІ"
				if(23)							Holiday = "Р”РЅС‘Рј РљРёС‚РѕРІ Рё Р”РµР»СЊС„РёРЅРѕРІ! Р’РѕР·РјРѕР¶РЅРѕ, СЃРµРіРѕРґРЅСЏ Р­Рљ СЃРјРѕР¶РµС‚ РїРѕР№РјР°С‚СЊ РѕРґРЅРѕРіРѕ"
				if(29)							Holiday = "Р”РЅС‘Рј РўРёРіСЂР°! РќРµ Р·Р°Р±СѓРґСЊС‚Рµ СЂР°СЃРєСЂР°СЃРёС‚СЊ Р±Р»РёР¶Р°Р№С€РµРіРѕ РўР°СЏСЂР° (СЃ РµРіРѕ СЂР°Р·СЂРµС€РµРЅРёСЏ)"
				if(30)							Holiday = "Р”РЅС‘Рј Р”СЂСѓР¶Р±С‹, С‚РѕРєСЃРёС‡РЅС‹Рµ РІС‹ Р»СЋРґРё"
				if(31)							Holiday = "Р”РЅС‘Рј Р РµР№РЅРґР¶РµСЂР°! РќРµ Р·Р°Р±СѓРґСЊС‚Рµ РјР°С‡РµС‚Рµ"

		if(8)	//Aug
			switch(DD)
				if(5)							Holiday = "Beer Day"
				if(6)							Holiday = "Р”РЅС‘Рј Р‘РѕСЂСЊР±С‹ СЃ РЇРґРµСЂРЅС‹Рј РћСЂСѓР¶РёРµРј"
				if(8)							Holiday = "РњСѓР¶РґСѓРЅР°СЂРѕРґРЅС‹Рј Р”РЅС‘Рј РљРѕС€РµРє Рё РђР»СЊРїРёРЅРёР·РјР°"
				if(9)							Holiday = "РЎРѕ Р’СЃРµРјРёСЂРЅС‹Рј Р”РЅС‘Рј РљРЅРёРіРѕР»СЋР±РѕРІ"
				if(10)							Holiday = "РњРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рј Р”РЅС‘Рј Р‘РёРѕРґРёР·РµР»СЏ"
				if(11)							Holiday = "Р”РЅС‘Рј РЎС‚СЂРѕРёС‚РµР»СЏ РІ СЃС‚СЂР°РЅР°С… РЎРќР“"
				if(12)							Holiday = "РњРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рј Р”РЅС‘Рј РњРѕР»РѕРґРµР¶Рё"
				if(15)							Holiday = "Р”РЅС‘Рј РђСЂС…РµРѕР»РѕРіР°"
				if(19)							Holiday = "Р”РЅС‘Рј Р¤РѕС‚РѕРіСЂР°С„РёРё Рё Р“СѓРјР°РЅРёС‚Р°СЂРЅРѕР№ РџРѕРјРѕС‰Рё"
				if(25)							Holiday = "Р”РЅС‘Рј РЁР°С…С‚РµСЂР° РІ СЃС‚СЂР°РЅР°С… РЎРќР“"
				if(29)							Holiday = "Р”РЅС‘Рј РџСЂРѕС‚РёРІРѕРґРµР№СЃС‚РІРёСЏ РЇРґРµСЂРЅС‹Рј РСЃРїС‹С‚Р°РЅРёСЏРј"
				if(31)							Holiday = "РќРѕС‡СЊСЋ Р›РµС‚СѓС‡РёС… РњС‹С€РµР№"

		if(9)	//Sep
			switch(DD)
				if(19)							Holiday = "Talk-Like-a-Pirate Day"
				if(28)							Holiday = "Stupid-Questions Day"

		if(10)	//Oct
			switch(DD)
				if(4)							Holiday = "Animal's Day"
				if(7)							Holiday = "Smiling Day"
				if(16)							Holiday = "Boss' Day"
				if(31)							Holiday = "Halloween"

		if(11)	//Nov
			switch(DD)
				if(1)							Holiday = "Vegan Day"
				if(13)							Holiday = "Kindness Day"
				if(19)							Holiday = "Flowers Day"
				if(21)							Holiday = "Saying-'Hello' Day"

		if(12)	//Dec
			switch(DD)
				if(10)							Holiday = "Human-Rights Day"
				if(14)							Holiday = "Monkey Day"
				if(21)							if(YY==12)	Holiday = "End of the World"
				if(22)							Holiday = "Orgasming Day"		//lol. These all actually exist
				if(24)							Holiday = "Christmas Eve"
				if(25)							Holiday = "рождеством Христова у западных христиан! Воистину ревайвнулся"
				if(26)							Holiday = "днём подарков! Подарите ближнему своему любимый баллон"
				if(27)							Holiday = "днём Спасателя! Не забудьте поздравить хирурга, парамедика, пришедшего на ваш крик СБшника, принявшего на борт во время ЧП торговца и... Много кого ещё"
				if(28)							Holiday = "днём кина! Продолжаем играть свои роли"
				if(29)							Holiday = "днём виолончели"
				if(31)							Holiday = "предновогодним днём! Подготовьте хорошее настроение и проведите его с теми, кого любите"

	if(!Holiday)
		//Friday the 13th
		if(DD == 13)
			if(time2text(world.timeofday, "DDD") == "Fri")
				Holiday = "Friday the 13th"

//Allows GA and GM to set the Holiday variable
/client/proc/Set_Holiday(T as text|null)
	set name = ".Set Holiday"
	set category = "Fun"
	set desc = "Force-set the Holiday variable to make the game think it's a certain day."
	if(!check_rights(R_SERVER))	return

	Holiday = T
	//get a new station name
	GLOB.using_map.station_name = null
	station_name()
	//update our hub status
	world.update_status()
	Holiday_Game_Start()

	message_admins("<span class='notice'>ADMIN: Event: [key_name(src)] force-set Holiday to \"[Holiday]\"</span>")
	log_admin("[key_name(src)] force-set Holiday to \"[Holiday]\"")


//Run at the  start of a round
/proc/Holiday_Game_Start()
	if(Holiday)
		to_world("<font color='blue'>Рђ С‚Р°РєР¶Рµ...</font>")
		to_world("<h4>Р’СЃРµС… СЃ [Holiday]!</h4>")
		switch(Holiday)			//special holidays
			if("Easter")
				//do easter stuff
			if("Christmas Eve","Christmas")
				Christmas_Game_Start()

	return

//Nested in the random events loop. Will be triggered every 2 minutes
/proc/Holiday_Random_Event()
	switch(Holiday)			//special holidays

		if("",null)			//no Holiday today! Back to work!
			return

		if("Easter")		//I'll make this into some helper procs at some point
/*			var/list/turf/simulated/floor/Floorlist = list()
			for(var/turf/simulated/floor/T)
				if(T.contents)
					Floorlist += T
			var/turf/simulated/floor/F = Floorlist[rand(1,Floorlist.len)]
			Floorlist = null
			var/obj/structure/closet/C = locate(/obj/structure/closet) in F
			var/obj/item/weapon/reagent_containers/food/snacks/chocolateegg/wrapped/Egg
			if( C )			Egg = new(C)
			else			Egg = new(F)
*/
/*			var/list/obj/containers = list()
			for(var/obj/item/weapon/storage/S in world)
				if(isNotStationLevel(S.z))	continue
				containers += S

			message_admins("<span class='notice'>DEBUG: Event: Egg spawned at [Egg.loc] ([Egg.x],[Egg.y],[Egg.z])</span>")*/
		if("End of the World")
			if(prob(eventchance))	GameOver()

		if("Christmas","Christmas Eve")
			if(prob(eventchance))	ChristmasEvent()
