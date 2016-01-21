on openInSublime(folder)
	tell application "Sublime Text 2"
		open folder
		activate
	end tell
end openInSublime


tell application "Finder"
	set sel to item 1 of (get selection)
	if class of sel is folder then
		set currentDir to sel as text
	else
		set currentDir to (container of sel) as text
	end if
end tell

openInSublime(currentDir)

tell application "Terminal"
	activate
end tell

tell application "System Events"
	tell process "Terminal" to keystroke "n" using command down
end tell

tell application "Terminal"
	activate
	do script with command "cd " & (quoted form of POSIX path of currentDir) in window 2
	do script with command "cd " & (quoted form of POSIX path of currentDir) in window 1
	do script with command "node website.js" in window 2
	do script with command "gulp" in window 1
	
end tell