/obj/item/clothing/suit/armor/bulletproof/adro
	name = "6B13M assault armor"
	desc = "An assault armor '6B13' from GCC. Personally modified by Blade 6B13. Ceramic armored plates replaced with lightweight polyethylene plates. The protection class is higher, the weight is less."
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L)
	icon = CUSTOM_ITEM_OBJ
	icon_state = "pcarrier"
	item_state = "pcarrier"
	item_icons = list(
		slot_wear_suit_str = CUSTOM_ITEM_MOB
		)
	trade_blacklisted = TRUE

/obj/item/clothing/head/helmet/ballistic/adro
	name = "sphere-1 assault helmet"
	desc = "An assault helmet 'Sphere-1'. This one has black paint and white stripes. Personal item of a PMC 'Volk' veteran."
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(
		slot_head_str = CUSTOM_ITEM_MOB
		)
	icon_state = "helm_adro"
	body_parts_covered = HEAD|FACE|EYES
	action_button_name = "Toggle Visor"
	trade_blacklisted = TRUE
	var/raised = FALSE

/obj/item/clothing/head/helmet/ballistic/adro/attack_self(mob/user)
	raised = !raised
	if(raised)
		icon_state = "[icon_state]_up"
		body_parts_covered |= EYES|FACE
	else
		icon_state = initial(icon_state)
		body_parts_covered = initial(body_parts_covered)
	visible_message(SPAN_ITALIC("\The [user] [raised ? "raises" : "lowers"] the visor on \the [src]."), range = 3)
	update_clothing_icon()

/obj/item/clothing/under/rank/security/adro
	name = "agikas tracksuit"
	desc = "A black tracksuit from Magnitka with 'Agikas' logo on chest, very warm and comfortable"
	icon = CUSTOM_ITEM_OBJ
	item_icons = list(slot_w_uniform_str = CUSTOM_ITEM_MOB)
	icon_state = "adrouni"
	item_state = "adrouni"
	worn_state = "adrouni"
	armor = list() //no armor
	trade_blacklisted = TRUE

/obj/item/weapon/clothingbag/adro
	name = "uniform package"
	desc = "An utility bag stamped with a PMC 'Volk' logo."
	New()
		new /obj/item/clothing/suit/armor/bulletproof/adro(src)
		new /obj/item/clothing/head/helmet/ballistic/adro(src)
		new /obj/item/clothing/under/rank/security/adro(src)
