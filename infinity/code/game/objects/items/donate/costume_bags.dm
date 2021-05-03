// There is costume bags that you can buy with donate coins

/obj/item/weapon/clothingbag/costume
	name = "costume clothing bag"
	desc = "A cheap plastic bag that contains a fresh set of clothes."

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Clown Costume
/obj/item/weapon/clothingbag/costume/clown
	name = "costume clothing bag - clown"
	desc = "Labeled as \"FOR MOTHER HONK\""

/obj/item/weapon/clothingbag/costume/clown/New()
	..()
	new /obj/item/clothing/mask/gas/clown_hat(src)
	new /obj/item/clothing/under/rank/clown(src)
	new /obj/item/clothing/shoes/clown_shoes(src)

// Witch costume
/obj/item/weapon/clothingbag/costume/witch
	name = "costume clothing bag - witch"
	desc = "Labeled as \"FOR REALLY BAD GIRLS (or boys)\""

/obj/item/weapon/clothingbag/costume/witch/New()
	..()
	new /obj/item/clothing/head/wizard/marisa/fake(src)
	new /obj/item/clothing/suit/wizrobe/marisa/fake(src)
	new /obj/item/clothing/shoes/sandal(src)
	new /obj/item/weapon/staff/broom(src)

// Chaplain costume
/obj/item/weapon/clothingbag/costume/chaplain
	name = "costume clothing bag - chaiplain"
	desc = "Labeled as \"DEAR LORD SAVE US\""

/obj/item/weapon/clothingbag/costume/chaplain/New()
	..()
	new /obj/item/clothing/under/rank/chaplain(src)
	new /obj/item/clothing/shoes/black(src)
	new /obj/item/weapon/material/cross(src)
