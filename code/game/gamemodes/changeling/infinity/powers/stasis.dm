//Fake our own death and fully heal. You will appear to be dead but regenerate fully after a short delay.
/mob/proc/changeling_fakedeath()
	set category = "Changeling"
	set name = "Regenerative Stasis (20)"

	var/datum/changeling/changeling = changeling_power(20,1,100,DEAD)
	if(!changeling)	return
	if(status_flags & FAKEDEATH)
		to_chat(src, SPAN_LING("Мы уже регенирируем."))
		return

	var/mob/living/carbon/C = src
	if(!C.stat && alert("Нам следует инсциировать собственную смерть?",,"Да","Нет") == "Нет")//Confirmation for living changelings if they want to fake their death
		return
	to_chat(C, SPAN_LING("Мы попытаемся восстановить нашу оболочку."))
	C.status_flags |= FAKEDEATH //play dead
	C.UpdateLyingBuckledAndVerbStatus()
	C.remove_changeling_powers()

	spawn(rand(80 SECONDS, 3 MINUTES))
		if(changeling_power(20,1,100,DEAD) && !(MUTATION_HUSK in C.mutations))
			// charge the changeling chemical cost for stasis
			changeling.chem_charges -= 20

			to_chat(C, SPAN_LING(FONT_GIANT("Мы готовы восстать. Используйте кнопку <b>Revive</b>, когда будет удобный момент.")))
			C.verbs += /mob/proc/changeling_revive
//todo			src.ability_master.add_ling_verb(src, /mob/proc/changeling_revive, "Revive", "revive")

	SSstatistics.add_field_details("changeling_powers","FD")
	return 1

/mob/proc/changeling_revive()
	set category = "Changeling"
	set name = "Revive"

	var/mob/living/carbon/C = src
	// If we were devoured
	if(MUTATION_HUSK in C.mutations)
		C.verbs -= /mob/proc/changeling_revive
		C.ghostize()
		return
	// restore us to health
	C.revive()
	// remove our fake death flag
	C.status_flags &= ~(FAKEDEATH)
	// let us move again
	C.UpdateLyingBuckledAndVerbStatus()
	// re-add out changeling powers
	C.make_changeling()
	// sending display messages
	to_chat(C, SPAN_LING("Мы восстановились."))
	C.verbs -= /mob/proc/changeling_revive
//TODO. Не работает. Это костыль для ревайва в шкафу.
/*
	for(var/obj/screen/ability/verb_based/changeling/revive_screen in src.ability_master.ability_objects)
		if(revive_screen == "Revive")
			src.ability_master.remove_ability(revive_screen)
			break
*/
/datum/changeling/proc/regenerate()
	chem_charges = min(max(0, chem_charges+chem_recharge_rate), chem_storage)
	geneticdamage = max(0, geneticdamage-1)
