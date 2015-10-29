module Music where

import Chords exposing (major)

bassNotes = [ "C3", "C#3", "D3", "D#3", "E3", "F3", "F#3", "G3", "G#3", "A3", "A#3", "B3", "C3" ]

silence = [ ]

keysAsNotes : List Int -> List String
keysAsNotes keys =
  unique (List.concatMap keyAsNote keys)

unique : List String -> List String
unique items =
  List.reverse (List.foldl addUnique [] items)

addUnique : String -> List String -> List String
addUnique item uniq =
  if List.member item uniq
     then uniq
     else item :: uniq

keyAsNote : Int -> List String
keyAsNote key =
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
    189 -> [ "B3"  ]
    187 -> [ "C4"  ]
    81  -> major(Just "C4")
    87  -> major(Just "C#4")
    69  -> major(Just "D4")
    82  -> major(Just "D#4")
    84  -> major(Just "E4")
    89  -> major(Just "F4")
    85  -> major(Just "F#4")
    73  -> major(Just "G4")
    79  -> major(Just "G#4")
    80  -> major(Just "A4")
    219 -> major(Just "A#4")
    221 -> major(Just "B4")
    220 -> major(Just "C5")
    _   -> silence
