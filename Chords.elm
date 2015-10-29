module Chords where

notes = [ "C4", "C#4", "D4", "D#4", "E4", "F4", "F#4", "G4", "G#4", "A4", "A#4", "B4", "C5", "C#5", "D5", "D#5", "E5", "F5", "F#5", "G5", "G#5", "A5", "A#5", "B5", "C6" ]

major : Maybe String -> List String
major root =
  chord root [ 0, 4, 7 ]

chord : Maybe String -> List Int -> List String
chord root intervals =
  let
      notesFromStart = startAtNote root notes
      noteFromInterval = noteUp notesFromStart
  in
     List.map noteFromInterval intervals

noteUp : List String -> Int -> String
noteUp notes halfSteps =
  Maybe.withDefault "" (List.head (List.drop halfSteps notes))

startAtNote : Maybe String -> List String -> List String
startAtNote root notes =
  if (notes == [] || root == List.head notes) then
     notes
     else
     startAtNote root (Maybe.withDefault [] (List.tail notes))
