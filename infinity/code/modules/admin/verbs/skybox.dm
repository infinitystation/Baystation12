/datum/admins/proc/create_new_skybox_data()
	set category = "Fun"
	set desc = "Create new skybox datum for using by 'Select and Apply' proc."
	set name = "SKYBOX: Create new skybox prefab"

	if(!check_rights(R_FUN))
		return
	var/nam = input("Enter name for your skybox prefab", "SkyBox Name")
	if(!length(nam))
		return
	var/i = input("Pick icon file:", "SkyBox Icon") as icon
	if(!isicon(i))
		return
	else if(!length(icon_states(i)))
		return
	var/star_state = input("Enter stars' state for skybox", "SkyBox Stars", "stars")
	var/new_narsie = "narsie"
	var/new_cascade = "cascade"
	switch(alert("Do you want to change default BS cascade and narsie icon states?", "SkyBox","Yes", "No"))
		if("Yes")
			new_narsie = input("Enter narsie state for skybox", "SkyBox", "narsie")
			new_cascade = input("Enter BS cascade state for skybox", "SkyBox", "cascade")
	var/forced_color = input("Do you want to use forced colors for your skybox? Input it if, yes.", "SkyBox")

	var/datum/skybox_data/newData = new()
	newData.name				= nam
	newData.skybox_icon			= i
	newData.star_state			= star_state
	newData.cascade_icon_states	= new_cascade
	newData.narsie_icon_states	= new_narsie
	newData.narsie_icon_states	= (forced_color ? forced_color : null)

	GLOB.skybox_datas[newData.name] = newData

	log_admin("[usr?.key] have created skybox prefab. With vars: [json_encode(newData.vars)]")
	message_admins("[usr?.key] have created skybox prefab. With vars: [json_encode(newData.vars)]")

	SSstatistics.add_field_details("admin_verb","CSB") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/datum/admins/proc/select_and_apply_skybox_data()
	set category = "Fun"
	set desc = "Choose skybox from list and change global skybox to it"
	set name = "SKYBOX: Select and Apply"

	if(!check_rights(R_FUN))
		return

	var/datum/skybox_data/target = input("Select skybox to apply", "SkyBox Master") in GLOB.skybox_datas + "(CANCEL)"
	if(target != "(CANCEL)" && (target in GLOB.skybox_datas))
		target = GLOB.skybox_datas[target]
	else
		return
	SSskybox.set_skybox_datum(target)

	log_admin("[usr?.key] have changed skybox to [target.name].")
	message_admins("[usr?.key] have changed skybox to [target.name].")

	SSstatistics.add_field_details("admin_verb","SAB") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
