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
  div [ class "view" ]
  [
    noteList "bass" Music.bassNotes,
    noteList "chord" Music.chordRoots
    ]

noteList : String -> List String -> Html
noteList noteType notes =
  div [ class "container" ] (List.map (asNoteElement noteType) notes)

asNoteElement : String -> String -> Html
asNoteElement noteType note =
  span [ class (noteType ++ " light") ] [ text note ]

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
