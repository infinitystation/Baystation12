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

	//_Elar_
	//AI Floor Color
	using = new /obj/screen/ai_button()
	using.name = "Change Floor Color"
	using.icon_state = "ai_floor"
	using.screen_loc = ui_ai_color
	using.ai_verb = /mob/living/silicon/ai/proc/change_floor
	src.adding += using

	//AI Holo Change
	using = new /obj/screen/ai_button()
	using.name = "Change Hologram"
	using.icon_state = "ai_holo_change"
	using.screen_loc = ui_ai_holo_change
	using.ai_verb = /mob/living/silicon/ai/proc/ai_hologram_change
	src.adding += using

	//AI crew monitor
	using = new /obj/screen/ai_button()
	using.name = "Crew Monitor"
	using.icon_state = "crew_monitor"
	using.screen_loc = ui_ai_crew_mon
	using.ai_verb = /mob/living/silicon/ai/proc/show_crew_monitor
	src.adding += using

	//AI power override
	using = new /obj/screen/ai_button()
	using.name = "Toggle Power Override"
	using.icon_state = "ai_p_override"
	using.screen_loc = ui_ai_power_override
	using.ai_verb = /mob/living/silicon/ai/proc/ai_power_override
	src.adding += using

	//AI Shutdown
	using = new /obj/screen/ai_button()
	using.name = "Shutdown"
	using.icon_state = "ai_shutdown"
	using.screen_loc = ui_ai_shutdown
	using.ai_verb = /mob/living/silicon/ai/proc/ai_shutdown
	src.adding += using

	//AI Holo Movement
	using = new /obj/screen/ai_button()
	using.name = "Toggle Hologram Movement"
	using.icon_state = "ai_holo_mov"
	using.screen_loc = ui_ai_holo_mov
	using.ai_verb = /mob/living/silicon/ai/proc/toggle_hologram_movement
	src.adding += using

	//AI Core Display
	using = new /obj/screen/ai_button()
	using.name = "Pick Icon"
	using.icon_state = "ai_core_pick"
	using.screen_loc = ui_ai_core_icon
	using.ai_verb = /mob/living/silicon/ai/proc/pick_icon
	src.adding += using

	//AI Status
	using = new /obj/screen/ai_button()
	using.name = "Pick Status"
	using.icon_state = "ai_status"
	using.screen_loc = ui_ai_status
	using.ai_verb = /mob/living/silicon/ai/proc/ai_statuschange
	src.adding += using

	//AI Crew Records
	using = new /obj/screen/ai_button()
	using.name = "Crew Records"
	using.icon_state = "ai_crew_rec"
	using.screen_loc = ui_ai_crew_rec
	using.ai_verb = /mob/living/silicon/ai/proc/show_crew_records
	src.adding += using

	mymob.client.screen = list()
	mymob.client.screen += src.adding