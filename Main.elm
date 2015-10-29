module Main where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Keyboard
import Set
import Music

-- MODEL

type alias Model = List String

type Action = NoOp | Play | Thump String | Silence

inbox : Signal.Mailbox Action
inbox =
  Signal.mailbox NoOp

actions : Signal Action
actions =
  inbox.signal

model : Signal Model
model =
  Signal.foldp update Music.silence actions

keysAsNotes : List Int -> List String
keysAsNotes charCodes =
  List.map toString charCodes

notes : Signal (List String)
notes =
  Signal.map Music.keysAsNotes (Signal.map Set.toList Keyboard.keysDown)

-- UPDATE

update : Action -> Model -> Model
update action model =
  case action of
    NoOp
      -> model
    Play
      -> [ "A4", "C#5", "E5" ]
    Thump note
      -> [ note ]
    Silence
      -> Music.silence

-- UPDATE

view : Signal.Address Action -> Model -> Html
view address model =
  div [ ]
  [
    noteList address Music.bassNotes,
    button [
      onClick address Play
      ] [ text "Play" ],
    button [
      onClick address Silence
      ] [ text "Silence" ]
    ]

noteList : Signal.Address Action -> List String -> Html
noteList address notes =
  div [ ] (List.map (asNoteElement address) notes)

asNoteElement : Signal.Address Action -> String -> Html
asNoteElement address note =
  button [
    onClick address (Thump note)
    ] [ text note ]

-- PORTS

port notesPlaying : Signal Model
port notesPlaying =
  notes

port notesPressed : Signal (List String)
port notesPressed =
  notes

-- MAIN

main : Signal Html
main =
  Signal.map (view inbox.address) model
