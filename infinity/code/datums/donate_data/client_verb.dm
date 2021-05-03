/client/verb/ShowDonateData()
	set name = "Donations' info"
	set desc = "Check information about your donations"
	set category = "OOC"
	if(!DonateData)
		alert(src, "Somehow, bluespace ate your data, try again later.", "Error", "Ok")
		return
	else
		var/dat = "<hr><table>"
		var/list/L = list("Rank" = DonateData.rank, "Premium Level" = DonateData.level, "Premium Points" = DonateData.points)
		for(var/i in L)
			dat += {"
			<tr>
				<td>[i]:
				<td>[L[i]]
			"}
		dat += "</table>"

		var/datum/browser/popup = new(usr, "donatedata", "Donations' Info of [DonateData.key]", 200 + 10 * length(DonateData.key), 50 * length(L))
		popup.set_content(dat)
		popup.open()
