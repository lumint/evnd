tell application "Evernote"
	set pnotes to find notes "[Note ID: 6f6440d2647e0c3f0e3ce390ac05f4f8] created:20160728T150141 -created:20160728T150145"
	set count1 to count of pnotes
	if count1 equals 1 then
		set note1 to item 1 of pnotes
	else
		set note1 to missing value
	end if
	if note1 is not missing value then return ENML content of note1
end tell
