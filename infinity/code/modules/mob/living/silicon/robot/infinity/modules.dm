/obj/item/robot_module/naris
	name = "naris the friend"
	sprites = list(	"Basic" = "naris")
	hide_on_manifest = 0

/obj/item/robot_module/naris/New()
	src.modules += new /obj/item/device/flash(src)
	src.modules += new /obj/item/crowbar(src)
	src.modules += new /obj/item/handcuffs/cable/cyborg(src)
	src.modules += new /obj/item/gun/energy/taser/mounted(src)
	src.emag = new /obj/item/melee/energy/sword(src)
	..()
