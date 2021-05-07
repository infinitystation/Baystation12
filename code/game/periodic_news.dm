// This system defines news that will be displayed in the course of a round.
// Uses BYOND's type system to put everything into a nice format

/datum/news_announcement
	var
		round_time // time of the round at which this should be announced, in seconds
		message // body of the message
		author = "NanoTrasen Editor"
		channel_name = "Nyx Daily"
		can_be_redacted = 0
		message_type = "Story"

	revolution_inciting_event

		paycuts_suspicion
			round_time = 60*10
/*ORIGINAL
			message = {"Reports have leaked that NanoTrasen is planning to put paycuts into
						effect on many of its Research Stations in Tau Ceti. Apparently these research
						stations haven't been able to yield the expected revenue, and thus adjustments
						have to be made."}
/ORIGINAL*/
			message = {"Благодаря утечке информации в общий доступ, были раскрыты планы НаноТрайзен о массовом
						сокращении заработной платы своих сотрудников на множестве исследовательский станций в системе
						Тау Кита. Вероятно, они оказались неспособны принести ожидаемую руководством прибыль, и
						потому данные корректировки в региональной политике корпорации необходимы и неизбежны."}
			author = "Unauthorized"

		paycuts_confirmation
			round_time = 60*40
/*ORIGINAL
			message = {"Earlier rumours about paycuts on Research Stations in the Tau Ceti system have
						been confirmed. Shockingly, however, the cuts will only affect lower tier
						personnel. Heads of Staff will, according to our sources, not be affected."}
/ORIGINAL*/
			message = {"Ранняя утечка информации о сокращении оплаты труда на исследовательских станциях Тау Кита,
						принадлежащих НаноТрайзен, подтвердились. Неожиданным стал факт того, что это повлияет лишь на
						зарплату среди рядовых сотрудников.
						Согласно нашему источнику, изменения не коснутся руководящего персонала станций."}
			author = "Unauthorized"

		human_experiments
			round_time = 60*90
/*ORIGINAL
			message = {"Unbelievable reports about human experimentation have reached our ears. According
			 			to a refugee from one of the Tau Ceti Research Stations, their station, in order
			 			to increase revenue, has refactored several of their facilities to perform experiments
			 			on live humans, including virology research, genetic manipulation, and \"feeding them
			 			to the slimes to see what happens\". Allegedly, these test subjects were neither
			 			humanified monkeys nor volunteers, but rather unqualified staff that were forced into
			 			the experiments, and reported to have died in a \"work accident\" by NanoTrasen."}
/ORIGINAL*/
			message = {"Немыслимые сообщения, касающиеся экспериментов над людьми достигли наших ушей. Согласно словам
			 			беженца с одной из исследовательских станций Тау Кита, их объект, для увеличения прибыли,
			 			переоборудовал несколько своих отсеков для проведения экспериментов над живыми людьми.
			 			В их число входит: исследование вирусов, генетические манипуляции и \"кормёжка слаймов, чтобы
			 			посмотреть, что случится\". Предположительно, жертвами экспериментов были не преображённые
			 			мартышки или добровольцы, но неквалифицированный персонал, принужденный к участию в этих
			 			экспериментах, после чего они скоропостижно погибали в \"несчастных случаях на рабочих местах\",
			 			устроенных корпорацией."}
			author = "Unauthorized"

	bluespace_research

		announcement
			round_time = 60*40
/*ORIGINAL
			message = {"The new field of research trying to explain several interesting spacetime oddities,
						also known as \"Bluespace Research\", has reached new heights. Of the several
						hundred space stations now orbiting in Tau Ceti, fifteen are now specially equipped
						to experiment with and research Bluespace effects. Rumours have it some of these
						stations even sport functional \"travel gates\" that can instantly move a whole research
						team to an alternate reality."}
/ORIGINAL*/
			message = {"Новая область исследований, пытающаяся объяснить несколько интересных странностей времени,
						также известная как "Исследования Блюспейса", достигла новых высот. Из нескольких
						сотен космических станций, что сейчас находятся в системе Тау Кита, пятнадцать были специально
						оборудованы чтобы экспериментировать и исследовать эффекты Блюспейса. По слухам, на некоторых
						станциях есть функциональные "гейтвеи", которые могут мгновенно перенести целую
						исследовательскую команду в альтернативную реальность."}
	random_junk

		cheesy_honkers
			author = "Assistant Editor Carl Ritz"
			channel_name = "The Gibson Gazette"
/*ORIGINAL
			message = {"Do cheesy honkers increase risk of having a miscarriage? Several health administrations
						say so!"}
/ORIGINAL*/
			message = {"Повышают ли Сырные Хонкеры риск выкидыша? Несколько управлений здравоохранения говорят - да!"}
			round_time = 60 * 20

		net_block
			author = "Assistant Editor Carl Ritz"
			channel_name = "The Gibson Gazette"
/*ORIGINAL
			message = {"Several corporations banding together to block access to 'wetskrell.net', site administrators
			claiming violation of net laws."}
/ORIGINAL*/
			message = {"Несколько корпораций объединились, чтобы заблокировать доступ к популярному сайту
						\"wetskrell.net\". Администрация сайта заявляет о нарушении закона."}
			round_time = 60 * 40

		found_ssd
			channel_name = "Nyx Daily"
			author = "Doctor Eric Hanfield"
/*ORIGINAL
			message = {"Several people have been found unconscious at their terminals. It is thought that it was due
						to a lack of sleep or of simply migraines from staring at the screen too long. Camera footage
						reveals that many of them were playing games instead of working and their pay has been docked
						accordingly."}
/ORIGINAL*/
			message = {"Несколько человек были найдены без сознания на своих рабочих местах. Считается, что это было
						связано из-за недосыпа или просто мигрени из-за того, что слишком долго смотрели на экран.
						Записи с видеокамер показали, что многие из них играли в игры вместо того, чтобы работать.
						Их жалование было скорректировано соответствующим образом."}
			round_time = 60 * 60

	lotus_tree

		explosions
			channel_name = "Nyx Daily"
			author = "Reporter Leland H. Howards"
/*ORIGINAL
			message = {"The newly-christened civillian transport Lotus Tree suffered two very large explosions near the
						bridge today, and there are unconfirmed reports that the death toll has passed 50. The cause of
						the explosions remain unknown, but there is speculation that it might have something to do with
						the recent change of regulation in the Moore-Lee Corporation, a major funder of the ship, when M-L
						announced that they were officially acknowledging inter-species marriage and providing couples
						with marriage tax-benefits."}
/ORIGINAL*/
			message = {"На недавно спущенный с верфей пассажирский лайнер \"Принцесса Бесконечности\" прогремели два
						больших взрыва. Непотвержденные отчеты сообщают, что количество погибших превысило 50 членов
						экипажа и пассажиров. Причина взрывов остается неизвестной, но есть гипотеза, что это могло
						произойти из-за недавних изменений регуляций в Falco Designs - производителя судна -
						когда они объявили, что официально признают межвидовые браки и обеспечивают заключившие брак
						пары налоговыми льготами."}
			round_time = 60 * 56

	food_riots

		breaking_news
			channel_name = "Nyx Daily"
			author = "Reporter Ro'kii Ar-Raqis"
/*ORIGINAL
			message = {"Breaking news: Food riots have broken out throughout the Refuge asteroid colony in the Tenebrae
						Lupus system. This comes only hours after NanoTrasen officials announced they will no longer trade with the
						colony, citing the increased presence of \"hostile factions\" on the colony has made trade too dangerous to
						continue. NanoTrasen officials have not given any details about said factions. More on that at the top of
						the hour."}
/ORIGINAL*/
			message = {"Срочные новости: Продовольственные бунты прокатились по отделившейся от ЦПСС астероидной
						колонии в системе Tenebrae Lupus. Это начало происходишь через несколько часов после того, как
						представитель НаноТрейзен заявил о том, они больше не будут торговать с колонией, ссылаясь на
						рост присутствия \"враждебных фракций\" в ней, из-за чего торговые маршруты стали слишком
						опасными. Представитель не предоставил никаких сведений об указанных фракциях. Больше по этой
						теме в конце часа."}
			round_time = 60 * 25

		more
			channel_name = "Nyx Daily"
			author = "Reporter Ro'kii Ar-Raqis"
/*ORIGINAL
			message = {"More on the Refuge food riots: The Refuge Council has condemned NanoTrasen's withdrawal from
			the colony, claiming \"there has been no increase in anti-NanoTrasen activity\", and \"\[the only] reason
			NanoTrasen withdrew was because the \[Tenebrae Lupus] system's Phoron deposits have been completely mined out.
			We have little to trade with them now\". NanoTrasen officials have denied these allegations, calling them
			\"further proof\" of the colony's anti-NanoTrasen stance. Meanwhile, Refuge Security has been unable to quell
			the riots. More on this at 6."}
/ORIGINAL*/
			message = {"Больше о продовольственных бунтах: Совет колонистов осуждает уход НаноТрейзен из колонии,
						утвержая, что \"не было никакого увеличения активности против корпорации\", и \"\[Единственная]
						причина их ухода заключается в том, что фороновые месторожения в системе \[Tenebrae Lupus] были
						выработаны. Теперь нам почти нечем торговать с ними\". Представитель отрицает эти обвинения,
						называя их \"еще одним доказательством\" Анти-НаноТрейзеновской политики. В то же время,
						местные силы правопорядка не смогли подавить беспорядки. Подробнее об этом через несколько
						часов."}
			round_time = 60 * 65


var/global/list/newscaster_standard_feeds = list(/datum/news_announcement/bluespace_research, /datum/news_announcement/lotus_tree, /datum/news_announcement/random_junk,  /datum/news_announcement/food_riots)

proc/process_newscaster()
	if(SSticker.mode.newscaster_announcements) //INF
		check_for_newscaster_updates(SSticker.mode.newscaster_announcements)

var/global/tmp/announced_news_types = list()
/*ORIGINAL
proc/check_for_newscaster_updates(type)
	for(var/subtype in typesof(type)-type)
		var/datum/news_announcement/news = new subtype()
		if(news.round_time * 10 <= world.time && !(subtype in announced_news_types))
			announced_news_types += subtype
			announce_newscaster_news(news)
/ORIGINAL*/
//[INF]
/proc/check_for_newscaster_updates(type)
	for(var/A in type)
		for(var/subtype in typesof(A)-A)
			var/datum/news_announcement/news = new subtype()
			if(news.round_time * 10 <= world.time && !(subtype in announced_news_types))
				announced_news_types += subtype
				announce_newscaster_news(news)
//[/INF]
proc/announce_newscaster_news(datum/news_announcement/news, list/zlevels)
	var/datum/feed_network/network
	for(var/datum/feed_network/G in news_network)
		if (zlevels[1] in G.z_levels)
			network = G

			break

	if (!network) //if no networks exist, no newscasters exist either
		return

	var/datum/feed_channel/sendto
	for(var/datum/feed_channel/FC in network.network_channels)
		if(FC.channel_name == news.channel_name)
			sendto = FC
			break

	if(!sendto)
		sendto = new /datum/feed_channel
		sendto.channel_name = news.channel_name
		sendto.author = news.author
		sendto.locked = 1
		sendto.is_admin_channel = 1
		network.network_channels += sendto
	
	// [INF]
	for(var/datum/feed_channel/galaxy_channel in network.network_channels)
		if(galaxy_channel.is_admin_channel)
			galaxy_channel.views += rand(4000,12000)
	// [/INF]
	
	var/author = news.author ? news.author : sendto.author
	network.SubmitArticle(news.message, author, news.channel_name, null, !news.can_be_redacted, news.message_type)
