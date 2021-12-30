//necklace

/obj/item/clothing/accessory/necklace/messa //arhod's custom item
	name = "messa amulet"
	desc = "Выплавленный из сплава стали и титана амулет с маленьким флаконом из ударопрочного стекла, \
	содержащий кровь владельца. Амулет напоминает форму кровоточащего, полузакрытого кошачьего глаза - \
	символ духа Мессы. Считается, что Месса изменила ход истории таяран через своих детей во время \
	Тысячителетного рабства. Позже эти дети образовали семью \"Фусозай\", известная в клане Кайман, \
	как одна из самых воинственных и преданных свободе таяран организация."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "messa_amulet"
	accessory_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB, slot_wear_suit_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE

//a gun

/obj/item/gun/energy/gun/secure/messith
	name = "messith pistol"
	desc = "Пистолет \"Мессит\" является усовершенствованной версией стандартного 'Сэрандаррита', переоборудованный \
	под энерго-оружие. Данный пистолет выдаётся всем членам семьи 'Фусозай', как табельное оружие начиная со звания '\
	Мессита', чем и был прозван. Его главная особенность в отличие от стандартного компактного 'Перуна' - удлинённый \
	ствол и облегчённая рукоятка, позволяющая стрелять точнее своего прародителя и ровестника, но минус - дороговизна \
	и быстрый разогрев ствола при стрельбе в летальном режиме. На стволе, судя по всему, обладатель данного оружия \
	нацарапал надпись 'Var Dar Fusozai'"
	icon_state = "messithstun"
	modifystate = "messithstun"
	icon = 'icons/obj/infinity_items/messith.dmi'
	item_icons = list(
		slot_l_hand_str = 'icons/mob/onmob/guns/guns_l.dmi',
		slot_r_hand_str = 'icons/mob/onmob/guns/guns_r.dmi',
		)
	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun, modifystate="messithstun"),
		list(mode_name="shock", projectile_type=/obj/item/projectile/beam/stun/shock, modifystate="messithshock"),
		list(mode_name="kill", projectile_type=/obj/item/projectile/beam, modifystate="messithkill"),
		)
	trade_blacklisted = TRUE

/obj/item/gun/energy/gun/secure/messith/New()
	..()
	Scale(0.8, 0.8)
	Translate(-8, 0)

/obj/item/custkit/messith
	name = "messith customization kit"
	input = /obj/item/gun/energy/gun/secure
	output = /obj/item/gun/energy/gun/secure/messith

//zippo

/obj/item/flame/lighter/zippo/custom/messotha
	name = "messotha zippo"
	desc = "Темная зажигалка из, на удивление, теплого на ощупь металла с особой фиолетовой гравировкой. \
	Выпускает необычное пурпурное пламя, непривычное для; природного явления. \
	На лицевой стороне красуется цифра 27 со следующими словами: \
	\"27 убийств. Если ты нашёл эту зиппо на моём теле - иди-ка ты нахуй!\". На обратной стороне же, следующее: \
	\"Мы безвольные, обученные неопытными, делающие невозможное для неблагодарных. Десяти минут слишком мало\"."
	icon = 'infinity/icons/obj/lighters.dmi'
	icon_state = "messotha"
	trade_blacklisted = TRUE

/obj/item/clothing/accessory/armband/arhod_fusozai
	name = "fusozai signa (Messiatith-H)"
	desc = "Нашивка таяранского цвета крови, носимая на предплечье. Изображение на нем напоминает форму глаза, с \
	алым кошачьим зрачком, ниже которого распологается мишень со следующими словами - Вар Дар Фусозай. Выше глаза \
	вышито имя предпологаемого владельца - Амрин Баттррал."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "arhod_fusozai"
	accessory_icons = list(
		slot_w_uniform_str = CUSTOM_ITEM_MOB,
		slot_wear_suit_str = CUSTOM_ITEM_MOB)
	trade_blacklisted = TRUE
