module Main where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Keyboard
import Set
import String
import Music
import Constants

-- MODEL

type alias Notes = List String
type alias CharCodes = List Int

-- VIEW

view : CharCodes -> Html
view pressedKeys =
  div [ class "view" ]
  [
    noteList pressedKeys Constants.bassNoteKeys,
    noteList pressedKeys Constants.chromaticChordKeys,
    chordFlavor pressedKeys
    ]

chordFlavor : CharCodes -> Html
chordFlavor pressedKeys =
  div [ class "chord-flavor" ] [ text (Music.chordFlavor pressedKeys) ]

noteList : CharCodes -> List Int -> Html
noteList pressedKeys keyList =
  let
      noteMapper = asNoteElement pressedKeys
  in
     div [ class "container" ] (List.map noteMapper keyList)

asNoteElement : CharCodes -> Int -> Html
asNoteElement pressedKeys key =
  let
      keyIsPressed = List.member key pressedKeys
      pressedClass = if keyIsPressed then "pressed" else ""
      keyMap       = Constants.keyMapping key
      classes = String.join " " [ keyMap.noteType, "key", pressedClass ]
  in
     span [ class classes ] [ text keyMap.label ]

-- SIGNALS

keysDown : Signal CharCodes
keysDown =
  Signal.map Set.toList Keyboard.keysDown

notes : Signal Notes
notes =
  Signal.map Music.allNotes keysDown

-- PORTS

port notesPlaying : Signal Notes
port notesPlaying =
  notes

port notesConsole : Signal Notes
port notesConsole =
  notes

port keysDownConsole : Signal CharCodes
port keysDownConsole =
  keysDown

-- MAIN

main : Signal Html
main =
  Signal.map view keysDown
