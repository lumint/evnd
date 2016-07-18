tell application "Evernote"
	set pnotes to find notes "[Note ID: cc4e2b7fb5cb9df44cb8faae688a287d] created:20160718T201147 -created:20160718T201151"
	set count1 to count of pnotes
	if count1 equals 1 then
		set note1 to item 1 of pnotes
	else
		set note1 to missing value
	end if
	if note1 is not missing value then return ENML content of note1
end tell
