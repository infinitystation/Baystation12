// Checking for empty lists in 'content' and 'embeds'. Also checks 'embeds' for structure.
// SHOULD BE INCLUDED BEFORE _webhook.dm
#define EMBED_LIST_VARS			list("fields", "footer", "image", "author", "thumbnail")
/decl/webhook/proc/sanitize_hook(var/list/message)
	if(message["content"] && islist(message["content"]))
		message["content"] = "No list in content allowed"
	var/list/error = list("ERROR")
	if(message["embeds"])
		if(!islist(message["embeds"]))
			message["embeds"] = list(list("title" = "Embed should be a list"))
		else
			var/list/embed = message["embeds"]
			if(length(embed) != 1)
				message["embeds"] = list(list("title" = "Incorrect external embed wrapper (should be 1 list in list)"))
			else
				embed = embed[1]
				if(!islist(embed))
					message["embeds"] = list(list("title" = "Incorrect internal embed wrapper (not a list)"))
				else
					for(var/item in embed)
						if(!embed[item])
							if(item == "color")
								embed[item] = COLOR_WEBHOOK_RUNTIME
								error += "Empty color line in embed"
							else if(item in EMBED_LIST_VARS)
								error += "Declared [item], but variable is empty, when LIST required"
								embed -= item
							else
								error += "Declared [item], but variable is empty, when TEXT required"
								embed -= item
						else
							if(item in EMBED_LIST_VARS)
								if(!islist(embed[item]))
									error += "Declared [item], but variable is NOT A LIST, as expected"
									embed -= item
								else if(item != "fields")
									var/list/check = embed[item]
									for(var/item2 in check)
										if(!check[item2])
											error += "Declared [item2] inside [item], but variable is empty"
											embed -= item
										else if(islist(check[item2]))
											error += "Declared [item2] inside [item], but variable is LIST instead TEXT"
											embed -= item
								else
									if(!embed[item] || !islist(embed[item]))
										error += "Declared [item] but it's empty, or not a LIST"
										embed -= item
									else
										var/list/check2 = embed[item]
										for(var/item3 in check2)
											if(!islist(item3))
												error += "Declared [item] but [item3] variable is empty, or not a LIST"
												embed -= item
											else
												for(var/item4 in item3)
													if(!item3[item4] || islist(item3[item4]))
														error += "Declared [item3] field, but there empty var or LIST in field"
														embed -= item
	if(length(error) > 1)
		if(message["content"])
			message["content"] += "<br>[jointext(error,"<br>")]"
		else
			message["content"] = "[jointext(error,"<br>")]"
	return message
#undef EMBED_LIST_VARS
