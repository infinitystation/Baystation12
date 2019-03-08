/mob/living/var/emoteCooldown = (3 SECONDS)
/mob/living/var/emoteLastUse = -1000

/mob/living/proc/emoteCooldownCheck()
	if(emoteLastUse <= (world.time - emoteCooldown))
		emoteLastUse = world.time
		return 1
	else
		to_chat(src, "<span class='warning'>����� �����&#255;�� ������ ������ �� ����� [emoteCooldown / 10] ������.</span>")
		return 0

/mob/living/verb/laugh()
	set name = "��������"
	set category = "Emote"
	emote("laugh")

/mob/living/verb/giggle()
	set name = "��������"
	set category = "Emote"
	emote("giggle")

/mob/living/verb/scream()
	set name = "�������"
	set category = "Emote"
	emote("scream")

/mob/living/verb/scratch()
	set name = "����������"
	set category = "Emote"
	emote("scratch")

/mob/living/verb/blush()
	set name = "��������"
	set category = "Emote"
	emote("blush")

/mob/living/verb/blink()
	set name = "������������"
	set category = "Emote"
	emote("blink")

/mob/living/verb/bow()
	set name = "�����������"
	set category = "Emote"
	emote("bow")

/mob/living/verb/choke()
	set name = "����������"
	set category = "Emote"
	emote("choke")

/mob/living/verb/chuckle()
	set name = "�����������"
	set category = "Emote"
	emote("chuckle")

/mob/living/verb/collapse()
	set name = "�������"
	set category = "Emote"
	emote("collapse")

/mob/living/verb/cough()
	set name = "�������"
	set category = "Emote"
	emote("cough")

/mob/living/verb/cry()
	set name = "�������"
	set category = "Emote"
	emote("cry")

/mob/living/verb/clap()
	set name = "�������"
	set category = "Emote"
	emote("clap")

/mob/living/verb/drool()
	set name = "����� ������"
	set category = "Emote"
	emote("drool")

/mob/living/verb/faint()
	set name = "�������� ��������"
	set category = "Emote"
	emote("faint")

/mob/living/verb/frown()
	set name = "���������"
	set category = "Emote"
	emote("frown")

/mob/living/verb/gasp()
	set name = "����������"
	set category = "Emote"
	emote("gasp")

/mob/living/verb/glare()
	set name = "�������� � ����������"
	set category = "Emote"
	emote("glare")

/mob/living/verb/groan()
	set name = "��������� � �������"
	set category = "Emote"
	emote("groan")

/mob/living/verb/grin()
	set name = "���������� � ������"
	set category = "Emote"
	emote("grin")

/mob/living/verb/look()
	set name = "����������"
	set category = "Emote"
	emote("look")

/mob/living/verb/nod()
	set name = "�������"
	set category = "Emote"
	emote("nod")

/mob/living/verb/moan()
	set name = "�������"
	set category = "Emote"
	emote("moan")

/mob/living/verb/shake()
	set name = "������ �������"
	set category = "Emote"
	emote("shake")

/mob/living/verb/sigh()
	set name = "��������"
	set category = "Emote"
	emote("sigh")

/mob/living/verb/smile()
	set name = "����������"
	set category = "Emote"
	emote("smile")

/mob/living/verb/sneeze()
	set name = "�������"
	set category = "Emote"
	emote("sneeze")

/mob/living/verb/grunt()
	set name = "�������"
	set category = "Emote"
	emote("grunt")

/mob/living/verb/sniff()
	set name = "��������"
	set category = "Emote"
	emote("sniff")

/mob/living/verb/snore()
	set name = "�������"
	set category = "Emote"
	emote("snore")

/mob/living/verb/shrug()
	set name = "������ �������"
	set category = "Emote"
	emote("shrug")

/mob/living/verb/stare()
	set name = "��������"
	set category = "Emote"
	emote("stare")

/mob/living/verb/tremble()
	set name = "������� � �����"
	set category = "Emote"
	emote("tremble")

/mob/living/verb/twitch_v()
	set name = "������ ��������"
	set category = "Emote"
	emote("twitch_v")

/mob/living/verb/twitch()
	set name = "ĸ�������"
	set category = "Emote"
	emote("twitch")

/mob/living/verb/wave()
	set name = "������"
	set category = "Emote"
	emote("wave")

/mob/living/verb/whimper()
	set name = "�������"
	set category = "Emote"
	emote("whimper")

/mob/living/verb/whistle()
	set name = "��������"
	set category = "Emote"
	emote("whistle")

/mob/living/verb/wink()
	set name = "����������"
	set category = "Emote"
	emote("wink")

/mob/living/verb/yawn()
	set name = "������"
	set category = "Emote"
	emote("yawn")

/mob/living/verb/salute()
	set name = "������� �������� �����������"
	set category = "Emote"
	emote("salute")

/mob/living/verb/eyebrow()
	set name = "���������� �����"
	set category = "Emote"
	emote("eyebrow")
