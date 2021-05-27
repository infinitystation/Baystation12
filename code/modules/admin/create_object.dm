var/create_object_html = null
//[inf]
GLOBAL_VAR_INIT(create_object_forms, list(
/obj, /obj/structure, /obj/machinery, /obj/effect, /obj/item,
/obj/item/, /obj/item/clothing, /obj/item/stack,
/obj/item/device, /obj/item/reagent_containers, /obj/item/gun, /obj/prefab))
//[/inf]
/datum/admins/proc/create_object(var/mob/user)
	if (!create_object_html)
		var/objectjs = GLOB.create_object_forms //inf@WAS: var/objectjs = null
		objectjs = jointext(typesof(/obj), ";")
		create_object_html = file2text('html/create_object.html')
		create_object_html = replacetext(create_object_html, "null /* object types */", "\"[objectjs]\"")

	show_browser(user, replacetext(create_object_html, "/* ref src */", "\ref[src]"), "window=create_object;size=425x580") //INF


/datum/admins/proc/quick_create_object(var/mob/user)

	var/quick_create_object_html = null
	var/path = input("Select the path of the object you wish to create.", "Path", /obj) as null|anything in GLOB.create_object_forms // inf
	if(!path)
		return

	if (!quick_create_object_html)
		var/objectjs = null
		objectjs = jointext(typesof(path), ";")
		quick_create_object_html = file2text('html/create_object.html')
		quick_create_object_html = replacetext(quick_create_object_html, "null /* object types */", "\"[objectjs]\"")

	show_browser(user, replacetext(quick_create_object_html, "/* ref src */", "\ref[src]"), "window=quick_create_object;size=425x570") //INF
