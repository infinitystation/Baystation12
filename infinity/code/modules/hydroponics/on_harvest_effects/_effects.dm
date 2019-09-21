/datum/hydroponics_effect/proc/triggeredby(mob/user)
	return

/datum/hydroponics_effect/halucination/mandragora_scream
	var/braindam		=	5
	var/halo_range		=	6
	var/halo_power		=	60
	var/halo_duration	=	60
	var/psy_porog		=	10
	var/halo_porog		= 	500
	var/cry_volume		=	100

	var/MANDRAGORA_CRYES = list('infinity/sound/voice/agony_female_1.ogg',
								'infinity/sound/voice/agony_female_2.ogg',
								'infinity/sound/voice/agony_female_3.ogg',
								'infinity/sound/voice/bug_screech.ogg',
								'infinity/sound/voice/pain_female_1.ogg',
								'infinity/sound/voice/pain_female_2.ogg',
								'infinity/sound/voice/pain_female_3.ogg',
								'infinity/sound/voice/pain_female_4.ogg',
								'infinity/sound/voice/pain_male_1.ogg',
								'infinity/sound/voice/pain_male_2.ogg',
								'infinity/sound/voice/pain_male_3.ogg',
								'infinity/sound/voice/scream_male_1.ogg',
								'infinity/sound/voice/scream_male_2.ogg',
								'infinity/sound/voice/scream_male_3.ogg',
								'infinity/sound/voice/scream_female_2.ogg',
								//'sound/effects/Heart Beat.ogg',
								'sound/effects/ghost.ogg'
								)

/datum/hydroponics_effect/halucination/mandragora_scream/proc/immune_check(mob/living/carbon/M)
	if(M.psi || M.mind.learned_spells.len || M.is_deaf())
		if(M.is_deaf())
			return 2
		return 1

/datum/hydroponics_effect/halucination/mandragora_scream/triggeredby(mob/user)
	var/cry = pick(MANDRAGORA_CRYES)
	playsound(user.loc, 'sound/effects/bonebreak1.ogg', cry_volume, 1)
	for(var/mob/living/carbon/M in view(halo_range, user))
		if(!immune_check(M))
			sound_to(M, 'sound/effects/Heart Beat.ogg')
			M.hallucination(halo_duration, halo_power)
			M.adjustBrainLoss(braindam)
			if(M.hallucination_power < halo_porog)
				if(rand(1, 100) < psy_porog)
					if(!M.psi) M.psi = new()
					var/descipline = pick(list(PSI_REDACTION, PSI_COERCION, PSI_PSYCHOKINESIS, PSI_ENERGISTICS))
					var/descipline_addpower = rand(1, 2)
					var/current = M.psi.get_rank(descipline)
					M.set_psi_rank(descipline, current + descipline_addpower, defer_update = TRUE)
		else if(immune_check(M) == 2)
			return "Deaf"
		else
			sound_to(M, cry)