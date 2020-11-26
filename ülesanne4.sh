#!/bin/bash
# Skript, mis võtab ühest failist paroolid ja teisest kasutajanimed ning moodustab neist kasutaja
if [ $# -ne 2 ];then # 2 tähistab siin parameetrite arvu, mida kasutatakse skriptis
	echo "Palun käivitage käsk kujul $0 nimefail paroolifail"
else
	nimed=$1
	paroolid=$2
	paste -d":" $nimed $paroolid > kaspas.txt
	if [ -f $nimed -a -r $nimed ] && [ -f $paroolid -a -r $paroolid ]; then
	# kontrollib failide olemasolu, kui kõik korras, liigub funktsiooni täitma
		echo "Failid on korras, proovime luua kasutaja!"
		for kas in $(cat $nimed); do # kasutajate loomine
		useradd $kas -m -s /bin/bash
		echo "Kasutaja $kas sai loodud!"
#		more /etc/shadow | grep "$kas" # kontrollin, kas kasutaja sai loodud
		done
		for pas in $(cat kaspas.txt); do # kasutajale parooli määramine
		echo $pas | chpasswd
		kas2=$(echo $pas | cut -f1 -d":")
		echo "Kasutajale $kas2 sai määratud parool!"
#		more /etc/shadow | grep "$kas"
		done
		rm kaspas.txt
	else
		echo "Probleem failidest lugemisel!"
	fi
fi
