//Please use mob or src (not usr) in these procs. This way they can be called in the same fashion as procs.
/client/verb/wiki()
	set name = "Wiki"
	set desc = "Visit the wiki."
	set hidden = 1
	if( config.wikiurl )
		if(alert("This will open the wiki in your browser. Are you sure?",,"Yes","No")=="No")
			return
		send_link(src, config.wikiurl)
	else
		to_chat(src, "<span class='warning'>The wiki URL is not set in the server configuration.</span>")
	return

/client/verb/github()
	set name = "GitHub"
	set desc = "Visit the GitHub repository."
	set hidden = 1
	if( config.githuburl )
		if(alert("This will open GitHub in your browser. Are you sure?",,"Yes","No")=="No")
			return
		send_link(src, config.githuburl)
	else
		to_chat(src, "<span class='warning'>The github URL is not set in the server configuration.</span>")
	return

/client/verb/bugreport()
	set name = "Bug Report"
	set desc = "Visit the GitHub repository to report an issue or bug."
	set hidden = 1
	if( config.issuereporturl )
		if(alert("This will open GitHub in your browser. Are you sure?",,"Yes","No")=="No")
			return
		send_link(src, config.issuereporturl)
	else
		to_chat(src, "<span class='warning'>The issue report URL is not set in the server configuration.</span>")
	return

/client/verb/forum()
	set name = "Forum"
	set desc = "Visit the forum."
	set hidden = 1
	if( config.forumurl )
		if(alert("This will open the forum in your browser. Are you sure?",,"Yes","No")=="No")
			return
		send_link(src, config.forumurl)
	else
		to_chat(src, "<span class='warning'>The forum URL is not set in the server configuration.</span>")
	return

#define RULES_FILE "config/rules.html"
/client/verb/rules()
	set name = "Rules"
	set desc = "Show Server Rules."
	set hidden = 1
	show_browser(src, file(RULES_FILE), "window=rules;size=480x320")
#undef RULES_FILE

#define LORE_FILE "config/lore.html"
/client/verb/lore_splash()
	set name = "Lore"
	set desc = "Links to the beginner Lore wiki."
	set hidden = 1
	show_browser(src, file(LORE_FILE), "window=lore;size=480x320")
#undef LORE_FILE

/client/verb/hotkeys_help()
	set name = "Hotkeys Help"
	set category = "OOC"

	var/admin = {"<font color='purple'>
Admin:
\tF5 = ����� ���������/��������&#255; � ����
\tF6 = ������ �������
\tF7 = ��������� ��
\tF8 = �����������
</font>"}

	var/hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (����� ������� �������)
\tTAB = ����������� hotkey-mode
\ta = �����
\ts = ����
\td = ������
\tw = �����
\t, = ������������&#255; �� ������� ����
\t. = ������������&#255; �� ������� ����
\tq = ���������
\te = ������
\tr = ��������
\tt = �������
\t5 = �����&#255;
\tx = �����&#255;�� ����
\tz = ������������ ������ � ���� (��� y)
\tj = ����������� ����� �����������&#255;
\tf = �����������-��������������-�����
\tg = �����������-��������������-������
\t1 = �������������� "������"
\t2 = �������������� "����������"
\t3 = �������������� "��������"
\t4 = �������������� "���������"
</font>"}

	var/other = {"<font color='purple'>
Any-Mode: (����� ������� ��������)
\tCtrl+a = �����
\tCtrl+s = ����
\tCtrl+d = ������
\tCtrl+w = �����
\tCtrl+q = ���������
\tCtrl+e = ������
\tCtrl+r = �������
\tCtrl+x ��� �������� = �����&#255;�� ����
\tCtrl+z = ������������ ������ � ���� (��� Ctrl+y)
\tCtrl+f = ����������� ����� ��������������&#255;-�����
\tCtrl+g = ����������� ����� ��������������&#255;-������
\tCtrl+1 = �������������� "������""
\tCtrl+2 = �������������� "����������"
\tCtrl+3 = �������������� "��������"
\tCtrl+4 = �������������� "���������"
\tF1 = ��
\tF2 = OOC
\tF3 = �������
\tF4 = �����&#255;
\tDEL = ���������� �&#255;����
\tINS = �����������-���������-������
\tHOME = ���������
\tPGUP ��� �������� = �����&#255;�� ����
\tPGDN = ������������ ������ � ����
\tEND = �������
\tCtrl + Click = �&#255;����
\tShift + Click = ���������
\tAlt + Click = �������� ������� �� ������
\tCtrl + Alt + Click = ������� �� ���-����
</font>"}

	var/robot_hotkey_mode = {"<font color='purple'>
Hotkey-Mode: (����� ������� �������)
\tTAB = �������� ����� �������
\ta = �����
\ts = ����
\td = ������
\tw = �����
\tq = �������������� �������� ������
\tt = �������
\tx = ������������� �������� ������
\tz = ������������ ������������ ������ (or y)
\tf = �����������-���������-�����
\tg = �����������-���������-������
\t1 = ������������ ������ 1
\t2 = ������������ ������ 2
\t3 = ������������ ������ 3
\t4 = ����������� ��������������
\t5 = ������
</font>"}

	var/robot_other = {"<font color='purple'>
Any-Mode: (����� ������� ��������)
\tCtrl+a = �����
\tCtrl+s = ����
\tCtrl+d = ������
\tCtrl+w = �����
\tCtrl+q = �������������� �������� ������
\tCtrl+x = ������������� �������� ������
\tCtrl+z = ������������ ������������ ������ (or Ctrl+y)
\tCtrl+f = ����������� ����� ��������������&#255;-�����
\tCtrl+g = ����������� ����� ��������������&#255;-������
\tCtrl+1 = ������������ ������ 1
\tCtrl+2 = ������������ ������ 2
\tCtrl+3 = ������������ ������ 3
\tCtrl+4 = ����������� ����� ��������������&#255; (������)
\tF1 = ��
\tF2 = OOC
\tF3 = �������
\tF4 = �����&#255;
\tDEL = �&#255;����
\tINS = ����������� ����� ��������������&#255; (������)
\tPGUP = ������������� �������� ������
\tPGDN = ������������ ������������ ������
\tCtrl + Click = �&#255;���� ��� ����������� ����
\tShift + Click = ��������� ��� ������� ����
\tAlt + Click = �������� ������� �� ������
\tCtrl + Alt + Click = ��������������� ����
</font>"}
	var/alarm = {"<font color='red'>
��������! ����� �������������� ���&#255;��� ������ � ������ ��� ���� ����������� ��������� �� ����������, ��� ��� ���� ������ ������������ ������� �� ������� ���������, �� ������� �� ����� �������� � ����� ������� ������&#255; ������������ ��������� �� �������, ������ ���������� DreamMaker(������� � ������� ���� ���� ����� �������). ����� ������� ������&#255; ���&#255;��� ������� ��������� ����� ����������� �� �������.
</font>"}
	if(isrobot(src.mob))
		to_chat(src, robot_hotkey_mode)
		to_chat(src, robot_other)
		to_chat(src, alarm)
	else
		to_chat(src, hotkey_mode)
		to_chat(src, other)
		to_chat(src, alarm)
	if(holder)
		to_chat(src, admin)


//������� Regulations
/client/proc/show_info(var/source = "rules")

	var/dat = {"
<html>
<head>
<title>[source]</title>
<meta charset="windows-1251">
<script>
	function page_rules() 		{location.href='?_src_=rules;informat=rules';}
	function page_adrules() 	{location.href='?_src_=rules;informat=adrules';}
	function page_roleplay() 	{location.href='?_src_=rules;informat=roleplay';}
	function page_ban() 		{location.href='?_src_=rules;informat=ban;';}
</script>
 </head>

<body>
<table><tr>
<td width = 40>
<td><input type="button" value="������� �������" 				id="button3_rules" onclick="page_rules()">			</td>
<td><input type="button" value="������ �������������" 			id="button2_changelog" onclick="page_adrules()">	</td>
<td><input type="button" value="�������� ������� ����" 			id="button4_stories" onclick="page_roleplay()"		</td>
<td align="right"><input type="button" value="�������� �����" 	id="button6_admin" onclick="page_ban()">			</td>
</td></tr></table>
<hr>
<br>

[file2text("config/info/[source].html")]

</body></html>
	"}
	usr << browse(fix_html(dat), "window=hub_welcome;size=1000x500;can_close=1;")

/client/Topic(href, href_list[])
	if(href_list["informat"]) //"Regulations"
		show_info(href_list["informat"])
	..()

/client/verb/servinfo()
	set hidden = 1
	show_info("rules")