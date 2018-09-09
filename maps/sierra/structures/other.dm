/obj/structure/bookcase/manuals/security
	name = "Law Manuals bookcase"

	New()
		..()
		new /obj/item/weapon/book/manual/detective(src)
		new /obj/item/weapon/book/manual/nt_regs(src)
		new /obj/item/weapon/book/manual/solgov_law(src)
		new /obj/item/weapon/book/manual/sol_sop(src)
		new /obj/item/weapon/book/manual/military_law(src)
		update_icon()