/decl/hierarchy/supply_pack/materials
	name = "Materials"

/decl/hierarchy/supply_pack/materials/New()
	for(var/thing in contains)
		var/obj/item/stack/material/S = thing
		var/material/mat = SSmaterials.get_material_by_name(initial(S.default_type))
		if(istype(mat) && mat.sale_price)
			cost += mat.sale_price * initial(S.amount)
	..()

// Material sheets (50 - full stack)

/decl/hierarchy/supply_pack/materials/steel50
	name = "50 steel sheets"
	contains = list(/obj/item/stack/material/steel/fifty)
	cost = 10
	containername = "steel sheets crate"

/decl/hierarchy/supply_pack/materials/alum50
	name = "50 aluminium sheets"
	contains = list(/obj/item/stack/material/aluminium/fifty)
	cost = 10
	containername = "aluminium sheets crate"

/decl/hierarchy/supply_pack/materials/glass50
	name = "50 glass sheets"
	contains = list(/obj/item/stack/material/glass/fifty)
	cost = 10
	containername = "glass sheets crate"

/decl/hierarchy/supply_pack/materials/plastic50
	name = "50 plastic sheets"
	contains = list(/obj/item/stack/material/plastic/fifty)
	cost = 10
	containername = "plastic sheets crate"

/decl/hierarchy/supply_pack/materials/marble50
	name = "50 slabs of marble"
	contains = list(/obj/item/stack/material/marble/fifty)
	cost = 20
	containername = "marble slabs crate"

/decl/hierarchy/supply_pack/materials/plasteel50
	name = "50 plasteel sheets"
	contains = list(/obj/item/stack/material/plasteel/fifty)
	cost = 20
	containername = "plasteel sheets crate"

/decl/hierarchy/supply_pack/materials/titanium50
	name = "50 titanium sheets"
	contains = list(/obj/item/stack/material/titanium/fifty)
	cost = 20
	containername = "titanium sheets crate"

/decl/hierarchy/supply_pack/materials/ocp50
	name = "50 osmium carbide plasteel sheets"
	contains = list(/obj/item/stack/material/ocp/fifty)
	cost = 20
	containername = "osmium carbide plasteel sheets crate"

// Material sheets (10 - Smaller amounts, less cost efficient)
/decl/hierarchy/supply_pack/materials/marble10
	name = "10 slabs of marble"
	contains = list(/obj/item/stack/material/marble/ten)
	cost = 20
	containername = "marble slabs crate"

/decl/hierarchy/supply_pack/materials/plasteel10
	name = "10 plasteel sheets"
	contains = list(/obj/item/stack/material/plasteel/ten)
	cost = 30
	containername = "plasteel sheets crate"

/decl/hierarchy/supply_pack/materials/titanium10
	name = "10 titanium sheets"
	contains = list(/obj/item/stack/material/titanium/ten)
	cost = 20
	containername = "titanium sheets crate"

/decl/hierarchy/supply_pack/materials/ocp10
	name = "10 osmium carbide plasteel sheets"
	contains = list(/obj/item/stack/material/ocp/ten)
	cost = 20
	containername = "osmium carbide plasteel sheets crate"

/decl/hierarchy/supply_pack/materials/phoron10
	name = "10 phoron sheets"
	contains = list(/obj/item/stack/material/phoron/ten)
	cost = 50 // When sold yields 67 points.
	containername = "phoron sheets crate"

/decl/hierarchy/supply_pack/materials/gold10
	name = "10 gold sheets"
	contains = list(/obj/item/stack/material/gold/ten)
	cost = 90
	containername = "gold sheets crate"

/decl/hierarchy/supply_pack/materials/silver10
	name = "10 silver sheets"
	contains = list(/obj/item/stack/material/silver/ten)
	cost = 60
	containername = "silver sheets crate"

/decl/hierarchy/supply_pack/materials/uranium10
	name = "10 uranium sheets"
	contains = list(/obj/item/stack/material/uranium/ten)
	cost = 70
	containername = "uranium sheets crate"

/decl/hierarchy/supply_pack/materials/diamond10
	name = "10 diamond sheets"
	contains = list(/obj/item/stack/material/diamond/ten)
	cost = 100
	containername = "diamond sheets crate"

//wood zone
/decl/hierarchy/supply_pack/materials/wood50
	name = "50 wooden planks"
	contains = list(/obj/item/stack/material/wood/fifty)
	cost = 10
	containername = "wooden planks crate"

/decl/hierarchy/supply_pack/materials/mahogany25
	name = "25 mahogany planks"
	contains = list(/obj/item/stack/material/wood/mahogany/twentyfive)
	cost = 10
	containername = "mahogany planks crate"

/decl/hierarchy/supply_pack/materials/maple50
	name = "50 maple planks"
	contains = list(/obj/item/stack/material/wood/maple/twentyfive = 2)
	cost = 30 //INF, WAS 10. It will cost 55, which is 100% of its cost (crate+stamp+wood)
	containername = "maple planks crate"

/decl/hierarchy/supply_pack/materials/walnut25
	name = "25 walnut planks"
	contains = list(/obj/item/stack/material/wood/walnut/twentyfive)
	cost = 10
	containername = "walnut planks crate"

/decl/hierarchy/supply_pack/materials/ebony25
	name = "25 ebony planks"
	contains = list(/obj/item/stack/material/wood/ebony/twentyfive)
	cost = 15 //luxury tax
	containername = "ebony planks crate"

/decl/hierarchy/supply_pack/materials/yew25
	name = "25 yew planks"
	contains = list(/obj/item/stack/material/wood/yew/twentyfive)
	cost = 10
	containername = "yew planks crate"

/decl/hierarchy/supply_pack/materials/cloth50
	name = "50 rolls white cloth"
	contains = list(/obj/item/stack/material/cloth/fifty)
	cost = 10
	containername = "white cloth crate"

/decl/hierarchy/supply_pack/materials/red_cloth50
	name = "50 rolls red cloth"
	contains = list(/obj/item/stack/material/cloth/red/fifty)
	cost = 10
	containername = "red cloth crate"

/decl/hierarchy/supply_pack/materials/yellow_cloth50
	name = "50 rolls yellow cloth"
	contains = list(/obj/item/stack/material/cloth/yellow/fifty)
	cost = 10
	containername = "yellow cloth crate"

/decl/hierarchy/supply_pack/materials/teal_cloth50
	name = "50 rolls teal cloth"
	contains = list(/obj/item/stack/material/cloth/teal/fifty)
	cost = 10
	containername = "teal cloth crate"

/decl/hierarchy/supply_pack/materials/black_cloth50
	name = "50 rolls black cloth"
	contains = list(/obj/item/stack/material/cloth/black/fifty)
	cost = 10
	containername = "black cloth crate"

/decl/hierarchy/supply_pack/materials/green_cloth50
	name = "50 rolls green cloth"
	contains = list(/obj/item/stack/material/cloth/green/fifty)
	cost = 10
	containername = "green cloth crate"

/decl/hierarchy/supply_pack/materials/purple_cloth50
	name = "50 rolls purple cloth"
	contains = list(/obj/item/stack/material/cloth/purple/fifty)
	cost = 10
	containername = "purple cloth crate"

/decl/hierarchy/supply_pack/materials/blue_cloth50
	name = "50 rolls blue cloth"
	contains = list(/obj/item/stack/material/cloth/blue/fifty)
	cost = 10
	containername = "blue cloth crate"

/decl/hierarchy/supply_pack/materials/beige_cloth50
	name = "50 rolls beige cloth"
	contains = list(/obj/item/stack/material/cloth/beige/fifty)
	cost = 10
	containername = "beige cloth crate"

/decl/hierarchy/supply_pack/materials/lime_cloth50
	name = "50 rolls lime cloth"
	contains = list(/obj/item/stack/material/cloth/lime/fifty)
	cost = 10
	containername = "lime cloth crate"
