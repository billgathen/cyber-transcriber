var elmAppElement = document.getElementById('elmApp');
var elm = Elm.embed(Elm.Main, elmAppElement);

elm.ports.notesPlaying.subscribe(function(data) {
  playNotes(data);
});

elm.ports.console.subscribe(function(data) {
  console.log(data);
});
