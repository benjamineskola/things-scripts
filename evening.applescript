-- run first thing in the morning, e.g., from cron

tell application "Things3"
  set theToken to "your-auth-token"
  
  set theTodos to to dos of list "Today"
  repeat with aTodo in theTodos
    set tagList to tags of aTodo
    repeat with aTag in tagList
      if (name of aTag as text) is "Evening"
        if class of aTodo is project
          set urlCommand to "update-project"
        else
          set urlCommand to "update"
        end if

        set theUrl to "things:///" & urlCommand & "?auth-token=" & theToken & "&id=" & (id of aTodo as text) & "&when=evening"
        open location theUrl
      end if
    end repeat
  end repeat
end tell
