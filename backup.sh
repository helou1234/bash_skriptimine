#!/bin/bash
#    See skript varundab automaatselt arhiivina kasutajate kodukaustad root kausta home_bcp ja lisab varundamis kuupäeva

kuupaev=`date +%d.%m.%Y`
varunduskoht="/home/home_bcp/"
for kasutaja in `more ./kasutajad.txt`; do
tar -cf $varunduskoht$kasutaja[$kuupaev].tar home/$kasutaja
#loon käsu, mis varundab kõikide  kasutajate kodukaustad, kes on mainitud kasutajad.txt failis
done
