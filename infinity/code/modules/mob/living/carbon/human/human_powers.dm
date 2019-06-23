/mob/living/proc/toggle_pass_table()
	set category = "Abilities"
	set name = "Toggle Agility" //Dunno a better name for this. You have to be pretty agile to hop over stuff!!!
	set desc = "Allows you to start/stop hopping over things such as hydroponics trays, tables, and railings."
	pass_flags ^= PASS_FLAG_TABLE //I dunno what this fancy ^= is but Aronai gave it to me.
	to_chat(src, "You [pass_flags&PASS_FLAG_TABLE ? "will" : "will NOT"] move over tables/railings/trays!")

/mob/living/carbon/human/proc/toggle_sprint()
	set category = "Abilities"
	set name = "Sprint"
	set desc = "Temporary acceleration for nutrients and internal energy. Dangerous for health, especials for heart."

	var/obj/aura/speed/bio/tajaran/aura = locate() in auras
	if(!aura)
		to_chat(src, SPAN_WARNING("You don't possess a sprint ability."))
		return
/*	if(aura.toggled && (aura.deactivation + 30 SECONDS < world.time)) //switches off itself overtime
		to_chat(src, SPAN_WARNING("You're too excited to stop! DO SOMETHING!"))
		return*/
	if(aura.energy < aura.energy_min)
		to_chat(src, SPAN_WARNING("You're a bit tired after sprint, you cannot do again."))
		return
	aura.toggle()
