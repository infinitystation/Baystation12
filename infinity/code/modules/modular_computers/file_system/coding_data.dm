var/global/list/coding_languages = list("Batch")//,"Anaconda", "NTML")

/datum/computer_file/data/coding
	filetype = "COD"
	var/code_lang = "null"
	var/code_lang_desc = "null"

/datum/computer_file/data/coding/batch
	filetype = "BAT"
	code_lang = "Batch"
	code_lang_desc = "Simple terminal commands code"

/datum/computer_file/data/text/README/coding/batch
	filename = "batch_manual"
	stored_data = "\[center\]\[daislogo\]\[br\]\
					\[h1\]=== Batch language manual ===\[/h1\]\[hr\]\
					Due of possible breakthroughs in cybersecurity, this programming language is limited and very simple, and it does not include loops and logical branches.\[hr\]\
					All key words of batch you can get from terminal by using command \'man\'.\[br\]\
					All key words must divide by \'; \'. After \';\' you must write space.\[br\]\
					If command last in program, don't write \'; \' after this command.\[hr\]\[/center\]"

/*/datum/computer_file/data/coding/python_borned/anaconda
	filetype = "ANC"
	code_lang = "Anaconda"
	code_lang_desc = "Wide oriented utility language, can used for network works, data manipulation and etc."

/datum/computer_file/data/coding/html
	filetype = "NTM"
	code_lang = "NTML"
	code_lang_desc = "NanoTrasen MarkUp Language, using to create ui for your programs, and maybe news articles."*/
