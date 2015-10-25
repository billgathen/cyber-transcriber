module Main where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Music

type alias Model = List String

type Action = NoOp | Play | Silence

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
    Silence
      -> Music.silence

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
