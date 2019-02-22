proc/corrupt_text(t)
	var/returntext = ""
	for(var/i = 1, i <= length(t), i++)

		var/letter = copytext(t, i, i+1)
		if(prob(75))
			if(prob(10))
				letter = ""
			for(var/j = 1, j <= rand(0, 2), j++)
				letter += pick("#","@","*","&","%","$", "!","¹","?","*","*","*","*","*","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")

		returntext += letter

	return returntext

proc/corrupt_name(n, s)
	var/returnname = ""
	for(var/i = 1, i <= length(n), i++)
		var/letter = copytext(n, i, i+1)
		var/lowered = 0

		if(letter == uppertext(letter))
			letter = lowertext(letter)
			lowered = 1

		if(prob(85 - s * 20))	// I need medical attention
			if(letter == "a")
				letter = "o"
			else if(letter == "b")
				letter = "d"
			else if(letter == "d")
				letter = "b"
			else if(letter == "f")
				letter = "l"
			else if(letter == "g")
				letter = "q"
			else if(letter == "h")
				letter = pick("n", "r")
			else if(letter == "i")
				letter = pick("j", "l")
			else if(letter == "j")
				letter = "i"
			else if(letter == "k")
				letter = "h"
			else if(letter == "l")
				letter = "f"
			else if(letter == "m")
				letter = "n"
			else if(letter == "n")
				letter = pick("m", "h")
			else if(letter == "o")
				letter = "a"
			else if(letter == "p")
				letter = pick("b", "q", "d")
			else if(letter == "q")
				letter = pick("p", "b", "d")
			else if(letter == "r")
				letter = "n"
			else if(letter == "s")
				letter = "c"
			else if(letter == "v")
				letter = "w"
			else if(letter == "w")
				letter = "v"
			else if(letter == "z")
				letter = "s"

		if(lowered)
			letter = uppertext(letter)

		returnname += letter

	return returnname
