module Main where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

type alias Model = List String

aMajor  = [ "A4", "C#4", "E4" ]
noChord = [ ]

type Action = NoOp | Play | Silence

inbox : Signal.Mailbox Action
inbox =
  Signal.mailbox NoOp

actions : Signal Action
actions =
  inbox.signal

model : Signal Model
model =
  Signal.foldp update noChord actions

update : Action -> Model -> Model
update action model=
  case action of
    NoOp
      -> model
    Play
      -> aMajor
    Silence
      -> noChord

view : Signal.Address Action -> Model -> Html
view address model =
  div [ ]
  [
    button [
      onClick address Play
      ] [ text "Play" ],
    button [
      onClick address Silence
      ] [ text "Silence" ]
    ]

-- Send to JavaScript
port notesPlaying : Signal Model
port notesPlaying =
  model

main : Signal Html
main =
  Signal.map (view inbox.address) model
