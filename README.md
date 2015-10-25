# Cyber Transcriber

A browser-based music transcription tool primarily focused on figuring out chord progressions from popular music, playing from whatever music source you have running on your computer, including Youtube videos, streaming services like Rhapsody and Spotify, and native programs like iTunes.

It's early days, but it will eventually support:

1. Bass lines
1. Setting a key signature
1. Diatonic chords from that key (along with some likely alternatives)

I'm writing it to learn how to use the [Elm](http://elm-lang.org) programming language along with the [Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API).

## Building the project

1. After forking the project, [install Elm](http://elm-lang.org/install)
1. In the project directory, run ```elm package install``` to get all the dependencies.
1. Run ```elm make Main.elm``` to compile the Elm code into JavaScript. The results will be in ```elm.js```.
1. Open ```index.html``` in your browser and everything should just work!

[MIT LICENSE](LICENSE)
