//Multimeter by Bear1ake, ported from Infinity-tgstation
/obj/item/device/multitool/multimeter
	name = "multimeter"
	desc = "»спользуется для измерения потребления электроэнергии оборудования и прозвонки проводов. –екомендуется докторами"
	icon = 'icons/obj/infinity_object.dmi'
	icon_state = "multimeter"
	origin_tech = "magnets=3;engineering=3"
	var/mode = METER_MESURING // Mode

//mode
/obj/item/device/multitool/multimeter/attack_self(mob/user)
	switch(mode)
		if(METER_MESURING)
			mode = METER_CHECKING
		if(METER_CHECKING)
			mode = METER_MESURING
	to_chat(user, "–ежим сменЄн на: [mode].")
