// There is costume bags that you can buy with donate coins

/obj/item/clothingbag/costume
	name = "costume clothing bag"
	desc = "A cheap plastic bag that contains a fresh set of clothes."

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Clown Costume
/obj/item/clothingbag/costume/clown
	name = "costume clothing bag - clown"
	desc = "Labeled as \"FOR MOTHER HONK\""

/obj/item/clothingbag/costume/clown/New()
	..()
	new /obj/item/clothing/mask/gas/clown_hat(src)
	new /obj/item/clothing/under/rank/clown(src)
	new /obj/item/clothing/shoes/clown_shoes(src)

// Witch costume
/obj/item/clothingbag/costume/witch
	name = "costume clothing bag - witch"
	desc = "Labeled as \"FOR REALLY BAD GIRLS (or boys)\""

/obj/item/clothingbag/costume/witch/New()
	..()
	new /obj/item/clothing/head/wizard/marisa/fake(src)
	new /obj/item/clothing/suit/wizrobe/marisa/fake(src)
	new /obj/item/clothing/shoes/sandal(src)
	new /obj/item/staff/broom(src)

// Chaplain costume
/obj/item/clothingbag/costume/chaplain
	name = "costume clothing bag - chaiplain"
	desc = "Labeled as \"DEAR LORD SAVE US\""

/obj/item/clothingbag/costume/chaplain/New()
	..()
	new /obj/item/clothing/under/rank/chaplain(src)
	new /obj/item/clothing/shoes/black(src)
	new /obj/item/material/cross(src)

// Anime costumes

/obj/item/clothingbag/costume/anime_white
	name = "costume clothing bag - white anime set"
	desc = "KAWAIIIIIII"

/obj/item/clothingbag/costume/anime_white/Initialize()
	. = ..()
	new /obj/item/clothing/suit/anime_white(src)
	new /obj/item/clothing/shoes/anime_white(src)
	new /obj/item/clothing/head/anime_band(src)
	new /obj/item/storage/backpack/industrial/anime_coffin(src)

/obj/item/clothingbag/costume/anime_blue
	name = "costume clothing bag - blue anime set"
	desc = "KAWAIIIIIII"

/obj/item/clothingbag/costume/anime_blue/Initialize()
	. = ..()
	new /obj/item/clothing/suit/anime_blue(src)
	new /obj/item/clothing/shoes/anime_blue(src)
	new /obj/item/clothing/head/anime_band/blue(src)
