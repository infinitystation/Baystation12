/obj/item/modular_computer/network_drone
	name = "internal processor"
	modifiable = 0

/datum/computer_file/data/config/network_drone
	filename = "config"

/datum/computer_file/data/config/network_drone/New()
	. = ..()
	stored_data = ""
	stored_data += "[MODULAR_CONFIG_REMCON_SETTING]:NETD@[rand(1000, 9999)]<br>"
	stored_data += "PrimaryDirective:Repair%and%maintenance%$OBJECT.;Do%not%interact%with%$OBJECT%crew%in%any%form.<br>"
	stored_data += "AssignedObject:NSV SIERRA<br>"

/datum/computer_file/data/drone_status
	filename = "status"
	filetype = "DSF" //Drone status file

/datum/computer_file/data/drone_halt
	filename = "halt"
	filetype = "LOCK" //Self-destruct file; remove it and drone will die :(

//Some fluff.
/datum/computer_file/data/drone_halt/New()
	..()
	for(var/I in 1 to 200)
		stored_data += rand(0,1) ? pick(alphabet) : uppertext(pick(alphabet))

/datum/computer_file/data/drone_readme
	filename = "readme"
	filetype = "TXT"
	stored_data = {"Do not delete halt.LOCK - it will cause internal meltdown.<br>
Laws are supplied in this form: LAW%LAW%LAW;LAW2%LAW2;LAW3%$OBJECT;<br>
Replace spaces with %, $OBJECT is replaced by next config option.<br>
IMPORTANT INFORMATION: If you want to edit config, you may want to set up a suspend-file.<br>
You can do this by using: echo -s suspend.DAT<br>
Suspend-file will stop internal data processing and lock down the device.<br>
We hope you will enjoy usage of these wonderful workers!<br><br>

side note - they love to malfunction. sometimes."}

/obj/item/weapon/stock_parts/computer/hard_drive/network_drone/install_default_programs()
	store_file(new/datum/computer_file/data/config/network_drone(src))
	store_file(new/datum/computer_file/data/drone_halt(src))
	store_file(new/datum/computer_file/data/drone_readme(src))
	max_capacity = 8

/obj/item/modular_computer/network_drone/install_default_hardware()
	..()
	network_card = new /obj/item/weapon/stock_parts/computer/network_card/(src)
	hard_drive = new /obj/item/weapon/stock_parts/computer/hard_drive/network_drone(src)
	processor_unit = new /obj/item/weapon/stock_parts/computer/processor_unit/small(src)

/obj/item/modular_computer/network_drone/apc_power(power_usage)
	var/mob/living/silicon/robot/network/N = src.loc
	if(istype(N))
		if(N.cell && N.cell.charge > 0) return 1
	return

/obj/item/modular_computer/network_drone/Process()

	if(apc_power())
		enable_computer()

	var/datum/extension/interactive/ntos/os = get_extension(src, /datum/extension/interactive/ntos)
	if(os)
		os.Process()

/obj/item/modular_computer/network_drone/shutdown_computer()
	QDEL_NULL_LIST(terminals)
	enabled = 0
	var/datum/extension/interactive/ntos/os = get_extension(src, /datum/extension/interactive/ntos)
	if(os)
		os.system_shutdown()