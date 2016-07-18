tell application "Evernote"
	set note1 to missing value
	if note1 is missing value then
		set matches to find notes " created:20160718T201147 -created:20160718T201151"
	end if
	set countmatches to count of matches
	if countmatches is 1
		set note1 to item 1 of matches
		set notelink1 to note link of note1
		return "{ \"found\": 1, \"notelink\": \"" & notelink1 & "\", \"queryString\": \"" & " created:20160718T201147 -created:20160718T201151" & "\"}"
	else
		return "{ \"found\": " & countmatches & ", \"notelink\": \"\", \"queryString\": \"" & " created:20160718T201147 -created:20160718T201151" & "\"}"
	end if
end tell