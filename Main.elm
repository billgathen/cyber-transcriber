module Main where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Keyboard
import Set
import Music

-- MODEL

type alias Notes = List String

notes : Signal Notes
notes =
  Signal.map Music.keysAsNotes (Signal.map Set.toList Keyboard.keysDown)

-- VIEW

view : Notes -> Html
view model =
  div [ ]
  [
    noteList Music.bassNotes
    ]

noteList : List String -> Html
noteList notes =
  div [ ] (List.map asNoteElement notes)

asNoteElement : String -> Html
asNoteElement note =
  span [ class "bass-note" ] [ text note ]

-- PORTS

port notesPlaying : Signal Notes
port notesPlaying =
  notes

port notesPressed : Signal (List String)
port notesPressed =
  notes

-- MAIN

main : Signal Html
main =
  Signal.map view notes
