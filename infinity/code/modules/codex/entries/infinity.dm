/datum/codex_entry/caligae
	associated_paths = list(/obj/item/clothing/shoes/sandal/xeno/caligae)
	lore_text = "These traditional Tajaran footwear, also called Haskri, have remained reletivly unchanged in principal, with improved materials and construction being the only notable improvment. Originally used for harsher environment, they became widespread for their comfort and hygiene. Some of them come with covering for additional protection for more sterile environments. Made for the Tajarans digitigrade anatomy, they won't fit on any other species."

/datum/codex_entry/lockets
	associated_paths = list(/obj/item/clothing/accessory/locket)
	mechanics_text = "Also, you can write in locket with a pen."

/datum/codex_entry/wrist_computer
	associated_paths = list(/obj/item/modular_computer/pda/wrist)
	lore_text = "Morally obsolete and replaced by a more compact and perfect personal computer, \
	the wrist computer has been used to this day as a cheap replacement for more expensive equipment \
	in some small corporations, \
	and sometimes for the sake of aesthetic pleasure of it's owner."

/datum/codex_entry/floor_light
	associated_paths = list(/obj/machinery/floor_light)
	mechanics_text = "You can change it's color with a multitool."

/datum/codex_entry/tape_roll
	associated_paths = list(/obj/item/weapon/tape_roll)
	mechanics_text = "Вы можете сделать множество интересных вещей с помощью изоленты. \
	Персонажи: при выборе рта, глаз, кистей или другой части тела, происходит заклеивание, \
	связывание или ремонт скафандра. При взаимодействии с бумагой, последнюю можно закрепить на стене, \
	но она не будет переноситься между раундами. является одним из компонентов рельсотрона. \
	Вместе с железным стержнем можно сделать самодельную медицинскую шину. \
	Помимо прочего, ею можно заменить FixOVein и медикаменты при лечении артерий и внутренних органов."

/datum/codex_entry/bs_snare
	associated_paths = list(/obj/item/clothing/accessory/bs_silk)
	mechanics_text = "Это блуспейс силок, он может быть привязан к хабу силка. \
	При активации привязанного хаба с консоли, возвращает владельца силка к привязанному хабу. \
	С помощью установленного на силке доступа, можно его заблокировать так, \
	что его нельзя будет снять с униформы. \
	ВНИМАНИЕ. После надевания блокированного силка, силок будет невозможно снять, даже имея нужный доступ."

/datum/codex_entry/music_player
	associated_paths = list(/obj/item/music_player)
	mechanics_text = "С помощью этого плеера можно воспроизводить музыку на ходу.<br> \
	Может воспроизводить компакт-кассеты, некоторые из которых можно купить у торговца или одолжить у бармена.<br> \
	Для воспроизведения требует наличие источника питания (аккумулятор).<br> \
	Можно использовать сочетание клавиш Alt и Click на плеере для паузы."

/datum/codex_entry/music_tape
	associated_paths = list(/obj/item/music_tape)
	mechanics_text = "Компакт-кассета на базе магнитной ленты.<br> \
	Обычно на таких хранят аудиоданные, например музыку,\
	которую можно проиграть на станционарном и переносном проигрывателе.<br> \
	Существуют специальные ленты которые поддаются перезаписи с помощью спецального оборудования."

/datum/codex_entry/apc/New()
	mechanics_text += "<br>При взломе малфом, вы можете сбросить настройки мультитулом - если, конечно, \
	являетесь мастером в электронике или программировании. Так же, при сломанной \
	раме вы можете заменить её, нажав по ней целой рамой. Если же рама имеет лишь небольшие повреждения, то \
	для ремонта достаточно и обычной сварки."
	..()

/datum/codex_entry/docking_port
	display_name = "Telescopic Docking Port (TDP)"
	associated_paths = list(/obj/docking_port)
	lore_text = "Телескопические стыковочные доки хорошо известны тем, кто работает на космических \
	объектах - или хотя бы в порту. Подобные системы часто занимают прилично места, не говоря уже о \
	том, что обслуживание доков часто может являться проблемой для неопытного экипажа. Обслуживание \
	подобных компонентов корабля требует серьезного опыта и не менее серьезных знаний - не \
	удивительно, поскольку хрупкость и сложность механических частей может бросить вызов неопытной \
	инженерной команде."
	mechanics_text = "Вы можете перемещать объекты и себя через мост с помощью перетаскивания на док/дока на объект.\
	<br>Док можно сломать двумя способами:\
	<br>1) Начать двигать судном, пока док выдвинут;\
	<br>2) Взорвать док.\
	<br>Док обладает тремя важными протоколами:\
	<br>1) Протокол блокировки (не позволяет подключаться к доку другим кораблям),\
	<br>2) Протокол оповещения (оповещения в рацию после (от)стыковки),\
	<br>3) Протокол доступа (не дает пользоваться панелью дока без соответствующего доступа; для Сьерры нужен доступ на мостик).\
	<br>Для ремонта необходим продвинутый навык конструирования. Этапы: гаечный ключ, пустая рука (2), \
	кусачки, провода (15), сталь (8), сварочный аппарат (3), пустая рука, гаечный ключ."
	antag_text = "   Несколько советов от бывалого корпоративного шпиона.\
	<br>Криптографический секвенсер (он же емаг) позволяет сбросить ограничение по доступу. \
	Однако, при осмотре шлюза в упор (или синтетиком) будет очевидно, что произошел взлом.\
	<br>Протокол блокировки, по умолчанию, отключен. Если командование благосклонно к вам \
	(или просто слишком непредусмотрительно), то другие суда смогут подключиться к доку.\
	<br>Если отключить режим оповещения, то никто не услышит, как к кораблю подключается \
	мост со штурмовой группой.\
	<br>C4 (или небольшой бомбы) достаточно, чтобы сломать док.\
	<br>С помощью изменяющей голос маски возможно ненадолго отвлечь охрану."

/obj/docking_port
	var/general_codex_key = "Telescopic Docking Port (TDP)"

/obj/docking_port/get_antag_info()
	var/list/entries = SScodex.retrieve_entries_for_string(general_codex_key)
	var/datum/codex_entry/general_entry = LAZYACCESS(entries, 1)
	if(general_entry && general_entry.antag_text)
		return general_entry.antag_text

/obj/docking_port/get_lore_info()
	var/list/entries = SScodex.retrieve_entries_for_string(general_codex_key)
	var/datum/codex_entry/general_entry = LAZYACCESS(entries, 1)
	if(general_entry && general_entry.lore_text)
		. += general_entry.lore_text

/obj/docking_port/get_mechanics_info()
	var/list/entries = SScodex.retrieve_entries_for_string(general_codex_key)
	var/datum/codex_entry/general_entry = LAZYACCESS(entries, 1)
	if(general_entry && general_entry.mechanics_text)
		. += general_entry.mechanics_text
