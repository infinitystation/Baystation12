/*
#define SANITY_HEALTHY 1000 //fully healthy sanity
#define SANITY_SLIGHTLY_LOWERED 800 //a light trauma or a state of shock
#define SANITY_SEVERELY_LOWERED 600	//possible psychosis, your doctor should be concerned
#define SANITY_RUGGED 600 //inadequate actions, possible drooling, seiures
#define INSANITY 200 //schizophrenia, uncontrollabe fear or laughter, severe psychosis, blackouts, hallucinations

/mob/living/carbon/human
	var/sanity = 1000
	var/list/stuff_that_decreases_insanity = {
		decl/effect/c
	}

/mob/living/carbon/human/Life()
	..()
	handle_sanity()

/mob/living/carbon/human/proc/handle_sanity()
	var/mob/living/carbon/human/M = src
	if (!M.client)
		return
	for (var/bad_thing in view(M.client.view))
		if (bad_thing in stuff_that_decreases_insanity)
			M.sanity -= bad_thing.sanity_debuff

*/