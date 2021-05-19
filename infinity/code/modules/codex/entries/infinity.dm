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
	associated_paths = list(/obj/item/tape_roll)
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
