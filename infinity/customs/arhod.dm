//necklace

/obj/item/clothing/accessory/necklace/messa //arhod's custom item
	name = "messa amulet"
	desc = "Выплавленный из сплава стали и титана амулет с маленьким флаконом из ударопрочного стекла, \
	содержащий кровь владельца. Амулет напоминает форму кровоточащего, полузакрытого кошачьего глаза - \
	символ духа Мессы. Считаетс&#255;, что Месса изменила ход истории та&#255;ран через своих детей во врем&#255; \
	Тыс&#255;чителетного рабства. Позже эти дети образовали семью \"Фусозай\", известна&#255; в клане Кайман, \
	как одна из самых воинственных и преданных свободе та&#255;ран организаци&#255;."
	icon = CUSTOM_ITEM_OBJ
	icon_state = "messa_amulet"
	accessory_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB, slot_wear_suit_str = CUSTOM_ITEM_MOB)

//a gun

/obj/item/weapon/gun/energy/gun/secure/messith
	name = "messith pistol"
	desc = "Пистолет \"Мессит\" &#255;вл&#255;етс&#255; усовершенствованной версией стандартного 'Сэрандаррита', переоборудованный под энерго-оружие. Данный пистолет выдаётс&#255; всем членам семьи 'Фусозай', как табельное оружие начина&#255; со звани&#255; 'Мессита', чем и был прозван. Его главна&#255; особенность в отличие от стандартного компактного 'Перуна' - удлинённый ствол и облегчённа&#255; руко&#255;тка, позвол&#255;юща&#255; стрел&#255;ть точнее своего прародител&#255; и ровестника, но минус - дороговизна и быстрый разогрев ствола при стрельбе в летальном режиме. На стволе, суд&#255; по всему, обладатель данного оружи&#255; нацарапал надпись 'Var Dar Fusozai'"
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

/obj/item/weapon/gun/energy/gun/secure/messith/New()
	..()
	Scale(0.8, 0.8)
	Translate(-8, 0)

/obj/item/custkit/messith
	name = "messith customization kit"
	input = /obj/item/weapon/gun/energy/gun/secure
	output = /obj/item/weapon/gun/energy/gun/secure/messith

//zippo

/obj/item/weapon/flame/lighter/zippo/custom/messotha
	name = "messotha zippo"
	desc = "Темна&#255; зажигалка из, на удивление, теплого на ощупь металла с особой фиолетовой гравировкой. \
	Выпускает необычное пурпурное плам&#255;, непривычное дл&#255;; природного &#255;влени&#255;. \
	На лицевой стороне красуетс&#255; цифра 27 со следующими словами: \
	\"27 убийств. Если ты нашёл эту зиппо на моём теле - иди-ка ты нахуй!\". На обратной стороне же, следующее: \
	\"Мы безвольные, обученные неопытными, делающие невозможное дл&#255; неблагодарных. Дес&#255;ти минут слишком мало\"."
	icon = 'infinity/icons/obj/lighters.dmi'
	icon_state = "messotha"
