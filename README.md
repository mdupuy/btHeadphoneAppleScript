Manage bluetooth headphone connection from command line OR applescript application OR keyboard shortcut

I have several blue tooth headphones. Some of them allow multi-point connections, some don't. If I want to quickly disconnect them from one Mac to connect them to my phone or connect them to another Mac, this script lets me quickly toggle the connection either remotely via ssh or locally in the terminal or with app container version of this script.

You can also call this script from the terminal via an automator workflow that is tied to a key press sequence via a service.
i.e. Open automator, create a new service, search for "Run AppleScript" in the Actions list and paste this in (assuming bt.applescript is in your PATH somethwere)

    tell application "Terminal"
	    set currentTab to do script ("bt.applescript;exit")
    end tell
    
Set the service to receive "no input" in "any application" and save.

This file is now in ~/Library/Services

but will also appear in System Preferences -> Keyboard -> Shortcuts -> Services -> General

Here you can assign it a keyboard shortcut
