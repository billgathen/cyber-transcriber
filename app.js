var elmAppElement = document.getElementById('elmApp');
var elm = Elm.embed(Elm.Main, elmAppElement);

elm.ports.notesPlaying.subscribe(function(data) {
  playNotes(data);
});

elm.ports.notesConsole.subscribe(function(data) {
  output(data);
});

elm.ports.keysDownConsole.subscribe(function(data) {
  output(data);
});

function output(data) {
  if (data.length > 0) { console.log(data); }
}
