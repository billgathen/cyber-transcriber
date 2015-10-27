module Main where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Keyboard
import Set
import Music

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

update : Action -> Model -> Model
update action model =
  case action of
    NoOp
      -> model
    Play
      -> Music.aMajorChord
    Thump note
      -> [ note ]
    Silence
      -> Music.silence

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

-- Send to JavaScript
port notesPlaying : Signal Model
port notesPlaying =
  model

port keysPressed : Signal (List Int)
port keysPressed =
  Signal.map Set.toList Keyboard.keysDown

main : Signal Html
main =
  Signal.map (view inbox.address) model
