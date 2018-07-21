/obj/item/documents
	name = "secret documents"
	desc = "\"����� C��������\" �������� � ������ � ����������� �� ������&#255; - ���� ���� ������ �� ����� �����&#255;���, ��� ����&#255;��� ����� ��� ��������. �� ������ ��������� ����������� ������ ��������������� ������� ���."
	icon = 'icons/obj/items_inf.dmi'
	icon_state = "docs_generic"
	item_state = "paper"
	var/information
	throwforce = 0
	w_class = ITEM_SIZE_TINY
	throw_range = 1
	throw_speed = 1
	layer = MOB_LAYER

	var/information_text = "It's very secret."
/*
/obj/item/documents/random/New()
	switch(information)
		if(1)
			information_text = ("� ������ ��������� �������� ��������� ������������ � �������� � �� ������������ ������ - ��������, ���-�� ���������� ������ ������� ������ �� ����� ��������� �������� ���...")
		if(2)
			information_text = ("����� ������� ��������� ������ ���� ���������� ������� - �� ����������� ���������� �� ��������� ���������. ���������...")
		if(3)
			information_text = ("����� ��������� �������� � ������ � ����������� �� ������� - ���� ���� ������ �� ����� ���������, ��� �������� ����� ��� ��������.")
		if(4)
			information_text = ("������ ���������� ��� �������� ������� � ������ ����� �� ������� �� ������� ��������� �� ��� ����������... ��������� ���� ������� �����, ��� ���������. ������ ������ �������� �� ���.")
*/
/obj/item/documents/nanotrasen
	desc = "\"Top Secret\" Nanotrasen documents, filled with complex diagrams and lists of names, dates and coordinates."
	icon_state = "docs_verified"

/obj/item/documents/syndicate
	desc = "\"Top Secret\" documents detailing sensitive Syndicate operational intelligence."

/obj/item/documents/syndicate/red
	name = "red secret documents"
	desc = "\"Top Secret\" documents detailing sensitive Syndicate operational intelligence. These documents are verified with a red wax seal."
	icon_state = "docs_red"

/obj/item/documents/syndicate/blue
	name = "blue secret documents"
	desc = "\"Top Secret\" documents detailing sensitive Syndicate operational intelligence. These documents are verified with a blue wax seal."
	icon_state = "docs_blue"

/obj/item/documents/syndicate/mining
	desc = "\"Top Secret\" documents detailing Syndicate plasma mining operations."

/obj/item/documents/photocopy
	desc = "A copy of some top-secret documents. Nobody will notice they aren't the originals... right?"
	var/forgedseal = 0
	var/copy_type = null

/* TODO INFINITY
/obj/item/documents/photocopy/New(loc, obj/item/documents/copy=null)
	..()
	if(copy)
		copy_type = copy.type
		if(istype(copy, /obj/item/documents/photocopy)) // Copy Of A Copy Of A Copy
			var/obj/item/documents/photocopy/C = copy
			copy_type = C.copy_type

/obj/item/documents/photocopy/attackby(obj/item/O, mob/user, params)
	if(istype(O, /obj/item/weapon/pen/crayon/red) || istype(O, /obj/item/weapon/pen/crayon/blue))
		if (forgedseal)
			to_chat(user, "<span class='warning'>You have already forged a seal on [src]!</span>")
		else
			var/obj/item/toy/crayon/C = O
			name = "[C.item_color] secret documents"
			icon_state = "docs_[C.item_color]"
			forgedseal = C.item_color
			to_chat(user, "<span class='notice'>You forge the official seal with a [C.item_color] crayon. No one will notice... right?</span>")
			update_icon()*
*/