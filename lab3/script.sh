#!/bin/bash

# zadanie 1
# 10 unikalnych adresow IP w access_log
grep -E -o '([0-9]{1,3}\.){3}[0-9]{1,3}' access_log | sort -u | head -n 10

# fraza "denied" w linku
grep 'GET .*denied.*' access_log
grep 'POST .*denied.*' access_log

# zapytania wyslane z konkretnego IP
grep '64.242.88.10\b' access_log

# zapytania typu DELETE
grep -E -o '"DELETE .* HTTP/.\.."' access_log | sort -u

# zadanie 2 
# wypisanie wszystkich ktorych ID jest liczba niepatrzysta. wynik na standardowe wyjscie bledu
grep -E '^[0-9]*[13579],' yolo.csv 1>&2

# imie kazdego kto jest wart 2.99 itd 
cut -d "," -f3,7 yolo.csv | grep -E '$2\.99.|$5\.99.|9\.99.' 1>&2

# zadanie 3
# Zamień $HEADER$ na /temat/
for FILE in groovies/; do
  sed -i 's|$HEADER$|/temat/|g' "$FILE"
done

# Usuń linijki z frazą 'Help docs.'
for FILE in groovies/; do
  sed -i '/Help docs:/d' "$FILE"
done