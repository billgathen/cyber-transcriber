module Music where

bassNotes = [ "C3", "C#3", "D3", "D#3", "E3", "F3", "F#3", "G3", "G#3", "A3", "A#3", "B3", "C3" ]

cMajorChord =      [ "C4",  "E4",  "G4"  ]
cSharpMajorChord = [ "C#4", "F4",  "G#4" ]
dMajorChord =      [ "D4",  "F#4", "A4"  ]
dSharpMajorChord = [ "D#4", "G4",  "A#4" ]
eMajorChord =      [ "E4",  "G#4", "B4"  ]
fMajorChord =      [ "F4",  "A4",  "C5"  ]
fSharpMajorChord = [ "F#4", "A#4", "C#5" ]
gMajorChord =      [ "G4",  "B4",  "D5"  ]
gSharpMajorChord = [ "G#4", "C5",  "D#5" ]
aMajorChord =      [ "A4",  "C#5", "E5"  ]
aSharpMajorChord = [ "A#4", "D5",  "F5"  ]
bMajorChord =      [ "B4",  "D#5", "F#5" ]
highCMajorChord =  [ "C5",  "E5",  "G5"  ]

silence = [ ]

keysAsNotes : List Int -> List String
keysAsNotes keys =
  -- not unique (yet)
  List.concatMap keyAsNote keys

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
    81  -> cMajorChord
    87  -> cSharpMajorChord
    69  -> dMajorChord
    82  -> dSharpMajorChord
    84  -> eMajorChord
    89  -> fMajorChord
    85  -> fSharpMajorChord
    73  -> gMajorChord
    79  -> gSharpMajorChord
    80  -> aMajorChord
    219 -> aSharpMajorChord
    221 -> bMajorChord
    220 -> highCMajorChord
    _   -> [ toString key ]
