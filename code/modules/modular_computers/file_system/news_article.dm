// /data/ files store data in string format.
// They don't contain other logic for now.
/datum/computer_file/data/news_article
	filetype = "XNML"
	filename = "Unknown News Entry"
	block_size = 5000 		// Results in smaller files
	do_not_edit = 1			// Editing the file breaks most formatting due to some HTML tags not being accepted as input from average user.
	var/server_file_path 	// File path to HTML file that will be loaded on server start. Example: '/news_articles/space_magazine_1.html'. Use the /news_articles/ folder!
	var/archived			// Set to 1 for older stuff
	var/cover				//filename of cover.

/datum/computer_file/data/news_article/New(var/load_from_file = 0)
	..()
	if(server_file_path && load_from_file)
		stored_data = file2text(server_file_path)
	calculate_size()


// NEWS DEFINITIONS BELOW THIS LINE

/datum/computer_file/data/news_article/space/vol_one
	filename = "SPACE Magazine vol. 1"
	server_file_path = 'news_articles/space_magazine_1.html'
	cover = "issue1.png"
	archived = 1

/datum/computer_file/data/news_article/space/vol_two
	filename = "SPACE Magazine vol. 2"
	server_file_path = 'news_articles/space_magazine_2.html'
	cover = "issue2.png"
	archived = 1

/datum/computer_file/data/news_article/space/vol_three
	filename = "SPACE Magazine vol. 3"
	server_file_path = 'news_articles/space_magazine_3.html'
	cover = "issue3.png"
	archived = 1

/datum/computer_file/data/news_article/space/vol_four
	filename = "SPACE Magazine vol. 4"
	server_file_path = 'news_articles/space_magazine_4.html'
	cover = "issue4.png"
	archived = 1

/datum/computer_file/data/news_article/space/vol_five
	filename = "SPACE Magazine vol. 5"
	server_file_path = 'news_articles/space_magazine_5.html'
	cover = "issue5.png"
	archived = 1

/datum/computer_file/data/news_article/space/vol_six
	filename = "SPACE Magazine vol. 6"
	server_file_path = 'news_articles/space_magazine_6.html'
	cover = "issue6.png"
	archived = 1

/datum/computer_file/data/news_article/infinity_1
	filename = "БЕСКОНЕЧНОСТЬ изд.1 - Факел Догорел!"
	server_file_path = 'news_articles/infinity_1.html'
	cover = "infinity1.bmp"
	archived = 0

/datum/computer_file/data/news_article/olympietz
	filename = "Новостные газеты: Олимпиец"
	server_file_path = 'news_articles/olympietz.html'
	cover = ""
	archived = 0

/datum/computer_file/data/news_article/fringe
	filename = "Новостные газеты: Фринж"
	server_file_path = 'news_articles/fringe.html'
	cover = ""
	archived = 0

/datum/computer_file/data/news_article/valley_express
	filename = "Новостные газеты: Вали Экспресс"
	server_file_path = 'news_articles/valley_express.html'
	cover = ""
	archived = 0

/datum/computer_file/data/news_article/tau_ceti_tribune
	filename = "Новостные газеты: Трибуна Тау Кита"
	server_file_path = 'news_articles/tau_ceti_tribune.html'
	cover = ""
	archived = 0