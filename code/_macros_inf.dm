#define SPAN_LING(X) "<span class='changeling'>[X]</span>"

#define SPAN_ALIEN(X) "<span class='alien'>[X]</span>"

#define GET_ATOMLOC_HREF_FOR(M) "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[M.x];Y=[M.y];Z=[M.z]'>JMP</a>"

#define GET_2D_DISTANCE(atom1, atom2) sqrt((atom1.x - atom2.x) ** 2 + (atom1.y - atom2.y) ** 2)

#define GET_3D_DISTANCE(atom1, atom2) sqrt(GET_2D_DISTANCE(atom1, atom2) ** 2 + (atom1.z - atom2.z) ** 2)

/proc/parse_html_inf(var/browser_content)
    if(isfile(browser_content))
        return browser_content
    else if(findtext(browser_content, "<html>"))
        return replacetext(browser_content, "<html>", "<html><meta charset='UTF-8'>")
    else
        return "<HTML><meta charset='UTF-8'><BODY>[browser_content]</BODY></HTML>"
