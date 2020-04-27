#define SPAN_LING(X) "<span class='changeling'>[X]</span>"

#define SPAN_ALIEN(X) "<span class='alien'>[X]</span>"

#define GET_ATOMLOC_HREF_FOR(M) "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[M.x];Y=[M.y];Z=[M.z]'>JMP</a>"

#define SPAWN_ZERO spawn(0)

#define MCR_SPAWN(time) spawn(time)

#define LAZY_LIST_CLEAR(list2clear) if(length(list2clear) && istype(list2clear, /list)){for(var/i in list2clear){list2clear -= i; if(isloc(i) || istype(i, /image) || isicon(i))qdel(i)}}