# -*- encoding : utf-8 -*-
items = %w{
sogar
meine
eines
aber
kaufen
weniger
seid
dich
Note
Woche
danach
haben
Mama
ob
Baum
doch
machen
schon
ab
beim
auch
weil
Oma
mal
weiter
Tage
seiner
Auto
einen
warum
Schule
laufen
raus
wenig
sei
man
du
deine
im
Tag
wo
nach
gegen
keine
bis
Haus
keiner
gut
Opa
sagen
hin
wer
noch
deiner
am
mich
weit
tun
oder
nur
Papa
mein
seit
weg
um
geben
an
einer
des
einem
wem
sich
nein
sein
her
dein
gehen
mit
bei
kein
seine
hoch
den
eine
war
sehen
dir
mir
nun
auf
bin
so
rufen
hat
da
es
aus
wen
ich
habe
in
das
ein
wir
der
was
dem
er
gerade
}

cbmN2 = TestCBM.create(name: "Sichtwortschatz", len: items.size, info: "", short_info: "", time: 60, subject: "Deutsch", construct: "Wortschatz", level: "Niveaustufe 2", type_info:"Speed-Test", archive: false, student_access: false)

it = cbmN2.items.build(itemtext: "Preparation", difficulty: 0, itemtype:-1, itemview:"
<div class='modal-content'>
  <div class='modal-header'>
    <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
    <h4 class='modal-title' id='mainModalHeader'></h4>
  </div>
  <div class='modal-body' id='modalBody'>
    <br/>
    <br/>
    <br/>
    <p style='font-family: fibel_nordregular; font-size:96px' id='itemText' class='text-center'>
      Test
    </p>
    <br/>
    <br/>
    <br/>
  </div>
  <div class='modal-footer' style='text-align: center'>
    <button id='cButton' type='button' class='btn btn-default btn-lg' onclick='cButtonClick()'>Schrift größer (Taste: 1)</button>
    <button id='sButton' type='button' class='btn btn-success' onclick='sButtonClick()'>Test starten</button>
    <button id='iButton' type='button' class='btn btn-default btn-lg' onclick='iButtonClick()'>Schrift kleiner (Taste: 0)</button>
  </div>
</div>
<script>
    $(window).keydown(function(event) {
        switch (event.keyCode) {
            case 49:
            case 97:
                cButtonClick();
                break;
            case 48:
            case 96:
                iButtonClick();
                break;
        }
    });
    var tempText = (document.getElementById('itemText'));
    function cButtonClick() {
        curSize=parseInt(tempText.style.fontSize) + 10;
        tempText.style.fontSize = curSize + 'px';
    }
    function iButtonClick() {
        curSize = parseInt(tempText.style.fontSize) - 10;
        tempText.style.fontSize = curSize + 'px';
    }
    function sButtonClick() {
        currentResult = currentResult + '0,';
        $(window).unbind('keydown');
        nextItem();
        timeoutId = window.setTimeout(timedOut, workTime);
    }
    $('#mainModalHeader').html(students[currentStudent]);
</script>")
it.save

items.each do |i|
  it = cbmN2.items.build(itemtext: i, difficulty: 0, itemtype: 0, itemview:"
  <div class='modal-content'>
  <div class='modal-header'>
    <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
    <h4 class='modal-title' id='mainModalHeader'></h4>
  </div>
  <div class='modal-body' id='modalBody'>
    <br/>
    <br/>
    <br/>
    <p style='font-family: fibel_nordregular; font-size:96px' id='itemText' class='text-center'>"+
      i +
      "</p>
    <br/>
    <br/>
    <br/>
  </div>
  <div class='modal-footer' style='text-align: center'>
    <button id='cButton' type='button' class='btn btn-success btn-lg' onclick='cButtonClick()'>Richtig (Taste: 1)</button>
    <button id='sButton' type='button' class='btn btn-default disabled'>Test starten</button>
    <button id='iButton' type='button' class='btn btn-danger btn-lg' onclick='iButtonClick()'>Falsch (Taste: 0)</button>
  </div>
</div>


<script>
    $(window).keydown(function(event) {
        switch (event.keyCode) {
            case 49:
            case 97:
                $(window).unbind('keydown');
                cButtonClick();
                break;
            case 48:
            case 96:
                $(window).unbind('keydown');
                iButtonClick();
                break;

        }
    });

    var tempText = (document.getElementById('itemText'));
    tempText.style.fontSize = curSize + 'px';

    function cButtonClick() {
        stopwatch = new Date() - stopwatch;
        currentTimes = currentTimes + stopwatch + ',';
        currentResult = currentResult + '1,';
        $(window).unbind('keydown');
        nextItem();
    }

    function iButtonClick() {
        stopwatch = new Date() - stopwatch;
        currentTimes = currentTimes + stopwatch + ',';
        currentResult = currentResult + '0,';
        $(window).unbind('keydown');
        nextItem();
    }
    $('#mainModalHeader').html(students[currentStudent]);
</script>")
  it.save
end

it = cbmN2.items.build(itemtext: "Ende", difficulty: 0, itemtype:1, itemview:"
<div class='modal-content'>
  <div class='modal-header'>
    <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
    <h4 class='modal-title' id='mainModalHeader'></h4>
  </div>
  <div class='modal-body' id='modalBody'>
    <br/>
    <br/>
    <br/>
    <p class='text-center'>
      <img id='pic' style='width: 250px;'/>
      <br/>
      <br/>
      <br/>
    </p>
    <p class='text-center' style='font-size: 24px' id='status'>
      <br/>
      <br/>
      <br/>
    </p>
    <br/>
    <br/>
    <br/>
  </div>
  <div class='modal-footer' style='text-align: center'>
    <button id='cButton' type='button' class='btn btn-default btn-lg disabled'>Richtig (Taste: 1)</button>
    <button id='sButton' type='button' class='btn btn-default disabled'>Test starten</button>
    <button id='iButton' type='button' class='btn btn-default btn-lg disabled'>Falsch (Taste: 0)</button>
  </div>
</div>


<script>
    var tempPic = (document.getElementById('pic'));
    var tempStatus = (document.getElementById('status'));
    var tempStudentButton = (document.getElementById('btn'+ currentStudent));

    if (lastResults[currentStudent] >= 0 && lastResults[currentStudent] < currentResult.split('1').length)
        tempPic.src = '/images/shared/Levumi-jubelt.gif';
    else if(lastResults[currentStudent] == -1)
        tempPic.src = '/images/shared/Levumi-normal-blau.jpg';
    else
        tempPic.src = '/images/shared/Levumi-weiterlesen.gif';

    if (timedout)
        tempStatus.innerHTML = 'Zeit abgelaufen.<br/>Die Testergebnisse wurden gespeichert!<br/>Sie können das Testfenster nun schließen.';
    else
        tempStatus.innerHTML = 'Alle Items beantwortet.<br/>Die Testergebnisse wurden gespeichert!<br/>Sie können das Testfenster nun schließen.';

    tempStudentButton.classList.add('btn-success')
    $('#mainModalHeader').html(students[currentStudent]);
</script>")
it.save

cbmN2.save



items = %w{
Wälder
bekommen
alle
Nächte
Jahre
heute
schwamm
Familie
klein
Hunde
dieser
Geburtstag
ihm
vielleicht
oft
wissen
bitten
sitzt
Späße
Gruß
zurück
einzelnen
fällt
Mann
Kind
lieb
sagt
denken
toll
immer
werden
nachts
vier
isst
Schwester
hoffentlich
bleiben
rannte
zwei
gleich
Abend
Freude
ist
erzählen
zusammen
morgen
Häuser
aufwachen
schreibt
Wasser
plötzlich
jedes
euch
fahren
hallo
nächste
Brief
ganz
dürfen
Stunde
hatte
etwas
drei
Welt
Spiel
jetzt
Katze
fallen
Bruder
euer
größer
kommen
also
heißen
wünschen
paar
kriegen
unter
viel
fragt
Klasse
schreiben
wohnen
Bett
lernen
springen
ja
steht
finden
eure
vor
dort
welche
dies
schwimmen
Mutter
Frau
alt
Jahr
letzter
Uhr
gefällt
Bäume
hören
sieht
die
gefallen
Hund
Kinder
schläft
hinter
ihr
bringen
geht
höher
verspäten
hoffen
wann
jede
fangen
ins
älter
sieht
welcher
Männer
ganzer
möchten
über
besser
durch
länger
fängt
geschwommen
erst
erstens
nimmt
sollen
gibt
alles
freuen
wachen
Wald
schlafen
als
Bürder
rennen
muss
nie
groß
andere
anders
selbst
können
kann
ihnen
Freund
gern
und
wieder
spät
bleibt
fliegen
lieben
liegen
mehr
mögen
weiß
ganze
sind
Ferien
Meer
ihn
bald
letzte
Tier
dann
will
fast
sitzen
darf
für
läuft
weit
dass
schöne
lang
neu
bist
unser
ihre
stehen
Freundin
Eltern
gestern
wollen
euer
zur
Spaß
uns
eins
fliegt
fragen
diese
wusste
hier
zum
sehr
einmal
gewinnen
essen
nicht
spielen
Geburt
fährt
Mütter
nehmen
wie
nichts
bringt
Zeit
müssen
ohne
wird
schnell
zu
unsere
jeder
wenn
}


cbmN4 = TestCBM.create(name: "Sichtwortschatz", len: items.size, info: "", short_info: "", time: 60, subject: "Deutsch", construct: "Wortschatz", level: "Niveaustufe 4", type_info:"Speed-Test", archive: false, student_access: false)

it = cbmN4.items.build(itemtext: "Preparation", difficulty: 0, itemtype:-1, itemview:"
<div class='modal-content'>
  <div class='modal-header'>
    <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
    <h4 class='modal-title' id='mainModalHeader'></h4>
  </div>
  <div class='modal-body' id='modalBody'>
    <br/>
    <br/>
    <br/>
    <p style='font-family: fibel_nordregular; font-size:96px' id='itemText' class='text-center'>
      Test
    </p>
    <br/>
    <br/>
    <br/>
  </div>
  <div class='modal-footer' style='text-align: center'>
    <button id='cButton' type='button' class='btn btn-default btn-lg' onclick='cButtonClick()'>Schrift größer (Taste: 1)</button>
    <button id='sButton' type='button' class='btn btn-success' onclick='sButtonClick()'>Test starten</button>
    <button id='iButton' type='button' class='btn btn-default btn-lg' onclick='iButtonClick()'>Schrift kleiner (Taste: 0)</button>
  </div>
</div>
<script>
    $(window).keydown(function(event) {
        switch (event.keyCode) {
            case 49:
            case 97:
                cButtonClick();
                break;
            case 48:
            case 96:
                iButtonClick();
                break;
        }
    });
    var tempText = (document.getElementById('itemText'));
    function cButtonClick() {
        curSize=parseInt(tempText.style.fontSize) + 10;
        tempText.style.fontSize = curSize + 'px';
    }
    function iButtonClick() {
        curSize = parseInt(tempText.style.fontSize) - 10;
        tempText.style.fontSize = curSize + 'px';
    }
    function sButtonClick() {
        currentResult = currentResult + '0,';
        $(window).unbind('keydown');
        nextItem();
        timeoutId = window.setTimeout(timedOut, workTime);
    }
    $('#mainModalHeader').html(students[currentStudent]);
</script>")
it.save

items.each do |i|
  it = cbmN4.items.build(itemtext: i, difficulty: 0, itemtype: 0, itemview:"
  <div class='modal-content'>
  <div class='modal-header'>
    <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
    <h4 class='modal-title' id='mainModalHeader'></h4>
  </div>
  <div class='modal-body' id='modalBody'>
    <br/>
    <br/>
    <br/>
    <p style='font-family: fibel_nordregular; font-size:96px' id='itemText' class='text-center'>"+
      i +
      "</p>
    <br/>
    <br/>
    <br/>
  </div>
  <div class='modal-footer' style='text-align: center'>
    <button id='cButton' type='button' class='btn btn-success btn-lg' onclick='cButtonClick()'>Richtig (Taste: 1)</button>
    <button id='sButton' type='button' class='btn btn-default disabled'>Test starten</button>
    <button id='iButton' type='button' class='btn btn-danger btn-lg' onclick='iButtonClick()'>Falsch (Taste: 0)</button>
  </div>
</div>


<script>
    $(window).keydown(function(event) {
        switch (event.keyCode) {
            case 49:
            case 97:
                $(window).unbind('keydown');
                cButtonClick();
                break;
            case 48:
            case 96:
                $(window).unbind('keydown');
                iButtonClick();
                break;

        }
    });

    var tempText = (document.getElementById('itemText'));
    tempText.style.fontSize = curSize + 'px';

    function cButtonClick() {
        stopwatch = new Date() - stopwatch;
        currentTimes = currentTimes + stopwatch + ',';
        currentResult = currentResult + '1,';
        $(window).unbind('keydown');
        nextItem();
    }

    function iButtonClick() {
        stopwatch = new Date() - stopwatch;
        currentTimes = currentTimes + stopwatch + ',';
        currentResult = currentResult + '0,';
        $(window).unbind('keydown');
        nextItem();
    }
    $('#mainModalHeader').html(students[currentStudent]);
</script>")
  it.save
end

it = cbmN4.items.build(itemtext: "Ende", difficulty: 0, itemtype:1, itemview:"
<div class='modal-content'>
  <div class='modal-header'>
    <button type='button' class='close' data-dismiss='modal' aria-label='Close'><span aria-hidden='true'>&times;</span></button>
    <h4 class='modal-title' id='mainModalHeader'></h4>
  </div>
  <div class='modal-body' id='modalBody'>
    <br/>
    <br/>
    <br/>
    <p class='text-center'>
      <img id='pic' style='width: 250px;'/>
      <br/>
      <br/>
      <br/>
    </p>
    <p class='text-center' style='font-size: 24px' id='status'>
      <br/>
      <br/>
      <br/>
    </p>
    <br/>
    <br/>
    <br/>
  </div>
  <div class='modal-footer' style='text-align: center'>
    <button id='cButton' type='button' class='btn btn-default btn-lg disabled'>Richtig (Taste: 1)</button>
    <button id='sButton' type='button' class='btn btn-default disabled'>Test starten</button>
    <button id='iButton' type='button' class='btn btn-default btn-lg disabled'>Falsch (Taste: 0)</button>
  </div>
</div>


<script>
    var tempPic = (document.getElementById('pic'));
    var tempStatus = (document.getElementById('status'));
    var tempStudentButton = (document.getElementById('btn'+ currentStudent));

    if (lastResults[currentStudent] >= 0 && lastResults[currentStudent] < currentResult.split('1').length)
        tempPic.src = '/images/shared/Levumi-jubelt.gif';
    else if(lastResults[currentStudent] == -1)
        tempPic.src = '/images/shared/Levumi-normal-blau.jpg';
    else
        tempPic.src = '/images/shared/Levumi-weiterlesen.gif';

    if (timedout)
        tempStatus.innerHTML = 'Zeit abgelaufen.<br/>Die Testergebnisse wurden gespeichert!<br/>Sie können das Testfenster nun schließen.';
    else
        tempStatus.innerHTML = 'Alle Items beantwortet.<br/>Die Testergebnisse wurden gespeichert!<br/>Sie können das Testfenster nun schließen.';

    tempStudentButton.classList.add('btn-success')
    $('#mainModalHeader').html(students[currentStudent]);
</script>")
it.save

cbmN4.save
