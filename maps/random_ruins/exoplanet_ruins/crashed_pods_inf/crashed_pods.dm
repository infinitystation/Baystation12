GLOBAL_LIST_INIT(crashed_pods_areas, new)

/datum/map_template/ruin/exoplanet/crashed_pods
	name = "crashed survival pods"
	id = "crashed_pods"
	description = "A crashed survival pods from a destroyed ship."
	suffixes = list("crashed_pods_inf/crashed_pods.dmm")
	spawn_cost = 2.5
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS | TEMPLATE_FLAG_NO_RADS

/area/map_template/crashed_pods
	name = "\improper Crashed Pods"
	icon = 'infinity/icons/turf/areas.dmi'
	icon_state = "crashed_pods"
	turf_initializer = /decl/turf_initializer/maintenance

/area/map_template/crashed_pods/pod_hydro
	name = "\improper Crashed hydroponic Pod"
	icon_state = "pod_hydro"
	sound_env = SMALL_ENCLOSED

/area/map_template/crashed_pods/pod_cargo
	name = "\improper Crashed cargo Pods"
	icon_state = "pod_cargo"
	sound_env = LARGE_ENCLOSED

/area/map_template/crashed_pods/pod_eng
	name = "\improper Crashed engineering Pod"
	icon_state = "pod_eng"
	sound_env = SMALL_ENCLOSED

/area/map_template/crashed_pods/pod_med
	name = "\improper Crashed medical Pod"
	icon_state = "pod_med"
	sound_env = SMALL_ENCLOSED

/area/map_template/crashed_pods/pod_com
	name = "\improper Crashed Pods"
	icon_state = "pod_com"
	sound_env = SMALL_ENCLOSED

/decl/submap_archetype/crashed_pod
	descriptor = "crashed survival pods"
	crew_jobs = list(/datum/job/submap/pod)

/datum/submap/crashed_pod/sync_cell(var/obj/effect/overmap/visitable/cell)
	cell.has_distress_beacon = name

/datum/job/submap/pods
	title = "Crashed Pods Crew Member"
	info = "Your ship has been destroyed by a terrible disaster."
	outfit_type = /decl/hierarchy/outfit/job/survivor
	total_positions = 6

/decl/hierarchy/outfit/job/survivor
	name = OUTFIT_JOB_NAME("Survivor")
	pda_type = null

/datum/job/submap/pods/New(var/datum/submap/_owner, var/abstract_job = FALSE)
	..()
	if(_owner) // Might be called from admin tools, etc
		info = "Your station, the [_owner.name], has been destroyed by a terrible disaster, \
		leaving you stranded in your survival pod on a hostile exoplanet. Your pod's distress \
		signal might draw help, but even if you should be so lucky, you must survive long \
		enough for it to arrive."

/obj/effect/submap_landmark/spawnpoint/crashed_pods_survivor
	name = "Crashed Pods Crew"

/obj/effect/submap_landmark/joinable_submap/crashed_pods
	name = "Crashed Survival Pods"
	archetype = /decl/submap_archetype/crashed_pod
	submap_datum_type = /datum/submap/crashed_pod

/obj/effect/submap_landmark/joinable_submap/crashed_pods/New()
	var/list/possible_ship_names = list(
		"Hornet",		"Witchmoth",	"Planthopper",
		"Mayfly",		"Locust",		"Cicada",
		"Sanddragon",	"Conehead",		"Whitetail",
		"Amberwing",	"Swallowtail",	"Hawkmoth",
		"Katydid",		"Longhorn",		"Luna Moth",
		"Monarch",		"Mydas",		"Paperwasp",
		"Treehopper",	"Sphinxmoth",	"Leatherwing",
		"Scarab",		"Ash Borer",	"Admiral",
		"Emperor",		"Skipper",		"Tarantula Hawk",
		"Adder",		"Bumblebee")
	name = "[pick("SEV", "SIC", "FTUV", "ICV", "HMS")] [pick(possible_ship_names)]"
	..()
