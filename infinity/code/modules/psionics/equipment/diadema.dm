/obj/item/clothing/head/helmet/space/psi_amp/lesser/diadema
	name = "tech diadema"
	desc = "A crown-of-thorns cerebro-energetic enhancer that interfaces directly with the brain, isolating and strengthening psionic signals. It kind of looks like a tiara having sex with an industrial robot."
	icon_state = "amp"
	var/global/list/clothing_choices

/obj/item/clothing/head/helmet/space/psi_amp/lesser/diadema/New()
	if(!clothing_choices)
		clothing_choices = generate_chameleon_choices(/obj/item/clothing/head)
	var/brank = rand(100)
	switch(brank)
		if(1 to 64) boosted_rank = PSI_RANK_OPERANT
		if(65 to 89) boosted_rank = PSI_RANK_MASTER
		if(90 to 100) boosted_rank = PSI_RANK_PARAMOUNT
	var/urank = rand(100)
	switch(urank)
		if(1 to 68) unboosted_rank = PSI_RANK_BLUNT
		if(69 to 89) unboosted_rank = PSI_RANK_LATENT
		if(90 to 100) unboosted_rank = PSI_RANK_OPERANT
	var/bpower = rand(100)
	switch(bpower)
		if(1 to 20) boosted_psipower = 150
		if(21 to 40) boosted_psipower = 100
		if(41 to 60) boosted_psipower = 75
		if(61 to 80) boosted_psipower = 50
		if(81 to 100) boosted_psipower = 25

/obj/item/clothing/head/helmet/space/psi_amp/lesser/diadema/verb/change(picked in clothing_choices)
	set name = "Change Hat/Helmet Appearance"
	set category = "Chameleon Items"
	set src in usr

	if (!(usr.incapacitated()))
		if(!ispath(clothing_choices[picked]))
			return

		disguise(clothing_choices[picked], usr)
		update_clothing_icon()

/obj/item/clothing/head/helmet/space/psi_amp/lesser/tiara
	name = "tech tiara"
	desc = "A crown-of-thorns cerebro-energetic enhancer that interfaces directly with the brain, isolating and strengthening psionic signals. It kind of looks like a tiara having sex with an industrial robot."
	icon_state = "amp"
	var/global/list/clothing_choices

/obj/item/clothing/head/helmet/space/psi_amp/lesser/tiara/New()
	if(!clothing_choices)
		clothing_choices = generate_chameleon_choices(/obj/item/clothing/head)
	var/brank = rand(100)
	switch(brank)
		if(1 to 78) boosted_rank = PSI_RANK_OPERANT
		if(79 to 94) boosted_rank = PSI_RANK_MASTER
		if(95 to 100) boosted_rank = PSI_RANK_PARAMOUNT
	var/urank = rand(100)
	switch(urank)
		if(1 to 78) unboosted_rank = PSI_RANK_BLUNT
		if(79 to 94) unboosted_rank = PSI_RANK_LATENT
		if(95 to 100) unboosted_rank = PSI_RANK_OPERANT
	var/bpower = rand(100)
	switch(bpower)
		if(1 to 20) boosted_psipower = 120
		if(21 to 40) boosted_psipower = 100
		if(41 to 60) boosted_psipower = 80
		if(61 to 80) boosted_psipower = 60
		if(81 to 100) boosted_psipower = 40

/obj/item/clothing/head/helmet/space/psi_amp/lesser/tiara/verb/change(picked in clothing_choices)
	set name = "Change Hat/Helmet Appearance"
	set category = "Chameleon Items"
	set src in usr

	if (!(usr.incapacitated()))
		if(!ispath(clothing_choices[picked]))
			return

		disguise(clothing_choices[picked], usr)
		update_clothing_icon()