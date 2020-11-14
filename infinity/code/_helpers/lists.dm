/proc/get_matrix_cell(l, x, y)
	if(x in l)
		. = l[x]

	if(islist(.))
		if(length(.))
			var/list/L = .
			if(L.Find(y))
				. = L[y]
		else
			. = null
	if(!.)
		. = "#ffffff"
