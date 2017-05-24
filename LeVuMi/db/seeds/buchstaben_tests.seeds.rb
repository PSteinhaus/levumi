# -*- encoding : utf-8 -*-
items = %w{
m
r
s
n
f
l
a
e
i
o
u
h
w
p
t
d
au
ei
ch
k
b
sch
g
M
R
S
N
F
L
A
E
I
O
U
H
W
P
T
D
Au
Ei
Ch
K
B
Sch
G
}

cbmN1 = TestScreening.create(name: "Buchstaben erkennen", len: items.size, info: "", short_info: "", subject: "Deutsch", construct: "Leseflüssigkeit", level: "Niveaustufe 1")

items.each do |i|
  it = cbmN1.items.build(itemtext: i, difficulty: 0)
  it.save
end

cbmN1.save



items = %w{
m
r
s
n
f
l
a
e
i
o
u
h
w
p
t
d
au
ei
ch
k
b
sch
g
j
v
ß
sp
st
z
qu
x
y
eu
ä
ö
ü
M
R
S
N
F
L
A
E
I
O
U
H
W
P
T
D
Au
Ei
Ch
K
B
Sch
G
J
V
Sp
St
Z
Qu
X
Y
Eu
Ä
Ö
Ü
}

cbmN2 = TestScreening.create(name: "Buchstaben erkennen", len: items.size, info: "", short_info: "", subject: "Deutsch", construct: "Leseflüssigkeit", level: "Niveaustufe 2")

items.each do |i|
  it = cbmN2.items.build(itemtext: i, difficulty: 0)
  it.save
end

cbmN2.save

