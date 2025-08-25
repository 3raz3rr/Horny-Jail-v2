ADMIN_VERB(get_server_logs, R_ADMIN, "Get Server Logs", "View or retrieve logfiles.", ADMIN_CATEGORY_MAIN)
	user.browseserverlogs()

ADMIN_VERB(get_current_logs, R_ADMIN, "Get Current Logs", "View or retrieve logfiles for the current round.", ADMIN_CATEGORY_MAIN)
        user.browseserverlogs(current=TRUE)

ADMIN_VERB(send_config_file, R_ADMIN, "Send Config File", "Send configured file to remote bot.", ADMIN_CATEGORY_MAIN)
       user.send_config_file_to_bot()

/client/proc/browseserverlogs(current=FALSE)
	var/path = browse_files(current ? BROWSE_ROOT_CURRENT_LOGS : BROWSE_ROOT_ALL_LOGS)
	if(!path)
		return

	if(file_spam_check())
		return

	log_admin("[key_name(src)] accessed file: [path]") // SKYRAT EDIT -- ADDITION
	message_admins("[key_name_admin(src)] accessed file: [path]")
	switch(tgui_alert(usr,"View (in game), Open (in your system's text editor), or Download?", path, list("View", "Open", "Download")))
		if ("View")
			src << browse(HTML_SKELETON("<pre style='word-wrap: break-word;'>[html_encode(file2text(file(path)))]</pre>"), list2params(list("window" = "viewfile.[path]")))
		if ("Open")
			src << run(file(path))
		if ("Download")
			src << ftp(file(path))
		else
			return
        to_chat(src, "Attempting to send [path], this may take a fair few minutes if the file is very large.", confidential = TRUE)

/client/proc/send_config_file_to_bot()
       var/bot_ip = CONFIG_GET(string/bot_ip)
       var/bot_port = CONFIG_GET(number/bot_port)
       var/file_path = CONFIG_GET(string/bot_file)
       if(!bot_ip || !bot_port || !file_path)
               to_chat(src, "Bot configuration missing. Check BOT_IP, BOT_PORT, and BOT_FILE.", confidential = TRUE)
               return
       if(!fexists(file_path))
               to_chat(src, "Configured file ([file_path]) not found.", confidential = TRUE)
               return
       if(file_spam_check())
               return
       var/url = "http://[bot_ip]:[bot_port]/"
       log_admin("[key_name(src)] sent config file [file_path] to [url]")
       message_admins("[key_name_admin(src)] sent config file [file_path] to [url]")
       if(world.Export(url, file(file_path)))
               to_chat(src, "Attempting to send [file_path] to [url].", confidential = TRUE)
       else
               to_chat(src, "Failed to send [file_path] to [url].", confidential = TRUE)
