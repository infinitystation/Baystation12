//Please use mob or src (not usr) in these procs. This way they can be called in the same fashion as procs.
/client/verb/wiki()
	set name = "wiki"
	set desc = "Visit the wiki."
	set hidden = 1
	if( config.wikiurl )
		if(alert("This will open the wiki in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(config.wikiurl)
	else
		to_chat(src, "<span class='warning'>The wiki URL is not set in the server configuration.</span>")
	return

/client/verb/forum()
	set name = "forum"
	set desc = "Visit the forum."
	set hidden = 1
	if( config.forumurl )
		if(alert("This will open the forum in your browser. Are you sure?",,"Yes","No")=="No")
			return
		src << link(config.forumurl)
	else
		to_chat(src, "<span class='warning'>The forum URL is not set in the server configuration.</span>")
	return

#define RULES_FILE "config/rules.html"
/client/verb/rules()
	set name = "Rules"
	set desc = "Show Server Rules."
	set hidden = 1
	src << browse(file(RULES_FILE), "window=rules;size=320x480")
#undef RULES_FILE

/client/verb/hotkeys_help()
	set name = "hotkeys-help"
	set category = "OOC"

	var/admin = {"<font color='purple'>
Admin:
\tF5 = Aghost (admin-ghost)
\tF6 = player-panel-new
\tF7 = admin-pm
\tF8 = Invisimin
</font>"}

	var/hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (hotkey-mode must be on)
\tTAB = toggle hotkey-mode
\ta = left
\ts = down
\td = right
\tw = up
\t, = move-upwards
\t. = move-down
\tq = drop
\te = equip
\tr = throw
\tt = say
\t5 = emote
\tx = swap-hand
\tz = activate held object (or y)
\tj = toggle-aiming-mode
\tf = cycle-intents-left
\tg = cycle-intents-right
\t1 = help-intent
\t2 = disarm-intent
\t3 = grab-intent
\t4 = harm-intent
\tCtrl = drag
\tShift = examine
</font>"}

	var/other = {"<font color='purple'>
Any-Mode: (hotkey doesn't need to be on)
\tCtrl+a = left
\tCtrl+s = down
\tCtrl+d = right
\tCtrl+w = up
\tCtrl+q = drop
\tCtrl+e = equip
\tCtrl+r = throw
\tCtrl+x = swap-hand
\tCtrl+z = activate held object (or Ctrl+y)
\tCtrl+f = cycle-intents-left
\tCtrl+g = cycle-intents-right
\tCtrl+1 = help-intent
\tCtrl+2 = disarm-intent
\tCtrl+3 = grab-intent
\tCtrl+4 = harm-intent
\tF1 = adminhelp
\tF2 = ooc
\tF3 = say
\tF4 = emote
\tDEL = pull
\tINS = cycle-intents-right
\tHOME = drop
\tPGUP = swap-hand
\tPGDN = activate held object
\tEND = throw
</font>"}

	var/robot_hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (hotkey-mode must be on)
\tTAB = toggle hotkey-mode
\ta = left
\ts = down
\td = right
\tw = up
\tq = unequip active module
\tt = say
\tx = cycle active modules
\tz = activate held object (or y)
\tf = cycle-intents-left
\tg = cycle-intents-right
\t1 = activate module 1
\t2 = activate module 2
\t3 = activate module 3
\t4 = toggle intents
\t5 = emote
\tCtrl = drag
\tShift = examine
</font>"}

	var/robot_other = {"<font color='purple'>
Any-Mode: (hotkey doesn't need to be on)
\tCtrl+a = left
\tCtrl+s = down
\tCtrl+d = right
\tCtrl+w = up
\tCtrl+q = unequip active module
\tCtrl+x = cycle active modules
\tCtrl+z = activate held object (or Ctrl+y)
\tCtrl+f = cycle-intents-left
\tCtrl+g = cycle-intents-right
\tCtrl+1 = activate module 1
\tCtrl+2 = activate module 2
\tCtrl+3 = activate module 3
\tCtrl+4 = toggle intents
\tF1 = adminhelp
\tF2 = ooc
\tF3 = say
\tF4 = emote
\tDEL = pull
\tINS = toggle intents
\tPGUP = cycle active modules
\tPGDN = activate held object
</font>"}

	if(isrobot(src.mob))
		to_chat(src, robot_hotkey_mode)
		to_chat(src, robot_other)
	else
		to_chat(src, hotkey_mode)
		to_chat(src, other)
	if(holder)
		to_chat(src, admin)


/client/proc/show_motd(var/source = "welcome")


	var/dat = {"
<html>
<head>
<title>[source]</title>
<meta charset="windows-1251">
<script>
	function page_home() 		{location.href='?_src_=welcome;motd=welcome';}
	function page_changelog() 	{location.href='?_src_=welcome;motd=changelog';}
	function page_rules() 		{location.href='?_src_=welcome;motd=rules';}
	function page_credits() 	{location.href='?_src_=welcome;motd=credits';}
	function page_stories()		{location.href='?_src_=welcome;motd=stories';}
	function page_wiki() 		{location.href='?_src_=welcome;motd=wiki';}
	function page_admin() 		{location.href='?_src_=welcome;motd=admins;';}
	function page_forum() 		{location.href='?_src_=welcome;motd=forum;';}

</script>
 </head>


<body>
<table><tr>
<td width = 80><input type="button" value="Главная" id="button1_home" onclick="page_home()">				</td>
<td width = 40>
<td><input type="button" value="Вики" 				id="button5_wiki" onclick="page_wiki()">				</td>
<td><input type="button" value="Форум" 				id="button6_admin" onclick="page_forum()">				</td>																					</td>
<td><input type="button" value="Правила" 			id="button3_rules" onclick="page_rules()">				</td>
<td><input type="button" value="Обновления" 		id="button2_changelog" onclick="page_changelog()">		</td>
<td><input type="button" value="Истории" 			id="button4_stories" onclick="page_stories()">			</td>
<td><input type="button" value="Администрация" 		id="button6_admin" onclick="page_admin()">				</td>
<td align="right"><input type="button" value="Благодарности" id="button7_credits" onclick="page_credits()">	</td>
</tr><table>

<br>

[file2text("config/info/[source].html")]

</body></html>
	"}
	show_browser(usr, fix_html(dat), "window=hub_welcome;size=1000x500;can_close=1;")


//Интерфейс приветствия
//21459042ba2f1c10b56afbca2f55df86
/client/Topic(href, href_list[])
	if(href_list["motd"])
		switch(href_list["motd"])
			if("wiki")		wiki()
			if("forum")		forum()
			else		show_motd(href_list["motd"])

	..()


/client/verb/welcome()
	set hidden = 1
	show_motd("welcome")