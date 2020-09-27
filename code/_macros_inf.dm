#define RECOMMENDED_VERSION 513

#define SPAN_LING(X) "<span class='changeling'>[X]</span>"

#define SPAN_ALIEN(X) "<span class='alien'>[X]</span>"

#define GET_ATOMLOC_HREF_FOR(M) "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[M.x];Y=[M.y];Z=[M.z]'>JMP</a>"

#define GET_2D_DISTANCE(atom1, atom2) sqrt((atom1.x - atom2.x) ** 2 + (atom1.y - atom2.y) ** 2)

#define GET_3D_DISTANCE(atom1, atom2) sqrt(GET_2D_DISTANCE(atom1, atom2) ** 2 + (atom1.z - atom2.z) ** 2)

#define isbot(A) istype(A, /mob/living/bot)

#define PICK_OR_SET(listOrVar) (islist(listOrVar) ? pick(listOrVar) : listOrVar)

#define any2bool(expression) (!(!(expression)))

#define max1(thing) (max((thing), 1))

#define SET_L_RPC(r, p, c) set_light(p, l_outer_range = r, l_color = c)

#if DM_VERSION < RECOMMENDED_VERSION
#warn Unsupported compiler version: please update byond or go to beta, otherwise some features won't work.
/proc/copytext_char(T,Start=1,End=0)
	return copytext(T, Start, End)

/proc/length_char(E)
	return length(E)

/proc/findtext_char(Haystack,Needle,Start=1,End=0)
	return findtext(Haystack, Needle, Start, End)
/proc/replacetextEx_char(Haystack,Needle,Replacement,Start=1,End=0)
	return replacetextEx(Haystack,Needle,Replacement,Start,End)
#endif

/proc/parse_html_inf(var/browser_content)
	if(isfile(browser_content))
		return browser_content
	else if(findtext(browser_content, "<html>"))
		return replacetext(browser_content, "<html>", "<html><meta charset='UTF-8'>")
	else
		return "<HTML><meta charset='UTF-8'><BODY>[browser_content]</BODY></HTML>"
