module Music where

import Chords exposing (chord)

bassNotes  = [ "C3", "C#3", "D3", "D#3", "E3", "F3", "F#3", "G3", "G#3", "A3", "A#3", "B3", "C4" ]
chordRoots = [ "C4", "C#4", "D4", "D#4", "E4", "F4", "F#4", "G4", "G#4", "A4", "A#4", "B4", "C5" ]

silence = [ ]

keysAsNotes : List Int -> List String
keysAsNotes keys =
  let
      keyAsNoteOrChord = keyAsNote (chordIntervals keys)
  in
    unique (List.concatMap keyAsNoteOrChord keys)

unique : List String -> List String
unique items =
  List.reverse (List.foldl addUnique [] items)

addUnique : String -> List String -> List String
addUnique item uniq =
  if List.member item uniq
     then uniq
     else item :: uniq

chordIntervals : List Int -> List Int
chordIntervals keys =
  case (chordMap keys) of
    [ True,  True,  False ] -> [ 0, 3, 7, 10 ] -- minor 7th
    [ False, True,  False ] -> [ 0, 4, 7, 10 ] -- dom 7th
    [ True,  False, False ] -> [ 0, 3, 7     ] -- minor
    [ False, False, True  ] -> [ 0, 7, 12    ] -- power chord
    _                       -> [ 0, 4, 7     ] -- major

chordFlavor : List Int -> String
chordFlavor keys =
  case (chordMap keys) of
    [ True,  True,  False ] -> "minor 7th"
    [ False, True,  False ] -> "dominant 7th"
    [ True,  False, False ] -> "minor"
    [ False, False, True  ] -> "power chord"
    _                       -> "major"

chordMap : List Int -> List Bool
chordMap keys =
  let
      shiftKey  = 16
      ctrlKey   = 17
      altKey    = 18
      minor     = List.member shiftKey keys
      seventh   = List.member ctrlKey keys
      power     = List.member altKey keys
  in
      [ minor, seventh, power ]

keyAsNote : List Int -> Int -> List String
keyAsNote intervals key =
  case key of
    192 -> [ "C3"  ]
    49  -> [ "C#3" ]
    50  -> [ "D3"  ]
    51  -> [ "D#3" ]
    52  -> [ "E3"  ]
    53  -> [ "F3"  ]
    54  -> [ "F#3" ]
    55  -> [ "G3"  ]
    56  -> [ "G#3" ]
    57  -> [ "A3"  ]
    48  -> [ "A#3" ]
    189 -> [ "B3"  ] -- Chrome
    187 -> [ "C4"  ] -- Chrome
    173 -> [ "B3"  ] -- Firefox
    61  -> [ "C4"  ] -- Firefox
    81  -> chord (Just "C4") intervals
    87  -> chord (Just "C#4") intervals
    69  -> chord (Just "D4") intervals
    82  -> chord (Just "D#4") intervals
    84  -> chord (Just "E4") intervals
    89  -> chord (Just "F4") intervals
    85  -> chord (Just "F#4") intervals
    73  -> chord (Just "G4") intervals
    79  -> chord (Just "G#4") intervals
    80  -> chord (Just "A4") intervals
    219 -> chord (Just "A#4") intervals
    221 -> chord (Just "B4") intervals
    220 -> chord (Just "C5") intervals
    _   -> silence
