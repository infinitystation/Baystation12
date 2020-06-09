#define SPAN_LING(X) "<span class='changeling'>[X]</span>"

#define SPAN_ALIEN(X) "<span class='alien'>[X]</span>"

#define GET_ATOMLOC_HREF_FOR(M) "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[M.x];Y=[M.y];Z=[M.z]'>JMP</a>"

#define GET_2D_DISTANCE(atom1, atom2) sqrt((atom1.x - atom2.x) ** 2 + (atom1.y - atom2.y) ** 2)

#define GET_3D_DISTANCE(atom1, atom2) sqrt(GET_2D_DISTANCE(atom1, atom2) ** 2 + (atom1.z - atom2.z) ** 2)

#define isbot(A)	is_type_in_list(A, list(/mob/living/bot/remotebot, /mob/living/bot/cleanbot, /mob/living/bot/farmbot, /mob/living/bot/secbot/ed209, /mob/living/bot/secbot, /mob/living/bot/medbot, /mob/living/bot/floorbot))

#define PICK_OR_SET(listOrVar) (islist(listOrVar) ? pick(listOrVar) : listOrVar)

/proc/parse_html_inf(var/browser_content)
	if(isfile(browser_content))
		return browser_content
	else if(findtext(browser_content, "<html>"))
		return replacetext(browser_content, "<html>", "<html><meta charset='UTF-8'>")
	else
		return "<HTML><meta charset='UTF-8'><BODY>[browser_content]</BODY></HTML>"
