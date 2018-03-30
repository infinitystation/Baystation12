/mob/living/silicon/ai
	hud_type = /datum/hud/ai

/datum/hud/ai/FinalizeInstantiation() //~KareTa

	src.adding = list()
	var/obj/screen/ai_button/using

	//AI Core
	using = new /obj/screen/ai_button()
	using.name = "Ai Core"
	using.icon_state = "ai_core"
	using.screen_loc = ui_ai_core
	using.ai_verb = /mob/living/silicon/ai/proc/core
	src.adding += using

	//AI_Announcement
	using = new /obj/screen/ai_button()
	using.name = "AI Announcement"
	using.icon_state = "announcement"
	using.screen_loc = ui_ai_announcement
	using.ai_verb = /mob/living/silicon/ai/proc/ai_announcement
	src.adding += using

	//Camera Track
	using = new /obj/screen/ai_button()
	using.name = "Track With Camera"
	using.icon_state = "track"
	using.screen_loc = ui_ai_cam_track
	using.ai_verb = /mob/living/silicon/ai/proc/ai_camera_track
	using.input_procs = list(/mob/living/silicon/ai/proc/trackable_mobs = (AI_BUTTON_PROC_BELONGS_TO_CALLER|AI_BUTTON_INPUT_REQUIRES_SELECTION))
	src.adding += using

	//Camera Lights
	using = new /obj/screen/ai_button()
	using.name = "Toggle Camera Lights"
	using.icon_state = "camera_light"
	using.screen_loc = ui_ai_cam_light
	using.ai_verb = /mob/living/silicon/ai/proc/toggle_camera_light
	src.adding += using

	//Change Network
	using = new /obj/screen/ai_button()
	using.name = "Jump to Network"
	using.icon_state = "camera"
	using.screen_loc = ui_ai_cam_change_network
	using.ai_verb = /mob/living/silicon/ai/proc/ai_network_change
	using.input_procs = list(/mob/living/silicon/ai/proc/get_camera_network_list = (AI_BUTTON_PROC_BELONGS_TO_CALLER|AI_BUTTON_INPUT_REQUIRES_SELECTION))
	src.adding += using

	//Set Sensor Augmentation
	using = new /obj/screen/ai_button()
	using.name = "Set Sensor Augmentation"
	using.icon_state = "ai_sensor"
	using.screen_loc = ui_ai_sensor
	using.ai_verb = /mob/living/silicon/ai/proc/sensor_mode
	src.adding += using

	//Crew Manifest
	using = new /obj/screen/ai_button()
	using.name = "Show Crew Manifest"
	using.icon_state = "manifest"
	using.screen_loc = ui_ai_crew_manifest
	using.ai_verb = /mob/living/silicon/ai/proc/ai_roster
	src.adding += using

	//Toggle Camera Mode
	using = new /obj/screen/ai_button()
	using.name = "Toggle Camera Mode"
	using.icon_state = "take_picture"
	using.screen_loc = ui_ai_take_image
	using.ai_verb = /mob/living/silicon/ai/proc/ai_take_image
	src.adding += using

	//View Images
	using = new /obj/screen/ai_button()
	using.name = "View Images"
	using.icon_state = "view_images"
	using.screen_loc = ui_ai_view_images
	using.ai_verb = /mob/living/silicon/ai/proc/ai_view_images
	src.adding += using

	//State Laws
	using = new /obj/screen/ai_button()
	using.name = "State Laws"
	using.icon_state = "state_laws"
	using.screen_loc = ui_ai_state_laws
	using.ai_verb = /mob/living/silicon/ai/proc/ai_checklaws
	src.adding += using

	//Call Shuttle
	using = new /obj/screen/ai_button()
	using.name = "Call Shuttle"
	using.icon_state = "call_shuttle"
	using.screen_loc = ui_ai_call_shuttle
	using.ai_verb = /mob/living/silicon/ai/proc/ai_call_shuttle
	src.adding += using

	//Move Upwards
	using = new /obj/screen/ai_button()
	using.name = "Move Upwards"
	using.icon_state = "ai_up"
	using.screen_loc = ui_ai_up
	using.ai_verb = /mob/verb/up
	src.adding += using

	//Move Downwards
	using = new /obj/screen/ai_button()
	using.name = "Move Downwards"
	using.icon_state = "ai_down"
	using.screen_loc = ui_ai_down
	using.ai_verb = /mob/verb/down
	src.adding += using

	mymob.client.screen = list()
	mymob.client.screen += src.adding