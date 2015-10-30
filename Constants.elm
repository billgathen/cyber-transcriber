module Constants where

type alias KeyMap =
  {
    label : String,
    noteType : String
  }

bassNoteKeys       = [ 192, 49, 50, 51, 52, 53, 54, 55, 56, 57, 48, 189, 187 ]
chromaticChordKeys = [ 81, 87, 69, 82, 84, 89, 85, 73, 79, 80, 219, 221, 220 ]

-- NOTE B3 and C4 bass notes don't light on Firefox b/c the bassNoteKeys array uses the Chrome charCode
-- The note plays, though, because Music is based on key inputs
keyMapping : Int -> KeyMap
keyMapping key =
  case key of
    192 -> KeyMap "C"   "bass"
    49  -> KeyMap "C#"  "bass"
    50  -> KeyMap "D"   "bass"
    51  -> KeyMap "D#"  "bass"
    52  -> KeyMap "E"   "bass"
    53  -> KeyMap "F"   "bass"
    54  -> KeyMap "F#"  "bass"
    55  -> KeyMap "G"   "bass"
    56  -> KeyMap "G#"  "bass"
    57  -> KeyMap "A"   "bass"
    48  -> KeyMap "A#"  "bass"
    189 -> KeyMap "B"   "bass"
    187 -> KeyMap "C"   "bass"
    173 -> KeyMap "B"   "bass"
    61  -> KeyMap "C"   "bass"
    81  -> KeyMap "C"  "chord"
    87  -> KeyMap "C#" "chord"
    69  -> KeyMap "D"  "chord"
    82  -> KeyMap "D#" "chord"
    84  -> KeyMap "E"  "chord"
    89  -> KeyMap "F"  "chord"
    85  -> KeyMap "F#" "chord"
    73  -> KeyMap "G"  "chord"
    79  -> KeyMap "G#" "chord"
    80  -> KeyMap "A"  "chord"
    219 -> KeyMap "A#" "chord"
    221 -> KeyMap "B"  "chord"
    220 -> KeyMap "C"  "chord"
    _   -> KeyMap ""    ""
