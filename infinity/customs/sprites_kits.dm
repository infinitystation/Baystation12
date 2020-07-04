/obj/item/custkit/sprite/white_card //M.Ceisler (mceisler), Vladimir Bloodenheart
	name = "white ID customization kit"
	input = /obj/item/weapon/card/id
	output = "mimeGold"

/obj/item/custkit/sprite/white_card/attackby(obj/item/I, mob/user, params)
	if(istype(I, input))
		I.icon = 'icons/obj/card.dmi'
		I.icon_state = output
		I.name = "White ID"
		qdel(src)
