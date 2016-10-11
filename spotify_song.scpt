(* Get the current song from Spotify *)
if application "Spotify" is running then
  tell application "Spotify"
    set theName to name of the current track
    try
      return "♫  " & theName
    on error err
    end try
  end tell
end if
