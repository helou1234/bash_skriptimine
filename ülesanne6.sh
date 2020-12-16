#!/bin/bash
# Skript, mis võtab failist kasutajad ja genereerib neile parooli. seejärel loob faili, kus sees kasutajad ja parool$
if [ `whoami` = root ]; then #rida, misk kontrollib,kas kasutaja on sisseloginud root kasutajaga või mitte
	echo "Kasutajal on olemas root õigused, käivitame skripti."
	if [ $# -ne 1 ];then # 1 tähistab siin parameetrite arvu, mida kasutatakse skriptis
        	echo "Palun käivitage käsk kujul $0 nimefail"
	else
        	nimed=$1
        	if [ -f $nimed -a -r $nimed ]; then
        	# kontrollib faili olemasolu, kui kõik korras, liigub funktsiooni täitma
                	echo "Fail on korras, proovime luua kasutaja!"
                	for kas in $(cat $nimed); do # kasutajate loomine
                	useradd $kas -m -s /bin/bash
                	echo "Kasutaja $kas sai loodud!"
                	done
                	for rida in $(cat $1); do
                	pwgen -1 >> pas.txt #loon faili, mis sisaldab parooligeneraatori tulemust
                	paste -d":" $nimed pas.txt > kaspas.txt #käsen skriptil teha fail, kus on kirjas kasutajanimed ja pa$
                	done
        	else
                	echo "Probleem failidest lugemisel!"
        	fi
        	rm pas.txt #kustutame skripti jaoks loodud salasõnade faili
	fi
else
echo "Skripti käivitamiseks peate olema sisse logitud root kasutajana!"
fi
