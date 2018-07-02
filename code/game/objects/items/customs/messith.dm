/obj/item/weapon/gun/energy/gun/small/messith
	name = "Messith"
	desc = "ѕистолет 'ћессит' является усовершенствованной версией стандартного '—эрандаррита', переоборудованный под энерго-оружие. ƒанный пистолет выдаЄтся всем членам семьи '‘усозай', как табельное оружие начиная со звания 'ћессита', чем и был прозван. ≈го главная особенность в отличие от стандартного компактного 'ѕеруна' - удлинЄнный ствол и облегчЄнная руко€тка, позвол€ющая стрелять точнее своего прародителя и ровестника, но минус - дороговизна и быстрый разогрев ствола при стрельбе в летальном режиме. Ќа стволе, судя по всему, обладатель данного оружия нацарапал надпись 'Var Dar Fusozai'"
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
		list(mode_name="kill", projectile_type=/obj/item/projectile/beam/smalllaser, modifystate="messithkill"),
		)

/obj/item/weapon/gun/energy/gun/small/messith/New()
	..()
	Scale(0.8, 0.8)
	Translate(-8, 0)

/obj/item/custkit/messith
	name = "Messith customization kit"
	input = /obj/item/weapon/gun/energy/gun/small/secure
	output = /obj/item/weapon/gun/energy/gun/small/messith
