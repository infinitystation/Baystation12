var/create_object_html = null
var/list/create_object_forms = list(/obj, /obj/structure, /obj/machinery, /obj/effect, /obj/item, /obj/mecha, /obj/item/weapon, /obj/item/clothing, /obj/item/stack, /obj/item/device, /obj/item/weapon/reagent_containers, /obj/item/weapon/gun)

/datum/admins/proc/create_object(var/mob/user)
	if (!create_object_html)
		var/objectjs = null
		objectjs = jointext(typesof(/obj), ";")
		create_object_html = file2text('html/create_object.html')
		create_object_html = replacetext(create_object_html, "null /* object types */", "\"[objectjs]\"")

	user << browse(replacetext(create_object_html, "/* ref src */", "\ref[src]"), "window=create_object;size=425x475")

/datum/admins/proc/quick_create_object(var/mob/user)
	var/path = input("Select the path of the object you wish to create.", "Path", /obj) in create_object_forms
	var/html_form = create_object_forms[path]


	var/quick_create_object_html = null
	if(!path)
		return

	if (!quick_create_object_html)
		var/objectjs = null
		objectjs = jointext(typesof(path), ";")
		quick_create_object_html = file2text('html/create_object.html')
		quick_create_object_html = replacetext(quick_create_object_html, "null /* object types */", "\"[objectjs]\"")

	user << browse(replacetext(html_form, "/* ref src */", "\ref[src]"), "window=qco[path];size=425x475")
