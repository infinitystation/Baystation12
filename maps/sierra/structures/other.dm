/obj/structure/bookcase/manuals/security
	name = "Law Manuals bookcase"

	New()
		..()
		new /obj/item/weapon/book/manual/detective(src)
		new /obj/item/weapon/book/manual/nt_regs(src)
		new /obj/item/weapon/book/manual/solgov_law(src)
		new /obj/item/weapon/book/manual/nt_sop(src)
		new /obj/item/weapon/book/manual/nt_tc(src)
		new /obj/item/weapon/book/manual/military_law(src)
		update_icon()

/obj/structure/mattress_clean
	name = "mattress"
	desc = "A clean mattress. Not so comfortable, but enought."
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "mattress"
	anchored = 0