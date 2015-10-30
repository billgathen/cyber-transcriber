module Main where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Keyboard
import Set
import String
import Music

-- MODEL

type alias Notes = List String

notes : Signal Notes
notes =
  Signal.map Music.keysAsNotes (Signal.map Set.toList Keyboard.keysDown)

-- VIEW

view : Notes -> Html
view notesPlaying =
  div [ class "view" ]
  [
    noteList notesPlaying "bass" Music.bassNotes,
    noteList notesPlaying "chord" Music.chordRoots
    ]

noteList : Notes -> String -> List String -> Html
noteList notesPlaying noteType notes =
  let
      noteMapper = asNoteElement notesPlaying noteType
  in
     div [ class "container" ] (List.map noteMapper notes)

asNoteElement : Notes -> String -> String -> Html
asNoteElement notesPlaying noteType note =
  let
      noteIsPlaying = List.member note notesPlaying
      playingClass = if noteIsPlaying then "playing" else ""
      classes = String.join " " [ noteType, "key", playingClass ]
  in
     span [ class classes ] [ text note ]

-- PORTS

port notesPlaying : Signal Notes
port notesPlaying =
  notes

port console : Signal Notes
port console =
  notes

-- MAIN

main : Signal Html
main =
  Signal.map view notes
