tell application "Things3"
  set inboxToDos to to dos of list "Inbox"
  repeat with inboxToDo in inboxToDos
   set AppleScript's text item delimiters to " "
   set title to name of inboxToDo
   -- set AppleScript's text item delimiters to " "
   set theWords to {}
   set theWords to every text item of title

   -- If there are tags
   if (offset of "#" in title) > 0
     set theTags to {}
     repeat with aWord in theWords
       if (offset of "#" in aWord) = 1
         set AppleScript's text item delimiters to aWord
         set titleLst to title's text items
         set name of inboxTodo to titleLst as text
         set title to name of inboxToDo
         set AppleScript's text item delimiters to ""

         set aWord to text 2 thru -1 of aWord
         copy aWord to end of theTags
       end if
     end repeat
     set AppleScript's text item delimiters to ", "
     set tag names of inboxToDo to (theTags as text)
     set AppleScript's text item delimiters to ""
   end if
  end repeat
end tell
