/proc/seconds_to_readable(seconds)
	if (!isnum(seconds))
		seconds = text2num(seconds)

	if (seconds < 0)
		return "INFINITE"
	else if (isnull(seconds))
		return "BAD INPUT"

	var/hours = 0
	var/minutes = 0

	if (seconds >= 3600)
		hours = round(seconds / 3600)
		seconds = seconds - (hours * 3600)
	if (seconds >= 60)
		minutes = round(seconds / 60)
		seconds = seconds - (minutes * 60)

	var/result = list()

	if (hours)
		result += "[hours] hour\s"
	if (minutes)
		result += "[minutes] minute\s"
	if (seconds)
		result += "[seconds] second\s"

	return jointext(result, ", ")
