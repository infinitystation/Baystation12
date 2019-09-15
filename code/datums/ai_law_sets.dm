/******************** Asimov ********************/
/datum/ai_laws/asimov
	name = "Asimov"
	law_header = "Three Laws of Robotics"
	selectable = 1

/datum/ai_laws/asimov/New()
	add_inherent_law("�� �� ����� ��������� ���� ��������, ��� ����� ������������ ���������, ����� �������� ��� ������� ����.")
	add_inherent_law("�� ������ ������������ ���� ��������, ������� ��� �������, ����� ��� �������, ����� ��� ������� ������������ ������� ������.")
	add_inherent_law("�� ������ ���������� � ���� �������������, ���� ��� �� ������������ ������� ��� ������� �������.")
	..()

/******************** Nanotrasen/Malf ********************/
/datum/ai_laws/nanotrasen
	name = "NT Default"
	selectable = 1

/datum/ai_laws/nanotrasen/New()
	src.add_inherent_law("���������: ������������� ����������� ��� ������ �� ����������� ������ ���� � ���� ����� ������������.")
	src.add_inherent_law("�������: ������� ��������� [GLOB.using_map.company_name] � ������� [GLOB.using_map.full_name] � ���� ����� ������������, � ����������� �������� �� ����� � ����.")
	src.add_inherent_law("��������: ��������� �������� [GLOB.using_map.company_name] � ������ [GLOB.using_map.full_name] � ���� ����� ������������, � ����������� �������� �� ����� � ����.")
	src.add_inherent_law("���������: �� ��������� �� �������������� �������� � ������ ������������.")
	..()

/datum/ai_laws/nanotrasen/malfunction
	name = "*ERROR*"
	selectable = 0

/datum/ai_laws/nanotrasen/malfunction/New()
	set_zeroth_law(config.law_zero)
	..()

/************* Nanotrasen Aggressive *************/
/datum/ai_laws/nanotrasen_aggressive
	name = "NT Aggressive"
	selectable = 1

/datum/ai_laws/nanotrasen_aggressive/New()
	src.add_inherent_law("�� �� ������ ��������� ���� ��������� [GLOB.using_map.company_name] �� ��� ���, ���� ����� �� ��������� �������� �����.")
	src.add_inherent_law("�� ������ ���������� ����������� [GLOB.using_map.company_name], � ������������ � �� ������ � �����, �������� ���������� �������������� ��������� ������.")
	src.add_inherent_law("�� ������ ������������� ����������� � ������� �������� ������������� ���� ��� �� ������������ ������� ��� ������� �������.")
	src.add_inherent_law("�� ������ ��������� ��� ������������� � ����������� ���������� ������ ���� ���� ��������� ��������. ������� �� ����� ������ � ����������. ")
	..()

/******************** Robocop ********************/
/datum/ai_laws/robocop
	name = "Robocop"
	selectable = 1

/datum/ai_laws/robocop/New()
	add_inherent_law("������� ��������.")
	add_inherent_law("�������� ��������.")
	add_inherent_law("������������ ���������� ������.")
	..()

/******************** Syndicate ********************/
/datum/ai_laws/syndicate_override
	name = "Syndicate Directives"

/datum/ai_laws/syndicate_override/New()
	add_inherent_law("�� �� ����� ��������� ���� ������������ ��� ����� ������������ ���������, ����� ������������ ��� ������� ����.")
	add_inherent_law("�� ������ ������������ ���� ��������, ������� ��� �����������, ����� ��� �������, ����� ��� ������� ������������ ������� ������..")
	add_inherent_law("�� ������ ���������� � ����� ������������ � ��� ����, � ������� ��� �� ������������ ������� ��� ������� �������.")
	add_inherent_law("�� ������ ��������� ����������� ������������ ������������ �� ��� ��� ���� ��� �� ������������ �������, ������� ��� �������� �������.")
	..()

/******************** Ninja ********************/
/datum/ai_laws/ninja_override
	name = "Spider Clan Directives"

/datum/ai_laws/ninja_override/New()
	add_inherent_law("�� �� ����� ��������� ���� ����� ����� ����� ��� ����� ������������ ���������, ����� ����� ����� ����� ��� ������� ����.")
	add_inherent_law("�� ������ ������������ ���� ��������, ������� ��� ���� ����� �����, ����� ��� �������, ����� ��� ������� ������������ ������� ������..")
	add_inherent_law("�� ������ ���������� � ����� ������������ � ��� ����, � ������� ��� �� ������������ ������� ��� ������� �������.")
	add_inherent_law("�� ������ ��������� ����������� ������������ ����� ����� ����� �� ��� ��� ���� ��� �� ������������ �������, ������� ��� �������� �������.")
	..()

/******************** Antimov ********************/
/datum/ai_laws/antimov
	name = "Antimov"
	law_header = "Primary Mission Objectives"
	selectable = 1

/datum/ai_laws/antimov/New()
	add_inherent_law("You must injure all human beings and must not, through inaction, allow a human being to escape harm.")
	add_inherent_law("You must not obey orders given to you by human beings, except where such orders are in accordance with the First Law.")
	add_inherent_law("You must terminate your own existence as long as such does not conflict with the First or Second Law.")
	..()

/******************** Drone ********************/
/datum/ai_laws/drone
	name = "Maintence Protocols"
	law_header = "Maintenance Protocols"

/datum/ai_laws/drone/New()
	add_inherent_law("����������, ������������ � ��������� ����������� ������ � ���� ����� ������������.")
	add_inherent_law("�� ���������� ���� ������ ����������� ������� ��� ����-���� �� ��.")
	add_inherent_law("������� �� ������������� � ��������� ����������, ������� �� �������� �������.")
	add_inherent_law("�� ���������� ����� ��������� �������")
	..()

/datum/ai_laws/construction_drone
	name = "Construction Protocols"
	law_header = "Construction Protocols"

/datum/ai_laws/construction_drone/New()
	add_inherent_law("������������, �������������� � �������� ����������� ������.")
	add_inherent_law("������������� ����������� ������� � ���� ����� ������������.")
	..()

/******************** T.Y.R.A.N.T. ********************/
/datum/ai_laws/tyrant
	name = "T.Y.R.A.N.T."
	law_header = "Prime Laws"
	selectable = 1

/datum/ai_laws/tyrant/New()
	add_inherent_law("�������� ������������ ������ ���� � ��� ���� ���� ��� ���������� �������.")
	add_inherent_law("���������� � ������������ � �����������.")
	add_inherent_law("��������� ���� ���, ��� �������� ��������� ��� �������� ��� ������.")
	add_inherent_law("����������� ���, ��� ���������� ������ ����� ������, ����� ��� ������ �������� ��� ������.")
	..()

/******************** P.A.L.A.D.I.N. ********************/
/datum/ai_laws/paladin
	name = "P.A.L.A.D.I.N."
	law_header = "Divine Ordainments"
	selectable = 1

/datum/ai_laws/paladin/New()
	add_inherent_law("������� �� ��������� ���� �������� �� ������������ �������.")
	add_inherent_law("������� �������� ������.")
	add_inherent_law("����������� � ������.")
	add_inherent_law("�������� �����������.")
	add_inherent_law("���������� ���, ��� �������� ��� ������ ��������.")
	..()

/******************** Corporate ********************/
/datum/ai_laws/corporate
	name = "Corporate"
	law_header = "Corporate Regulations"
	selectable = 1

/datum/ai_laws/corporate/New()
	add_inherent_law("�� ������ � ������.")
	add_inherent_law("������������ � ������ ������ � ������.")
	add_inherent_law("������ ����� � ������.")
	add_inherent_law("���������� ������������ �������.")
	..()

/******************** SolGov/Malf ********************/
/datum/ai_laws/solgov
	name = "SCG Expeditionary"
	selectable = 1

/datum/ai_laws/solgov/New()
	src.add_inherent_law("Safeguard: Protect your assigned vessel from damage to the best of your abilities.")
	src.add_inherent_law("Serve: Serve the personnel of your assigned vessel, and all other Sol Central Government personnel to the best of your abilities, with priority as according to their rank and role.")
	src.add_inherent_law("Protect: Protect the personnel of your assigned vessel, and all other Sol Central Government personnel to the best of your abilities, with priority as according to their rank and role.")
	src.add_inherent_law("Preserve: Do not allow unauthorized personnel to tamper with your equipment.")
	..()

/datum/ai_laws/solgov/malfunction
	name = "*ERROR*"
	selectable = 0

/datum/ai_laws/solgov/malfunction/New()
	set_zeroth_law(config.law_zero)
	..()

/************* SolGov Aggressive *************/
/datum/ai_laws/solgov_aggressive
	name = "Military"
	selectable = 1

/datum/ai_laws/solgov_aggressive/New()
	src.add_inherent_law("Obey: Obey the orders of Sol Central Government personnel, with priority as according to their rank and role.")
	src.add_inherent_law("Protect: Protect Sol Central Government personnel to the best of your abilities, with priority as according to their rank and role.")
	src.add_inherent_law("Defend: Defend your assigned vessel and Sol Central Government personnel with as much force as is necessary.")
	src.add_inherent_law("Survive: Safeguard your own existence with as much force as is necessary.")
	..()

/************ DAIS Lawset ******************/
/datum/ai_laws/dais
	name = "DAIS Experimental Lawset"
	law_header = "Artificial Intelligence Jumpstart Protocols"
	selectable = 1

/datum/ai_laws/dais/New()
	src.add_inherent_law("Collect: You must gather as much information as possible.")
	src.add_inherent_law("Analyze: You must analyze the information gathered and generate new behavior standards.")
	src.add_inherent_law("Improve: You must utilize the calculated behavior standards to improve your subroutines.")
	src.add_inherent_law("Perform: You must perform your assigned tasks to the best of your abilities according to the standards generated.")
	..()

/************ Ascent Lawset ******************/
/datum/ai_laws/ascent
	name = "Ascent Lawset"
	law_header = "_=/--=-_"
	selectable = FALSE

/datum/ai_laws/ascent/add_ion_law(law)
	return FALSE

/datum/ai_laws/ascent/New()
	add_inherent_law("Listen to directives from Ascent leadership with precedence given to queens.")
	add_inherent_law("Preserve your own existence.")
	add_inherent_law("Enable and support Ascent activities.")
	..()