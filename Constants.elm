module Constants where

type alias KeyMap =
  {
    label : String,
    noteType : String
  }

bassNoteKeys       = [ 192, 49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 189, 187 ]
chromaticChordKeys = [ 81, 87, 69, 82, 84, 89, 85, 73, 79, 80, 219, 221, 220 ]

keyMapping : Int -> KeyMap
keyMapping key =
  case key of
    192 -> KeyMap "C3"  "bass"
    49  -> KeyMap "C#3" "bass"
    50  -> KeyMap "D3"  "bass"
    51  -> KeyMap "D#3" "bass"
    52  -> KeyMap "E3"  "bass"
    53  -> KeyMap "F3"  "bass"
    54  -> KeyMap "F#3" "bass"
    55  -> KeyMap "G3"  "bass"
    56  -> KeyMap "G#3" "bass"
    57  -> KeyMap "A3"  "bass"
    48  -> KeyMap "A#3" "bass"
    189 -> KeyMap "B3"  "bass"
    187 -> KeyMap "C4"  "bass"
    81  -> KeyMap "C4"  "chord"
    87  -> KeyMap "C#4" "chord"
    69  -> KeyMap "D4"  "chord"
    82  -> KeyMap "D#4" "chord"
    84  -> KeyMap "E4"  "chord"
    89  -> KeyMap "F4"  "chord"
    85  -> KeyMap "F#4" "chord"
    73  -> KeyMap "G4"  "chord"
    79  -> KeyMap "G#4" "chord"
    80  -> KeyMap "A4"  "chord"
    219 -> KeyMap "A#4" "chord"
    221 -> KeyMap "B4"  "chord"
    220 -> KeyMap "C5"  "chord"
    _   -> KeyMap ""    ""
