/obj/item/weapon/robot_module/naris
	name = "naris the friend"
	sprites = list(	"Basic" = "naris")
	hide_on_manifest = 0

/obj/item/weapon/robot_module/naris/New()
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/weapon/crowbar(src)
	src.modules += new /obj/item/weapon/handcuffs/cable/cyborg(src)
	src.modules += new /obj/item/weapon/gun/energy/taser/mounted(src)
	src.emag = new /obj/item/weapon/melee/energy/sword(src)
	..()