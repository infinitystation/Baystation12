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
				if(9)							Holiday = "Днём Победы"
				if(12)							Holiday = "Owl and Pussycat Day"	//what a dumb day of observence...but we -do- have costumes already :3
				if(13)							Holiday = "Днём Черноморского флота"
				if(14)							Holiday = "Днём Фрилансера"
				if(15)							Holiday = "Днём Семьи"
				if(17)							Holiday = "днём электросвязи и информационного общества"
				if(18)							Holiday = "Днём Посадки Леса"
				if(21)							Holiday = "Днём Полярника"
		if(6)	//Jun

		if(7)	//Jul
			switch(DD)
				if(1)							Holiday = "Днём Врача! Крепких нервов им"
				if(2)							Holiday = "Днём НЛО! Опять скреллы пшеницу воровали"
				if(8)							Holiday = "Днём Писателя! И уберите уже Вуди из библиотеки"
				if(11)							Holiday = "Днём Шоколада! Убедитесь, что повар занят делом"
				if(15)							Holiday = "Днём Российской Почты, что был 14 числа"
				if(17)							Holiday = "Днём Правосудия, гражданин"
				if(20)							Holiday = "Днём Шахматиста... И Тортиков"
				if(21)							Holiday = "Днём Металлурга, славяне"
				if(22)							Holiday = "Днём Бокса! Поздравим наших баттлтрапов"
				if(23)							Holiday = "Днём Китов и Дельфинов! Возможно, сегодня ЭК сможет поймать одного"
				if(29)							Holiday = "Днём Тигра! Не забудьте раскрасить ближайшего Таяра (с его разрешения)"
				if(30)							Holiday = "Днём Дружбы, токсичные вы люди"
				if(31)							Holiday = "Днём Рейнджера! Не забудьте мачете"

		if(8)	//Aug
			switch(DD)
				if(5)							Holiday = "Beer Day"
				if(6)							Holiday = "Днём Борьбы с Ядерным Оружием"
				if(8)							Holiday = "Муждународным Днём Кошек и Альпинизма"
				if(9)							Holiday = "Со Всемирным Днём Книголюбов"
				if(10)							Holiday = "Международным Днём Биодизеля"
				if(11)							Holiday = "Днём Строителя в странах СНГ"
				if(12)							Holiday = "Международным Днём Молодежи"
				if(15)							Holiday = "Днём Археолога"
				if(19)							Holiday = "Днём Фотографии и Гуманитарной Помощи"
				if(25)							Holiday = "Днём Шахтера в странах СНГ"
				if(29)							Holiday = "Днём Противодействия Ядерным Испытаниям"
				if(31)							Holiday = "Ночью Летучих Мышей"

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
		to_world("<font color='blue'>А также...</font>")
		to_world("<h4>Всех с [Holiday]!</h4>")
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
