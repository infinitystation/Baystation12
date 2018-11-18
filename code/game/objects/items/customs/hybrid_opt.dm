/obj/item/clothing/glasses/material/hybrid/special //special glasses for spacial MrNicolas
	name = "hybrid optical scanner"
	desc = "This scanner has several buttons on one side and the TCC logo on the other. Under the logo engraving 'Thoughts are material.' On the inside there is a pair of connectors. It seems that this thing is not for ordinary eyes."
	icon_state = "hybrids"

/obj/item/clothing/glasses/material/hybrid/special/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/clothing/glasses/material/hybrid/special/Process()
	if(ishuman(loc))
		var/mob/living/carbon/human/S = loc
		var/obj/item/organ/internal/eyes/N = S.internal_organs_by_name[BP_EYES]
		if(on)
			if (!BP_IS_ROBOTIC(N))
				if (N.damage <= N.min_broken_damage)
					to_chat(S, "<span class='warning'>Your eyes sting a little.</span>")
					N.damage += rand(1, 2)
					if (N.damage >= N.min_broken_damage)
						to_chat(S, "<span class='danger'>You go blind!</span>")
						S.sdisabilities |= BLIND

/obj/item/clothing/glasses/material/hybrid/special/equipped(var/mob/user, var/slot)
	if(slot == slot_glasses)
		START_PROCESSING(SSobj, src)

/obj/item/clothing/glasses/material/hybrid/special/dropped()
	STOP_PROCESSING(SSobj, src)
	. = ..()