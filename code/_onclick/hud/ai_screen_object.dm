/obj/screen/ai_button //~KareTa
	var/mob/living/silicon/ai/ai_verb
	var/input_procs = list()

/obj/screen/ai_button/Click()
	var/mob/living/silicon/ai/R = usr
	if(!istype(R, /mob/living/silicon/ai)) return 1
	if (!(ai_verb in R.verbs)) return 1

	var/input_args = list()
	for(var/input_proc in input_procs)
		if(input_procs[input_proc]) // Does the called proc belong to the AI, or not?
			input_args += call(R, input_proc)()
		else
			input_args += call(input_proc)()

	call(R, ai_verb)(arglist(input_args))
	return 1
