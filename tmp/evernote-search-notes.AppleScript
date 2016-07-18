
on coerceTwoDigit(num)
	if num < 10
		set num to "0" & (num as string)
	else
		set num to (num as string)
	end if
	return num
end coerceTwoDigit

on dateToString(aDate)
	if aDate is missing value then return aDate
	set y to year of aDate as string
	set m to coerceTwoDigit(month of aDate as integer)
	set d to coerceTwoDigit(day of aDate as integer)
	set h to coerceTwoDigit(hours of aDate as integer)
	set mm to coerceTwoDigit(minutes of aDate as integer)
	set ss to coerceTwoDigit(seconds of aDate as integer)
	return y & m & d & "T" & h & mm & ss
end dateToString


on wrapString(inputStr)
	set outputStr to "###@@@" & inputStr & "@@@###"
	return outputStr
end wrapString



tell application "Evernote"
	set matches to find notes "business"
	if matches is not {missing value} then
		set countmatches to count of matches
	else
		set countmatches to 0
	end if
	set infostr to "{"
	if countmatches is not 0 then repeat with note1 in matches
		if note1 is not missing value then
			set notelink1 to note link of note1
			set infostr to infostr & "\"" & notelink1 & "\": {"
			set infostr to infostr & "\"noteLink\": \"" & notelink1 & "\", "
			set title1 to title of note1
			set infostr to infostr & "\"title\": \"" & my wrapString(title1) & "\", "
			set notebook1 to notebook of note1
			if notebook1 is not missing value then
				set nbname to name of notebook1
				set nbtype to notebook1's notebook type
				set infostr to infostr & "\"notebook\": {"
				set infostr to infostr & "\"name\": "
				set infostr to infostr & "\"" & my wrapString(nbname) & "\", "
				set infostr to infostr & "\"type\": "
				set infostr to infostr & "\"" & nbtype & "\"}, "
			end if
			set tags1 to tags of note1
			set infostr to infostr & "\"tags\": ["
			repeat with tag1 in tags1
				set tagname to name of tag1
				set infostr to infostr & "\"" & my wrapString(tagname) & "\", " 
			end repeat
			set infostr to infostr & "\"DummyTag\"], "
			set mdate1 to modification date of note1
			set mdate1 to my dateToString(mdate1)
			set infostr to infostr & "\"enModificationDate\": \"" & mdate1 & "\"}, "
		end if
	end repeat
	set infostr to infostr & "\"found\": " & countmatches & "}"
	return infostr
end tell
