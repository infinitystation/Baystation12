
//////////////
////resomi////
//////////////

/obj/item/clothing/suit/storage/toggle/Resomicoat
	 name = "small cloak"
	 icon = 'icons/obj/clothing/infinity/suits.dmi'
	 desc = "A cloak that seems too small to fit a human."
	 icon_state = "resomicoat"
	 item_state = "resomicoat"
	 icon_open = "resomicoat_open"
	 icon_closed = "resomicoat"
	 body_parts_covered = UPPER_TORSO|ARMS|LOWER_TORSO|LEGS
	 species_restricted = list(SPECIES_RESOMI)

/obj/item/clothing/suit/storage/toggle/Resomicoat/white
 	icon_state = "white_resomicoat"
 	item_state = "white_resomicoat"
 	icon_open = "white_resomicoat_open"
 	icon_closed = "white_resomicoat"

/obj/item/clothing/suit/storage/toggle/Resomilabcoat
	name = "small labcoat"
	icon = 'icons/obj/clothing/infinity/suits.dmi'
	desc = "A labcoat that seems too small to fit a human."
	icon_state = "resomi_labcoat"
	item_state = "resomi_labcoat"
	icon_open = "resomi_labcoat_open"
	icon_closed = "resomi_labcoat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	species_restricted = list(SPECIES_RESOMI)
	allowed = list(/obj/item/device/analyzer,/obj/item/stack/medical,/obj/item/weapon/reagent_containers/dropper,/obj/item/weapon/reagent_containers/syringe,/obj/item/weapon/reagent_containers/hypospray,/obj/item/device/healthanalyzer,/obj/item/device/flashlight/pen,/obj/item/weapon/reagent_containers/glass/bottle,/obj/item/weapon/reagent_containers/glass/beaker,/obj/item/weapon/reagent_containers/pill,/obj/item/weapon/storage/pill_bottle,/obj/item/weapon/paper)
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 50, rad = 0)

//standart resomicloak

/obj/item/clothing/suit/storage/resomicloak
	name = "broken cloak"
	desc = "It drapes over a Resomes's shoulders and closes at the neck with pockets convienently placed inside."
	icon = 'infinity/icons/obj/clothing/species/resomi/resomi_cloak.dmi'
	item_icons = list(slot_wear_suit_str = 'infinity/icons/obj/clothing/species/resomi/resomi_cloak.dmi')
	icon_state = "tesh_cloak_bo"
	species_restricted = list(SPECIES_RESOMI)
	body_parts_covered = UPPER_TORSO|ARMS|LOWER_TORSO

/obj/item/clothing/suit/storage/resomicloak/standard/black_orange
	name = "black and orange cloak"
	icon_state = "tesh_cloak_bo"
	item_state = "tesh_cloak_bo"

/obj/item/clothing/suit/storage/resomicloak/standard/black_grey
	name = "black and grey cloak"
	icon_state = "tesh_cloak_bg"
	item_state = "tesh_cloak_bg"

/obj/item/clothing/suit/storage/resomicloak/standard/black_midgrey
	name = "black and medium grey cloak"
	icon_state = "tesh_cloak_bmg"
	item_state = "tesh_cloak_bmg"

/obj/item/clothing/suit/storage/resomicloak/standard/black_lightgrey
	name = "black and light grey cloak"
	icon_state = "tesh_cloak_blg"
	item_state = "tesh_cloak_blg"

/obj/item/clothing/suit/storage/resomicloak/standard/black_white
	name = "black and white cloak"
	icon_state = "tesh_cloak_bw"
	item_state = "tesh_cloak_bw"

/obj/item/clothing/suit/storage/resomicloak/standard/black_red
	name = "black and red cloak"
	icon_state = "tesh_cloak_br"
	item_state = "tesh_cloak_br"

/obj/item/clothing/suit/storage/resomicloak/standard/black
	name = "black cloak"
	icon_state = "tesh_cloak_bn"
	item_state = "tesh_cloak_bn"

/obj/item/clothing/suit/storage/resomicloak/standard/black_yellow
	name = "black and yellow cloak"
	icon_state = "tesh_cloak_by"
	item_state = "tesh_cloak_by"

/obj/item/clothing/suit/storage/resomicloak/standard/black_green
	name = "black and green cloak"
	icon_state = "tesh_cloak_bgr"
	item_state = "tesh_cloak_bgr"

/obj/item/clothing/suit/storage/resomicloak/standard/black_blue
	name = "black and blue cloak"
	icon_state = "tesh_cloak_bbl"
	item_state = "tesh_cloak_bbl"

/obj/item/clothing/suit/storage/resomicloak/standard/black_purple
	name = "black and purple cloak"
	icon_state = "tesh_cloak_bp"
	item_state = "tesh_cloak_bp"

/obj/item/clothing/suit/storage/resomicloak/standard/black_pink
	name = "black and pink cloak"
	icon_state = "tesh_cloak_bpi"
	item_state = "tesh_cloak_bpi"

/obj/item/clothing/suit/storage/resomicloak/standard/black_brown
	name = "black and brown cloak"
	icon_state = "tesh_cloak_bbr"
	item_state = "tesh_cloak_bbr"

/obj/item/clothing/suit/storage/resomicloak/standard/orange_grey
	name = "orange and grey cloak"
	icon_state = "tesh_cloak_og"
	item_state = "tesh_cloak_og"

/obj/item/clothing/suit/storage/resomicloak/standard/rainbow
	name = "rainbow cloak"
	icon_state = "tesh_cloak_rainbow"
	item_state = "tesh_cloak_rainbow"

/obj/item/clothing/suit/storage/resomicloak/standard/lightgrey_grey
	name = "light grey and grey cloak"
	icon_state = "tesh_cloak_lgg"
	item_state = "tesh_cloak_lgg"

/obj/item/clothing/suit/storage/resomicloak/standard/white_grey
	name = "white and grey cloak"
	icon_state = "tesh_cloak_wg"
	item_state = "tesh_cloak_wg"

/obj/item/clothing/suit/storage/resomicloak/standard/red_grey
	name = "red and grey cloak"
	icon_state = "tesh_cloak_rg"
	item_state = "tesh_cloak_rg"

/obj/item/clothing/suit/storage/resomicloak/standard/orange
	name = "orange cloak"
	icon_state = "tesh_cloak_on"
	item_state = "tesh_cloak_on"

/obj/item/clothing/suit/storage/resomicloak/standard/yellow_grey
	name = "yellow and grey cloak"
	icon_state = "tesh_cloak_yg"
	item_state = "tesh_cloak_yg"

/obj/item/clothing/suit/storage/resomicloak/standard/green_grey
	name = "green and grey cloak"
	icon_state = "tesh_cloak_gg"
	item_state = "tesh_cloak_gg"

/obj/item/clothing/suit/storage/resomicloak/standard/blue_grey
	name = "blue and grey cloak"
	icon_state = "tesh_cloak_blug"
	item_state = "tesh_cloak_blug"

/obj/item/clothing/suit/storage/resomicloak/standard/purple_grey
	name = "purple and grey cloak"
	icon_state = "tesh_cloak_pg"
	item_state = "tesh_cloak_pg"

/obj/item/clothing/suit/storage/resomicloak/standard/pink_grey
	name = "pink and grey cloak"
	icon_state = "tesh_cloak_pig"
	item_state = "tesh_cloak_pig"

/obj/item/clothing/suit/storage/resomicloak/standard/brown_grey
	name = "brown and grey cloak"
	icon_state = "tesh_cloak_brg"
	item_state = "tesh_cloak_brg"

//job resomicloak

/obj/item/clothing/suit/storage/resomicloak/jobs/cargo
	name = "cargo cloak"
	desc = "A soft Resomi cloak made for the Cargo department"
	icon_state = "tesh_cloak_car"
	item_state = "tesh_cloak_car"

/obj/item/clothing/suit/storage/resomicloak/jobs/mining
	name = "mining cloak"
	desc = "A soft Resomi cloak made for Mining"
	icon_state = "tesh_cloak_mine"
	item_state = "tesh_cloak_mine"

/obj/item/clothing/suit/storage/resomicloak/jobs/command
	name = "command cloak"
	desc = "A soft Resomi cloak made for the Command department"
	icon_state = "tesh_cloak_comm"
	item_state = "tesh_cloak_comm"

/obj/item/clothing/suit/storage/resomicloak/jobs/ce
	name = "cheif engineer cloak"
	desc = "A soft Resomi cloak made the Chief Engineer"
	icon_state = "tesh_cloak_ce"
	item_state = "tesh_cloak_ce"

/obj/item/clothing/suit/storage/resomicloak/jobs/eningeer
	name = "engineering cloak"
	desc = "A soft Resomi cloak made for the Engineering department"
	icon_state = "tesh_cloak_engie"
	item_state = "tesh_cloak_engie"

/obj/item/clothing/suit/storage/resomicloak/jobs/atmos
	name = "atmospherics cloak"
	desc = "A soft Resomi cloak made for the Atmospheric Technician"
	icon_state = "tesh_cloak_atmos"
	item_state = "tesh_cloak_atmos"

/obj/item/clothing/suit/storage/resomicloak/jobs/cmo
	name = "chief medical officer cloak"
	desc = "A soft Resomi cloak made the Cheif Medical Officer"
	icon_state = "tesh_cloak_cmo"
	item_state = "tesh_cloak_cmo"

/obj/item/clothing/suit/storage/resomicloak/jobs/medical
	name = "medical cloak"
	desc = "A soft Resomi cloak made for the Medical department"
	icon_state = "tesh_cloak_doc"
	item_state = "tesh_cloak_doc"

/obj/item/clothing/suit/storage/resomicloak/jobs/chemistry
	name = "chemist cloak"
	desc = "A soft Resomi cloak made for the Chemist"
	icon_state = "tesh_cloak_chem"
	item_state = "tesh_cloak_chem"

/obj/item/clothing/suit/storage/resomicloak/jobs/viro
	name = "virologist cloak"
	desc = "A soft Resomi cloak made for the Virologist"
	icon_state = "tesh_cloak_viro"
	item_state = "tesh_cloak_viro"

/obj/item/clothing/suit/storage/resomicloak/jobs/para
	name = "paramedic cloak"
	desc = "A soft Resomi cloak made for the Paramedic"
	icon_state = "tesh_cloak_para"
	item_state = "tesh_cloak_para"

/obj/item/clothing/suit/storage/resomicloak/jobs/sci
	name = "scientist cloak"
	desc = "A soft Resomi cloak made for the Science department"
	icon_state = "tesh_cloak_sci"
	item_state = "tesh_cloak_sci"

/obj/item/clothing/suit/storage/resomicloak/jobs/robo
	name = "roboticist cloak"
	desc = "A soft Resomi cloak made for the roboticist"
	icon_state = "tesh_cloak_robo"
	item_state = "tesh_cloak_robo"

/obj/item/clothing/suit/storage/resomicloak/jobs/sec
	name = "security cloak"
	desc = "A soft Resomi cloak made for the Security department"
	icon_state = "tesh_cloak_sec"
	item_state = "tesh_cloak_sec"

/obj/item/clothing/suit/storage/resomicloak/jobs/qm
	name = "quartermaster cloak"
	desc = "A soft Resomi cloak made for the Quartermaster"
	icon_state = "tesh_cloak_qm"
	item_state = "tesh_cloak_qm"

/obj/item/clothing/suit/storage/resomicloak/jobs/service
	name = "service cloak"
	desc = "A soft Resomi cloak made for the Service department"
	icon_state = "tesh_cloak_serv"
	item_state = "tesh_cloak_serv"

/obj/item/clothing/suit/storage/resomicloak/jobs/iaa
	name = "internal affairs cloak"
	desc = "A soft Resomi cloak made for the Internal Affairs Agent"
	icon_state = "tesh_cloak_iaa"
	item_state = "tesh_cloak_iaa"