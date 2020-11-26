#!/bin/bash
#´********Skript loob failis olevatest nimedes lisa_kasutaja skripti alusel uued kasutajad
if [ $# -eq 0 ]; then
    echo "Kasutusjuhend: palun sisestage käsk kujul $0 failinimi"
else
  failinimi=$1
  if [ -f $failinimi -a -r $failinimi ]; then
# -f sisestatakse, kuna see kontrollib, kas fail eksisteerib
#  -r käsk loeb failist sisu
    echo "fail on korras"
    for nimi in $(cat $failinimi)
    do
      # sellega peaks faili sisu olema nähtav, kui fail on kätte saadav ja nüüd echo asemel tuleb kutsuda vajalik skript
     echo $nimi #kuvab nime, kellele hakatakse kasutajat looma
     sh lisa_kasutaja.sh $nimi # aktiveeritakse selle skrpiti abil teise skrpiti töö
    done
  else
    echo "probleem failiga $failinimi"
  fi
fi
