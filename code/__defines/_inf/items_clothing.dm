#define ACCESSORY_SLOT_OVER     "Over"

// Macroses

// Returns FILE or NULL. Not text!!!
#define INF_FILE(X)											file("infinity/[X]")

// Returns TEXT not file!!!
#define CLOTHING_ICON_OBJ(X)								"icons/obj/clothing/obj_[X].dmi"
#define CLOTHING_ICON_MOB(X)								"icons/mob/onmob/onmob_[X].dmi"

#define INF_CLOTHING_ICON_OBJ(X)							INF_FILE(CLOTHING_ICON_OBJ(X))
#define INF_CLOTHING_ICON_MOB(X)							INF_FILE(CLOTHING_ICON_MOB(X))

// Example: INF_CLOTHONG_ICON_OBJ("head")	--> 	'infinity/icons/obj/clothing/obj_head.dmi'
// Example: INF_CLOTHONG_ICON_MOB("head")	--> 	'infinity/icons/mob/onmob/onmob_head.dmi'

// If needed you can use file(CLOTHING_ICON_OBJ("head")) to receive baystations icon files
// Or if replacing bay's full path with ours - use INF_FILE("icons/obj/clothing/obj_head.dmi") it's multipurposal

// One important thing: single quote ' defines FILE if between them we can't locate file byond throws an error
// double quotes " it's text, it's cool to work with, BUT if you need take file from path do not forget to use file()
