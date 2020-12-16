#!/bin/bash
#    See skript varundab automaatselt arhiivina /home kaustad root kausta home_bcp
kuupaev=`date +%d.%m.%Y`
sihtkaust="/home"
varunduskoht="/home/home_bcp/"
if [ -d $sihtkaust ]; then
	for kataloog in $(ls $sihtkaust); do #annan käsu, et iga leitud kaust arhiveerida ja kokku pakkida
		tar -cf $varunduskoht$kataloog[$kuupaev].tar home/$kataloog #teen kaustadest arhiivi
		gzip $varunduskoht$kataloog[$kuupaev].tar  #pakin arhiivi kokku
	done
else
	echo "Kontrollige, kas sisestasite kausta asukoha ja nime õigesti!"
	fi
