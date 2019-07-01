GLOBAL_VAR_INIT(changelog_hash_infinity, "")

/datum/preferences
	var/lastchangelog_infinity = ""

/client/verb/changes_infinity()
	set name = "Infinity Changelog"
	set category = "OOC"
	getFiles(
		'html/88x31.png',
		'html/bug-minus.png',
		'html/burn-exclamation.png',
		'html/chevron.png',
		'html/chevron-expand.png',
		'html/cross-circle.png',
		'html/hard-hat-exclamation.png',
		'html/image-minus.png',
		'html/image-plus.png',
		'html/map-pencil.png',
		'html/music-minus.png',
		'html/music-plus.png',
		'html/tick-circle.png',
		'html/scales.png',
		'html/spell-check.png',
		'html/wrench-screwdriver.png',
		'html/changelog.css',
		'html/changelog_infinity.html'
		)

	src << browse('html/changelog_infinity.html', "window=changes_infinity;size=675x650")
	if(prefs.lastchangelog_infinity != GLOB.changelog_hash_infinity)
		prefs.lastchangelog_infinity = GLOB.changelog_hash_infinity
		prefs.save_preferences()
		winset(src, "rpane.changelog_infinity", "background-color=none;font-style=;")
