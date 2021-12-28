/mob/living/simple_animal/friendly/chel_portovie
	name = "Huesos"
	desc = "Huesos tired of long trips."
	icon_state = "muj2"
	icon_living = "muj2"
	icon_dead = "mujdead2"
	turns_per_move = 5
	response_help = "pushes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 0
	maxHealth = 100
	health = 100
	faction = "Portovie ludi"
	can_escape = TRUE
	skin_material = MATERIAL_SKIN_FUR_ORANGE
	ai_holder_type = /datum/ai_holder/simple_animal/passive/chel_portovie
	say_list_type = /datum/say_list/chel_portovie

/datum/ai_holder/simple_animal/passive/chel_portovie
	speak_chance = 30
	wander = FALSE

/datum/say_list/chel_portovie
	speak = list(
		"Опять работать.",
		"Хороший сегодня день.",
		"Как же хочется домой.",
		"Надеюсь завтра будет получка.",
		"Свежая газета «космические новости».",
		"А вы знали что завтра День космонавтики?",
		"Надо работать, чтобы жить.",
		"Как насчёт собраться в пятницу и сходить в бар?",
		"Что там сегодня по расписанию?",
		"Опять аборигены какие-то пристыковались.",
		"Пойдём обслуживать корабли?",
		"Что сегодня босс сказал сделать?",
		"Сегодня ты на ночную смену идёшь.",
		"Черт, больше никогда не буду брать вино из космотерочки.",
		"Надо собраться и сделать работу.",
		"Завтра будет матч?",
		"Надеюсь моя быстрая ставка пройдёт.",
		"Как приятно что сегодня все мы здесь собрались.",
		"Эй, нам нужны ещё бутылки!",
		"Работа не волк, волк - это волк.",
		"Мы сегодня идём в чайную, надеюсь будут места.",
		"Хочу уже в отпуск, почему я не кот?",
		"Только сегодня по низким ценам жаренные космические коты!",
		"Ненавижу этих таяр.",
		"Куда смотрит администрация, здесь везде грязь.",
		"Хочу сменить пол, а то на кухне он устарел.",
		"Черт, а у неё красивые ноги!",
		"Надеюсь повышение скоро ждать, а то за комуналку нечем платить.",
		"Слава нашему работодателю.")

/datum/say_list/chel_portovie/mujick
	//speak = list("А я утюг дома выключил?",
		//"Ты сделал вчера телевизор",
		//"Я купил новый телевизор.")
	//speak = list("Ты сделал вчера телевизор?")
	//speak = list("Я купил новый телевизор.")
	//speak = list("Я бросил пить десять лет назад.")
	//speak = list("Блин, пропуск дома забыл.")
	//speak = list("Поздно вчера лёг спать, рубит весь день.")
	//speak = list("Я не люблю спорт, он делает меня счастливым.")
	//speak = list("Я сегодня увольняюсь, устал от постоянной нагрузки.")

/datum/say_list/chel_portovie/mujick/New()
	. = ..()
	speak += list("А я утюг дома выключил?",
		"Ты сделал вчера телевизор",
		"Я купил новый телевизор.",
		"Я бросил пить десять лет назад.",
		"Блин, пропуск дома забыл.",
		"Поздно вчера лёг спать, рубит весь день.",
		"Я не люблю спорт, он делает меня счастливым.",
		"Я сегодня увольняюсь, устал от постоянной нагрузки.")

/datum/say_list/chel_portovie/trap

/datum/say_list/chel_portovie/trap/New()
	. = ..()
	speak += list("Дура, ты в космосе, здесь везде Звёзды.",
	"Я вчера видела красивые звёзды.",
	"Я сегодня увольняюсь, устала от постоянной нагрузки.")

	//speak = list("Дура, ты в космосе, здесь везде Звёзды.")
	//speak = list("Я вчера видела красивые звёзды.")
	//speak = list("Я сегодня увольняюсь, устала от постоянной нагрузки.")

/mob/living/simple_animal/friendly/chel_portovie/mujick
	say_list_type = /datum/say_list/chel_portovie/mujick

/mob/living/simple_animal/friendly/chel_portovie/trap
	say_list_type = /datum/say_list/chel_portovie/trap

/mob/living/simple_animal/friendly/chel_portovie/mujick/muj1
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "muj1"
	icon_living = "muj1"
	icon_dead = "mujdead1"

mob/living/simple_animal/friendly/chel_portovie/mujick/muj2
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "muj2"
	icon_living = "muj2"
	icon_dead = "mujdead2"

/mob/living/simple_animal/friendly/chel_portovie/mujick/muj3
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "muj3"
	icon_living = "muj3"
	icon_dead = "mujdead3"

/mob/living/simple_animal/friendly/chel_portovie/mujick/muj4
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "muj4"
	icon_living = "muj4"
	icon_dead = "mujdead4"

/mob/living/simple_animal/friendly/chel_portovie/mujick/muj5
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "muj5"
	icon_living = "muj5"
	icon_dead = "mujdead5"

/mob/living/simple_animal/friendly/chel_portovie/mujick/muj6
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "muj6"
	icon_living = "muj6"
	icon_dead = "mujdead6"

/mob/living/simple_animal/friendly/chel_portovie/mujick/muj7
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "muj7"
	icon_living = "muj7"
	icon_dead = "mujdead7"

/mob/living/simple_animal/friendly/chel_portovie/mujick/muj8
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "muj8"
	icon_living = "muj8"
	icon_dead = "mujdead8"

/mob/living/simple_animal/friendly/chel_portovie/mujick/muj9
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "muj9"
	icon_living = "muj9"
	icon_dead = "mujdead9"

/mob/living/simple_animal/friendly/chel_portovie/mujick/muj10
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "muj10"
	icon_living = "muj10"
	icon_dead = "mujdead10"

/mob/living/simple_animal/friendly/chel_portovie/mujick/muj11
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "muj11"
	icon_living = "muj11"
	icon_dead = "mujdead11"

/mob/living/simple_animal/friendly/chel_portovie/mujick/muj12
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "muj12"
	icon_living = "muj12"
	icon_dead = "mujdead12"

/mob/living/simple_animal/friendly/chel_portovie/mujick/muj13
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "muj13"
	icon_living = "muj13"
	icon_dead = "mujdead13"

/mob/living/simple_animal/friendly/chel_portovie/trap/trap1
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "trap1"
	icon_living = "trap1"
	icon_dead = "trapdead1"

/mob/living/simple_animal/friendly/chel_portovie/trap/trap2
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "trap2"
	icon_living = "trap2"
	icon_dead = "trapdead2"

/mob/living/simple_animal/friendly/chel_portovie/trap/trap3
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "trap3"
	icon_living = "trap3"
	icon_dead = "trapdead3"

/mob/living/simple_animal/friendly/chel_portovie/trap/trap4
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "trap4"
	icon_living = "trap4"
	icon_dead = "trapdead4"

/mob/living/simple_animal/friendly/chel_portovie/trap/trap5
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "trap5"
	icon_living = "trap5"
	icon_dead = "trapdead5"

/mob/living/simple_animal/friendly/chel_portovie/trap/trap6
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "trap6"
	icon_living = "trap6"
	icon_dead = "trapdead6"

/mob/living/simple_animal/friendly/chel_portovie/trap/trap7
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "trap7"
	icon_living = "trap7"
	icon_dead = "trapdead7"

/mob/living/simple_animal/friendly/chel_portovie/trap/trap8
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "trap8"
	icon_living = "trap8"
	icon_dead = "trapdead8"

/mob/living/simple_animal/friendly/chel_portovie/trap/trap9
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "trap9"
	icon_living = "trap9"
	icon_dead = "trapdead9"

/mob/living/simple_animal/friendly/chel_portovie/trap/trap10
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "trap10"
	icon_living = "trap10"
	icon_dead = "trapdead10"

/mob/living/simple_animal/friendly/chel_portovie/trap/trap11
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "trap11"
	icon_living = "trap11"
	icon_dead = "trapdead11"

/mob/living/simple_animal/friendly/chel_portovie/trap/trap12
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "trap12"
	icon_living = "trap12"
	icon_dead = "trapdead12"

/mob/living/simple_animal/friendly/chel_portovie/trap/trap13
	name = "Traveller"
	desc = "Traveller tired of long trips."
	icon_state = "trap13"
	icon_living = "trap13"
	icon_dead = "trapdead13"

/mob/living/simple_animal/friendly/trapFROG
	name = "Frog-girl"
	desc = "Amazing Frog-girl."
	icon_state = "trapFROG"
	icon_living = "trapFROG"
	icon_dead = "trapdeadFROG"
	maxHealth = 500
	health = 500
	a_intent = I_HURT
	natural_weapon = /obj/item/natural_weapon/juggernaut/behemoth/frog
	response_harm   = "жабий удар"
	ai_holder_type = /datum/ai_holder/simple_animal/retaliate/trapFROG
	say_list_type = /datum/say_list/trapFROG
	faction = "Portovie ludi"

/obj/item/natural_weapon/juggernaut/behemoth/frog
	force = 15

/datum/ai_holder/simple_animal/retaliate/trapFROG
	speak_chance = 10
	wander = FALSE

/datum/say_list/trapFROG
	speak = list(
		"Ква.",
		"Ква-ква!.",
		"Вот бы все остальные стали девочками-лягушками!",
		"Медведь из озера любит меня!",
		"И почему медведь из озера меня так любит?")

/mob/living/simple_animal/friendly/holozeng
	name = "Zeng-Hu hologram"
	icon_state = "holo"
	icon_living = "holo"
	density = FALSE
	maxHealth = 1000
	health = 1000
	anchored = TRUE
	ai_holder_type = /datum/ai_holder/simple_animal/passive/holozeng
	say_list_type = /datum/say_list/holozeng

/datum/ai_holder/simple_animal/passive/holozeng
	speak_chance = 10
	wander = FALSE

/datum/say_list/holozeng
	speak = list("Добро пожаловать на площадку корпорации 'Зенг-Ху' - самого передового производителя фармацевтики и робототехники в Млечном пути! В рамках партнерства с 'НаноТрейзен', ИКН 'Сьерра' была оборудована передовым оборудованием и препаратами, часть из которых вы можете видеть на данных стендах! Представляем Вам 'звезду' этой выставки - 'ХимМастер 3000', на которой любой квалифицированный специалист сможет синтезировать любое нужное ему вещество, не боясь, что его процесс прервётся из-за окончания запасов! Вы спросите - а где же держать синтезированные препараты, если каждый из них имеет свою температуру хранения? А вот и наш ответ - умный холодильник для препаратов, химикатов и любых других товаров, требующих особых условий хранения. Разве это не чудесно? 'Зенг-Ху' - мы двигаем человечество в светлое будущее.")

/mob/living/simple_animal/friendly/holohep
	name = "Hephaestus Industries hologram"
	icon_state = "holo"
	icon_living = "holo"
	density = FALSE
	maxHealth = 1000
	health = 1000
	anchored = TRUE
	ai_holder_type = /datum/ai_holder/simple_animal/passive/holohep
	say_list_type = /datum/say_list/holohep

/datum/ai_holder/simple_animal/passive/holohep
	speak_chance = 10
	wander = FALSE

/datum/say_list/holohep
	speak = list("Вы прибыли на площадку корпорации 'Гефестус Индастрис' - самого крупного и лучшего производителя вооружения и другого военного снаряжения, из тех, что Вы можете сыскать на человеческом пространстве. Мы и наши подчинённые, производим различное вооружение, как, к примеру, орудия для планетарных сооружений или те ослепляющие устройства на поясах различных ЧВК и высокопоставленных лиц, в том числе, и транс-корпораций. На наших стендах Вы можете увидеть модифицированную версию LAEP90 'Перун', производимого для Отдела Защиты Активов транс-корпорации 'НаноТрейзен', а также для различных организаций ЦПСС. Подробнее с другими объектами выставки ознакомьтесь непосредственно перед ними. 'Гефестус Индастрис' - безопасность есть приоритет.")

/mob/living/simple_animal/friendly/holodei
	name = "Deimos Advanced Information Systems hologram"
	icon_state = "holo"
	icon_living = "holo"
	density = FALSE
	maxHealth = 1000
	health = 1000
	anchored = TRUE
	ai_holder_type = /datum/ai_holder/simple_animal/passive/holodei
	say_list_type = /datum/say_list/holodei

/datum/ai_holder/simple_animal/passive/holodei
	speak_chance = 10
	wander = FALSE

/datum/say_list/holodei
	speak = list("Да, Вы можете лицезреть нашу выставочную площадку. Мы - создаём мыслящие, и не очень, системы, как те бортовые ИИ, установленные на объектах, требующих дополнительного контроля и обеспечения помощи персоналу этих самых объектов. Большинство цифровых систем и систем, требующих обслуживания квалифицированными специалистам в сфере цифровых технологий - представляем именно мы, потому и признаны компанией номер один на территории ЦПСС. На наших стендах Вы сможете посмотреть на пустые оболочки ИИ, как изнутри, так и снаружи. Также мы представляем Вам нашего персонального помощника - ПИИ, или персональный искусственный интеллект, поставляемый на множество объектов транс-корпорации 'НаноТрейзен'. 'Деймос Адванцед Информэйшен Систем'- мы разрабатываем Ваше будущее.")

/mob/living/simple_animal/friendly/holovey
	name = "Vey-Med Limited hologram"
	icon_state = "holo"
	icon_living = "holo"
	density = FALSE
	maxHealth = 1000
	health = 1000
	anchored = TRUE
	ai_holder_type = /datum/ai_holder/simple_animal/passive/holovey
	say_list_type = /datum/say_list/holovey

/datum/ai_holder/simple_animal/passive/holovey
	speak_chance = 10
	wander = FALSE

/datum/say_list/holovey
	speak = list("Доброго времени суток, уважаемый посетитель площадки транс-корпорации 'Вей-Мед'. Мы - скромная организация, производящая качественные протезы различных сфер назначения и не только. Если Вы когда-либо были в Медицинских Отделах большинства из ныне существующих и развивающихся организаций, Вы могли заметить и даже использовать наше великолепное медицинское оборудование! Для чуть более лучшего и конкретного ознакомления с продуктами наших трудов - обратитесь к информации на наших стендах. 'Вей-Мед' - как клетки в организме, мы соединяем жизнь и смерть.")

/mob/living/simple_animal/friendly/holorob
	name = "Robust Industries LLC hologram"
	icon_state = "holo"
	icon_living = "holo"
	density = FALSE
	maxHealth = 1000
	health = 1000
	anchored = TRUE
	ai_holder_type = /datum/ai_holder/simple_animal/passive/holorob
	say_list_type = /datum/say_list/holorob

/datum/ai_holder/simple_animal/passive/holorob
	speak_chance = 10
	wander = FALSE

/datum/say_list/holorob
	speak = list("Здравствуй, путник! Беспокоишься, что в условиях корабельной жизни ты не сможешь насладиться теми самыми вкусами, которые ты пробовал в условиях планетарной атмосферы? Можешь отбросить сомнения, потому что 'Робуст ЛЛС' представляет огромный набор снэков, сладостей и напитков, и все из них производятся и хранятся для употребления на суднах, кораблях, и даже в вакууме.. но мы не советуем употребление шоколадных плиток в открытом космосе, конечно же. На данном стенде присутствует только малая доля нашей продукции, каждую из которых Вы можете протестировать на свой вкус!'Робуст ЛЛС' - вкус, достойный космоса!")

/mob/living/simple_animal/friendly/holoeng
	name = "Einstein Engines hologram"
	icon_state = "holo"
	icon_living = "holo"
	density = FALSE
	maxHealth = 1000
	health = 1000
	anchored = TRUE
	ai_holder_type = /datum/ai_holder/simple_animal/passive/holoeng
	say_list_type = /datum/say_list/holoeng

/datum/ai_holder/simple_animal/passive/holoeng
	speak_chance = 10
	wander = FALSE

/datum/say_list/holoeng
	speak = list("Итак, Вы находитесь площади корпорации 'Энштейн Энджинс' - лучшего производителя двигателей для космических объектов различных размеров, и, конечно же, лучшего производителя дешёвой энергии во всём пространстве человеческой цивилизации. Если Вы когда-либо были на космических объектах и пользовались там какими-либо электроприборами, знайте, что, вероятнее всего, энергия, потребляемая ими, была произведена именно Нашим оборудованием, в том числе и не безызвестными реакторами на суперматерии, которыми так славится наша организация. В любом случае, как распоряжаться этой силой решать исключительно Вам и тем, кто покупает нашу продукцию. Если хотите, подробнее можете ознакомиться нашими продуктами на следующих стендах, но мы настоятельно не рекомендуем что-либо царапать, трогать и слишком долго смотреть на них. 'Энштейн Энджинс' - дайте нам точку опору, и мы перевернём весь мир.")
