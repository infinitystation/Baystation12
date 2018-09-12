//Report datums for use with the report editor and other programs.

/datum/computer_file/report/recipient/crew_transfer
	form_name = "CTA-NTF-01"
	title = "��&#255;������ �� �������"
	logo = "\[logo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/crew_transfer/generate_fields()
	..()
	var/list/hop_fields = list()
	add_field(/datum/report_field/instruction, "��� ������ - ���� ����� ���������")
	add_field(/datum/report_field/people/from_manifest, "��&#255; (��)")
	add_field(/datum/report_field/people/from_manifest, "��&#255; (��&#255;������)", required = 1)
	add_field(/datum/report_field/date, "���� ���������&#255;")
	add_field(/datum/report_field/time, "����&#255; ���������&#255;")
	add_field(/datum/report_field/simple_text, "������&#255; ���������")
	add_field(/datum/report_field/simple_text, "������������&#255; ���������")
	add_field(/datum/report_field/pencode_text, "������� ��������")
	add_field(/datum/report_field/instruction, "�������� ���������&#255; ���������������� � ������ ������������� ���������&#255; ��������� �����.")
	add_field(/datum/report_field/signature, "������� ��&#255;�����&#255;")
	hop_fields += add_field(/datum/report_field/signature, "������� ����� ���������")
	hop_fields += add_field(/datum/report_field/number, "���������� ��������� �� ������� ���������")
	hop_fields += add_field(/datum/report_field/number, "���������� ��������� �� ������������� ���������")
	hop_fields += add_field(/datum/report_field/options/yes_no, "��������")
	for(var/datum/report_field/field in hop_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/access_modification
	form_name = "AMA-NTF-02"
	title = "��&#255;������ �� ��������� �������"
	logo = "\[logo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/access_modification/generate_fields()
	..()
	var/list/hop_fields = list()
	add_field(/datum/report_field/instruction, "��� ������ - ���� ����� ���������")
	add_field(/datum/report_field/people/from_manifest, "��&#255; (��)")
	add_field(/datum/report_field/people/from_manifest, "��&#255; (��&#255;������)", required = 1)
	add_field(/datum/report_field/date, "���� ���������&#255;")
	add_field(/datum/report_field/time, "����&#255; ���������&#255;")
	add_field(/datum/report_field/simple_text, "������&#255; ���������")
	add_field(/datum/report_field/simple_text, "������������� ������")
	add_field(/datum/report_field/pencode_text, "������� ���������&#255; �������")
	add_field(/datum/report_field/simple_text, "���� ���������&#255; �������")
	add_field(/datum/report_field/instruction, "�������� ���������&#255; ���������������� � ������ ������������� ���������&#255; ��������� �����.")
	add_field(/datum/report_field/signature, "������� ��&#255;�����&#255;")
	hop_fields += add_field(/datum/report_field/signature, "������� ����� ���������")
	hop_fields += add_field(/datum/report_field/number, "���������� ��������� �� ��������������� ���������")
	hop_fields += add_field(/datum/report_field/options/yes_no, "��������")
	for(var/datum/report_field/field in hop_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/borging
	form_name = "CC-NTF-09"
	title = "�������� �� ��������������"
	logo = "\[logo\]"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/borging/generate_fields()
	..()
	var/list/hop_fields = list()
	add_field(/datum/report_field/instruction, "��� ������ - ���� ����� ���������")
	add_field(/datum/report_field/people/from_manifest, "��&#255; (��)")
	add_field(/datum/report_field/people/from_manifest, "��&#255; (�������)", required = 1)
	add_field(/datum/report_field/date, "���� ���������&#255;")
	add_field(/datum/report_field/time, "����&#255; ���������&#255;")
	add_field(/datum/report_field/instruction, "�, ����������������&#255;, �����&#255;��� ���������� �� ����������� ������ ��������� � ����� �������������� ��� �������&#255;��� � ��. � ���������� ��� ���� ������ ������ �������&#255;. � ����� �������, ��� ��� �������&#255; ����� ���� �����������, � �������� �������� ����� �����������.")
	add_field(/datum/report_field/signature, "������� ��������")
	hop_fields += add_field(/datum/report_field/signature, "������� ����� ���������")
	hop_fields += add_field(/datum/report_field/options/yes_no, "��������")
	for(var/datum/report_field/field in hop_fields)
		field.set_access(access_edit = access_hop)

/datum/computer_file/report/recipient/sec
	logo = "\[logo\]"

/datum/computer_file/report/recipient/sec/New()
	..()
	set_access(access_security)
	set_access(access_heads, override = 0)

/datum/computer_file/report/recipient/sec/investigation
	form_name = "NT-SEC-43"
	title = "������ � �������������"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sec/investigation/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "����������� ������ ��� ������")
	add_field(/datum/report_field/instruction, "������ ��&#255; ����������� ������������&#255;.")
	add_field(/datum/report_field/people/from_manifest, "��&#255;")
	add_field(/datum/report_field/date, "����")
	add_field(/datum/report_field/time, "����&#255;")
	add_field(/datum/report_field/simple_text, "�������� ����")
	add_field(/datum/report_field/pencode_text, "����������")
	add_field(/datum/report_field/pencode_text, "���������&#255;")
	add_field(/datum/report_field/signature, "�������")
	set_access(access_edit = access_security)

/datum/computer_file/report/recipient/sec/incident
	form_name = "NT-SEC-12"
	title = "������ �� ���������"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sec/incident/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "����������� ������ ��� ������")
	add_field(/datum/report_field/instruction, "������&#255;���&#255; �������� ��� ����������, ������������� �� ��������. ������ ���� ��������� � ���������������� �� ����� �����!")
	add_field(/datum/report_field/people/from_manifest, "������������� ������")
	add_field(/datum/report_field/simple_text, "��� ���������/�����������&#255;")
	add_field(/datum/report_field/date, "����")
	add_field(/datum/report_field/time, "����&#255; ���������")
	add_field(/datum/report_field/people/list_from_manifest, "������(�), ������&#255;��� �����")
	add_field(/datum/report_field/simple_text, "Location")
	add_field(/datum/report_field/pencode_text, "�������� ����������� � ��������", "\[small\]\[i\](�-������, ���-�������������, �-���������, ���-��������� ��� �����, �-������������, �-�������������, ���-��������)\[/i\]\[/small\]")
	add_field(/datum/report_field/pencode_text, "�������� ���������/�������������", "\[small\]\[i\](���-����������, �-��������������, ���-�����&#255;��, �-�������, �-��������)\[/i\]\[/small\]")
	add_field(/datum/report_field/pencode_text, "��������� ������")
	add_field(/datum/report_field/signature, "������� �������������� �������")
	set_access(access_edit = access_security)

/datum/computer_file/report/recipient/sec/evidence
	form_name = "NT-SEC-02b"
	title = "����� ������������� � �������������"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sec/evidence/generate_fields()
	..()
	var/datum/report_field/temp_field
	add_field(/datum/report_field/instruction, "����������� ������ ��� ������")
	add_field(/datum/report_field/date, "����")
	add_field(/datum/report_field/time, "����&#255;")
	add_field(/datum/report_field/people/from_manifest, "������������ �")
	add_field(/datum/report_field/pencode_text, "������ ���������, ��&#255;��� �� ��������")
	set_access(access_edit = access_security)
	temp_field = add_field(/datum/report_field/signature, "������� ��������/�����������")
	temp_field.set_access(access_edit = list(access_security, access_armory))
	temp_field = add_field(/datum/report_field/signature, "������� ���������")
	temp_field.set_access(access_edit = list(access_security, access_forensics_lockers))

//Supply and Exploration; these are not shown in deck manager.

/datum/computer_file/report/recipient/docked
	logo = "\[logo\]"
	form_name = "NT-SUP-12"
	title = "������ � ��������"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/docked/New()
	..()
	set_access(access_cargo, access_cargo)
	set_access(access_heads, override = 0)

/datum/computer_file/report/recipient/docked/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "����������� ��������&#255; � ������������� ������ ��� ������")
	add_field(/datum/report_field/instruction, "����&#255; ���������&#255;")
	add_field(/datum/report_field/date, "����")
	add_field(/datum/report_field/simple_text, "�������� �����")
	add_field(/datum/report_field/simple_text, "�����/�������� �����")
	add_field(/datum/report_field/simple_text, "��� ��&#255;��������� �����")
	add_field(/datum/report_field/people/from_manifest, "�������� ������������")
	add_field(/datum/report_field/instruction, "����&#255; ���������&#255; � �����")
	add_field(/datum/report_field/pencode_text, "������ ����� ����� �� �����")
	add_field(/datum/report_field/instruction, "���������&#255; �� ������� �����")
	add_field(/datum/report_field/options/yes_no, "������")
	add_field(/datum/report_field/options/yes_no, "����� ����")
	add_field(/datum/report_field/options/yes_no, "������������ ������� ���������")
	add_field(/datum/report_field/options/yes_no, "���������&#255; ��� ������������&#255; ���������")
	add_field(/datum/report_field/signature, "����������&#255; ����� �� �����")
	add_field(/datum/report_field/instruction, "���������� � �����������")
	add_field(/datum/report_field/time, "����&#255; ����������")
	add_field(/datum/report_field/pencode_text, "�������������� ����������� �� ����������")

/datum/computer_file/report/recipient/fauna
	logo = "\[solcrest\]"
	form_name = "SCG-EXP-19f"
	title = "������ �� ������������ �����"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/docked/New()
	..()
	set_access(access_edit = access_hangar)
	set_access(access_edit = access_research, override = 0)

/datum/computer_file/report/recipient/fauna/generate_fields()
	..()
	add_field(/datum/report_field/instruction, "�������������� ����������� ��� ������")
	add_field(/datum/report_field/instruction, "��������&#255; ����� ������ ���� ��������� ������� �������������� ������� ����� �������&#255; � �������&#255; ����� ����� ������������ �����.")
	add_field(/datum/report_field/date, "����")
	add_field(/datum/report_field/people/list_from_manifest, "����������� ��������")
	add_field(/datum/report_field/pencode_text, "�������&#255;/���������")
	add_field(/datum/report_field/pencode_text, "������ �����������&#255;")
	add_field(/datum/report_field/pencode_text, "������")
	add_field(/datum/report_field/pencode_text, "�����")
	add_field(/datum/report_field/simple_text, "������� ������������&#255;")
	add_field(/datum/report_field/pencode_text, "���������")
	add_field(/datum/report_field/pencode_text, "�������� ��������&#255;/�������")
	add_field(/datum/report_field/pencode_text, "������ ��������������")
	add_field(/datum/report_field/pencode_text, "������������&#255;")
	add_field(/datum/report_field/instruction, "�� ���������� � ��������� ������ �����, �������� ������������ ������ ��������� �� �� ����� � ������ ���������� ���, � ��������, � ����� ��������� ����� � ����� ����� ������� � ������� ��������� �� ���������&#255;�.")

//NT reports, mostly for liason but can be used by any NT personnel.

/datum/computer_file/report/recipient/nt
	logo = "\[logo\]"

/datum/computer_file/report/recipient/nt/proc/add_header()
	add_field(/datum/report_field/simple_text, "�����", "��� ������")
	add_field(/datum/report_field/date, "����")
	add_field(/datum/report_field/time, "����&#255;")
	add_field(/datum/report_field/simple_text, "�����")

/datum/computer_file/report/recipient/nt/anomaly
	form_name = "NT-1546"
	title = "����� �� ������� ������������"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/anomaly/New()
	..()
	set_access(access_research, access_research)

/datum/computer_file/report/recipient/nt/anomaly/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/simple_text, "������� �������� �������")
	add_field(/datum/report_field/people/from_manifest, "�������������&#255; ������")
	add_field(/datum/report_field/people/from_manifest, "������&#255;���� �������� ������������")
	add_field(/datum/report_field/pencode_text, "��������� ���������&#255;")
	add_field(/datum/report_field/pencode_text, "����� ��������")
	add_field(/datum/report_field/simple_text, "��������� ������� �������")
	add_field(/datum/report_field/simple_text, "������� ��������� �������")

/datum/computer_file/report/recipient/nt/fire
	form_name = "NT-0102"
	title = "����� ����������&#255; ��������� ��������� NT"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/fire/New()
	..()
	set_access(access_heads, access_heads)
	set_access(access_nanotrasen, override = 0)

/datum/computer_file/report/recipient/nt/fire/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/instruction, "������ � ����������� ��������� ��������")
	add_field(/datum/report_field/people/from_manifest, "��&#255;")
	add_field(/datum/report_field/number, "�������")
	add_field(/datum/report_field/simple_text, "���������")
	add_field(/datum/report_field/pencode_text, "������� ���������&#255;")
	add_field(/datum/report_field/signature, "������������")
	add_field(/datum/report_field/instruction, "����������, ���������� ������ ���� ���������� � ���� ������ � ����������� ��������� ���������.")

/datum/computer_file/report/recipient/nt/incident/New()
	..()
	set_access(access_edit = access_nanotrasen)

/datum/computer_file/report/recipient/nt/incident/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/pencode_text, "������ �� ���������")
	add_field(/datum/report_field/pencode_text, "����������� ���������")

/datum/computer_file/report/recipient/nt/incident/proc/add_signatures()
	add_field(/datum/report_field/signature, "�������")
	add_field(/datum/report_field/signature, "������� ��������&#255;")
	add_field(/datum/report_field/options/yes_no, "��������")

/datum/computer_file/report/recipient/nt/incident/ship
	form_name = "NT-3203"
	title = "������ �� ��������� �� ����� NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/ship/generate_fields()
	..()
	add_field(/datum/report_field/pencode_text, "����������� ������������")
	add_signatures()


/datum/computer_file/report/recipient/nt/incident/personnel
	form_name = "NT-3205"
	title = "������ �� ��������� � ���������� NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/personnel/generate_fields()
	..()
	add_field(/datum/report_field/people/list_from_manifest, "����������� ��������")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/asset
	form_name = "NT-3201"
	title = "������ �� ��������� � �������� NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/asset/generate_fields()
	..()
	add_field(/datum/report_field/pencode_text, "������ ����������� NanoTrasen")
	add_field(/datum/report_field/pencode_text, "������ ������� NanoTrasen")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/xeno
	form_name = "NT-3213"
	title = "������ �� ��������� � ����������-��-������ NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/xeno/generate_fields()
	add_field(/datum/report_field/instruction, "���� � ���������� ��-�������� ����������� ������&#255; ����, ����������� ����� NT-3213A.")
	..()
	add_field(/datum/report_field/people/list_from_manifest, "����������� ��������-��-����")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/xeno_no_visa/
	form_name = "NT-3213A"
	title = "������ �� ��������� � ����������-��-������ NanoTrasen: ���������� ����"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/xeno_no_visa/generate_fields()
	add_field(/datum/report_field/instruction, "���� ������&#255; ���� ���������� ��-�������� �������, ����������� NT-3213.")
	..()
	add_field(/datum/report_field/people/list_from_manifest, "����������� ��������-��-����")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/synth
	form_name = "NT-3213X"
	title = "������ �� ��������� � ����������-����������� NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/synth/generate_fields()
	..()
	add_field(/datum/report_field/people/list_from_manifest, "����������� ��������-���������")
	add_signatures()

/datum/computer_file/report/recipient/nt/incident/crew
	form_name = "NT-3241"
	title = "������ �� ��������� � ������ � ���������� NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/incident/crew/generate_fields()
	add_field(/datum/report_field/instruction, "��&#255; ������������������ ����������, ���������� � ���&#255; � �������, � ������/�����������.")
	..()
	add_field(/datum/report_field/people/list_from_manifest, "����������� ����� �������")
	add_field(/datum/report_field/people/list_from_manifest, "����������� ��������")
	add_signatures()

/datum/computer_file/report/recipient/nt/volunteer
	form_name = "NT-1443"
	title = "����� �����������-��������� NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/volunteer/generate_fields()
	..()
	var/list/temp_fields = list()
	add_header()
	add_field(/datum/report_field/people/from_manifest, "��&#255; ���������")
	add_field(/datum/report_field/simple_text, "����������� ���������")
	add_field(/datum/report_field/simple_text, "����������&#255; ��&#255; ���������: (���� ����)")
	add_field(/datum/report_field/people/list_from_manifest, "������������� �������������")
	add_field(/datum/report_field/instruction, "���������&#255; �����, \"��������\" ���� �������� �� ����� �� ��������������� NanoTrasen � �� ����������� �� ����� ������, ������&#255;, ������ ������������� ��� �������� �������, ������� ����� ����� ����������� ����������� ���������. � ������ ���������&#255; �������������� NanoTrasen, ����� ��� �������� ������������, ����� ��������&#255; �����������. ���������� ����� ��������&#255; ������ ���� ��� �������.")
	add_field(/datum/report_field/signature, "������� ���������")
	temp_fields += add_field(/datum/report_field/signature, "������� ������������&#255; NanoTrasen")
	temp_fields += add_field(/datum/report_field/options/yes_no, "��������")
	for(var/datum/report_field/temp_field in temp_fields)
		temp_field.set_access(access_edit = access_nanotrasen)

/datum/computer_file/report/recipient/nt/deny
	form_name = "NT-1443D"
	title = "Rejection of Test Subject Volunteer Notice"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/deny/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/instruction, "Dear Sir/Madam, we regret to inform you that your volunteer application for service as a test subject with the NanoTrasen Corporation has been rejected. We thank you for your interest in our company and the progression of research. Attached, you will find a copy of your original volunteer form for your records. Regards,")
	add_field(/datum/report_field/instruction, "��������� ��&#255;������, � ���������� �������� ���, ��� ���� ��&#255;������ �� ������������ � �������� ����������� � ���������� NanoTrasen ���� ����������. �� ���������� ��� �� �������, ���&#255;������� � �������� � �������� ���������. � ���������� �� ������� �������� ������ ��&#255;�����&#255;. � ���������,")
	add_field(/datum/report_field/signature, "������� ������������&#255; NanoTrasen")
	add_field(/datum/report_field/people/from_manifest, "��&#255; ���������")
	add_field(/datum/report_field/instruction, "������� ������")
	add_field(/datum/report_field/options/yes_no, "���������&#255; �������������")
	add_field(/datum/report_field/options/yes_no, "��������������&#255; �������������")
	add_field(/datum/report_field/options/yes_no, "������ �������")
	add_field(/datum/report_field/simple_text, "������")
	add_field(/datum/report_field/options/yes_no, "����� �������")
	set_access(access_edit = access_nanotrasen)

/datum/computer_file/report/recipient/nt/memo/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/simple_text, "����")
	add_field(/datum/report_field/pencode_text, "�����")
	add_field(/datum/report_field/signature, "������������")
	add_field(/datum/report_field/options/yes_no, "��������")

/datum/computer_file/report/recipient/nt/memo/internal
	form_name = "NT-0003"
	title = "��������&#255;&#255; �������"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/memo/internal/New()
	..()
	set_access(access_nanotrasen, access_nanotrasen)

/datum/computer_file/report/recipient/nt/memo/external
	form_name = "NT-0005"
	title = "�����&#255;&#255; �������"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/memo/external/New()
	..()
	set_access(access_edit = access_nanotrasen)

//No access restrictions for easier use.
/datum/computer_file/report/recipient/nt/sales
	form_name = "NT-2192"
	title = "�������� �������� � ��������&#255; NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/sales/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/instruction, "���������&#255; � ��������")
	add_field(/datum/report_field/simple_text, "�������� ��������")
	add_field(/datum/report_field/simple_text, "��� ��������")
	add_field(/datum/report_field/number, "��������� ����� ������� �������� (�)")
	add_field(/datum/report_field/number, "����������� ���������� ��������")
	add_field(/datum/report_field/number, "����&#255; ��������� (�)")
	add_field(/datum/report_field/instruction, "���������&#255; � ��������")
	add_field(/datum/report_field/instruction, "���������� �� ����� ����� �� ������� ��������� ������ �������� � ����� �� ����������� � �������, �� ����� �����&#255;�� ������� �� ����� �� �������, ��� ������ ��������� � ��������� (�� �������). �������� ����������&#255; ������� ��� �� ���� �����&#255;��� ��&#255; ������� ��� ������ ���������, ��&#255;������ � ���������������� ������ ��� ������������ �������, �� �� �����, ������������ ��� �������������, � ����� ���������&#255; �� �������������� ������.")
	add_field(/datum/report_field/people/from_manifest, "��&#255;")
	add_field(/datum/report_field/signature, "�������")
	add_field(/datum/report_field/options/yes_no, "��������")

/datum/computer_file/report/recipient/nt/visa
	form_name = "NT-0952"
	title = "����� ������� ���� ������������ ������������� ��������� ������� NanoTrasen"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/visa/generate_fields()
	..()
	add_header()
	var/datum/report_field/temp_field
	add_field(/datum/report_field/people/from_manifest, "���������� ����")
	add_field(/datum/report_field/pencode_text, "������� �������")
	add_field(/datum/report_field/signature, "������� ���������&#255; ����")
	temp_field = add_field(/datum/report_field/signature, "������� ����������&#255;")
	temp_field.set_access(access_edit = access_nanotrasen)
	temp_field = add_field(/datum/report_field/options/yes_no, "�������� ������������")
	temp_field.set_access(access_edit = access_nanotrasen)
	temp_field = add_field(/datum/report_field/signature, "������� ������ ������, �������������&#255; ���������")
	temp_field.set_access(access_edit = access_iaa)

/datum/computer_file/report/recipient/nt/payout
	form_name = "NT-3310"
	title = "����������&#255; ������� ���������� ������������"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/nt/payout/generate_fields()
	..()
	add_header()
	add_field(/datum/report_field/people/from_manifest, "�����&#255;��� �������� ���������� ������� ���������&#255; ����� ��������,")
	add_field(/datum/report_field/pencode_text, "� ����� ��������� ������� ���������: (���������, ���������� �������),")
	add_field(/datum/report_field/pencode_text, "������&#255; ������ ����")
	add_field(/datum/report_field/instruction, "��������� � ��������� ���������� ������������ ���������� ��� ��������.")
	add_field(/datum/report_field/signature, "�������")
	add_field(/datum/report_field/options/yes_no, "��������")
	set_access(access_edit = access_nanotrasen)

//Solgov reports, mostly for the NR
/datum/computer_file/report/recipient/sol
	logo = "\[logo\]"
	form_name = "NT-REP-00"

/datum/computer_file/report/recipient/sol/audit
	form_name = "NT-REP-12"
	title = "����� ������������ ��� ������"
	available_on_ntnet = 1

/datum/computer_file/report/recipient/sol/audit/generate_fields()
	add_field(/datum/report_field/date, "����")
	add_field(/datum/report_field/time, "����&#255;")
	add_field(/datum/report_field/simple_text, "����� ������������")
	add_field(/datum/report_field/pencode_text, "������������� ���������&#255;")
	add_field(/datum/report_field/pencode_text, "������������� ���������&#255;")
	add_field(/datum/report_field/pencode_text, "������ �������")
	add_field(/datum/report_field/signature, "�������")
	add_field(/datum/report_field/options/yes_no, "��������")
	set_access(access_edit = access_iaa)

/datum/computer_file/report/recipient/sol/audit
	form_name = "NT-REP-4"
	title = "����� �� ���������"
	available_on_ntnet = 1
