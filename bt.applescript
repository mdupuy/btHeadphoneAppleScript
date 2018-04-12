#!/usr/bin/osascript
on run arg
	#do shell script "echo " & item 1 of arg
	#log "entered " & item 1 of arg
	
	if (count of arg) > 0 then
		if (item 1 of arg contains "j") then
			set headphones to "Jaybird X3"
		else if (item 1 of arg contains "b") then
			set headphones to "BRAGI HP 93"
		else if (item 1 of arg contains "s") then
			set headphones to "BeatsSolo2"
		end if
	else
		#if no arguments passed in, use a default
		set headphones to "BRAGI HP 93"
	end if
	
	#log headphones
	
	#set a to path to frontmost application as text
	tell application "System Events"
		set frontmostApplicationName to name of 1st process whose frontmost is true
	end tell
	tell application "System Events"
		tell process "SystemUIServer"
			set btMenu to (menu bar item 1 of menu bar 1 where description is "bluetooth")
			tell btMenu
				click
				if exists menu item headphones of menu 1 then
					tell (menu item headphones of menu 1)
						click
						if exists menu item "Connect" of menu 1 then
							click menu item "Connect" of menu 1
							return "Connecting " & headphones
						else if exists menu item "Disconnect" of menu 1 then
							click menu item "Disconnect" of menu 1
							return "Disconnecting " & headphones
						else
							return "Couldn't find connect/disconnect for " & headphones
						end if
					end tell
				else
					#couldn't click on menu item, send esc key
					tell application "System Events"
						key code 53
					end tell
					return "Couldn't select " & headphones
				end if
			end tell
		end tell
	end tell
	#return focus to last active application
	tell application frontmostApplicationName
		activate
	end tell
	
	return "no menu items found"
end run
