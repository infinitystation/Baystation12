GLOBAL_VAR_INIT(coding_languages, list("Batch")) //,"Anaconda", "NTML")

/datum/computer_file/data/coding
	filetype = "COD"
	var/code_lang = "null"
	var/code_lang_desc = "null"

/datum/computer_file/data/coding/batch
	filetype = "BAT"
	code_lang = "Batch"
	code_lang_desc = "Simple terminal commands code"

/datum/computer_file/data/text/batch_manual
	filename = "batch_manual"
/*	stored_data = {"\[center]\[daislogo]\[br]\
					\[h1]=== Batch language manual ===\[/h1]\[hr]
					All key words of batch you can get from terminal by using command 'man'.\[br]
					All key words must divide by '; '. After '; ' you must write space.\[br]
					If command last in program, don't write '; ' after this command.\[hr]\[/center]
					To compile your code, you should input in terminal \'alias -ex \[code file name without square brackets]'"}*/
	stored_data = {"\[center]\[daislogo]\[br]
					\[h1]=== Мануал пакетного языка ===\[/h1]\[hr]
					Все ключевые слова и описания ключевых слов для данного языка вы можете найти написав в терминале НТОС используя команду 'man'.\[br]
					Все ключевые слова должны разделяться '; '. После ';' вы должны оставлять пробел и только потом писать следующую инструкцию.\[br]
					Если команда последняя в программе не пишите '; ' после неё.\[hr]\[/center]
					Для компиляции используется команда 'alias', для подробной информации 'man alias'"}

/*
/datum/computer_file/data/coding/anaconda
	filetype = "ANC"
	code_lang = "Anaconda"
	code_lang_desc = "Wide oriented utility language, can used for network works, data manipulation and etc."

/datum/computer_file/data/coding/html
	filetype = "NTM"
	code_lang = "NTML"
	code_lang_desc = "NanoTrasen MarkUp Language, using to create ui for your programs, and maybe news articles."
*/
