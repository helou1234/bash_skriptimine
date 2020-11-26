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
    for rida in $(cat $failinimi);do
     kasutajanimi=$(echo "$rida" | cut -f1 -d:) 
# lõikab failis esimesest tulbast nime, millega hakata kasutajat looma
     echo $nimi #kuvab nime, kellele hakatakse kasutajat looma
     sh lisa_kasutaja.sh $kasutajanimi # aktiveeritakse selle skrpiti abil teise skrpiti töö
	echo "$rida" | chpasswd #Määrab kasutajale parooli alles jäänud rida kasutades
    done
  else
    echo "probleem failiga $failinimi"
  fi
fi
