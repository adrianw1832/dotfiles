(* Get the current song from Spotify *)
if application "Spotify" is running then
  tell application "Spotify"
    set theArtist to artist of the current track
    try
      return "- " & theArtist
    on error err
    end try
  end tell
end if
