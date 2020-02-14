#define SPAN_LING(X) "<span class='changeling'>[X]</span>"

#define SPAN_ALIEN(X) "<span class='alien'>[X]</span>"

#define GET_ATOMLOC_HREF_FOR(M) "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[M.x];Y=[M.y];Z=[M.z]'>JMP</a>"

/proc/parse_html_inf(var/browser_content)
	if(isfile(browser_content))
		return browser_content
	else if(findtext(browser_content, "<html>"))
		return replacetext(browser_content, "<html>", "<html><meta charset='UTF-8'>")
	else
		return "<HTML><meta charset='UTF-8'><BODY>[browser_content]</BODY></HTML>"
