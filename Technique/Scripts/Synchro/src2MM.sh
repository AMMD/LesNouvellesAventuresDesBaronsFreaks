#!/bin/bash
# Scripts pour synchroniser les nouveaux rushes vidéos vers les machines de montage
echo "Synchroniser depuis :"
echo "	1. internet (serveur de sauvegarde)"
echo "	2. disque dur externe"
echo "	3. machine ORL"

while read line
do
	if [ $line == "1" ]; then
		echo ""
		echo "-> 1. depuis internet"
		break
	elif [ $line == "2" ]; then
		echo ""
		srcDir=""
		if [ -d $srcDir ]; then
			echo "-> 2. depuis disque dur externe"
		else
			echo "Le dossier "$srcDir" n'existe pas."
		fi


		break
	elif [ $line == "3" ]; then
		echo ""
		echo "-> 3. depuis machine ORL"
		break
	else
		echo ""
		echo "Option non reconnue"
	fi
done

destDir=""

if [ -d $destDir ]; then

#		rsync -avz --progress $jailDir"/Rushes/*" $HDDDir"/Rushes/"
		echo -e "Terminé"

else
	echo "Le dossier "$jailDir" n'existe pas."
fi
