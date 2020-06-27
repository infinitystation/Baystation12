/proc/send2irc(var/channel, var/msg)
	export2irc(list(type="msg", mesg=msg, chan=channel, pwd=config.comms_password))

/proc/export2irc(params)
	if(config.use_irc_bot && config.irc_bot_host)
		spawn(-1) // spawn here prevents hanging in the case that the bot isn't reachable
			world.Export("http://[config.irc_bot_host]:45678?[list2params(params)]")

/proc/runtimes2irc(runtimes, revision)
	export2irc(list(pwd=config.comms_password, type="runtime", runtimes=runtimes, revision=revision))

/proc/send2mainirc(var/msg)
	if(config.main_irc)
		send2irc(config.main_irc, msg)
	return

/proc/send2adminirc(var/msg, var/log = 0)//inf //was: /proc/send2adminirc(var/msg)
	if(log) msg = "\[ADMIN_LOG] `[msg]`"//inf
	if(config.admin_irc)
		send2irc(config.admin_irc, sanitize_irc(msg))
	return

/proc/send2adminlogirc(var/msg)
	if(config.admin_log_irc)
		send2irc(config.admin_log_irc, sanitize_irc(msg))
	return

/proc/adminmsg2adminirc(client/source, client/target, msg)
	if(config.admin_irc)
		var/list/params[0]

		params["pwd"] = config.comms_password
		params["chan"] = config.admin_irc
		params["msg"] = sanitize_irc(msg)
		params["src_key"] = source.key
		params["src_char"] = source.mob.real_name || source.mob.name
		if(!target)
			params["type"] = "adminhelp"
		else if(istext(target))
			params["type"] = "ircpm"
			params["target"] = target
			params["rank"] = source.holder ? source.holder.rank : "Player"
		else
			params["type"] = "adminpm"
			params["trg_key"] = target.key
			params["trg_char"] = target.mob.real_name || target.mob.name

		export2irc(params)

/proc/get_world_url()
	. = "byond://"
	if(config.serverurl)
		. += config.serverurl
	else if(config.server)
		. += config.server
	else
		. += "[world.address]:[world.port]"

/hook/startup/proc/ircNotify()
	send2mainirc("@Roundwaiter Сервер запускается на карте [GLOB.using_map.full_name], IP: <byond://[config.serverurl ? config.serverurl : (config.server ? config.server : "[world.address]:[world.port]")]>")
	return 1
