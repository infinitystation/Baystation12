#define isMultimeter(A)   (A && A.ismultimeter())

/atom/proc/ismultimeter()
	return FALSE

/obj/item/device/multitool/multimeter/ismultimeter()
	return TRUE
