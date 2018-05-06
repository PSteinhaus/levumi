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

cbmN2 = TestCBM.create(name: "Sichtwortschatz", len: items.size, info: "", shorthand: "SW2", time: 60, subject: "Deutsch", construct: "Wortschatz", level: "Niveaustufe 2", type_info:"Speed-Test", archive: false, student_access: false)

it = cbmN2.items.build(itemtext: "Preparation", difficulty: 0, itemtype:-1, itemview:"items/userbased/preparationUser")
it.save

items.each do |i|
  it = cbmN2.items.build(itemtext: i, difficulty: 0, itemtype: 0, itemview:"items/userbased/testItemUser")
  it.save
end

it = cbmN2.items.build(itemtext: "Ende", difficulty: 0, itemtype:1, itemview:"items/userbased/endItemUser")
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


cbmN4 = TestCBM.create(name: "Sichtwortschatz", len: items.size, info: "", shorthand: "SW4", time: 60, subject: "Deutsch", construct: "Wortschatz", level: "Niveaustufe 4", type_info:"Speed-Test", archive: false, student_access: false)

it = cbmN4.items.build(itemtext: "Preparation", difficulty: 0, itemtype:-1, itemview:"items/userbased/preparationUser")
it.save

items.each do |i|
  it = cbmN4.items.build(itemtext: i, difficulty: 0, itemtype: 0, itemview:"items/userbased/testItemUser")
  it.save
end

it = cbmN4.items.build(itemtext: "Ende", difficulty: 0, itemtype:1, itemview:"items/userbased/endItemUser")
it.save

cbmN4.save