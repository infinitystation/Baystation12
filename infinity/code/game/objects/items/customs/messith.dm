/obj/item/weapon/gun/energy/gun/secure/messith
	name = "messith pistol"
	desc = "Пистолет 'Мессит' &#255;вл&#255;етс&#255; усовершенствованной версией стандартного 'Сэрандаррита', переоборудованный под энерго-оружие. Данный пистолет выдаётс&#255; всем членам семьи 'Фусозай', как табельное оружие начина&#255; со звани&#255; 'Мессита', чем и был прозван. Его главна&#255; особенность в отличие от стандартного компактного 'Перуна' - удлинённый ствол и облегчённа&#255; руко&#255;тка, позвол&#255;юща&#255; стрел&#255;ть точнее своего прародител&#255; и ровестника, но минус - дороговизна и быстрый разогрев ствола при стрельбе в летальном режиме. На стволе, суд&#255; по всему, обладатель данного оружи&#255; нацарапал надпись 'Var Dar Fusozai'"
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
	name = "Messith customization kit"
	input = /obj/item/weapon/gun/energy/gun/secure
	output = /obj/item/weapon/gun/energy/gun/secure/messith
