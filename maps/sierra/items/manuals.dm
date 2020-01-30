/obj/item/weapon/book/manual/solgov_law
	name = "Sol Central Government Law"
	desc = "A brief overview of SolGov Law."
	icon_state = "bookSolGovLaw"
	author = "The Sol Central Government"
	title = "Sol Central Government Law"

/obj/item/weapon/book/manual/solgov_law/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]index.php?title=�����_����&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}


/obj/item/weapon/book/manual/military_law
	name = "The Sol Code of Military Justice"
	desc = "A brief overview of military law."
	icon_state = "bookSolGovLaw"
	author = "The Sol Central Government"
	title = "The Sol Code of Military Justice"

/obj/item/weapon/book/manual/military_law/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]index.php?title=������-�����������_������_���&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/weapon/book/manual/sol_sop
	name = "Standard Operating Procedures"
	desc = "SOP aboard the NES Sierra."
	icon_state = "booksolregs"
	author = "The Sol Central Government"
	title = "Standard Operating Procedure"

/obj/item/weapon/book/manual/sol_sop/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]index.php?title=�����������_���������_����&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/weapon/book/manual/nt_sop
	name = "NT Standard Operating Procedures"
	desc = "SOP aboard the NSV Sierra."
	icon = 'infinity/icons/obj/library.dmi'
	icon_state = "bookNTsop"
	author = "Employee Materials"
	title = "Standard Operating Procedure"

/obj/item/weapon/book/manual/nt_sop/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]index.php?title=�����������_���������_��&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/weapon/book/manual/nt_tc
	name = "NT Threat Codes"
	desc = "TC aboard the NSV Sierra."
	icon = 'infinity/icons/obj/library.dmi'
	icon_state = "bookNTtc"
	author = "Ship Rule Materials"
	title = "Threat Codes"

/obj/item/weapon/book/manual/nt_tc/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wikiurl]index.php?title=����_������_��&printable=yes&remove_links=1" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/weapon/folder/nt/rd

/obj/item/weapon/folder/envelope/blanks
	desc = "A thick envelope. The NT logo is stamped in the corner, along with 'CONFIDENTIAL'."

/obj/item/weapon/folder/envelope/blanks/Initialize()
	. = ..()
	new/obj/item/weapon/paper/sierra/blanks(src)

/obj/item/weapon/paper/sierra/blanks
	name = "RE: Regarding testing supplies"
	info = {"
	<tt><center><b><font color='red'>��������������</font></b>
	<h3>���������������� ����������� �����������</h3>
	<img src = ntlogo.png>
	</center>
	<b>��:</b> Swadian Barwuds<br>
	<b>����:</b> ������������������ ��������� NSV Sierra<br>
	<b>� �����:</b> ������ ���������� ��� NSV Sierra<br>
	<b>����:</b> �������������� ��������� (���������)<br>
	<hr>
	� ����������� ��� ����� � ����������� ������������� � ������ � ����� ����������� �������� ����������, ��.<br>
	�� ������� ������� �� ������ ������� ������ ������� - �������� � ����� ����, ��� ����� /"�����/" ������� ��������� ��� ����� ������. ���������� ��������� ���������, ��� �� ������ ������, ������������ ������� �� ����������� �� ����� ������������ ������������ ��� �������� ���� ��������. <br>
	� ��� �� ������ ����� �������� � �������� 'Aux Custodial Supplies'. ��� ��������� ���� ����� �������� ��������� - 4 �������� �� �������� � ����� ������������� ������ �������� �������. ��� ����������� �� �������� ���������������� �� ��������� ������ ����������� � ���, ����� ������������ �� � ����������� ������ ��� ����� ������ �����������.<br>
	��� �������� � ���������� ����� � ����������� �������� ����������� ����� - �� �� ����� �������, ����� ��� ����������. ���� ��� ����� ������� - ������ ��.<br>
	������ �� ����� ��� ����, ����� ��������� ������ ������� ���������, ��. �� ���� �� ��� ������������ ����������� � ��������� �������.<br>
	<i>S.B.</i></tt>
	"}

/obj/item/weapon/folder/envelope/captain
	desc = "A thick envelope. The NT logo is stamped in the corner, along with 'TOP SECRET - SIERRA UMBRA'."

/obj/item/weapon/folder/envelope/captain/Initialize()
	. = ..()
	var/memo = {"
	<tt><center><b><font color='red'>�������� - ������� �����: ������</font></b>
	<h3>����������� ������������</h3>
	<img src = ntlogo.png>
	</center>
	<b>��:</b> Swadian Barwuds<br>
	<b>����:</b> �������� NSV Sierra<br>
	<b>����:</b> ����� ������<br>
	<hr>
	�������,<br>
	���� ����� � ������� ����� ������ �������� ��������� ������� �������. ������ �����, ��� ���� ������� ����������; ������&#255;������ �������� �����������.
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[GLOB.using_map.system_name]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>Locutus System</li>
	<br>
	������������ ����� &#255;��&#255;���&#255;: ���������, ����������� ����� ����� � ������� ������������ ������������&#255;.<br>
	�� ���� �� ���� ������ �� &#255;��&#255;���&#255; ���������� ������������ ����������&#255;��, �� ����� � ��� ������&#255; ������ ����� �� ������������ � �������� ���� ����������� �������� �� ����.<br>
	� ������ ����������&#255; ���� � �������� ������������ ��������, ���������� ������� ��� ������ �������� ��&#255; �����������, ��������� ����� � �������� �� ������� ��&#255;��� ������� ��&#255;��.<br>
	�� ���� �� ���������� �� ��������� �� ���� ���������&#255;� �� ����������� ������. � ������ ����������&#255; ������� �������&#255; ��� ������&#255; ����� ��� ��� ��� � �������, �� ����������� ��. ��������� �������� ���������&#255;�� �������������� ��������������� ��������.<br>
	��������� � ���� �������������������� ��� �������������� �������� ��� ����������� � ��������.<br>

	<i>Swadian Barwuds</i></tt><br>
	<i>This paper has been stamped with the stamp of Central Command.</i>
	"}
	new/obj/item/weapon/paper/important(src, memo, "Standing Orders")

	new/obj/item/weapon/paper/sierra/umbra(src)

/obj/item/weapon/folder/envelope/rep
	desc = "A thick envelope. The NT logo is stamped in the corner, along with 'TOP SECRET - SIERRA UMBRA'."

/obj/item/weapon/folder/envelope/rep/Initialize()
	. = ..()
	new/obj/item/weapon/paper/sierra/umbra(src)

/obj/item/weapon/paper/sierra/umbra
	name = "UMBRA Protocol"
	icon = 'maps/sierra/icons/obj/uniques.dmi'
	icon_state = "paper_words"
	info = {"
	<tt><center><b><font color='red'>���������� �������� - ������� �����: ���� ������</font></b>
	<h3>����������� ������������</h3>
	<img src = ntlogo.png>
	</center>
	<b>��:</b> Kim Taggert, ������������ �������� ��<br>
	<b>����:</b> �������� NSV Sierra<br>
	<b>� �����:</b> ������ ���������� ��� NSV Sierra<br>
	<b>����:</b> �������� ����<br>
	<hr>
	<li>��� - ��������� ���������� � ����������� ����������. � ������ �� ��������� ���, �����&#255; ��������� �� ������ ���������&#255; ��������� �����. ������ �������� ��������� ��&#255; ��������&#255; �����&#255;���� ������� ����� ������.</li>
	<li>��������� ����� ���� ������ ������ ����� ��������&#255; ��������&#255; �� �� �� ����������� ���������. ����������� ����� �� �������� ���&#255;, �� � ��� �� ������ ���� ������� � �������������� ������������ ��������� � ���������. �� �������&#255;.</li>
	<li>�������� ��&#255; ��������� ��������� &#255;��&#255;���&#255; ������&#255; ����� '���������� ������, �������������' �������������&#255; ��� ���� ���� � �����������. ��� �� ����� �������&#255;�� ������������� � ������ ��.</li>
	<li>���������&#255; �� �������������� ��������, ������� ���������&#255;�� ������ ����������� ��� �����������, ������ ���� ���������� �� �� ��� ������� ������ ����. ������ ������� � ��� ����� ����� ������ ������ � ��������� ����������. ����� ����� �������� ����������� ��� ������ ���������, ���� ���������� �� ��������.</li>

	<li>����������������� ������ ���������� ����� ��������� ���������. ������ ������������ ����, �������� ������ �������� � ���������� ������, �� ������ �������� ����� �� � ����� �������&#255; � ��������� ����� ��� ������������&#255; ������������ ������������ ������ �������.</li>
	<li>��� ���������� ��������� ���������� ���������� �� ����������� ������� ������ ���� ������������ �� �������� ����������&#255;.</li>
	<li>��� ����������� �� ���������&#255; ������ � ����� �������� �������, �� ������ ��� ����� ������ ��������&#255; �� ������� ����, ���������������� ������� ����������� 'Crescent'. � ���� ��&#255;����&#255; �� ��������. �� ���������� ��������� �� ���� ��� ����������� �������������.

	<br>
	�� �����&#255; �� ��� ��������� ���������, � ����&#255;� ���, ��� ��� - ������&#255; ���������������� ��&#255; ����������&#255; ������ ������������ ��������� � ������������� �������. ����������� ������ �� � ������� ���&#255;���.
	<i>����� ����������, Kim.</i></tt><br>
	<i>This paper has been stamped with the stamp of Central Command.</i>
	"}