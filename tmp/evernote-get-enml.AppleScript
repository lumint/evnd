tell application "Evernote"
	set note1 to find note "evernote:///view/2147483647/s482/9f9bda53-d331-49c0-a792-76b04a52f850/9f9bda53-d331-49c0-a792-76b04a52f850/"
	if note1 is not missing value then return ENML content of note1
end tell
