module Music where

bassNotes = [ "C2", "C#2", "D2", "D#2", "E2", "F2", "F#2", "G2", "G#2", "A2", "A#2", "B2", "C3" ]

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
    192 -> [ "C2"  ]
    49  -> [ "C#2" ]
    50  -> [ "D2"  ]
    51  -> [ "D#2" ]
    52  -> [ "E2"  ]
    53  -> [ "F2"  ]
    54  -> [ "F#2" ]
    55  -> [ "G2"  ]
    56  -> [ "G#2" ]
    57  -> [ "A2"  ]
    48  -> [ "A#2" ]
    189 -> [ "B2"  ]
    187 -> [ "C3"  ]
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
